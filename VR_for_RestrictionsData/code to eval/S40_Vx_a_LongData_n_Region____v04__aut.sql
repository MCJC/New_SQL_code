/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the view [for_x].[dbo].[V9x_LongData]                                                           <<<<<     ***/
/***             NOTE: query does CURRENTLY pull data corresponding to other indexes than GRI & SHI                                                          ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [for_x]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
ALTER  VIEW
               [dbo].[Vx_a_LongData&Region]
AS
/***************************************************************************************************************************************************************/
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------SELECT 
          distinct
          V9xRow
          =  ROW_NUMBER()
             OVER(ORDER BY
                             [Nation_fk]
                            ,CASE WHEN [Q_Number] IS NULL THEN 9999
                                  ELSE [Q_Number]
                                  END
                            ,[QA_std]
                            ,[Question_Year]
                            ,[Answer_value]
                                          )
      ,[entity]
      ,[link_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Region]
      ,[Ctry_EditorialName]
      ,[Locality]
      ,[Religion]
      ,[Question_Year]
      ,[QA_std]
      ,[QW_std]
      ,[Answer_value]
      ,[AW_std]
                              --= CASE
                              --       WHEN [AW_std] IS NULL THEN [answer_wording]
                              --       ELSE [AW_std]
                              --   END
      ,[AW_det]
      ,[Question_fk]
      ,[Answer_fk]
      ,[Notes]
/***************************************************************************************************************************************************************/
FROM
/** >> ** sorting order of questions ***************************************************************************************************************************/
       [for_x].[dbo].[AllQuestions]
