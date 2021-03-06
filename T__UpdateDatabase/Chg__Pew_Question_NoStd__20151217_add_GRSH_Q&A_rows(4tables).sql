-- multi-script: change involves 3 to 4 tables
-- in this order:
--   + Chg__Pew_Answer_Std
--   + Chg__Pew_Question_Std
--   + Chg__Pew_Question_NoStd

/*
   Variables:
           K =  NN -- AnswerSetNumber      j  (i=StdAValue|j=ASetN)
           V =  NN -- StdAnswerValue      ij  (i=StdAValue|j=ASetN)
           W =  @@ -- StdAnswerWording    ij  (i=StdAValue|j=ASetN)



     Q = StdQuestionAbbreviation 
  --   L = '' -- StdQuestionWording      ij  (i=FSetAns|j=SQ)
  --  ,S = '' -- StdQuestionShortWording ij  (i=FSetAns|j=SQ)
    ,C =  StdQuestion80Characters
    ,P =  StdQuestionPublicSetName 


  --  ,F = '' -- FullSet_of_Answers      i   (i=FSetAns|j=SQ)
  --  UNION
  --  SELECT .   .   . "


SELECT
     Q = StdQuestionAbbreviation 
     Q = '' -- QuestionAbbreviation    ijk (i=DSN|j=SQ|k=Q)
     L = '' -- QuestionWording         ijk (i=DSN|j=SQ|k=Q)
    ,Y =  1 -- QuestionYear            ijk (i=DSN|j=SQ|k=Q)
    ,N = '' -- QuestionNote            ijk (i=DSN|j=SQ|k=Q)
    ,D = '' -- DataSourceName          i   (i=DSN|j=SQ|k=Q)

     Q = 'GRI_19_b_scaled' 
    ,L = 'Was property damaged, due to religion, as a result of any level of government action or policy?' 
    ,S = 'Did  government action or policy result in damaged property due to religion?' 
    ,C = 'Did  government action or policy result in damaged property due to religion?' 
    ,P = 'GRI_Q_19_Property_Damage' 

    UNION
  --  SELECT .   .   . "
*/


/**************************************************************************************************************************/
USE [forum]
GO
/**************************************************************************************************************************/
/*****                                                    STEP 000                                                    *****/
/*****                                           BackUp  current Table(s)                                             *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE @TofI    varchar(50)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
   DECLARE    MyCursor       CURSOR FOR      -- as a cursor to take values from
/*------------------------------------------------------------------------------------------------------------------------*/
                 SELECT   'Pew_Question_NoStd'
           UNION SELECT   'Pew_Question_Std'
           UNION SELECT   'Pew_Answer_Std'
/*------------------------------------------------------------------------------------------------------------------------*/
   OPEN           MyCursor                   -- cursor name
FETCH NEXT FROM   MyCursor                   -- retrieve the next row
           INTO   @TofI                      --  variable name
          WHILE   @@FETCH_STATUS = 0  BEGIN
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT * INTO  [_bk_forum].[dbo].[' + @TofI + '_' + @CrDt + ']
                  FROM      [forum].[dbo].[' + @TofI               + ']' )
/*------------------------------------------------------------------------------------------------------------------------*/
FETCH NEXT FROM   MyCursor                   -- retrieve the next row
           INTO   @TofI               END    --  variable name
   CLOSE          MyCursor                   -- cursor name
DEALLOCATE        MyCursor                   -- cursor name
/**************************************************************************************************************************/



/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                      SECTION A: Store set of Std As-parameters as Common Table Expression                      *****/
/**************************************************************************************************************************/
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/



/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                      SECTION A: Store set of Std Qs-parameters as Common Table Expression                      *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: SQWdg + SQShWdg + FSetAns */
----------------------------------------------------------------------------------------------------------------------------
      SELECT
     Q = 'GRI_19_b_scaled' 
    ,L = 'Was property damaged, due to religion, as a result of any level of government action or policy?' 
    ,S = 'Did  government action or policy result in damaged property due to religion?' 
    ,C = 'Did  government action or policy result in damaged property due to religion?' 
    ,P = 'GRI_Q_19_Property_Damage' 
UNION SELECT
     Q = 'GRI_19_c_scaled' 
    ,L = 'Were there detentions or abductions, due to religion, as a result of any level of government action or policy?' 
    ,S = 'Did government action or policy result in detentions or abductions due to religion?' 
    ,C = 'Did Gov action or policy result in detentions or abductions due to religion?' 
    ,P = 'GRI_Q_19_Detentions' 
UNION SELECT
     Q = 'GRI_19_d_scaled' 
    ,L = 'Were individuals displaced from their homes, due to religion, by any level of government action or policy?' 
    ,S = 'Did government action or policy displace people from their homes due to religion?' 
    ,C = 'Did Gov action or policy displace people from their homes due to religion?' 
    ,P = 'GRI_Q_19_Displacements' 
UNION SELECT
     Q = 'GRI_19_e_scaled' 
    ,L = 'Were there physical assaults, due to religion, motivated by any level of government action or policy in this country?' 
    ,S = 'Did government action or policy result in physical assaults due to religion?' 
    ,C = 'Did government action or policy result in physical assaults due to religion?' 
    ,P = 'GRI_Q_19_Abuse' 
