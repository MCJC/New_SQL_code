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
 /* 12 */               SELECT [C] = (SELECT COUNT(*) FROM   forum.        .[vi_Migrants]                                     )
                              ,[T] =                        'forum.        .[vi_Migrants]'
 /* 13 */     UNION ALL SELECT [C] = (SELECT COUNT(*) FROM   forum_ResAnal..[vi_Migrants]                                     )
                              ,[T] =                        'forum_ResAnal..[vi_Migrants]'
GO
/***************************************************************************************************************************************************************/
Print 'script ''create_vi03b_vi_Migrants.sql'' has ben executed'
/***************************************************************************************************************************************************************/
GO