/** << ** sorting order of questions ***************************************************************************************************************************/
RIGHT OUTER JOIN
(
/** >> ** current rows of coded & calculated data **************************************************************************************************************/
SELECT 
       [entity]
      ,[link_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Ctry_EditorialName]
      ,[Locality]
      ,[Religion]
      ,[Question_Year]
      ,[QA_std]
      ,[QW_std]
      ,[Answer_value]
      ,[answer_wording_std]        AS [AW_std]
      ,[answer_wording]            AS [AW_det]
      ,[Question_fk]
      ,[Answer_fk]
      ,[Notes]
  FROM [for_x].[dbo].[V1_DB_Long]
/* filters */
WHERE
Ctry_EditorialName                                   != 'North Korea'
AND
Ctry_EditorialName + '_/_' + STR(Question_Year, 4,0) != 'South Sudan_/_2010'            /* although data are not aggregated for the other part of former Sudan */
/* filters */
/***************************************************************************************************************************************************************/
UNION ALL
/***************************************************************************************************************************************************************/
SELECT 
       [entity]                    = 'Ctry'
      ,[link_fk]                   = 0
      ,[Nation_fk]
      ,[Locality_fk]               = NULL
      ,[Religion_fk]               = NULL
      ,[Ctry_EditorialName]
      ,[Locality]                  = 'not detailed'
      ,[Religion]                  = ''
      ,[Question_Year]
      ,[QA_std]                    = V4.[Variable]
      ,[QW_std]                    = [Wording_minus3]
      ,[Answer_value]              = V4.[Value]
      ,[AW_std]                    = [Answer_wording]
      ,[AW_det]                    = NULL
      ,[Question_fk]               = NULL
      ,[Answer_fk]                 = NULL
      ,[Notes]                     = NULL
  FROM
       [for_x].[dbo].[V4_L_by_CYV]   V4
LEFT OUTER JOIN
       [for_x].[dbo].[AllQuestions]  AQ
ON
       V4.[Variable]
    =  AQ.[Variable]
LEFT OUTER JOIN
       [for_x].[dbo].[AllAnswers]    AA
ON
       V4.[Variable]
    =  AA.[Variable]
AND
       V4.[Value]
    =  AA.[Value]
WHERE 
       V4.[Variable]
       NOT IN
              (
                SELECT  
                       DISTINCT
                       [QA_std]
                  FROM 
                       [for_x].[dbo].[V1_DB_Long]
                  WHERE 
                       [QA_std] NOT IN (
                                            'GRI_19_b'
                                          , 'GRI_19_c'
                                          , 'GRI_19_d'
                                          , 'GRI_19_da'
                                          , 'GRI_19_db'
                                          , 'GRI_19_e'
                                          , 'GRI_19_f'
                                          , 'GRI_20_05_x1'
                                          , 'SHI_01_b'
                                          , 'SHI_01_c'
                                          , 'SHI_01_d'
                                          , 'SHI_01_da'
                                          , 'SHI_01_db'
                                          , 'SHI_01_e'
                                          , 'SHI_01_f'
                                          , 'SHI_04_b'
                                          , 'SHI_04_c'
                                          , 'SHI_04_d'
                                          , 'SHI_04_da'
                                          , 'SHI_04_db'
                                          , 'SHI_04_e'
                                          , 'SHI_04_f'
                                          , 'SHI_05_b'
                                          , 'SHI_05_c'
                                          , 'SHI_05_d'
                                          , 'SHI_05_da'
                                          , 'SHI_05_db'
                                          , 'SHI_05_e'
                                          , 'SHI_05_f'

                                                                  ) 
                                                                    )
/***************************************************************************************************************************************************************/
UNION ALL
/***************************************************************************************************************************************************************/
SELECT 
       [entity]                    = 'Ctry'
      ,[link_fk]                   = 0
      ,[Nation_fk]
      ,[Locality_fk]               = NULL
      ,[Religion_fk]               = NULL
      ,[Ctry_EditorialName]
      ,[Locality]                  = 'not detailed'
      ,[Religion]                  = ''
      ,[Question_Year]
      ,[QA_std]                    = 'GRI'
      ,[QW_std]                    = 'Government Restrictions Index (GRI)'
      ,[Answer_value]              = [GRI]
      ,[AW_std]                    = 'scale 0 - [+.] - 10'
      ,[AW_det]                    = NULL
      ,[Question_fk]               = NULL
      ,[Answer_fk]                 = NULL
      ,[Notes]                     = NULL
  FROM
       [for_x].[dbo].[V3_W&Extras_by_Ctry&Year]
/***************************************************************************************************************************************************************/
UNION ALL
/***************************************************************************************************************************************************************/
SELECT 
       [entity]                    = 'Ctry'
      ,[link_fk]                   = 0
      ,[Nation_fk]
      ,[Locality_fk]               = NULL
      ,[Religion_fk]               = NULL
      ,[Ctry_EditorialName]
      ,[Locality]                  = 'not detailed'
      ,[Religion]                  = ''
      ,[Question_Year]
      ,[QA_std]                    = 'SHI'
      ,[QW_std]                    = 'Social Hostilities Index (SHI)'
      ,[Answer_value]              = [SHI]
      ,[AW_std]                    = 'scale 0 - [+.] - 10'
      ,[AW_det]                    = NULL
      ,[Question_fk]               = NULL
      ,[Answer_fk]                 = NULL
      ,[Notes]                     = NULL
  FROM
       [for_x].[dbo].[V3_W&Extras_by_Ctry&Year]
/***************************************************************************************************************************************************************/
UNION ALL
/***************************************************************************************************************************************************************/
SELECT 
       [entity]                    = 'Ctry'
      ,[link_fk]                   = 0
      ,[Nation_fk]
      ,[Locality_fk]               = NULL
      ,[Religion_fk]               = NULL
      ,[Ctry_EditorialName]
      ,[Locality]                  = 'not detailed'
      ,[Religion]                  = ''
      ,[Question_Year]
      ,[QA_std]                    = 'GFI'
      ,[QW_std]                    = 'Government Favoritism Index (GFI)'
      ,[Answer_value]              = [GFI]
      ,[AW_std]                    = 'scale 0 - [+.] - 10'
      ,[AW_det]                    = NULL
      ,[Question_fk]               = NULL
      ,[Answer_fk]                 = NULL
      ,[Notes]                     = NULL
  FROM
       [for_x].[dbo].[V3_W&Extras_by_Ctry&Year]
/***************************************************************************************************************************************************************/
UNION ALL
/***************************************************************************************************************************************************************/
SELECT 
       [entity]                    = 'Ctry'
      ,[link_fk]                   = 0
      ,[Nation_fk]
      ,[Locality_fk]               = NULL
      ,[Religion_fk]               = NULL
      ,[Ctry_EditorialName]
      ,[Locality]                  = 'not detailed'
      ,[Religion]                  = ''
      ,[Question_Year]
      ,[QA_std]                    = 'GRI_rd_1d'
      ,[QW_std]                    = 'Government Restrictions Index (GRI-rounded)'
      ,[Answer_value]              = [GRI_rd_1d]
      ,[AW_std]                    = 'scale 0 - [+.1] - 10'
      ,[AW_det]                    = NULL
      ,[Question_fk]               = NULL
      ,[Answer_fk]                 = NULL
      ,[Notes]                     = NULL
  FROM
       [for_x].[dbo].[V3_W&Extras_by_Ctry&Year]
/***************************************************************************************************************************************************************/
UNION ALL
/***************************************************************************************************************************************************************/
SELECT 
       [entity]                    = 'Ctry'
      ,[link_fk]                   = 0
      ,[Nation_fk]
      ,[Locality_fk]               = NULL
      ,[Religion_fk]               = NULL
      ,[Ctry_EditorialName]
      ,[Locality]                  = 'not detailed'
      ,[Religion]                  = ''
      ,[Question_Year]
      ,[QA_std]                    = 'SHI_rd_1d'
      ,[QW_std]                    = 'Social Hostilities Index (SHI-rounded)'
      ,[Answer_value]              = [SHI_rd_1d]
      ,[AW_std]                    = 'scale 0 - [+.1] - 10'
      ,[AW_det]                    = NULL
      ,[Question_fk]               = NULL
      ,[Answer_fk]                 = NULL
      ,[Notes]                     = NULL
  FROM
       [for_x].[dbo].[V3_W&Extras_by_Ctry&Year]
/***************************************************************************************************************************************************************/
UNION ALL
/***************************************************************************************************************************************************************/
SELECT 
       [entity]                    = 'Ctry'
      ,[link_fk]                   = 0
      ,[Nation_fk]
      ,[Locality_fk]               = NULL
      ,[Religion_fk]               = NULL
      ,[Ctry_EditorialName]
      ,[Locality]                  = 'not detailed'
      ,[Religion]                  = ''
      ,[Question_Year]
      ,[QA_std]                    = 'GFI_rd_1d'
      ,[QW_std]                    = 'Government Favoritism Index (GFI-rounded)'
      ,[Answer_value]              = [GFI_rd_1d]
      ,[AW_std]                    = 'scale 0 - [+.1] - 10'
      ,[AW_det]                    = NULL
      ,[Question_fk]               = NULL
      ,[Answer_fk]                 = NULL
      ,[Notes]                     = NULL
  FROM
       [for_x].[dbo].[V3_W&Extras_by_Ctry&Year]
/** << ** current rows of coded & calculated data **************************************************************************************************************/
)                                                                                                                                                         AS CRC
/***************************************************************************************************************************************************************/
ON     
       [Variable]
     = [QA_std]
/***************************************************************************************************************************************************************/
/** >> ** add region *******************************************************************************************************************************************/
JOIN
(
SELECT
       [Nation_pk]
      ,[Region]
FROM
       [forum].[dbo].[Pew_Nation]
)                                                                                                                                                         AS RDI
ON     
       [Nation_fk]
     = [Nation_pk]
/** << ** add region *******************************************************************************************************************************************/
