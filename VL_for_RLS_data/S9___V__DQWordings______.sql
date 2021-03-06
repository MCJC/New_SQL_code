/*********************************************************************************************************/
/***                                                                                                   ***/
/***     >>>>>   This script creates the VIEW [RLS].[dbo].[Displayable_NewQuestionWordings]  <<<<<     ***/
/*********************************************************************************************************/
USE [RLS]
GO
/*********************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************/
ALTER VIEW             [dbo].[Displayable_NewQuestionWordings]
AS
/*********************************************************************************************************/
SELECT [RLS_DNQW_pk]                      = ROW_NUMBER() OVER (ORDER BY [RLS_FieldName])
      ,[RLS_FieldName]
      ,[RLS_FieldLabel_in_datset]
FROM
/**************************************************************************************************************************************/
(
/**************************************************************************************************************************************/
SELECT 
       [RLS_FieldName]            = [N]
      ,[RLS_FieldLabel_in_datset] = [L]
FROM (
/**************************************************************************************************************************************/
      SELECT N = 'RLS_DNWV_pk'                     ,L = 'pk, not in dataset'
UNION SELECT N = 'RLSx0_001_main_ID'               ,L = 'main_ID'
UNION SELECT N = 'RLSx1_001_year'                  ,L = 'Year'
UNION SELECT N = 'RLSx2_001_WEIGHT'                ,L = 'National Weight'
UNION SELECT N = 'RLSx2_002_akhiweight2007'        ,L = 'Weight including AK and HI cases (from WT_LAT)'
UNION SELECT N = 'RLSx2_003_WGT_all_MSA'           ,L = 'Metro region specific weights'
UNION SELECT N = 'RLSx3_000_other_and_christian]'  ,L = 'Identifies members of non-Christian faiths, Christians, & Unaffil/D.K./Ref.'
UNION SELECT N = 'RLSx3_001_otherfaithfordisplay'  ,L = 'Identifies members of non-Christian faiths (i.e., the following traditions:'
                                                      +' Jewish, Muslim, Buddhist, Hindu, Other world religions, other faiths'
UNION SELECT N = 'RLSx3_002_christianfordisplay'   ,L = 'Identifies Christians'
UNION SELECT N = 'RLSx3_003_protestantfordisplay'  ,L = 'Identifies Protestants'
UNION SELECT N = 'RLSx4_001_reltradfordisplay_v'   ,L = 'RELTRAD relabeled for display on web and in report'
UNION SELECT N = 'RLSx4_001_reltradfordisplay_w'   ,L = 'RELTRAD relabeled for display on web and in report'
UNION SELECT N = 'RLSx4_002_protfamfordisplay_v'   ,L = 'PROTFAM relabeld for display on web and in report'
UNION SELECT N = 'RLSx4_002_protfamfordisplay_w'   ,L = 'PROTFAM relabeld for display on web and in report'
UNION SELECT N = 'RLSx4_003_familyfordisplay_v'    ,L = 'FAMILY collapsed for display on web and in report'
UNION SELECT N = 'RLSx4_003_familyfordisplay_w'    ,L = 'FAMILY collapsed for display on web and in report'
UNION SELECT N = 'RLSx4_004_denomfordisplay2_v'    ,L = 'DENOM collapsed for display on web and in report version 2'
UNION SELECT N = 'RLSx4_004_denomfordisplay2_w'    ,L = 'DENOM collapsed for display on web and in report version 2'
/**************************************************************************************************************************************/
) AS VarsAdded
UNION ALL
SELECT 
       [RLS_FieldName]            = [Question_abbreviation_std]
      ,[RLS_FieldLabel_in_datset] = [Question_short_wording_std]
  FROM [RLS].[dbo].[Pew_Question_Std]
 WHERE [Display] = 1
/**************************************************************************************************************************************/
) AS ALLVARS
/**************************************************************************************************************************************/
GO