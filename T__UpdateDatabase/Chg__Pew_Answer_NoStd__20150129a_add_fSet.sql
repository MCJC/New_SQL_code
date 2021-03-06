/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
--USE [x_LoadRLS1cUS]                                                          /* use working database                    */
  USE [forum]                                                                  /* use final database                      */
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Answer_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Answer_NoStd]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
-- select distinct * from                                                      /*  select sttm. for testing Set of Values */
(                                                                              /*> Set of Vals: QWd+StdVal+NoStdVal+AnsWd */
        SELECT Q =  'RLS14all_racenew'
             , V =  1 
             , X =  1 
             , Y =  'White NH'


  UNION SELECT Q =  'RLS14all_racenew'
             , V =  2 
             , X =  2 
             , Y =  'Black NH'


  UNION SELECT Q =  'RLS14all_racenew'
             , V =  3 
             , X =  3 
             , Y =  'Asian NH'


  UNION SELECT Q =  'RLS14all_racenew'
             , V =  4 
             , X =  4 
             , Y =  'Other/Mi'


  UNION SELECT Q =  'RLS14all_racenew'
             , V =  5 
             , X =  5 
             , Y =  'Latino'


  UNION SELECT Q =  'RLS14all_racenew'
             , V =  99 
             , X =  9 
             , Y =  'DK/REF'


  UNION SELECT Q =  'RLS14all_citizen'
             , V =  1 
             , X =  0 
             , Y =  'R is not a US citizen'


  UNION SELECT Q =  'RLS14all_citizen'
             , V =  2 
             , X =  1 
             , Y =  'R is a US citizen'


  UNION SELECT Q =  'RLS14all_regvoter'
             , V =  1 
             , X =  0 
             , Y =  'R is not absolutely certain registered to vote'


  UNION SELECT Q =  'RLS14all_regvoter'
             , V =  2 
             , X =  1 
             , Y =  'R is absolutely certain registered to vote'


  UNION SELECT Q =  'RLS07cUS_racenew'
             , V =  1 
             , X =  1 
             , Y =  'White NH'


  UNION SELECT Q =  'RLS07cUS_racenew'
             , V =  2 
             , X =  2 
             , Y =  'Black NH'


  UNION SELECT Q =  'RLS07cUS_racenew'
             , V =  3 
             , X =  3 
             , Y =  'Asian NH'


  UNION SELECT Q =  'RLS07cUS_racenew'
             , V =  4 
             , X =  4 
             , Y =  'Other/Mi'


  UNION SELECT Q =  'RLS07cUS_racenew'
             , V =  5 
             , X =  5 
             , Y =  'Latino'


  UNION SELECT Q =  'RLS07cUS_racenew'
             , V =  99 
             , X =  9 
             , Y =  'DK/REF'


  UNION SELECT Q =  'RLS07cUS_citizen'
             , V =  1 
             , X =  0 
             , Y =  'R is not a US citizen'


  UNION SELECT Q =  'RLS07cUS_citizen'
             , V =  2 
             , X =  1 
             , Y =  'R is a US citizen'


  UNION SELECT Q =  'RLS07cUS_regvoter'
             , V =  1 
             , X =  0 
             , Y =  'R is not absolutely certain registered to vote'


  UNION SELECT Q =  'RLS07cUS_regvoter'
             , V =  2 
             , X =  1 
             , Y =  'R is absolutely certain registered to vote'

                                                                             ) /* <   Set of Values ends!                 */
-- testset                                                                     /*     alias for testing Set of Values     */
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	               [Pew_Answer_NoStd]                                          /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* higher level select statement...        */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Answer_pk]          =   ROW_NUMBER()                                /* number all rows                         */
                                OVER( ORDER BY [Qk], [X])                   /* sorted by Q_pk & NoStdAnsValue          */
                             + (SELECT     MAX([Answer_pk])                 /* add currently max pk                    */
                                  FROM         [Pew_Answer_NoStd])          /* from NoStdAnswers                       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Answer_value_NoStd] =  [X]                                          /* value coded in original dataset         */
      ,[Answer_Wording]     =  [Y]                                          /* wording exactly as original ValueLabel  */
      ,[Answer_Std_fk]      =  [SAk]                                        /* fk as StdAns_pk, pulled...              */
      ,[Question_fk]        =  [Qk]                                         /* fk as NoStdQ_pk, pulled...              */
/*------------------------------------------------------------------------------------------------------------------------*/
FROM   (                                                                       /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
         SELECT                                                                /* sub-query select statement...           */
/*------------------------------------------------------------------------------------------------------------------------*/
                 [Qk]       = ( SELECT [Question_pk]                           /* identify available Q_pk (curr unique)   */
                                  FROM [Pew_Question]                          /* as presented in Std&NoStdQuestions view */
                                 WHERE [Question_abbreviation]       = [Q]   ) /* filter by corresponding Q_abbreviation  */
/*------------------------------------------------------------------------------------------------------------------------*/
               , [SAk]      = ( SELECT [Answer_Std_pk]                         /* identify corresponding A_pk             */
                                  FROM [Pew_Answer_Std]                        /* as stored in StdAnswers table           */
                                 WHERE [Answer_value_std]            = [V]     /* filter by already known StdValue...     */
                                 AND   [AnswerSet_number]            =         /* and by matching AnswerSetNum to...      */
                                     ( SELECT [AnswerSet_num]                  /*   identified available AnswerSetNum     */
                                         FROM [Pew_Question]                   /*   as presented in Std&NoStdQs view      */
                                        WHERE [Question_abbreviation]= [Q] ) ) /*   filter by corresponding Q_abbrev      */
/*------------------------------------------------------------------------------------------------------------------------*/
      , *                                                                      /* all other variables in CTE              */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdAnswers)      */
/*------------------------------------------------------------------------------------------------------------------------*/
                                                              )   AS NoStdAns  /* alias of sub-query                      */
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Answer_NoStd]                                               /* check results in modified table         */
/**************************************************************************************************************************/

