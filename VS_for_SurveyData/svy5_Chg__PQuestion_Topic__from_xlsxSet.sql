/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
	USE [x_LoadRLS1cUS]                                                        /* use wkDB - just delete for final script */
--	USE [forum]                                                                /* use final database                      */
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar(15)                                                 /* declare variable to store current date  */
  SET     @CrDt = (  REPLACE(
                     REPLACE(
                     REPLACE(
                     CONVERT(VARCHAR(19), GETDATE(), 120)
                                                         ,'-','' )
                                                         ,' ','_')
                                                         ,':','' )  )          /* store date in format YYYYMMDD_hhmmss    */
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_Topic_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Topic]'               )
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                              Store current max pk                                              *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#CMPK]') IS NOT NULL
  DROP TABLE            [#CMPK]
  SELECT * INTO         [#CMPK] FROM
                                    (SELECT MAX([Question_topic_pk]) AS [CMPK] /* select currently max pk                 */
                                       FROM     [Pew_Question_Topic] )    CM   /* from Questions by Topics                */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: QAb+StdVal+NoStdVal+AnsWd */
/*------------------------------------------------------------------------------------------------------------------------*/

SELECT
 L = ' -- StdQuestionAbbrev' --  ij (i=StdQuestion|j=Topic)
,T = 0 -- Topic pk           --   j (i=StdQuestion|j=Topic)

/*------------------------------------------------------------------------------------------------------------------------*/

UNION
SELECT
 L = ' -- StdQuestionAbbrev' --  ij (i=StdQuestion|j=Topic)
,T = 0 -- Topic pk           --   j (i=StdQuestion|j=Topic)

/*------------------------------------------------------------------------------------------------------------------------*/
                                                                             ) /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	               [Pew_Question_Topic]                                        /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* higher level select statement...        */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Question_topic_pk]        = CASE WHEN [Question_topic_pk] IS NULL
                                         THEN  ROW_NUMBER()                    /* number all rows                         */
                                               OVER( ORDER BY                  /* sorted by                               */
                                                     [Question_topic_pk]       /* current Q_topic_pk                      */
                                                   , [Question_Std_pk] )       /* and by StdQ_pk                          */
                                             + (SELECT                         /* adding...                               */
                                                   MAX([Question_topic_pk])    /* currently max pk                        */
                                                  FROM [Pew_Question_Topic] )  /* from NoStdAnswers                       */
                                         ELSE [Question_topic_pk]
                                     END
      ,[Question_Std_fk]          = CASE WHEN [Question_Std_fk] IS NULL
                                         THEN [Question_Std_pk]
                                         ELSE [Question_Std_fk]
                                     END
      ,[Topic_fk]                 = CASE WHEN [Topic_fk] IS NULL
                                          AND [Tp_fk]    IS NULL
                                         THEN [T]
                                         WHEN [Topic_fk] IS NULL
                                         THEN [Tp_fk]
                                         ELSE [Topic_fk]
                                     END
      ,[Topic_Priority_order]     = CASE WHEN [Topic_Priority_order] IS NULL
                                         THEN  99
                                         ELSE [Topic_Priority_order]
                                     END
      ,[SubTopic_Priority_order]  = CASE WHEN [SubTopic_Priority_order] IS NULL
                                         THEN  9
                                         ELSE [SubTopic_Priority_order]
                                     END
  FROM
       [Pew_Question_Topic]
  FULL
  JOIN
      (SELECT * FROM 
       [Pew_Question_Std]
       WHERE 
       [Question_abbreviation_std]  like 'SVY%' )            AllSvy
    ON
       [Question_Std_fk]
      =[Question_Std_pk]
  LEFT
  JOIN
      (SELECT
             [QS_fk] = [Question_Std_fk]
            ,[Tp_fk] = [Topic_fk]
       FROM
       (SELECT
               *
              ,[X]=ROW_NUMBER ()
                   OVER
                  (PARTITION BY [Question_Std_fk]
                   ORDER BY [Topic_fk]           )
        FROM 
        [_bk_forum]..[Pew_Question_Topic_2013_02_04] ) L1
       WHERE [X] = 1                                       ) OldQT
    ON
       [Question_Std_Pk]
      =[QS_fk]
  LEFT
  JOIN
