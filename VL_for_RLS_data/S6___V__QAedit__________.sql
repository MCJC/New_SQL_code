USE [RLS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************/
ALTER VIEW    [dbo].[Questio&Answer_wordings]
AS
/*********************************************************************************************************/
SELECT
/*********************************************************************************************************/
       [RowN]                      = ROW_NUMBER()
                                            OVER(
                                            ORDER BY  
                                                     [Question_Std_fk]
                                                    ,[Answer_Std_fk]            )
/*********************************************************************************************************/
      ,[Question_Std_fk]
      ,[Answer_Std_fk]
      ,[AnswerSet_num]
      ,[Answer_value_std]
      --,[Question_abbreviation_std]
      --,[Question_wording_std]
      ,[Question_short_wording_std]
      --,[Question_Label_80Chars]
      ,[Answer_Wording_std]
      --,[Display]
      --,[Editorially_Checked]
      --,[Full_set_of_Answers]
      --,[NA_by_set_of_Answers]
/*********************************************************************************************************/
  FROM [RLS].[dbo].[Pew_Q&A_Std]
/*********************************************************************************************************/
GO