UNION SELECT
     Q = 'GRI_19_f_scaled' 
    ,L = 'Were there deaths, due to religion, motivated by any level of government action or policy in this country?' 
    ,S = 'Did government action or policy result in death due to religion?' 
    ,C = 'Did government action or policy result in death due to religion?' 
    ,P = 'GRI_Q_19_Deaths' 
----------------------------------------------------------------------------------------------------------------------------
)                                                                              /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	              [Pew_Question_Std]                                           /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* select statement...                     */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Question_Std_pk]            =    ROW_NUMBER()                          /* number all rows                         */
                                         OVER(ORDER BY [Q])                    /* sorted by FullSetAns & QShortWordingStd */
                                      + (SELECT MAX([Question_Std_pk])         /* add currently max pk                    */
                                           FROM [Pew_Question_Std])            /* from StdQuestions                       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_abbreviation_std]  = [Q]
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_wording_std]       = [L]                                      /* wording std as to be coded              */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_short_wording_std] = [S]                                      /* short wording std as to be displayed    */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Display]                    = 0                                        /* set display to zero (provisionally)     */
/*------------------------------------------------------------------------------------------------------------------------*/
	  ,[AnswerSet_num]              = 16                                       /*                                         */
/* -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   - */
--	  ,[AnswerSet_num]              = [K]                                      /*                                         */
/* -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   - */
--	  ,[AnswerSet_num]              = ( SELECT                                 /*                                         */
--	                                  DISTINCT [AnswerSet_number]              /* pull distinct AnswerSet Number          */
--	                                      FROM [forum]..[Pew_Answer_Std]       /* from StdAnswer table                    */
--	                                     WHERE [Full_set_of_Answers] = [F]   ) /* filter using the known FullSet of Ans   */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Editorially_Checked]        = 'NO!'                                    /* label as not editorially checked        */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_Label_80Chars]     = [C]                                      /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[In_PubDataSet]              = [P]                                      /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdQuestions)    */
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/



/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: SQWdg + SQShWdg + FSetAns */
----------------------------------------------------------------------------------------------------------------------------
      SELECT
             Q = 'GRI_19_b_scaled' 
            ,L = 'Was property damaged, due to religion, as a result of any level of government action or policy?' 
            ,N = 'question for aggregated values' 
            ,D =  27 
UNION SELECT
             Q = 'GRI_19_c_scaled' 
            ,L = 'Were there detentions or abductions, due to religion, as a result of any level of government action or policy?' 
            ,N = 'question for aggregated values' 
            ,D =  27 
UNION SELECT
             Q = 'GRI_19_d_scaled' 
            ,L = 'Were individuals displaced from their homes, due to religion, by any level of government action or policy?' 
            ,N = 'question for aggregated values' 
            ,D =  27 
UNION SELECT
             Q = 'GRI_19_e_scaled' 
            ,L = 'Were there physical assaults, due to religion, motivated by any level of government action or policy in this country?' 
            ,N = 'question for aggregated values' 
            ,D =  27 
UNION SELECT
             Q = 'GRI_19_f_scaled' 
            ,L = 'Were there deaths, due to religion, motivated by any level of government action or policy in this country?' 
            ,N = 'question for aggregated values' 
            ,D =  27 
----------------------------------------------------------------------------------------------------------------------------
)                                                                              /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	               [Pew_Question_NoStd]                                        /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* select statement...                     */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Question_pk]           =   ROW_NUMBER()                                /* number all rows                         */
                                   OVER( ORDER BY [Q])                         /* sorted by year & answer wording (NoStd) */
                                + (SELECT     MAX([Question_pk])               /* add currently max pk                    */
                                     FROM         [Pew_Question_NoStd])        /* from NoStdQuestions                     */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_abbreviation] =  [Q]                                          /* abbreviation form VarName in dataset    */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_wording]      =  [L]                                          /* wording exactly as VarLabel in dataset  */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_Year]         =  NULL                                         /* as coded for the survey                 */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Notes]                 =  'question for aggregated values'             /* as decided for understanding questions  */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Display]               =  0                                            /* set display to zero (provisionally)     */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Data_source_fk]        =  27                                           /* fk from the selected DataSource_pk      */
/* -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   -    -   - */
--	  ,[Data_source_fk]        =  ( SELECT [Data_source_pk]                    /* fk from the selected DataSource_pk      */
--	                                  FROM [Pew_Data_Source]                   /* as stored in the DataSource table       */
--	                                 WHERE [Data_source_name]           = [D]) /* filter by the corresponding DataSource  */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_Std_fk]       =  ( SELECT [Question_Std_pk]                   /* fk from the selected QStd_pk            */
                                      FROM [Pew_Question_Std]                  /* as stored in StdQuestions table         */
                                     WHERE [Question_abbreviation_std]  = [Q]) /* filtered by using the known ShWdgStd    */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdQuestions)    */
/*------------------------------------------------------------------------------------------------------------------------*/
--WHERE                                                                        /* filter by...                            */
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/






/**************************************************************************************************************************/
/*****                                                    STEP 004                                                    *****/
/**************************************************************************************************************************/
--SELECT * FROM [Pew_Question_NoStd]                                             /* check results in modified table         */
/**************************************************************************************************************************/
