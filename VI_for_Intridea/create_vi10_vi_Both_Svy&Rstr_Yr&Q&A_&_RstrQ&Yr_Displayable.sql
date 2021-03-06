/* ++> create_vi10_vi_Both_Svy&Rstr_Yr&Q&A_&_RstrQ&Yr_Displayable.sql <++ */
--USE [forum]
--GO
--/***************************************************************************************************************************************************************/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--/***************************************************************************************************************************************************************/
--ALTER  VIEW
--               [dbo].[vi_Restrictions_Q&Yr_Displayable]
--AS
--/***************************************************************************************************************************************************************/
--SELECT 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--         [RQYDv_row]
--         = ROW_NUMBER()OVER(ORDER BY
--           [Question_abbreviation_std]
--          ,[Question_Year]             )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--       ,  *
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FROM  (
--        SELECT 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                  DISTINCT
--                  [Question_abbreviation_std]   = [QA_std]
--               ,  [Question_short_wording_std]  = [QS_std]
--               ,  [Question_Year]               = [Year]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FROM
--               [forum_ResAnal].[dbo].[vi_Both_Svy&Rstr_Yr&Q&A_Displayable]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------- filter questions to be displayed for Restrictions ------------------------------------------------------------------------------------------------------
--WHERE
--       [QA_std]     not like 'SVY%'
--/* AND [QA_std]     not like '%scaled'  */
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--)DistQY
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--GO
--/***************************************************************************************************************************************************************/




--USE [forum_ResAnal]
--GO
--/***************************************************************************************************************************************************************/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--/***************************************************************************************************************************************************************/
--ALTER  VIEW
--               [dbo].[vi_Restrictions_Yr&Q&A_Displayable]
--AS
--/***************************************************************************************************************************************************************/
--SELECT  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--        [RYQAv_row]
--      , [Year]
--      , [QA_std]
--      , [QW_std]
--      , [AV_std]
--      , [AW_std]
--      , [Display]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FROM
--               [dbo].[vi_Both_Svy&Rstr_Yr&Q&A_Displayable]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------- filter questions to be displayed for Restrictions ------------------------------------------------------------------------------------------------------
--WHERE
--       [QA_std]     not like 'SVY%'
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--GO
--/***************************************************************************************************************************************************************/




--USE [forum_ResAnal]
--GO
--/***************************************************************************************************************************************************************/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--/***************************************************************************************************************************************************************/
--ALTER  VIEW
--               [dbo].[vi_Survey_Yr&Q&A_Displayable]
--AS
--/***************************************************************************************************************************************************************/
--SELECT 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--        [RYQAv_row]
--      , [Year]
--      , [QA_std]
--      , [QW_std]
--      , [AV_std]
--      , [AW_std]
--      , [Display]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FROM
--               [dbo].[vi_Both_Svy&Rstr_Yr&Q&A_Displayable]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------- filter questions to be displayed for Restrictions ------------------------------------------------------------------------------------------------------
--WHERE
--       [QA_std]         like 'SVY%'
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--GO
--/***************************************************************************************************************************************************************/




/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the table [forum_ResAnal]..[vi_Both_Svy&Rstr_Yr&Q&A_Displayable]                                <<<<<     ***/
/***             NOTE:  This is a fixed table hosted at the default place for auxiliary fixed tables: [forum_ResAnal]                                        ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
/**** database name specification (once because [forum_ResAnal] is the default place for auxiliary fixed tables) ***********************************************/
USE              [forum_ResAnal]
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/
/*****                                                      ReCreate current Table in [forum_ResAnal]                                                      *****/
/***************************************************************************************************************************************************************/
IF OBJECT_ID (N'[forum_ResAnal].[dbo].[vi_Both_Svy&Rstr_Yr&Q&A_Displayable]', N'U') IS NOT NULL
DROP   TABLE    [forum_ResAnal].[dbo].[vi_Both_Svy&Rstr_Yr&Q&A_Displayable]                      -- drop table if existent
/***************************************************************************************************************************************************************/
/*** MAIN Restrictions & Survey sets of Questions/Answers for each year ****************************************************************************************/
SELECT 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
         [RYQAv_row]
                     = ROW_NUMBER()
                       OVER(ORDER BY   [Question_abbreviation_std]
                                     , [Answer_value_std]
                                     , [Question_Year] )
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
      , [Year]     =      [Question_Year]
	  , [QA_std]   =      [Question_abbreviation_std]
	  --           = CASE
	  --             WHEN [Question_abbreviation_std] = 'GRI_08_for_index'
	  --             THEN                               'GRI_08' 
	  --             WHEN [Question_abbreviation_std] = 'SHI_11_for_index'
	  --             THEN                               'SHI_11' 
	  --             ELSE [Question_abbreviation_std]
	  --              END
	  , [QW_std]   =      [Question_wording_std]
	  , [QS_std]   =      [Question_short_wording_std]
      , [AV_std]   =      [Answer_value_std]
      , [AW_std]   =      [Answer_Wording_std]
      , [Display]
	  , [StdQ_fk]  =  QAS.[Question_Std_fk]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INTO
                [forum_ResAnal].[dbo].[vi_Both_Svy&Rstr_Yr&Q&A_Displayable]
