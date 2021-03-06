/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Question_Std_pk]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
  FROM [forum].[dbo].[Pew_Question_Std]
where  Question_abbreviation_std like 'SHX_27_01%'  


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Question_pk]
      ,[Question_abbreviation]
      ,[Question_wording]
      ,[Data_source_fk]
      ,[Question_Year]
      ,[Short_wording]
      ,[Notes]
      ,[Default_response]
      ,[Question_Std_fk]
  FROM [forum].[dbo].[Pew_Question_NoStd]
where  [Question_Std_fk] IN ( 255, 256 )



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Answer_pk]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
  FROM [forum].[dbo].[Pew_Answer]
where [Question_fk] in (497, 1187 )