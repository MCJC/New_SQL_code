USE [for_x]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
--create VIEW
ALTER  VIEW
               [dbo].[V9X_2011]
AS
/***************************************************************************************************************************************************************/
SELECT 
       [V9xRow]
      ,[Ctry_EditorialName]
      ,[Question_Year]
      ,[QA_std]
                = case 
                  when [QA_std]  = 'GRI_08_for_index'
                  then             'GRI_08'
                  when [QA_std]  = 'SHI_11_for_index'
                  then             'SHI_11'
                  else [QA_std]
                  end
      ,[QW_std]
      ,[Answer_value]
      ,[AW_std]
  FROM [for_x].[dbo].[T9x_LongData]
WHERE 
       [Question_Year]  IN (2010, 2011 )
AND
       [QA_std]  IN (
                       'GRI_01'
                     , 'GRI_02'
                     , 'GRI_03'
                     , 'GRI_04'
                     , 'GRI_05'
                     , 'GRI_06'
                     , 'GRI_07'
                     , 'GRI_08_index'
                     , 'GRI_09'
                     , 'GRI_10'
                     , 'GRI_11'
                     , 'GRI_12'
                     , 'GRI_13'
                     , 'GRI_14'
                     , 'GRI_15'
                     , 'GRI_16'
                     , 'GRI_17'
                     , 'GRI_18'
                     , 'GRI_19'
                     , 'GRI_20'
                     , 'SHI_01'
                     , 'SHI_02'
                     , 'SHI_03'
                     , 'SHI_04'
                     , 'SHI_05'
                     , 'SHI_06'
                     , 'SHI_07'
                     , 'SHI_08'
                     , 'SHI_09'
                     , 'SHI_10'
                     , 'SHI_11_index'
                     , 'SHI_12'
                     , 'SHI_13'
                                       )       


  