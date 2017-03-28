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
 /* 20 */               SELECT [C] = (SELECT COUNT(*) FROM   forum.        .[vi_SurveyQuestions_ByYear]                       )
                              ,[T] =                        'forum.        .[vi_SurveyQuestions_ByYear]'
GO
/***************************************************************************************************************************************************************/
Print 'script ''create_vi07_vi_SurveyQuestions_ByYear.sql'' has ben executed'
/***************************************************************************************************************************************************************/
GO
