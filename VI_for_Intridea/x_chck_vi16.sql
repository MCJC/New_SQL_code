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
 /* 38 */               SELECT [C] = (SELECT COUNT(*) FROM   forum.        .[vi_Reportable_DataSource_Joins]                  )
                              ,[T] =                        'forum.        .[vi_Reportable_DataSource_Joins]'
GO
/***************************************************************************************************************************************************************/
Print 'script ''create_vi16_vi_Reportable_DataSource_Joins.sql'' has ben executed'
/***************************************************************************************************************************************************************/
GO
