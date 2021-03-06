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
                INTO  [_bk_forum].[dbo].[Pew_Answer_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Answer_NoStd]'               )
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                              Store current max pk                                              *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#CMPK]') IS NOT NULL
  DROP TABLE            [#CMPK]
  SELECT * INTO         [#CMPK] FROM
                                    (SELECT MAX([Answer_pk]) AS [CMPK]         /* select currently max pk                 */
                                       FROM     [Pew_Answer_NoStd]      ) CM   /* from NoStdAnswers                       */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
/* select distinct * from                                                      --  select sttm. for testing Set of Values */
(                                                                              /*> Set of Vals: QAb+StdVal+NoStdVal+AnsWd */


        SELECT Q =  ' -- NoStdQuestionAbbrev' --  p  (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
             , V =  1 -- StdAnswerValue       --   q (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
             , X =  0 -- NoStdAnswerValue     -- ipq (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
             , Y =  ' -- NoStdAnswerWording'  -- ipq (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
  UNION SELECT Q =  ' -- NoStdQuestionAbbrev' --  p  (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
             , V =  1 -- StdAnswerValue       --   q (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
             , X =  0 -- NoStdAnswerValue     -- ipq (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)
             , Y =  ' -- NoStdAnswerWording'  -- ipq (i=NoStdAnswer|p=NoStdQuestion|q=StdAnswer)


                                                                             ) /* <   Set of Values ends!                 */
/*   testset                                                                   --     alias for testing Set of Values     */
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	               [Pew_Answer_NoStd]                                          /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* higher level select statement...        */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Answer_pk]          =   ROW_NUMBER()                                   /* number all rows                         */
                                OVER( ORDER BY [Qk], [X])                      /* sorted by Q_pk & NoStdAnsValue          */
                             + (SELECT     MAX([Answer_pk])                    /* add currently max pk                    */
                                  FROM         [Pew_Answer_NoStd])             /* from NoStdAnswers                       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Answer_value_NoStd] =  [X]                                             /* value coded in original dataset         */
      ,[Answer_Wording]     =  [Y]                                             /* wording exactly as original ValueLabel  */
      ,[Answer_Std_fk]      =  [SAk]                                           /* fk as StdAns_pk, pulled...              */
      ,[Question_fk]        =  [Qk]                                            /* fk as NoStdQ_pk, pulled...              */
/*------------------------------------------------------------------------------------------------------------------------*/
FROM   (                                                                       /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
         SELECT                                                                /* sub-query select statement...           */
/*------------------------------------------------------------------------------------------------------------------------*/
                 [Qk]       = ( SELECT [Question_pk]                           /* identify available Q_pk (curr unique)   */
                                  FROM [Pew_Question_NoStd]                    /* as presented in Std&NoStdQuestions view */
                                 WHERE [Question_abbreviation]       = [Q]   ) /* filter by corresponding Q_abbreviation  */
/*------------------------------------------------------------------------------------------------------------------------*/
               , [SAk]      = ( SELECT [Answer_Std_pk]                         /* identify corresponding A_pk             */
                                  FROM [Pew_Answer_Std]                        /* as stored in StdAnswers table           */
                                 WHERE [Answer_value_std]            = [V]     /* filter by already known StdValue...     */
                                 AND   [AnswerSet_number]            =         /* and by matching AnswerSetNum to...      */
                                     ( SELECT [AnswerSet_num]                  /*   identified available AnswerSetNum     */
                                         FROM [Pew_Question_NoStd]             /*   as presented in NoStdQs ...           */
                                         JOIN [Pew_Question_Std]               /*   joined to StdQs ...                   */
                                           ON [Question_Std_fk]                /*   matching the StqQ fk                  */
                                            = [Question_Std_pk]                /*   to the StqQ pk                        */
                                        WHERE [Question_abbreviation]= [Q] ) ) /*   filter by corresponding Q_abbrev      */
/*------------------------------------------------------------------------------------------------------------------------*/
      , *                                                                      /* all other variables in CTE              */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdAnswers)      */
/*------------------------------------------------------------------------------------------------------------------------*/
                                                              )   AS NoStdAns  /* alias of sub-query                      */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
SELECT                                                                         /* check results in modified table         */
         [Question_fk]
        ,[Answer_Std_fk]
        ,[Answer_value_NoStd]
        ,[Answer_Wording]
        ,[Answer_pk]                                                                FROM [Pew_Answer_NoStd], [#CMPK]
                                                                                   WHERE [Answer_pk]       >  [CMPK]
ORDER BY [Question_fk]
        ,[Answer_Std_fk]
/**************************************************************************************************************************/
   SELECT   [c] =  COUNT(     DISTINCT CAST([Answer_pk]          AS VARCHAR(MAX))
                          +   '|'  +   CAST([Answer_value_NoStd] AS VARCHAR(MAX))
                          +   '|'  +        [Answer_Wording]
                          +   '|'  +   CAST([Answer_Std_fk]      AS VARCHAR(MAX))
                          +   '|'  +   CAST([Question_fk]        AS VARCHAR(MAX))  )
           ,[K] = 'N_rows'                                                          FROM [Pew_Answer_NoStd], [#CMPK]
                                                                                   WHERE [Answer_pk]       >  [CMPK]
UNION ALL
   SELECT   [c] =  COUNT(          [Answer_pk]                            )
           ,[K] = 'N_NSApk'                                                         FROM [Pew_Answer_NoStd], [#CMPK]
                                                                                   WHERE [Answer_pk]       >  [CMPK]
UNION ALL
   SELECT   [c] =  COUNT(     DISTINCT CAST([Answer_value_NoStd] AS VARCHAR(MAX))
                          +   '|'  +        [Answer_Wording]
                          +   '|'  +   CAST([Question_fk]        AS VARCHAR(MAX))  )
           ,[K] = 'N_      NSAV NSAW      NSQfk'                                    FROM [Pew_Answer_NoStd], [#CMPK]
                                                                                   WHERE [Answer_pk]       >  [CMPK]
UNION ALL
   SELECT   [c] =  COUNT(     DISTINCT CAST([Answer_value_NoStd] AS VARCHAR(MAX))
                          +   '|'  +   CAST([Question_fk]        AS VARCHAR(MAX))  )
           ,[K] = 'N_      NSAV           NSQfk'                                    FROM [Pew_Answer_NoStd], [#CMPK]
                                                                                   WHERE [Answer_pk]       >  [CMPK]
UNION ALL
   SELECT   [c] =  COUNT(     DISTINCT CAST([Answer_Std_fk]      AS VARCHAR(MAX))
                          +   '|'  +   CAST([Question_fk]        AS VARCHAR(MAX))  )
           ,[K] = 'N_                SAfk NSQfk'                                    FROM [Pew_Answer_NoStd], [#CMPK]
                                                                                   WHERE [Answer_pk]       >  [CMPK]
/**************************************************************************************************************************/
GO
