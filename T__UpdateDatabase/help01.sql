USE
[_bk_forum]
--[forum]
GO
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
       [Question_abbreviation_std]
      ,[nation_fk]
      ,[Locality_fk]
      ,[Ctry_EditorialName]
      ,[Locality]
      ,[Answer_fk]
      ,[display]
      ,[Answer_pk]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
      ,[Question_pk]
      ,[Question_abbreviation]
      ,[Question_wording]
      ,[Data_source_fk]
      ,[Question_Year]
      ,[Short_wording]
      ,[Notes]
      ,[Default_response]
      ,[Question_wording_std]
      ,[Locality_answer_pk]
      ,[Question_short_wording_std]


  FROM 
       [dbo].[Pew_Nation]
     , [dbo].[Pew_Locality]
     , [dbo].[Pew_Locality_Answer_2013_03_20]
     , [dbo].[Pew_Answer_20140227]  -- 2012_12_21]
     , [dbo].[Pew_question_2012DEC21]
     --, [dbo].[Pew_locality_answer]
     --, [dbo].[Pew_answer]
     --, [dbo].[Pew_question]
WHERE
       [Answer_pk]
      =[Answer_fk]
AND
       [Question_pk]
      =[Question_fk]
AND
       [Locality_pk]
      =[Locality_fk]
AND
       [nation_pk]
      =[nation_fk]
AND
       [nation_pk]
      =70
AND
       [Question_Year]
      =2011
AND
       [Question_abbreviation_std]
        LIKE 'SHI_04%'      
      


