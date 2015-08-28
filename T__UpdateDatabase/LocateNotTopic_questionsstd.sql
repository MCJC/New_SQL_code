/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Question_Std_pk]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
  FROM [forum].[dbo].[Pew_Question_Std]
where [Question_Std_pk] not in
(

select distinct [Question_Std_fk]
  FROM [forum].[dbo].[Pew_Question_Topic])