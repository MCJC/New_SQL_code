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
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + 'a]
                FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: SQSW+QAbb+QWdg+QY+QNt+DSN */
        SELECT S =  'Recoded Education Variable'
             , A =  'RLS14all_educcmb'
             , W =  'TREAT WITH CAUTION: Recoded Education Variable for 2007/2014 comparisons -- NOT directly comparable'
             , Y =   2014 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Recoded Education Variable'
             , A =  'RLS07cUS_educcmb'
             , W =  'TREAT WITH CAUTION: Recoded Education Variable for 2007/2014 comparisons -- NOT directly comparable'
             , Y =   2007 
             , N =  'recoded to make it comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2007) - Continental US'

                                                                             ) /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	               [Pew_Question_NoStd]                                        /* target table in current database        */
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

