/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Ctry_EditorialName]
      ,[Std_VarName]
      ,[link_fk]
      ,[Answer_fk]
      ,[Answer_value]
      ,[Answer_wording]
      ,[entity]
      ,[link_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Locality]
      ,[Religion]
      ,[Question_Year]
      ,[Question_wording]
      ,[Question_fk]
      ,[Notes]
  FROM [juancarlos].[dbo].[Restrictions_Data]
where Question_Year      = 2011
--and   Nation_fk          = 158
--and   Locality_fk = 
and Std_VarName like 'SHI_04'


order by Std_VarName
       
       , Answer_fk
       , Nation_fk
