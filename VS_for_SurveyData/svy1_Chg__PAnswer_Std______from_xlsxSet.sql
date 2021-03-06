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
EXEC                                                                           /* exec statement to run string s script   */
     ( ' SELECT * INTO [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + ']
                  FROM     [forum].[dbo].[Pew_Answer_Std]'               )     /* select into backup from current table   */
/**************************************************************************************************************************/
GO

--DELETE FROM               [forum].[dbo].[Pew_Answer_Std]
--WHERE                     [AnswerSet_number] IN ( , )   --- added


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                              Store current max pk                                              *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#CMPK]') IS NOT NULL
  DROP TABLE            [#CMPK]
  SELECT * INTO         [#CMPK] FROM
                                    (SELECT MAX([Answer_Std_pk]) AS [CMPK]     /* select currently max pk                 */
                                       FROM     [Pew_Answer_Std]               /* from Std Answers                        */
                                      WHERE     [Answer_Std_pk] < 999990) CM   /* excluding Un-Coded Numeric/Count vals   */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: ASetN + StdAVal + StdAWd  */
        SELECT N =  1 -- AnswerSetNumber      j  (i=StdAValue|j=ASetN)
             , V =  1 -- StdAnswerValue      ij  (i=StdAValue|j=ASetN)
             , W =  ' -- StdAnswerWording    ij  (i=StdAValue|j=ASetN)'
  UNION SELECT N =  1 -- AnswerSetNumber      j  (i=StdAValue|j=ASetN)
             , V =  2 -- StdAnswerValue      ij  (i=StdAValue|j=ASetN)
             , W =  ' -- StdAnswerWording    ij  (i=StdAValue|j=ASetN)'
                                                                             ) /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	               [Pew_Answer_Std]                                            /* table in working database               */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* select statement...                     */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Answer_Std_pk]          =   (ROW_NUMBER ()                             /* number all rows                         */
                                           OVER (ORDER BY [N], [V] ))          /* sorted by answer set number & value     */
                                  + (SELECT MAX([Answer_Std_pk])               /* add currently max pk                    */
                                       FROM     [Pew_Answer_Std]               /* from Std Answers                        */
                                      WHERE     [Answer_Std_pk] < 999990)      /* excluding Un-Coded Numeric/Count vals   */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[AnswerSet_number]       =   [N]                                        /* conventional answer set number          */
                                  + (SELECT MAX([AnswerSet_number])            /* add currently max answer set number     */
                                       FROM     [Pew_Answer_Std]               /* from Std Answers                        */
                                      WHERE     [AnswerSet_number] < 999990)   /* excluding Un-Coded Numeric/Count vals   */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Answer_value_std]       =   [V]                                        /* conventional answer standard value      */
      ,[Answer_Wording_std]     =   [W]                                        /* conventional answer standard wording    */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Full_set_of_Answers]    =   [A]                                        /* nested set of values & wordings by set  */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[NA_by_set_of_Answers]   =   [X]                                        /* count of values by answer set number    */
/*------------------------------------------------------------------------------------------------------------------------*/
FROM
/*------------------------------------------------------------------------------------------------------------------------*/
        [NSV]                                                     AS SetVs     /* main reference to CTE (New Set of Vals) */
/*------------------------------------------------------------------------------------------------------------------------*/
 JOIN
/*------------------------------------------------------------------------------------------------------------------------*/
      ( SELECT                                                                 /* sub-query for nested & aggegated values */
               [r] = [N]                                                       /* answer set number - join to main query  */
              ,[X] = COUNT(*)                                                  /* aggregate by counting rows              */
              ,[A] = STUFF(                                                    /* begin stuffing procedure...             */
                           ( SELECT '   ||'                                    /* begin selection into XML nested cell(s) */
                                  + STR(S2.[V], 7,2 )                          /* add value as string...                  */
                                  + ': '                                       /* concatenate using colon...              */
                                  +        [W]                                 /* to the corresponding wording            */
                              FROM         [NSV]          S2                   /* secondary reference to CTE in sub-query */
                             WHERE      S1.[N]                                 /* correspondence on main CTE reference... */
                                      = S2.[N]                                 /* to secondary reference in sub-query     */
                          ORDER BY      S1.[N]                                 /* sorting order by answer set number      */
                          FOR XML PATH('') )                                   /* nest in one XML string cell             */
                                            , 1, 8, '')                        /* end stuffing proced. by dropping chars  */
          FROM     [NSV]                                  S1                   /* main reference to CTE in sub-query      */
          GROUP BY [N]                                        )   AS nstdV     /* aggregate values & alias of sub-query   */
/*------------------------------------------------------------------------------------------------------------------------*/
ON         SetVs.[N]  =   nstdV.[r]                                            /* joint b/w main ref to CTE & sub-query   */
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
SELECT
       DISTINCT
       [AnswerSet_number]
      ,[Full_set_of_Answers]
      ,[NA_by_set_of_Answers]
  FROM [Pew_Answer_Std]
     , [#CMPK]
 WHERE [Answer_Std_pk]
     > [CMPK]
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Answer_Std] ORDER BY [Answer_Std_pk] DESC                   /* check results in modified table         */
/**************************************************************************************************************************/
SELECT * FROM (                                                                /* check consistency of modified table     */
SELECT [c] =  COUNT(DISTINCT  [Answer_Std_pk]       )
             ,[K] = 'NA'                                FROM [Pew_Answer_Std]
UNION ALL
SELECT [c] =  COUNT(DISTINCT
                         CAST([AnswerSet_number] AS VARCHAR(MAX))
                     +   '|'
                     +   CAST([Answer_value_std] AS VARCHAR(MAX))
                     +   '|'
                     +        [Answer_Wording_std]                )
             ,[K] = 'NA'                                FROM [Pew_Answer_Std]
UNION ALL
SELECT [c] =  COUNT(DISTINCT
                         CAST([AnswerSet_number] AS VARCHAR(MAX))
                     +   '|'
                     +   CAST([Answer_value_std] AS VARCHAR(MAX)) )
             ,[K] = 'NA'                                FROM [Pew_Answer_Std]
UNION ALL
SELECT [c] =  COUNT(DISTINCT
                         CAST([AnswerSet_number] AS VARCHAR(MAX))
                     +   '|'
                     +        [Answer_Wording_std]                )
             + 1 -- AnsSet   7 has 0.00: No/0.50: Yes/1.00: Yes
             + 6 -- AnsSet 226 has Wdg = 'scale 0-[+.1667]-1'
             ,[K] = 'NA'                                FROM [Pew_Answer_Std]
UNION ALL
SELECT [c] =  COUNT(DISTINCT
                         CAST([AnswerSet_number]     AS VARCHAR(MAX))
                     +   '|'
                     +   CAST([NA_by_set_of_Answers] AS VARCHAR(MAX))
                     +   '|'
                     +        [Full_set_of_Answers] )
             ,[K] = 'NS'                                FROM [Pew_Answer_Std]
UNION ALL
SELECT [c] =  COUNT(DISTINCT  [AnswerSet_number]    )
             ,[K] = 'NS'                                FROM [Pew_Answer_Std]
UNION ALL
SELECT [c] =  COUNT(DISTINCT  [Full_set_of_Answers] )
             ,[K] = 'NS'                                FROM [Pew_Answer_Std]
UNION ALL
SELECT [c] =  COUNT(DISTINCT  [Answer_Std_pk]       )
             + 8 -- Rows in testing query'
             ,[K] = 'Rows (w/8 [test-q])'               FROM [Pew_Answer_Std]

                                                                           ) D /* END selection for numeric consistency   */
/**************************************************************************************************************************/
GO
