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

        SELECT N =  1 
             , V =  01.00 
             , W =  'Less than high school (Grades 1-8 or no formal schooling)'


  UNION SELECT N =  1 
             , V =  02.00 
             , W =  'High school incomplete (Grades 9-11 or Grade 12 with NO diploma)'


  UNION SELECT N =  1 
             , V =  03.00 
             , W =  'High school graduate (Grade 12 with diploma or GED certificate)'


  UNION SELECT N =  1 
             , V =  04.00 
             , W =  'Some college, no degree (includes some community college)'


  UNION SELECT N =  1 
             , V =  05.00 
             , W =  'Two year associate degree from a college or university'


  UNION SELECT N =  1 
             , V =  06.00 
             , W =  'Four year college or university degree/Bachelor''s degree (e.g., BS, BA, AB)'


  UNION SELECT N =  1 
             , V =  07.00 
             , W =  'Some postgraduate or professional schooling, no postgraduate degree (e.g. some graduate school)'


  UNION SELECT N =  1 
             , V =  08.00 
             , W =  'Postgraduate or professional degree, including master''s, doctorate, medical or law degree (e.g., MA, MS, PhD, MD...)'


  UNION SELECT N =  1 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  2 
             , V =  01.00 
             , W =  '1'


  UNION SELECT N =  2 
             , V =  02.00 
             , W =  '2'


  UNION SELECT N =  2 
             , V =  03.00 
             , W =  '3'


  UNION SELECT N =  2 
             , V =  04.00 
             , W =  '4'


  UNION SELECT N =  2 
             , V =  05.00 
             , W =  '5'


  UNION SELECT N =  2 
             , V =  06.00 
             , W =  '6'


  UNION SELECT N =  2 
             , V =  07.00 
             , W =  '7'


  UNION SELECT N =  2 
             , V =  08.00 
             , W =  '8 or more'


  UNION SELECT N =  2 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  3 
             , V =  01.00 
             , W =  '150 to under $200,000'


  UNION SELECT N =  3 
             , V =  02.00 
             , W =  '200 to under $250,000'


  UNION SELECT N =  3 
             , V =  03.00 
             , W =  '250 to under $300,000'


  UNION SELECT N =  3 
             , V =  04.00 
             , W =  '$300,000 or more'


  UNION SELECT N =  3 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  4 
             , V =  01.00 
             , W =  'Gay / Gay or lesbian,'


  UNION SELECT N =  4 
             , V =  02.00 
             , W =  'Straight, that is, not gay'


  UNION SELECT N =  4 
             , V =  03.00 
             , W =  'Bisexual'


  UNION SELECT N =  4 
             , V =  04.00 
             , W =  'Something else (vol.)'


  UNION SELECT N =  4 
             , V =  97.00 
             , W =  'Don''t know (vol.)'


  UNION SELECT N =  4 
             , V =  98.00 
             , W =  'Refused (vol.)'


  UNION SELECT N =  5 
             , V =  01.00 
             , W =  'Very happy'


  UNION SELECT N =  5 
             , V =  02.00 
             , W =  'Pretty happy'


  UNION SELECT N =  5 
             , V =  03.00 
             , W =  'Not too happy'


  UNION SELECT N =  5 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  6 
             , V =  01.00 
             , W =  'Change for the better'


  UNION SELECT N =  6 
             , V =  02.00 
             , W =  'Change for the worse'


  UNION SELECT N =  6 
             , V =  03.00 
             , W =  'Hasn''t made much difference'


  UNION SELECT N =  6 
             , V =  04.00 
             , W =  'Mixed changes (vol.)'


  UNION SELECT N =  6 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  7 
             , V =  01.00 
             , W =  'Strongly favor'


  UNION SELECT N =  7 
             , V =  02.00 
             , W =  'Favor'


  UNION SELECT N =  7 
             , V =  03.00 
             , W =  'Oppose'


  UNION SELECT N =  7 
             , V =  04.00 
             , W =  'Strongly oppose'


  UNION SELECT N =  7 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  8 
             , V =  01.00 
             , W =  'Government aid to the poor does more harm than good, by making people too dependent on government assistance'


  UNION SELECT N =  8 
             , V =  02.00 
             , W =  'Government aid to the poor does more good than harm, because people can’t get out of poverty until their basic needs are met'


  UNION SELECT N =  8 
             , V =  03.00 
             , W =  'Neither/Both equally (vol.)'


  UNION SELECT N =  8 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  9 
             , V =  01.00 
             , W =  'There are clear and absolute standards for what is right and wrong'


  UNION SELECT N =  9 
             , V =  02.00 
             , W =  'Whether something is right or wrong often depends on the situation'


  UNION SELECT N =  9 
             , V =  03.00 
             , W =  'Neither/Both equally (vol.)'


  UNION SELECT N =  9 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  10 
             , V =  01.00 
             , W =  'Humans and other living things have evolved due to natural processes such as natural selection'


  UNION SELECT N =  10 
             , V =  02.00 
             , W =  'A supreme being guided the evolution of living things for the purpose of creating humans and other life in the form it exists today'


  UNION SELECT N =  10 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  11 
             , V =  01.00 
             , W =  'Yes, did volunteer work in past seven days'


  UNION SELECT N =  11 
             , V =  02.00 
             , W =  'No, did not do volunteer work in past seven days'


  UNION SELECT N =  11 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  12 
             , V =  01.00 
             , W =  'Yes, volunteered mainly through church/other religious organization'


  UNION SELECT N =  12 
             , V =  02.00 
             , W =  'No, volunteering was not done mainly through church/other religious organization'


  UNION SELECT N =  12 
             , V =  03.00 
             , W =  'Volunteered both through religious organization and in other way (vol.)'


  UNION SELECT N =  12 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  13 
             , V =  01.00 
             , W =  'Agree'


  UNION SELECT N =  13 
             , V =  02.00 
             , W =  'Disagree'


  UNION SELECT N =  13 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'


  UNION SELECT N =  14 
             , V =  01.00 
             , W =  'High'


  UNION SELECT N =  14 
             , V =  02.00 
             , W =  'Medium'


  UNION SELECT N =  14 
             , V =  03.00 
             , W =  'Low'


  UNION SELECT N =  14 
             , V =  99.00 
             , W =  'DK/Ref. (vol.)'
                                                                             ) /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
	INSERT INTO                                                                /* insert statement                        */
	               [Pew_Answer_Std]                                            /* table in working database               */
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
