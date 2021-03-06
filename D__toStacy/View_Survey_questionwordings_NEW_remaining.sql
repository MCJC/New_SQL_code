USE [Stacy's]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE VIEW
  ALTER  VIEW
                 [dbo].[Q_CurrentWordings]
AS
/***********************************************************************************************************************/
SELECT
       ROW_NUMBER()
       OVER(ORDER BY   
                      [Question_abbreviation_std]
                    , [Question_abbreviation]
                                                  ) AS RowID
     , *
FROM
(
/***********************************************************************************************************************/
SELECT
       DISTINCT
       [Question_pk]
      ,[Question_Std_pk]
      ,[Question_abbreviation]
      ,[Question_abbreviation_std]
      , Question_wording_std_edited_by_Neha = [Question_wording_std] 
      , Question_wording_std_CurrentVersion = [Question_wording_std]
      --,[Question_wording]
      --,[Short_wording]
      --,[Question_short_wording_std]
      --,[Data_source_fk]
      --,[Question_Year]
      --,[Notes]
      --,[Default_response]
  FROM     [forum].[dbo].[Pew_Question_NoStd]  
      ,    [forum].[dbo].[Pew_Question_Std]    
      ,    [forum].[dbo].[Pew_Answer]
      ,    [forum].[dbo].[Pew_Survey_Tables_Displayable]
WHERE
        [Answer_fk]
      = [Answer_pk]
  AND
        [Question_fk]
      = [Question_pk]
  AND
        [Question_Std_fk]
      = [Question_Std_pk]
/***********************************************************************************************************************/
) AS MYT

