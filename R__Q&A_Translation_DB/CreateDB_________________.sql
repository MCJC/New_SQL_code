/**************************************************************************************************************************/
/*****                                                                                                                *****/
/*****                                                 [TranslatQs]                                                   *****/
/*****                                                                                                                *****/
/**************************************************************************************************************************/
USE [TranslatQs]
GO
/**************************************************************************************************************************/
/* >   1  temp table ******************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID  ('tempdb..#QA')                        IS NOT NULL
DROP TABLE              #QA
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT 
       DISTINCT
       [Question_Std_fk]
      ,[Question_fk]
      ,[AnswerSet_num]
      ,[AnswerSet_number]
      ,[Answer_Std_fk]
      ,[Answer_fk]
      ,[Data_source_fk]
      ,[Pew_Data_Collection]
      ,[Pew_Data_SubCollection]
      ,[Data_source_name]
      ,[Question_abbreviation_std]
      ,[Question_abbreviation]
      ,[Question_short_wording_std]
      ,[Question_wording]
      ,[Question_Year]
      ,[Notes]
      ,[Answer_value]
      ,[Answer_value_Std]
      ,[Answer_value_NoStd]
      ,[Answer_Wording_std]
      ,[Answer_Wording]
      ,[Full_set_of_Answers]
      ,[NA_by_set_of_Answers]
      ,[Display]
      ,[Editorially_Checked]
  INTO [#QA]
  FROM [forum].[dbo].[Pew_Q&A]
 WHERE [Question_abbreviation_std] like 'SVY%'
/*------------------------------------------------------------------------------------------------------------------------*/
/* <   1  temp table ******************************************************************************************************/
/**************************************************************************************************************************/



/**************************************************************************************************************************/
       SELECT
       *
       FROM
       [#QA]
/**************************************************************************************************************************/


/**************************************************************************************************************************/
SELECT [Question_pk]                                       = [Question_fk]
      ,*
  INTO [TranslatQs].[dbo].[Pew_Question_NoStd]
  FROM(
       SELECT
       DISTINCT
       [Question_fk]
      ,[Question_Abbreviation]
      ,[Question_Wording]
      ,[Question_Wording_Spanish]                          = ''
      ,[Question_Year]
      ,[Notes]
      ,[Data_Source_fk]
      ,[Question_Std_fk]
      ,[FQuestion_fk]                                      = [Question_fk]
       FROM
       [#QA]                                                                                                         ) QA
/**************************************************************************************************************************/
SELECT [Answer_pk]                                         = [Answer_fk]
      ,*
  INTO [TranslatQs].[dbo].[Pew_Answer_NoStd]
  FROM(
       SELECT
       DISTINCT
       [Answer_fk]
      ,[Answer_Value_NoStd]
      ,[Answer_Wording]
      ,[Answer_Wording_Spanish]                            = ''
      ,[Answer_Std_fk]
      ,[Question_fk]
      ,[FAnswer_fk]                                        = [Answer_fk]
       FROM
       [#QA]                                                                                                         ) QA
/**************************************************************************************************************************/
SELECT [Answer_Std_pk]                                     = [Answer_Std_fk]
      ,*
  INTO [TranslatQs].[dbo].[Pew_Answer_Std]
  FROM(
       SELECT
       DISTINCT
       [Answer_Std_fk]
      ,[AnswerSet_number]
      ,[Answer_Value_std]
      ,[Answer_Wording_std]
      ,[Full_Set_of_Answers]
      ,[NA_by_Set_of_Answers]
      ,[FAnswer_Std_fk]                                    = [Answer_Std_fk]
       FROM
       [#QA]                                                                                                         ) QA
/**************************************************************************************************************************/
SELECT [Question_Std_pk]                                   = [Question_Std_fk]
      ,*
  INTO [TranslatQs].[dbo].[Pew_Question_Std]
  FROM(
       SELECT
       DISTINCT
       [Question_Std_fk]
      ,[Question_Abbreviation_Std]
      ,[Question_Wording_Std]                              = [Question_short_wording_std]
      ,[AnswerSet_num]
      ,[FQuestion_Std_fk]                                  = [Question_Std_fk]
       FROM
       [#QA]                                                                                                         ) QA
/**************************************************************************************************************************/
SELECT [Data_Source_pk]                                    = [Data_source_fk]
      ,*
  INTO [TranslatQs].[dbo].[Pew_Data_Source]
  FROM(
       SELECT
       DISTINCT
       [Data_Source_fk]
      ,[Data_Source_Name]
      ,[Pew_Data_Collection]
      ,[Pew_Data_SubCollection]
      ,[FData_Source_fk]                                   = [Data_source_fk]
       FROM
       [#QA]                                                                                                         ) QA
/**************************************************************************************************************************/
