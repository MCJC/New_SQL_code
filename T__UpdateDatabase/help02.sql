/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Answer_pk]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
      ,[Notes]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
  FROM [forum].[dbo].[Pew_answer]
     , [forum].[dbo].[Pew_question]

where
       [Question_pk]
      =[Question_fk]
AND
       [Answer_wording] like '%crude bomb went off Tuesday afternoon%'
