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
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Std]'               )
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                              Store current max pk                                              *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#CMPK]') IS NOT NULL
  DROP TABLE            [#CMPK]
  SELECT * INTO         [#CMPK] FROM
                                    (SELECT MAX([Question_Std_pk]) AS [CMPK]   /* select currently max pk                 */
                                       FROM     [Pew_Question_Std]        ) CM /* from Std Answers                        */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: SQWdg + SQShWdg + FSetAns */
/*------------------------------------------------------------------------------------------------------------------------*/


SELECT
 L = 'Question       Wording Standard  jk  (j=StdQ|k=SetAns)'
,S = 'Question Short Wording Standard  jk  (j=StdQ|k=SetAns)'
,F = 'Full Set of Answers               k  (j=StdQ|k=SetAns)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Question       Wording Standard  jk  (j=StdQ|k=SetAns)'
,S = 'Question Short Wording Standard  jk  (j=StdQ|k=SetAns)'
,F = 'Full Set of Answers               k  (j=StdQ|k=SetAns)'


/*------------------------------------------------------------------------------------------------------------------------*/
)                                                                              /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	               [Pew_Question_Std]                                          /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* select statement...                     */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Question_Std_pk]            =    ROW_NUMBER()                          /* number all rows                         */
                                         OVER(ORDER BY [F], [S])               /* sorted by FullSetAns & QShortWordingStd */
                                      + (SELECT MAX([Question_Std_pk])         /* add currently max pk                    */
                                           FROM [Pew_Question_Std])            /* from StdQuestions                       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_abbreviation_std]  =          'SVYp_'                         /* add survey StdQ prefix pending          */
                                      +  RIGHT('00000'                         /* > add leading zeros - keep right digits */
                                      +  CAST                                  /*  > cast numeric value                   */
                                        ( (                                    /*    start casting code                   */
                                          (SELECT COUNT([Question_Std_pk])     /*    - count N of pk's                    */
                                             FROM [Pew_Question_Std]           /*      from StdQ table                    */
                                            WHERE [Question_abbreviation_std]  /*      filtering when QAbbStd             */
                                                    LIKE 'Svy%'              ) /*      starts as 'Svy'                    */
                                         + ROW_NUMBER()                        /*    - adding the rownumber               */
                                           OVER(ORDER BY [S])                  /*      sorted by QShortWdgStd             */
                                        )                    AS varchar(4))    /*  < cast as 4-char string                */
                                                                           ,4) /* < keepping right four characterss       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_wording_std]       = [L]                                      /* wording std as to be coded              */
      ,[Question_short_wording_std] = [S]                                      /* short wording std as to be displayed    */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Display]                    = 0                                        /* set display to zero (provisionally)     */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[AnswerSet_num]              = ( SELECT DISTINCT [AnswerSet_number]     /* pull distinct AnswerSet Number          */
                                          FROM [Pew_Answer_Std]                /* from StdAnswer table                    */
                                         WHERE [Full_set_of_Answers] = [F]   ) /* filter using the known FullSet of Ans   */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Editorially_Checked]        = 'NO!'                                    /* label as not editorially checked        */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_Label_80Chars]     = NULL                                     /* leave mpty the 80Chars Label field      */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdQuestions)    */
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Question_Std] ORDER BY [Question_Std_pk] DESC               /* check results in modified table         */
SELECT * FROM [Pew_Question_Std]
            , [#CMPK]
        WHERE [Question_Std_pk]
            > [CMPK]
                                 ORDER BY [Question_Std_pk]                    /* check results in modified table         */
/**************************************************************************************************************************/
SELECT * FROM (                                                                /* check consistency of modified table     */
SELECT [c] = COUNT(DISTINCT [Question_Std_pk]            )
      ,[K] = 'QSpk'
  FROM [Pew_Question_Std]
 WHERE [Question_abbreviation_std] LIKE 'Svy%'
UNION
  ALL
SELECT [c] = COUNT(DISTINCT [Question_abbreviation_std]  )
      ,[K] = 'QAS'
  FROM [Pew_Question_Std]
 WHERE [Question_abbreviation_std] LIKE 'Svy%'
UNION
  ALL
SELECT [c] = COUNT(DISTINCT [Question_wording_std]       )
      ,[K] = 'QWS'
  FROM [Pew_Question_Std]
 WHERE [Question_abbreviation_std] LIKE 'Svy%'
UNION
  ALL
SELECT [c] = COUNT(DISTINCT [Question_short_wording_std] )
      ,[K] = 'QSWS - no need'
  FROM [Pew_Question_Std]
 WHERE [Question_abbreviation_std] LIKE 'Svy%'
                                                                           ) D /* END selection for numeric consistency   */
/**************************************************************************************************************************/
GO
