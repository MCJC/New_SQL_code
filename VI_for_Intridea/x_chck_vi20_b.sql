/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This script adds row(s) to the table [forum_ResAnal]..[vi_xCountRows_of_AllViews]                                                 <<<<<     ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [forum_ResAnal]
GO
/***************************************************************************************************************************************************************/
INSERT
INTO
       [forum_ResAnal].[dbo].[vi_xxCountRows_of_AllViews]
 /* 45 */               SELECT [C] = (SELECT COUNT(*) FROM   forum.        .[vi_Topic&Question_link_RelatedPewResearchReports])
                              ,[T] =                        'forum.        .[vi_Topic&Question_link_RelatedPewResearchReports]'
GO
/***************************************************************************************************************************************************************/
Print 'script ''create_vi20_b_vi_Topic&Question_link_RelatResearchRepts.sql'' has ben executed'
/***************************************************************************************************************************************************************/
GO
