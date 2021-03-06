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
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: QSWd+QAbb+QWdg+QY+QNt+DSN */
        SELECT S =  'Country of birth of the respondent'
             , A =  'RLS07cUS_respondent_birthcountry'
             , W =  'Country of birth of the respondent'
             , Y =   2007 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2007) - Continental US'


  UNION SELECT S =  'Country of birth of the respondent'
             , A =  'RLS14all_respondent_birthcountry'
             , W =  'Country of birth of the respondent'
             , Y =   2014 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Country of birth of the respondent''s father'
             , A =  'RLS07cUS_father_birthcountry'
             , W =  'Country of birth of the respondent''s father (asked only of respondents who were born in the U.S.)'
             , Y =   2007 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2007) - Continental US'


  UNION SELECT S =  'Country of birth of the respondent''s father'
             , A =  'RLS14all_father_birthcountry'
             , W =  'Country of birth of the respondent''s father (asked only of respondents who were born in the U.S.)'
             , Y =   2014 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Country of birth of the respondent''s mother'
             , A =  'RLS07cUS_mother_birthcountry'
             , W =  'Country of birth of the respondent''s mother (asked only of respondents who were born in the U.S.)'
             , Y =   2007 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2007) - Continental US'


  UNION SELECT S =  'Country of birth of the respondent''s mother'
             , A =  'RLS14all_mother_birthcountry'
             , W =  'Country of birth of the respondent''s mother (asked only of respondents who were born in the U.S.)'
             , Y =   2014 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Region of birth of the respondent'
             , A =  'RLS07cUS_respondent_birthregion'
             , W =  'Region of birth of the respondent'
             , Y =   2007 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2007) - Continental US'


  UNION SELECT S =  'Region of birth of the respondent'
             , A =  'RLS14all_respondent_birthregion'
             , W =  'Region of birth of the respondent'
             , Y =   2014 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Region of birth of the respondent''s father'
             , A =  'RLS07cUS_father_birthregion'
             , W =  'Region of birth of the respondent''s father'
             , Y =   2007 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2007) - Continental US'


  UNION SELECT S =  'Region of birth of the respondent''s father'
             , A =  'RLS14all_father_birthregion'
             , W =  'Region of birth of the respondent''s father'
             , Y =   2014 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Region of birth of the respondent''s mother'
             , A =  'RLS07cUS_mother_birthregion'
             , W =  'Region of birth of the respondent''s mother'
             , Y =   2007 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2007) - Continental US'


  UNION SELECT S =  'Region of birth of the respondent''s mother'
             , A =  'RLS14all_mother_birthregion'
             , W =  'Region of birth of the respondent''s mother'
             , Y =   2014 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


--  UNION SELECT N =  2, V =  1.00 , W = 'Set Two - Value One'
--  UNION SELECT N =  2, V =  2.00 , W = 'Set Two - Value Two'
                                                                             ) /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO                                                                    /* insert statement                        */
               [Pew_Question_NoStd]                                            /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* select statement...                     */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Question_pk]           =   ROW_NUMBER()                                /* number all rows                         */
                                   OVER( ORDER BY [Y], [A])                    /* sorted by year & answer wording (NoStd) */
                                + (SELECT     MAX([Question_pk])               /* add currently max pk                    */
                                     FROM         [Pew_Question_NoStd])        /* from NoStdQuestions                     */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_abbreviation] =  [A]                                          /* abbreviation form VarName in dataset    */
      ,[Question_wording]      =  [W]                                          /* wording exactly as VarLabel in dataset  */
      ,[Question_Year]         =  [Y]                                          /* as coded for the survey                 */
      ,[Notes]                 =  [N]                                          /* as decided for understanding questions  */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Data_source_fk]        =  ( SELECT [Data_source_pk]                    /* fk from the selected DataSource_pk      */
                                      FROM [Pew_Data_Source]                   /* as stored in the DataSource table       */
                                     WHERE [Data_source_name]           = [D]) /* filter by the corresponding DataSource  */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_Std_fk]       =  ( SELECT [Question_Std_pk]                   /* fk from the selected QStd_pk            */
                                      FROM [Pew_Question_Std]                  /* as stored in StdQuestions table         */
                                     WHERE [Question_short_wording_std] = [S]) /* filtered by using the known ShWdgStd    */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdQuestions)    */
/*------------------------------------------------------------------------------------------------------------------------*/
--WHERE                                                                        /* filter by...                            */
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Question_NoStd]                                             /* check results in modified table         */
/**************************************************************************************************************************/

