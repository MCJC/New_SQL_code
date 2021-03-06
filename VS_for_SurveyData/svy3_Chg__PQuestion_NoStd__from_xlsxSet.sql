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
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                              Store current max pk                                              *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#CMPK]') IS NOT NULL
  DROP TABLE            [#CMPK]
  SELECT * INTO         [#CMPK] FROM
                                    (SELECT MAX([Question_pk]) AS [CMPK]       /* select currently max pk                 */
                                       FROM     [Pew_Question_NoStd]    ) CM   /* from NoStdQuestions                     */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: SQW+QAbb+QWdg+QY+QNt+DSN  */
        SELECT S =  'StdQWording      jk  (i=NoStd|j=Std|k=DS)'
             , A =  'QAbbreviation   ijk  (i=NoStd|j=Std|k=DS)'
             , W =  'QWording        ijk  (i=NoStd|j=Std|k=DS)'
             , Y =   0000 -- QYr     ijk  (i=NoStd|j=Std|k=DS)
             , N =  'QNote           ijk  (i=NoStd|j=Std|k=DS)'
             , D =  'DataSourceName    k  (i=NoStd|j=Std|k=DS)'

  UNION SELECT S =  'StdQWording      jk  (i=NoStd|j=Std|k=DS)'
             , A =  'QAbbreviation   ijk  (i=NoStd|j=Std|k=DS)'
             , W =  'QWording        ijk  (i=NoStd|j=Std|k=DS)'
             , Y =   0000 -- QYr     ijk  (i=NoStd|j=Std|k=DS)
             , N =  'QNote           ijk  (i=NoStd|j=Std|k=DS)'
             , D =  'DataSourceName    k  (i=NoStd|j=Std|k=DS)'
                                                                             ) /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
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
                                     WHERE [Question_wording_std]       = [S]) /* filtered by using the known QWdgStd     */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdQuestions)    */
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/*****                                      Store  Data_source_fk of loaded data                                      *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#DSFK]') IS NOT NULL
  DROP TABLE            [#DSFK]
  SELECT * INTO         [#DSFK] FROM
                                    (SELECT
                                     DISTINCT [Data_source_fk]        AS DSFK  /*distinct DataSource_fk                   */
                                         FROM [Pew_Question_NoStd]             /* from NoStdQuestions                     */
                                            , [#CMPK]
                                        WHERE [Question_pk] > [CMPK])      FK  /* select recently loaded data             */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 004                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Question_NoStd]                                             /* check results in modified table         */
            , [#CMPK]
        WHERE [Question_pk]         > [CMPK]
     ORDER BY [Question_pk]                                                    /* check results in modified table         */
/**************************************************************************************************************************/
SELECT 
              [check] = CASE
                            WHEN COUNT(*) 
                                 OVER(
                                 PARTITION BY [Question_Std_fk])
                                            = 1
                           THEN   ''
                           ELSE 'check'
                            END
            , *
         FROM [Pew_Question_NoStd]
            , [#DSFK]
        WHERE [Data_source_fk]      = [DSFK]
     ORDER BY [Question_Std_fk]
            , [Question_abbreviation]
            , [Question_pk]                                                    /* check results in modified table         */
/**************************************************************************************************************************/
SELECT * FROM (                                                                /* check consistency of modified table     */
SELECT [c] =  COUNT(DISTINCT  [Question_pk]            )
      ,[K] = 'N_Qpk'
  FROM [Pew_Question_NoStd]
     , [#DSFK]
WHERE 
       [Data_source_fk] = [DSFK]
UNION ALL
SELECT [c] =  COUNT(DISTINCT  [Question_abbreviation]  )
      ,[K] = 'N_NSQA'
  FROM [Pew_Question_NoStd]
     , [#DSFK]
WHERE 
       [Data_source_fk] = [DSFK]
UNION ALL
SELECT [c] =  COUNT(DISTINCT  [Question_wording]       )
      ,[K] = 'N_NSQW'
  FROM [Pew_Question_NoStd]
     , [#DSFK]
WHERE 
       [Data_source_fk] = [DSFK]
UNION ALL
SELECT [c] =  COUNT(DISTINCT  [Question_Std_fk]        )
      ,[K] = 'N_SQfk'
  FROM [Pew_Question_NoStd]
     , [#DSFK]
WHERE 
       [Data_source_fk] = [DSFK]
                                                                           ) D /* END selection for numeric consistency   */
/**************************************************************************************************************************/
GO
