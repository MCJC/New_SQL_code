USE [Stacy's]
GO
/**************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**************************************************************************************************************************/
--CREATE 
ALTER 
      View [dbo].[Restrictions_Data_for_NumberChecking] as 
/**************************************************************************************************************************/
SELECT  
        TOP 5000  -- in order to sort 3,843 records
        *
FROM
(
/**********************************************************************************************/
SELECT 
        DISTINCT
       [Question_Year]
      , Region = 'WORLD'
      ,[Question_abbreviation_std]
      ,[Question_short_wording_std]
      ,[Answer_value]
      ,[answer_wording_std]
      , SUM(1)
               OVER(PARTITION BY [Question_Year]
                                ,[Question_abbreviation_std]
                                ,[Answer_value]
                                                             )  AS N  
  FROM [forum].[dbo].[Restrictions_byCtry]  D
     , [forum].[dbo].[Pew_Nation]           N
WHERE          Nation_fk
             = Nation_pk
/**********************************************************************************************/
UNION
/**********************************************************************************************/
SELECT 
        DISTINCT
       [Question_Year]
      , Region = [SubRegion6]
      ,[Question_abbreviation_std]
      ,[Question_short_wording_std]
      ,[Answer_value]
      ,[answer_wording_std]
      , SUM(1)
               OVER(PARTITION BY [SubRegion6]
                                ,[Question_Year]
                                ,[Question_abbreviation_std]
                                ,[Answer_value]
                                                             )  AS N  
  FROM [forum].[dbo].[Restrictions_byCtry]  D
     , [forum].[dbo].[Pew_Nation]           N
WHERE          Nation_fk
             = Nation_pk
/**********************************************************************************************/
) AS DD
/**********************************************************************************************/
ORDER BY      Question_Year
            , Region
            , Question_abbreviation_std
            , Answer_value
/**********************************************************************************************/