---------------------------------------------------------------------------------------------------------------------------------------------------------------
FROM
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
(
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***  List of LINKS to Std Questions  **************************************************************************************************************************/
/***
     Questions/Answers to be included in the GRF are:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        -  Restriction questions labeled as [StdQ]..[Display] = 1
                       and corresponding to displayable years
         + Restriction questions std (not labeled for Display)
                       GRI
                       GRI_scaled
                       GRI_20_SUMMARY
                       GRI_20_03_SUMMARY
                       SHI
                       SHI_scaled
                       SHI_01_summary_b
           (most do not do not have no-std version; GRI_20_SUMMARY & GRI_20_03_SUMMARY do for Years < 2012
                       --- previously: 'GRI_20_03_SUMMARY' AS 'GRI_20_top'
                                       'GRI_20_SUMMARY'    AS 'GRI_20_03_top'
                                       'SHI_01_summary_b'  AS 'SHI_01'
                       --  'SHI_01_summary_a'   -- removed, cannot be tabulated as displayed in GRF website (2014.06.18.jceo)
                       --  'GFI'                -- removed, it is not currently displayed in GRF website (2014.06.18.jceo)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        -  Survey      questions labeled as [StdQ]..[Display] = 1
                       and approved to be displayed... 
                             => currently all international survey questions work that way,
                                but in the future we will need:
                                            [NoSQ]..[Display] = 1
                                therefore such a field should be created
                                since all consistency should be checked, we shouls probably develop
                                tahat at the level of the ERM routines:
                                checking table/or/view by table/or/view after each update
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                                                                             ***/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***  List of NoStd Questions  *********************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT -- DISTINCT                                                                                                  /* Should not make any difference          */
          [QAS_key] = SUBSTRING([Question_abbreviation_STD], 1,3)
         ,[Question_Std_fk]
         ,[Question_Year]
         ,[Pew_Data_Collection]
         ,[Pew_Data_SubCollection]
--       ,[Display]
         ,[Display_Restrictions_Data_by_Year]   = [Restrictions_Data]
  FROM    [forum]..[Pew_Question]
        , [forum]..[Pew_Data_Source]
        , [forum]..[Pew_Display_by_Year]
WHERE     [Data_source_pk]
        = [Data_source_Fk]
  AND     [Question_Year]
        = [Year]
  AND     [Display]                                            =  1
  AND   (         SUBSTRING([Question_abbreviation_STD], 1,3) IN ( 'SVY' )
            OR (  SUBSTRING([Question_abbreviation_STD], 1,3) IN ( 'GRI', 'SHI' )
                  AND       [Restrictions_Data]                =  1               )  )
--AND                       [NSQ_Display]                      =  1                                                 /* Once [NoSQ]..[Display] has been created */
  AND                       [Pew_Data_SubCollection]          IN  (  'Global Restriction on Religion Study'
                                                                   , 'International Surveys'                )
/*********************************************************************************************************************************  List of NoStd Questions  ***/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UNION ALL
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***  List of Std Questions  ***********************************************************************************************************************************/
SELECT
          [QAS_key]                             = SUBSTRING([Question_abbreviation_STD], 1,3)
         ,[Question_Std_fk]                     = [Question_Std_Pk]
         ,[Question_Year]                       = [YEAR]
         ,[Pew_Data_Collection]                 = 'Global Restriction on Religion Study'
         ,[Pew_Data_SubCollection]              = 'Global Restriction on Religion Study'
         ,[Display_Restrictions_Data_by_Year]   = 1
--       ,[Question_abbreviation_std]
  FROM    [forum]..[Pew_Question_Std]
CROSS JOIN
          [forum]..[Pew_Display_by_Year]
WHERE
          [Restrictions_Data]                                  =  1
  AND     [Question_abbreviation_STD]                         IN (  'GRI'
                                                                  , 'GRI_scaled'
                                                                 -- , 'GRI_08_for_index'
                                                                  , 'GRI_20_03_SUMMARY'
                                                                  , 'GRI_20_SUMMARY'
                                                                  , 'SHI'
                                                                  , 'SHI_scaled'
                                                                 -- , 'SHI_11_for_index'
                                                                  , 'SHI_01_summary_b'    )
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***********************************************************************************************************************************  List of Std Questions  ***/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************  List of LINKS to Std Questions  ***/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                                                                           ) YQs
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/
LEFT JOIN
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
          [forum]..[Pew_Q&A_Std]                                                                                                                             QAS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
    ON    YQs.[Question_Std_fk]
        = QAS.[Question_Std_fk]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************** MAIN Restrictions & Survey sets of Questions/Answers for each year ***/
/***************************************************************************************************************************************************************/
GO
