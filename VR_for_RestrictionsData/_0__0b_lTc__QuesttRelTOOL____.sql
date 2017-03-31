/***************************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==>  script 002    ------------------------------------------------------------------------------------------ '
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>               This script creates a lookup table of questions on specific religion groups including groups' ID                      <<<<<     ***/
/***                                                                                                                                                         ***/
/***                                                      > > >     lookup tables work faster     < < <                                                      ***/
/***************************************************************************************************************************************************************/
USE [forum_ResAnal]
GO
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
ALTER  VIEW                      [dbo].[vr___00b]
AS
/***************************************************************************************************************************************************************/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*---   Subsetet of Q&A table including Qs and As where country answers are stored at country/religious group level   -----------------------------------------*/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
WITH MSSD AS   (
                       SELECT   *
                             FROM      [forum].[dbo].[Pew_Q&A]
                            WHERE  (   [Question_abbreviation_std]   LIKE 'GRI_11_%'
                                    OR [Question_abbreviation_std]   LIKE 'GRI_20_01x%'
                                    OR [Question_abbreviation_std]   LIKE 'SHI_01_x%'    )
                              AND      [Question_abbreviation]     IS NOT NULL
                              AND      [Question_wording]          IS NOT NULL
                              AND      [Question_Year]             IS NOT NULL
                                                                                                       )
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*---   List of QA_std and the corresponding religion group as linked at NatRelAnswer table (Qs excluded if not actually linked)   ----------------------------*/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
   , RKEY AS   (
                       SELECT   
                                       DISTINCT
                                       K.[Religion_group_fk]
                                     , S.[Question_abbreviation_std]
                               --    , S.[Answer_fk]
                             FROM      [MSSD]                                       S
                                     , [forum].[dbo].[Pew_Nation_Religion_Answer]   K
                            WHERE    S.[Answer_fk]
                                   = K.[Answer_fk]
                                                                                                       )
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*---   Complete list of QA_std and short wordings   ----------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
   , MSQS AS   (
                       SELECT   
                                       DISTINCT
                                       [Question_abbreviation_std]
                                     , [Question_short_wording_std]
                             FROM      [MSSD]
                                                                                                       )
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*---   Complete list of QA_std and short wordings and corresponding RelGp completing those linked at NatRelAnswer table   ------------------------------------*/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
   , QXRs AS   (
                       SELECT   
                                       [QA_std]      = [MSQS].[Question_abbreviation_std]
                                     , [QW_std]      = [MSQS].[Question_short_wording_std]
                                     , [RG_key]      = CASE
                                                            WHEN [RKEY].[Religion_group_fk] IS NULL
                                                             AND [MSQS].[Question_abbreviation_std] = 'GRI_20_01x_11'  /*atheism as fav rel by law*/
                                                            THEN                                                       25
                                                            ELSE [RKEY].[Religion_group_fk]
                                                       END
                              --     , [RG_key]      = [RKEY].[Religion_group_fk]
                             FROM                      [MSQS]
 							 LEFT JOIN                 [RKEY]
                                      ON               [MSQS].[Question_abbreviation_std]
                                                     = [RKEY].[Question_abbreviation_std]
                                                                                                       )
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
               SELECT
                         [Religion_fk]   = [RG_key]
                    ,    [Religion]      = [Pew_religion]
                    ,    [QA_std]
                    ,    [QW_std]
                 FROM    [QXRs]
                 LEFT
                 JOIN    [forum].[dbo].[Pew_Religion_Group]
                     ON
                         [rg_key]
                       = [Religion_group_pk]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
IF OBJECT_ID  (N'[forum_ResAnal].[dbo].[vr___00b____QuestnReligionTOOL]', N'U') IS NOT NULL
DROP TABLE       [forum_ResAnal].[dbo].[vr___00b____QuestnReligionTOOL]
SELECT * 	INTO [forum_ResAnal].[dbo].[vr___00b____QuestnReligionTOOL]
            FROM                 [dbo].[vr___00b]
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
--	SELECT* FROM [forum_ResAnal].[dbo].[vr___00b____QuestnReligionTOOL]
/***************************************************************************************************************************************************************/