/*------------------------------------------------------------------------------------------------------------------------*/
       NSV                                                   NewVal            /* CTE (New Set of NoStdAnswers) as NewVal */
/*------------------------------------------------------------------------------------------------------------------------*/
    ON
       [Question_wording_std]
      =[L]

WHERE
       [Question_topic_pk] IS NULL
/**************************************************************************************************************************/
GO

/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
SELECT                                                                         /* check results in modified table         */
         [Question_topic_pk]
        ,[Question_Std_fk]
        ,[Topic_fk]
        ,[Topic_Priority_order]
        ,[SubTopic_Priority_order]
    FROM [Pew_Question_Topic]
       , [#CMPK]
   WHERE [Question_topic_pk]
       > [CMPK]
ORDER BY [Question_Std_fk]
        ,[Topic_fk]
/**************************************************************************************************************************/
          SELECT Q.[Question_abbreviation]
               , S.[Question_abbreviation_std]
               , S.[Question_wording_std]                                      /*   identified available AnswerSetNum     */
               , S.[Question_Std_pk]
               , T.[Question_Std_fk]
            FROM   [Pew_Question_NoStd]          Q                             /*   as presented in NoStdQs ...           */
            JOIN   [Pew_Question_Std]            S                             /*   joined to StdQs ...                   */
              ON   [Question_Std_fk]                                           /*   matching the StqQ fk                  */
               =   [Question_Std_pk]                                           /*   to the StqQ pk                        */
            LEFT
            JOIN   [Pew_Question_Topic]          T
              ON S.[Question_Std_pk]
               = T.[Question_Std_fk]
           WHERE [Question_abbreviation] LIKE 'RLS%'                           /*   filter by corresponding Q_abbrev      */
        ORDER BY T.[Question_Std_fk]
               , S.[Question_Std_pk]
/**************************************************************************************************************************/
SELECT   [c] =
           COUNT(
        DISTINCT Q.[Question_abbreviation]       )
        ,[K] =      'All_Qs'
            FROM   [Pew_Question_NoStd]          Q                             /*   as presented in NoStdQs ...           */
            JOIN   [Pew_Question_Std]            S                             /*   joined to StdQs ...                   */
              ON   [Question_Std_fk]                                           /*   matching the StqQ fk                  */
               =   [Question_Std_pk]                                           /*   to the StqQ pk                        */
            LEFT
            JOIN   [Pew_Question_Topic]          T
              ON S.[Question_Std_pk]
               = T.[Question_Std_fk]
           WHERE   [Question_abbreviation] LIKE 'RLS%'                         /*   filter by corresponding Q_abbrev      */
UNION
  ALL
SELECT   [c] =
           COUNT(
        DISTINCT Q.[Question_abbreviation]       )
        ,[K] =      'Matched_Qs'
            FROM   [Pew_Question_NoStd]          Q                             /*   as presented in NoStdQs ...           */
            JOIN   [Pew_Question_Std]            S                             /*   joined to StdQs ...                   */
              ON   [Question_Std_fk]                                           /*   matching the StqQ fk                  */
               =   [Question_Std_pk]                                           /*   to the StqQ pk                        */
            LEFT
            JOIN   [Pew_Question_Topic]          T
              ON S.[Question_Std_pk]
               = T.[Question_Std_fk]
           WHERE   [Question_abbreviation] LIKE 'RLS%'                         /*   filter by corresponding Q_abbrev      */
             AND T.[Question_Std_fk] IS NOT NULL
UNION
  ALL
SELECT   [c] =
           COUNT(
        DISTINCT Q.[Question_abbreviation]       )
        ,[K] =      'UnMatched_Qs'
            FROM   [Pew_Question_NoStd]          Q                             /*   as presented in NoStdQs ...           */
            JOIN   [Pew_Question_Std]            S                             /*   joined to StdQs ...                   */
              ON   [Question_Std_fk]                                           /*   matching the StqQ fk                  */
               =   [Question_Std_pk]                                           /*   to the StqQ pk                        */
            LEFT
            JOIN   [Pew_Question_Topic]          T
              ON S.[Question_Std_pk]
               = T.[Question_Std_fk]
           WHERE   [Question_abbreviation] LIKE 'RLS%'                         /*   filter by corresponding Q_abbrev      */
             AND T.[Question_Std_fk] IS     NULL
/**************************************************************************************************************************/
GO




----------/**************************************************************************************************************************/
----------/*****                                                    STEP 002                                                    *****/
----------/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
----------/**************************************************************************************************************************/
----------WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
----------(                                                                              /*> Set of Vals: QAb+StdVal+NoStdVal+AnsWd */
----------        SELECT Q =  ' -- NoStdQuestionAbbrev' --  p  (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
----------             , V =  1 -- StdAnswerValue       --   q (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
----------             , X =  0 -- NoStdAnswerValue     -- ipq (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
----------             , Y =  ' -- NoStdAnswerWording'  -- ipq (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
----------                                                                             ) /* <   Set of Values ends!                 */
----------/*   testset                                                                   --     alias for testing Set of Values     */
----------/**************************************************************************************************************************/
----------/*****                                                    STEP 002                                                    *****/
----------/*****                                   SECTION B: Use the Common Table Expression                                   *****/
----------/**************************************************************************************************************************/
----------/*------------------------------------------------------------------------------------------------------------------------*/
------------	INSERT INTO                                                                /* insert statement                        */
------------	               [Pew_Answer_NoStd]                                          /* target table in current database        */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------SELECT                                                                         /* higher level select statement...        */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------       [Answer_pk]          =   ROW_NUMBER()                                   /* number all rows                         */
----------                                OVER( ORDER BY [Qk], [X])                      /* sorted by Q_pk & NoStdAnsValue          */
----------                             + (SELECT     MAX([Answer_pk])                    /* add currently max pk                    */
----------                                  FROM         [Pew_Answer_NoStd])             /* from NoStdAnswers                       */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------      ,[Answer_value_NoStd] =  [X]                                             /* value coded in original dataset         */
----------      ,[Answer_Wording]     =  [Y]                                             /* wording exactly as original ValueLabel  */
----------      ,[Answer_Std_fk]      =  [SAk]                                           /* fk as StdAns_pk, pulled...              */
----------      ,[Question_fk]        =  [Qk]                                            /* fk as NoStdQ_pk, pulled...              */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------FROM   (                                                                       /*                                         */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------         SELECT                                                                /* sub-query select statement...           */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------                 [Qk]       = ( SELECT [Question_pk]                           /* identify available Q_pk (curr unique)   */
----------                                  FROM [Pew_Question_NoStd]                    /* as presented in Std&NoStdQuestions view */
----------                                 WHERE [Question_abbreviation]       = [Q]   ) /* filter by corresponding Q_abbreviation  */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------               , [SAk]      = ( SELECT [Answer_Std_pk]                         /* identify corresponding A_pk             */
----------                                  FROM [Pew_Answer_Std]                        /* as stored in StdAnswers table           */
----------                                 WHERE [Answer_value_std]            = [V]     /* filter by already known StdValue...     */
----------                                 AND   [AnswerSet_number]            =         /* and by matching AnswerSetNum to...      */
----------                                     ( SELECT [AnswerSet_num]                  /*   identified available AnswerSetNum     */
----------                                         FROM [Pew_Question_NoStd]             /*   as presented in NoStdQs ...           */
----------                                         JOIN [Pew_Question_Std]               /*   joined to StdQs ...                   */
----------                                           ON [Question_Std_fk]                /*   matching the StqQ fk                  */
----------                                            = [Question_Std_pk]                /*   to the StqQ pk                        */
----------                                        WHERE [Question_abbreviation]= [Q] ) ) /*   filter by corresponding Q_abbrev      */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------      , *                                                                      /* all other variables in CTE              */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------  FROM [NSV]                                                                   /* from CTE (New Set of NoStdAnswers)      */
----------/*------------------------------------------------------------------------------------------------------------------------*/
----------                                                              )   AS NoStdAns  /* alias of sub-query                      */
