/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
 --      distinct
       [f]                                   = sum(1)
      -- [entity]
      --,[QA_fk]
      --,[link_fk]
      --,[Nation_fk]
      --,[Locality_fk]
      --,[Religion_fk]
      --,[Region5]
      --,[Region6]
      --,[Ctry_EditorialName]
      --,[Locality]
      --,[Religion]
      ,
         [Question_Year]
      ,
         [QA_std]
      --,[QW_std]
      ,[Answer_value]
      ,
         [Answer_value_Std]
      ,[Answer_value_NoStd]
      --,[answer_wording]
      --,[answer_wording_std]
      --,[Data_source_name]
      --,[Question_Std_fk]
      --,[Question_fk]
      --,[Answer_Std_fk]
      --,[Answer_fk]
      --,[AnswerSet_number]
      --,[Question_wording_std]
      --,[Question_wording]
      --,[Question_abbreviation]
      --,[NA_by_set_of_Answers]
      --,[Full_set_of_Answers]
      --,[Display_by_StdQ]
      --,[Display_by_NoSQ]
      --,[Display_by_Ans]
      --,[Editorially_Checked]
      --,[Notes]
  FROM [forum_ResAnal].[dbo].[vr___01_]
where
       [QA_std] like  'SHI_11%'

group by
         [QA_std]
      ,
         [Question_Year]
      ,
         [Answer_value_Std]
      ,[Answer_value]
      ,[Answer_value_NoStd]

order by
         [QA_std]
      ,
         [Question_Year]
      ,
         [Answer_value_Std]







/*



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [entity]
      ,[QA_fk]
      ,[link_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Region5]
      ,[Region6]
      ,[Ctry_EditorialName]
      ,[Locality]
      ,[Religion]
      ,[Question_Year]
      ,[QA_std]
      ,[QW_std]
      ,[Answer_value]
      ,[Answer_value_Std]
      ,[Answer_value_NoStd]
      ,[answer_wording]
      ,[answer_wording_std]
      ,[Data_source_name]
      ,[Question_Std_fk]
      ,[Question_fk]
      ,[Answer_Std_fk]
      ,[Answer_fk]
      ,[AnswerSet_number]
      ,[Question_wording_std]
      ,[Question_wording]
      ,[Question_abbreviation]
      ,[NA_by_set_of_Answers]
      ,[Full_set_of_Answers]
      ,[Display_by_StdQ]
      ,[Display_by_NoSQ]
      ,[Display_by_Ans]
      ,[Editorially_Checked]
      ,[Notes]
  FROM [forum_ResAnal].[dbo].[vr___01_]






*/