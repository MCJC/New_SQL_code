/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the view [for_x].[dbo].[Vx_j_TopLines_by_Region]                                                <<<<<     ***/
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
               [dbo].[Vx_j_TopLines_by_Region]
AS
/***************************************************************************************************************************************************************/
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------SELECT 
          V6Row
          =  ROW_NUMBER()
             OVER(ORDER BY
                             [Q_Number]
                           , [Variable]
                           , [Value]
                                          )
      ,  [Variable]
      ,  [Value]
      ,  [Answer_wording]
      ,  [NC_Americas_2007]
      ,  [PC_Americas_2007]
      ,  [NC_Americas_2008]
      ,  [PC_Americas_2008]
      ,  [NC_Americas_2009]
      ,  [PC_Americas_2009]
      ,  [NC_Americas_2010]
      ,  [PC_Americas_2010]
      ,  [NC_Americas_2011]
      ,  [PC_Americas_2011]
      ,  [NC_Americas_2012]
      ,  [PC_Americas_2012]
      ,  [NC_Asia-Pacific_2007]
      ,  [PC_Asia-Pacific_2007]
      ,  [NC_Asia-Pacific_2008]
      ,  [PC_Asia-Pacific_2008]
      ,  [NC_Asia-Pacific_2009]
      ,  [PC_Asia-Pacific_2009]
      ,  [NC_Asia-Pacific_2010]
      ,  [PC_Asia-Pacific_2010]
      ,  [NC_Asia-Pacific_2011]
      ,  [PC_Asia-Pacific_2011]
      ,  [NC_Asia-Pacific_2012]
      ,  [PC_Asia-Pacific_2012]
      ,  [NC_Europe_2007]
      ,  [PC_Europe_2007]
      ,  [NC_Europe_2008]
      ,  [PC_Europe_2008]
      ,  [NC_Europe_2009]
      ,  [PC_Europe_2009]
      ,  [NC_Europe_2010]
      ,  [PC_Europe_2010]
      ,  [NC_Europe_2011]
      ,  [PC_Europe_2011]
      ,  [NC_Europe_2012]
      ,  [PC_Europe_2012]
      ,  [NC_Middle East-North Africa_2007]
      ,  [PC_Middle East-North Africa_2007]
      ,  [NC_Middle East-North Africa_2008]
      ,  [PC_Middle East-North Africa_2008]
      ,  [NC_Middle East-North Africa_2009]
      ,  [PC_Middle East-North Africa_2009]
      ,  [NC_Middle East-North Africa_2010]
      ,  [PC_Middle East-North Africa_2010]
      ,  [NC_Middle East-North Africa_2011]
      ,  [PC_Middle East-North Africa_2011]
      ,  [NC_Middle East-North Africa_2012]
      ,  [PC_Middle East-North Africa_2012]
      ,  [NC_Sub-Saharan Africa_2007]
      ,  [PC_Sub-Saharan Africa_2007]
      ,  [NC_Sub-Saharan Africa_2008]
      ,  [PC_Sub-Saharan Africa_2008]
      ,  [NC_Sub-Saharan Africa_2009]
      ,  [PC_Sub-Saharan Africa_2009]
      ,  [NC_Sub-Saharan Africa_2010]
      ,  [PC_Sub-Saharan Africa_2010]
      ,  [NC_Sub-Saharan Africa_2011]
      ,  [PC_Sub-Saharan Africa_2011]
      ,  [NC_Sub-Saharan Africa_2012]
      ,  [PC_Sub-Saharan Africa_2012]
      ,  [V5Row]  FROM
/***************************************************************************************************************************************************************/
(
/***************************************************************************************************************************************************************/
SELECT 
       Q.[Q_Number]
      ,V.[Variable]
      ,V.[Value]
      ,V.[Answer_wording]
      ,  [NC_Americas_2007]
      ,  [PC_Americas_2007]
      ,  [NC_Americas_2008]
      ,  [PC_Americas_2008]
      ,  [NC_Americas_2009]
      ,  [PC_Americas_2009]
      ,  [NC_Americas_2010]
      ,  [PC_Americas_2010]
      ,  [NC_Americas_2011]
      ,  [PC_Americas_2011]
      ,  [NC_Americas_2012]
      ,  [PC_Americas_2012]
      ,  [NC_Asia-Pacific_2007]
      ,  [PC_Asia-Pacific_2007]
      ,  [NC_Asia-Pacific_2008]
      ,  [PC_Asia-Pacific_2008]
      ,  [NC_Asia-Pacific_2009]
      ,  [PC_Asia-Pacific_2009]
      ,  [NC_Asia-Pacific_2010]
      ,  [PC_Asia-Pacific_2010]
      ,  [NC_Asia-Pacific_2011]
      ,  [PC_Asia-Pacific_2011]
      ,  [NC_Asia-Pacific_2012]
      ,  [PC_Asia-Pacific_2012]
      ,  [NC_Europe_2007]
      ,  [PC_Europe_2007]
      ,  [NC_Europe_2008]
      ,  [PC_Europe_2008]
      ,  [NC_Europe_2009]
      ,  [PC_Europe_2009]
      ,  [NC_Europe_2010]
      ,  [PC_Europe_2010]
      ,  [NC_Europe_2011]
      ,  [PC_Europe_2011]
      ,  [NC_Europe_2012]
      ,  [PC_Europe_2012]
      ,  [NC_Middle East-North Africa_2007]
      ,  [PC_Middle East-North Africa_2007]
      ,  [NC_Middle East-North Africa_2008]
      ,  [PC_Middle East-North Africa_2008]
      ,  [NC_Middle East-North Africa_2009]
      ,  [PC_Middle East-North Africa_2009]
      ,  [NC_Middle East-North Africa_2010]
      ,  [PC_Middle East-North Africa_2010]
      ,  [NC_Middle East-North Africa_2011]
      ,  [PC_Middle East-North Africa_2011]
      ,  [NC_Middle East-North Africa_2012]
      ,  [PC_Middle East-North Africa_2012]
      ,  [NC_Sub-Saharan Africa_2007]
      ,  [PC_Sub-Saharan Africa_2007]
      ,  [NC_Sub-Saharan Africa_2008]
      ,  [PC_Sub-Saharan Africa_2008]
      ,  [NC_Sub-Saharan Africa_2009]
      ,  [PC_Sub-Saharan Africa_2009]
      ,  [NC_Sub-Saharan Africa_2010]
      ,  [PC_Sub-Saharan Africa_2010]
      ,  [NC_Sub-Saharan Africa_2011]
      ,  [PC_Sub-Saharan Africa_2011]
      ,  [NC_Sub-Saharan Africa_2012]
      ,  [PC_Sub-Saharan Africa_2012]
      ,  [V5Row]
  FROM [for_x].[dbo].[AllAnswers]            V
LEFT
OUTER
JOIN
       [for_x].[dbo].[V7r_LRestr_by_RV]      D
ON
       V.[Variable]
     = D.[Variable]
AND
       V.[Value]
     = D.[Value]
JOIN
       [for_x].[dbo].[AllQuestions]          Q
ON
       V.[Variable]
     = Q.[Variable]
/***************************************************************************************************************************************************************/
--UNION ALL
--/***************************************************************************************************************************************************************/
--SELECT 
--         [Q_Number]
--      ,  [Variable]
--      ,  [Value]          = -6.00
--      ,  [Answer_wording] = [Label_minus4]
--      ,  [NC_Americas_2007]                  = '' 
--      ,  [PC_Americas_2007]                  = '' 
--      ,  [NC_Americas_2008]                  = '' 
--      ,  [PC_Americas_2008]                  = '' 
--      ,  [NC_Americas_2009]                  = '' 
--      ,  [PC_Americas_2009]                  = '' 
--      ,  [NC_Americas_2010]                  = '' 
--      ,  [PC_Americas_2010]                  = '' 
--      ,  [NC_Americas_2011]                  = '' 
--      ,  [PC_Americas_2011]                  = '' 
--      ,  [NC_Americas_2012]                  = '' 
--      ,  [PC_Americas_2012]                  = '' 
--      ,  [NC_Asia-Pacific_2007]              = '' 
--      ,  [PC_Asia-Pacific_2007]              = '' 
--      ,  [NC_Asia-Pacific_2008]              = '' 
--      ,  [PC_Asia-Pacific_2008]              = '' 
--      ,  [NC_Asia-Pacific_2009]              = '' 
--      ,  [PC_Asia-Pacific_2009]              = '' 
--      ,  [NC_Asia-Pacific_2010]              = '' 
--      ,  [PC_Asia-Pacific_2010]              = '' 
--      ,  [NC_Asia-Pacific_2011]              = '' 
--      ,  [PC_Asia-Pacific_2011]              = '' 
--      ,  [NC_Asia-Pacific_2012]              = '' 
--      ,  [PC_Asia-Pacific_2012]              = '' 
--      ,  [NC_Europe_2007]                    = '' 
--      ,  [PC_Europe_2007]                    = '' 
--      ,  [NC_Europe_2008]                    = '' 
--      ,  [PC_Europe_2008]                    = '' 
--      ,  [NC_Europe_2009]                    = '' 
--      ,  [PC_Europe_2009]                    = '' 
--      ,  [NC_Europe_2010]                    = '' 
--      ,  [PC_Europe_2010]                    = '' 
--      ,  [NC_Europe_2011]                    = '' 
--      ,  [PC_Europe_2011]                    = '' 
--      ,  [NC_Europe_2012]                    = '' 
--      ,  [PC_Europe_2012]                    = '' 
--      ,  [NC_Middle East-North Africa_2007]  = '' 
--      ,  [PC_Middle East-North Africa_2007]  = '' 
--      ,  [NC_Middle East-North Africa_2008]  = '' 
--      ,  [PC_Middle East-North Africa_2008]  = '' 
--      ,  [NC_Middle East-North Africa_2009]  = '' 
--      ,  [PC_Middle East-North Africa_2009]  = '' 
--      ,  [NC_Middle East-North Africa_2010]  = '' 
--      ,  [PC_Middle East-North Africa_2010]  = '' 
--      ,  [NC_Middle East-North Africa_2011]  = '' 
--      ,  [PC_Middle East-North Africa_2011]  = '' 
--      ,  [NC_Middle East-North Africa_2012]  = '' 
--      ,  [PC_Middle East-North Africa_2012]  = '' 
--      ,  [NC_Sub-Saharan Africa_2007]        = '' 
--      ,  [PC_Sub-Saharan Africa_2007]        = '' 
--      ,  [NC_Sub-Saharan Africa_2008]        = '' 
--      ,  [PC_Sub-Saharan Africa_2008]        = '' 
--      ,  [NC_Sub-Saharan Africa_2009]        = '' 
--      ,  [PC_Sub-Saharan Africa_2009]        = '' 
--      ,  [NC_Sub-Saharan Africa_2010]        = '' 
--      ,  [PC_Sub-Saharan Africa_2010]        = '' 
--      ,  [NC_Sub-Saharan Africa_2011]        = '' 
--      ,  [PC_Sub-Saharan Africa_2011]        = '' 
--      ,  [NC_Sub-Saharan Africa_2012]        = '' 
--      ,  [PC_Sub-Saharan Africa_2012]        = '' 
--      ,  [V5Row]                             = 0
--  FROM 
--       [for_x].[dbo].[AllQuestions]
/***************************************************************************************************************************************************************/
UNION ALL
/***************************************************************************************************************************************************************/
SELECT 
         [Q_Number]
      ,  [Variable]
      ,  [Value]          = -5.00
      ,  [Answer_wording] = [Wording_minus3]
      ,  [NC_Americas_2007]                  = '' 
      ,  [PC_Americas_2007]                  = '' 
      ,  [NC_Americas_2008]                  = '' 
      ,  [PC_Americas_2008]                  = '' 
      ,  [NC_Americas_2009]                  = '' 
      ,  [PC_Americas_2009]                  = '' 
      ,  [NC_Americas_2010]                  = '' 
      ,  [PC_Americas_2010]                  = '' 
      ,  [NC_Americas_2011]                  = '' 
      ,  [PC_Americas_2011]                  = '' 
      ,  [NC_Americas_2012]                  = '' 
      ,  [PC_Americas_2012]                  = '' 
      ,  [NC_Asia-Pacific_2007]              = '' 
      ,  [PC_Asia-Pacific_2007]              = '' 
      ,  [NC_Asia-Pacific_2008]              = '' 
      ,  [PC_Asia-Pacific_2008]              = '' 
      ,  [NC_Asia-Pacific_2009]              = '' 
      ,  [PC_Asia-Pacific_2009]              = '' 
      ,  [NC_Asia-Pacific_2010]              = '' 
      ,  [PC_Asia-Pacific_2010]              = '' 
      ,  [NC_Asia-Pacific_2011]              = '' 
      ,  [PC_Asia-Pacific_2011]              = '' 
      ,  [NC_Asia-Pacific_2012]              = '' 
      ,  [PC_Asia-Pacific_2012]              = '' 
      ,  [NC_Europe_2007]                    = '' 
      ,  [PC_Europe_2007]                    = '' 
      ,  [NC_Europe_2008]                    = '' 
      ,  [PC_Europe_2008]                    = '' 
      ,  [NC_Europe_2009]                    = '' 
      ,  [PC_Europe_2009]                    = '' 
      ,  [NC_Europe_2010]                    = '' 
      ,  [PC_Europe_2010]                    = '' 
      ,  [NC_Europe_2011]                    = '' 
      ,  [PC_Europe_2011]                    = '' 
      ,  [NC_Europe_2012]                    = '' 
      ,  [PC_Europe_2012]                    = '' 
      ,  [NC_Middle East-North Africa_2007]  = '' 
      ,  [PC_Middle East-North Africa_2007]  = '' 
      ,  [NC_Middle East-North Africa_2008]  = '' 
      ,  [PC_Middle East-North Africa_2008]  = '' 
      ,  [NC_Middle East-North Africa_2009]  = '' 
      ,  [PC_Middle East-North Africa_2009]  = '' 
      ,  [NC_Middle East-North Africa_2010]  = '' 
      ,  [PC_Middle East-North Africa_2010]  = '' 
      ,  [NC_Middle East-North Africa_2011]  = '' 
      ,  [PC_Middle East-North Africa_2011]  = '' 
      ,  [NC_Middle East-North Africa_2012]  = '' 
      ,  [PC_Middle East-North Africa_2012]  = '' 
      ,  [NC_Sub-Saharan Africa_2007]        = '' 
      ,  [PC_Sub-Saharan Africa_2007]        = '' 
      ,  [NC_Sub-Saharan Africa_2008]        = '' 
      ,  [PC_Sub-Saharan Africa_2008]        = '' 
      ,  [NC_Sub-Saharan Africa_2009]        = '' 
      ,  [PC_Sub-Saharan Africa_2009]        = '' 
      ,  [NC_Sub-Saharan Africa_2010]        = '' 
      ,  [PC_Sub-Saharan Africa_2010]        = '' 
      ,  [NC_Sub-Saharan Africa_2011]        = '' 
      ,  [PC_Sub-Saharan Africa_2011]        = '' 
      ,  [NC_Sub-Saharan Africa_2012]        = '' 
      ,  [PC_Sub-Saharan Africa_2012]        = '' 
      ,  [V5Row]                             = 0
  FROM 
       [for_x].[dbo].[AllQuestions]
/***************************************************************************************************************************************************************/
--UNION ALL
--/***************************************************************************************************************************************************************/
--SELECT 
--         [Q_Number]
--      ,  [Variable]
--      ,  [Value]          = -4.00
--      ,  [Answer_wording] = ''
--      ,  [NC_MID-2007]    = 'baseline year,'
--      ,  [PC_MID-2007]    = 'ending'
--      ,  [NC_MID-2008]    = 'year'
--      ,  [PC_MID-2008]    = 'ending'
--      ,  [NC_MID-2009]    = 'year'
--      ,  [PC_MID-2009]    = 'ending'
--      ,  [NC_MID-2010]    = 'year'
--      ,  [PC_MID-2010]    = 'ending'
--      ,  [NC_END-2011]    = 'previous year'
--      ,  [PC_END-2011]    = 'ending'
--      ,  [NC_END-2012]    = 'latest year,'
--      ,  [PC_END-2012]    = 'ending'
--      ,  V5Row            = 0
--  FROM 
--       [for_x].[dbo].[AllQuestions]
--/***************************************************************************************************************************************************************/
--UNION ALL
--/***************************************************************************************************************************************************************/
--SELECT 
--         [Q_Number]
--      ,  [Variable]
--      ,  [Value]          = -3.00
--      ,  [Answer_wording] = ''
--      ,  [NC_MID-2007]    = 'MID-'
--      ,  [PC_MID-2007]    = '2007'
--      ,  [NC_MID-2008]    = 'MID-'
--      ,  [PC_MID-2008]    = '2008'
--      ,  [NC_MID-2009]    = 'MID-'
--      ,  [PC_MID-2009]    = '2009'
--      ,  [NC_MID-2010]    = 'MID-'
--      ,  [PC_MID-2010]    = '2010'
--      ,  [NC_END-2011]    = 'Dec. 31,'
--      ,  [PC_END-2011]    = '2011'
--      ,  [NC_END-2012]    = 'Dec. 31,'
--      ,  [PC_END-2012]    = '2012'
--      ,  V5Row            = 0
--  FROM 
--       [for_x].[dbo].[AllQuestions]
--/***************************************************************************************************************************************************************/
--UNION ALL
--/***************************************************************************************************************************************************************/
--SELECT 
--         [Q_Number]
--      ,  [Variable]
--      ,  [Value]          = -2.00
--      ,  [Answer_wording] = ''
--      ,  [NC_MID-2007]    = 'NUMBER OF'
--      ,  [PC_MID-2007]    = '  %  OF  '
--      ,  [NC_MID-2008]    = 'NUMBER OF'
--      ,  [PC_MID-2008]    = '  %  OF  '
--      ,  [NC_MID-2009]    = 'NUMBER OF'
--      ,  [PC_MID-2009]    = '  %  OF  '
--      ,  [NC_MID-2010]    = 'NUMBER OF'
--      ,  [PC_MID-2010]    = '  %  OF  '
--      ,  [NC_MID-2011]    = 'NUMBER OF'
--      ,  [PC_MID-2011]    = '  %  OF  '
--      ,  [NC_MID-2012]    = 'NUMBER OF'
--      ,  [PC_MID-2012]    = '  %  OF  '
--      ,  V5Row            = 0
--  FROM 
--       [for_x].[dbo].[AllQuestions]
--/***************************************************************************************************************************************************************/
--UNION ALL
--/***************************************************************************************************************************************************************/
--SELECT 
--         [Q_Number]
--      ,  [Variable]
--      ,  [Value]          = -1.00
--      ,  [Answer_wording] = ''
--      ,  [NC_MID-2007]    = 'COUNTRIES'
--      ,  [PC_MID-2007]    = 'COUNTRIES'
--      ,  [NC_MID-2008]    = 'COUNTRIES'
--      ,  [PC_MID-2008]    = 'COUNTRIES'
--      ,  [NC_MID-2009]    = 'COUNTRIES'
--      ,  [PC_MID-2009]    = 'COUNTRIES'
--      ,  [NC_MID-2010]    = 'COUNTRIES'
--      ,  [PC_MID-2010]    = 'COUNTRIES'
--      ,  [NC_MID-2011]    = 'COUNTRIES'
--      ,  [PC_MID-2011]    = 'COUNTRIES'
--      ,  [NC_MID-2012]    = 'COUNTRIES'
--      ,  [PC_MID-2012]    = 'COUNTRIES'
--      ,  V5Row            = 0
--  FROM 
--       [for_x].[dbo].[AllQuestions]
/***************************************************************************************************************************************************************/
UNION ALL
/***************************************************************************************************************************************************************/
SELECT 
         [Q_Number]
      ,  [Variable]
      ,  [Value]          = 200.00
      ,  [Answer_wording]                    = 'TOTAL'
      ,  [NC_Americas_2007]                  = '35' 
      ,  [PC_Americas_2007]                  = '100 %' 
      ,  [NC_Americas_2008]                  = '35' 
      ,  [PC_Americas_2008]                  = '100 %' 
      ,  [NC_Americas_2009]                  = '35' 
      ,  [PC_Americas_2009]                  = '100 %' 
      ,  [NC_Americas_2010]                  = '35' 
      ,  [PC_Americas_2010]                  = '100 %' 
      ,  [NC_Americas_2011]                  = '35' 
      ,  [PC_Americas_2011]                  = '100 %' 
      ,  [NC_Americas_2012]                  = '35' 
      ,  [PC_Americas_2012]                  = '100 %' 
      ,  [NC_Asia-Pacific_2007]              = '50' 
      ,  [PC_Asia-Pacific_2007]              = '100 %' 
      ,  [NC_Asia-Pacific_2008]              = '50' 
      ,  [PC_Asia-Pacific_2008]              = '100 %' 
      ,  [NC_Asia-Pacific_2009]              = '50' 
      ,  [PC_Asia-Pacific_2009]              = '100 %' 
      ,  [NC_Asia-Pacific_2010]              = '50' 
      ,  [PC_Asia-Pacific_2010]              = '100 %' 
      ,  [NC_Asia-Pacific_2011]              = '50' 
      ,  [PC_Asia-Pacific_2011]              = '100 %' 
      ,  [NC_Asia-Pacific_2012]              = '50' 
      ,  [PC_Asia-Pacific_2012]              = '100 %' 
      ,  [NC_Europe_2007]                    = '45' 
      ,  [PC_Europe_2007]                    = '100 %' 
      ,  [NC_Europe_2008]                    = '45' 
      ,  [PC_Europe_2008]                    = '100 %' 
      ,  [NC_Europe_2009]                    = '45' 
      ,  [PC_Europe_2009]                    = '100 %' 
      ,  [NC_Europe_2010]                    = '45' 
      ,  [PC_Europe_2010]                    = '100 %' 
      ,  [NC_Europe_2011]                    = '45' 
      ,  [PC_Europe_2011]                    = '100 %' 
      ,  [NC_Europe_2012]                    = '45' 
      ,  [PC_Europe_2012]                    = '100 %' 
      ,  [NC_Middle East-North Africa_2007]  = '20' 
      ,  [PC_Middle East-North Africa_2007]  = '100 %' 
      ,  [NC_Middle East-North Africa_2008]  = '20' 
      ,  [PC_Middle East-North Africa_2008]  = '100 %' 
      ,  [NC_Middle East-North Africa_2009]  = '20' 
      ,  [PC_Middle East-North Africa_2009]  = '100 %' 
      ,  [NC_Middle East-North Africa_2010]  = '20' 
      ,  [PC_Middle East-North Africa_2010]  = '100 %' 
      ,  [NC_Middle East-North Africa_2011]  = '20' 
      ,  [PC_Middle East-North Africa_2011]  = '100 %' 
      ,  [NC_Middle East-North Africa_2012]  = '20' 
      ,  [PC_Middle East-North Africa_2012]  = '100 %' 
      ,  [NC_Sub-Saharan Africa_2007]        = '47' 
      ,  [PC_Sub-Saharan Africa_2007]        = '100 %' 
      ,  [NC_Sub-Saharan Africa_2008]        = '47' 
      ,  [PC_Sub-Saharan Africa_2008]        = '100 %' 
      ,  [NC_Sub-Saharan Africa_2009]        = '47' 
      ,  [PC_Sub-Saharan Africa_2009]        = '100 %' 
      ,  [NC_Sub-Saharan Africa_2010]        = '47' 
      ,  [PC_Sub-Saharan Africa_2010]        = '100 %' 
      ,  [NC_Sub-Saharan Africa_2011]        = '48' 
      ,  [PC_Sub-Saharan Africa_2011]        = '100 %' 
      ,  [NC_Sub-Saharan Africa_2012]        = '48' 
      ,  [PC_Sub-Saharan Africa_2012]        = '100 %' 
      ,  [V5Row]                             = 0
  FROM 
       [for_x].[dbo].[AllQuestions]
/***************************************************************************************************************************************************************/
--UNION ALL
--/***************************************************************************************************************************************************************/
--SELECT 
--         [Q_Number]
--      ,  [Variable]
--      ,  [Value]          = 201.00
--      ,  [Answer_wording] = [Notes1_plus201]
--      ,  [NC_Americas_2007]                  = '' 
--      ,  [PC_Americas_2007]                  = '' 
--      ,  [NC_Americas_2008]                  = '' 
--      ,  [PC_Americas_2008]                  = '' 
--      ,  [NC_Americas_2009]                  = '' 
--      ,  [PC_Americas_2009]                  = '' 
--      ,  [NC_Americas_2010]                  = '' 
--      ,  [PC_Americas_2010]                  = '' 
--      ,  [NC_Americas_2011]                  = '' 
--      ,  [PC_Americas_2011]                  = '' 
--      ,  [NC_Americas_2012]                  = '' 
--      ,  [PC_Americas_2012]                  = '' 
--      ,  [NC_Asia-Pacific_2007]              = '' 
--      ,  [PC_Asia-Pacific_2007]              = '' 
--      ,  [NC_Asia-Pacific_2008]              = '' 
--      ,  [PC_Asia-Pacific_2008]              = '' 
--      ,  [NC_Asia-Pacific_2009]              = '' 
--      ,  [PC_Asia-Pacific_2009]              = '' 
--      ,  [NC_Asia-Pacific_2010]              = '' 
--      ,  [PC_Asia-Pacific_2010]              = '' 
--      ,  [NC_Asia-Pacific_2011]              = '' 
--      ,  [PC_Asia-Pacific_2011]              = '' 
--      ,  [NC_Asia-Pacific_2012]              = '' 
--      ,  [PC_Asia-Pacific_2012]              = '' 
--      ,  [NC_Europe_2007]                    = '' 
--      ,  [PC_Europe_2007]                    = '' 
--      ,  [NC_Europe_2008]                    = '' 
--      ,  [PC_Europe_2008]                    = '' 
--      ,  [NC_Europe_2009]                    = '' 
--      ,  [PC_Europe_2009]                    = '' 
--      ,  [NC_Europe_2010]                    = '' 
--      ,  [PC_Europe_2010]                    = '' 
--      ,  [NC_Europe_2011]                    = '' 
--      ,  [PC_Europe_2011]                    = '' 
--      ,  [NC_Europe_2012]                    = '' 
--      ,  [PC_Europe_2012]                    = '' 
--      ,  [NC_Middle East-North Africa_2007]  = '' 
--      ,  [PC_Middle East-North Africa_2007]  = '' 
--      ,  [NC_Middle East-North Africa_2008]  = '' 
--      ,  [PC_Middle East-North Africa_2008]  = '' 
--      ,  [NC_Middle East-North Africa_2009]  = '' 
--      ,  [PC_Middle East-North Africa_2009]  = '' 
--      ,  [NC_Middle East-North Africa_2010]  = '' 
--      ,  [PC_Middle East-North Africa_2010]  = '' 
--      ,  [NC_Middle East-North Africa_2011]  = '' 
--      ,  [PC_Middle East-North Africa_2011]  = '' 
--      ,  [NC_Middle East-North Africa_2012]  = '' 
--      ,  [PC_Middle East-North Africa_2012]  = '' 
--      ,  [NC_Sub-Saharan Africa_2007]        = '' 
--      ,  [PC_Sub-Saharan Africa_2007]        = '' 
--      ,  [NC_Sub-Saharan Africa_2008]        = '' 
--      ,  [PC_Sub-Saharan Africa_2008]        = '' 
--      ,  [NC_Sub-Saharan Africa_2009]        = '' 
--      ,  [PC_Sub-Saharan Africa_2009]        = '' 
--      ,  [NC_Sub-Saharan Africa_2010]        = '' 
--      ,  [PC_Sub-Saharan Africa_2010]        = '' 
--      ,  [NC_Sub-Saharan Africa_2011]        = '' 
--      ,  [PC_Sub-Saharan Africa_2011]        = '' 
--      ,  [NC_Sub-Saharan Africa_2012]        = '' 
--      ,  [PC_Sub-Saharan Africa_2012]        = '' 
--      ,  [V5Row]                             = 0
--  FROM 
--       [for_x].[dbo].[AllQuestions]
--/***************************************************************************************************************************************************************/
--UNION ALL
--/***************************************************************************************************************************************************************/
--SELECT 
--         [Q_Number]
--      ,  [Variable]
--      ,  [Value]          = 500.00
--      ,  [Answer_wording]                    = ''
--      ,  [NC_Americas_2007]                  = '' 
--      ,  [PC_Americas_2007]                  = '' 
--      ,  [NC_Americas_2008]                  = '' 
--      ,  [PC_Americas_2008]                  = '' 
--      ,  [NC_Americas_2009]                  = '' 
--      ,  [PC_Americas_2009]                  = '' 
--      ,  [NC_Americas_2010]                  = '' 
--      ,  [PC_Americas_2010]                  = '' 
--      ,  [NC_Americas_2011]                  = '' 
--      ,  [PC_Americas_2011]                  = '' 
--      ,  [NC_Americas_2012]                  = '' 
--      ,  [PC_Americas_2012]                  = '' 
--      ,  [NC_Asia-Pacific_2007]              = '' 
--      ,  [PC_Asia-Pacific_2007]              = '' 
--      ,  [NC_Asia-Pacific_2008]              = '' 
--      ,  [PC_Asia-Pacific_2008]              = '' 
--      ,  [NC_Asia-Pacific_2009]              = '' 
--      ,  [PC_Asia-Pacific_2009]              = '' 
--      ,  [NC_Asia-Pacific_2010]              = '' 
--      ,  [PC_Asia-Pacific_2010]              = '' 
--      ,  [NC_Asia-Pacific_2011]              = '' 
--      ,  [PC_Asia-Pacific_2011]              = '' 
--      ,  [NC_Asia-Pacific_2012]              = '' 
--      ,  [PC_Asia-Pacific_2012]              = '' 
--      ,  [NC_Europe_2007]                    = '' 
--      ,  [PC_Europe_2007]                    = '' 
--      ,  [NC_Europe_2008]                    = '' 
--      ,  [PC_Europe_2008]                    = '' 
--      ,  [NC_Europe_2009]                    = '' 
--      ,  [PC_Europe_2009]                    = '' 
--      ,  [NC_Europe_2010]                    = '' 
--      ,  [PC_Europe_2010]                    = '' 
--      ,  [NC_Europe_2011]                    = '' 
--      ,  [PC_Europe_2011]                    = '' 
--      ,  [NC_Europe_2012]                    = '' 
--      ,  [PC_Europe_2012]                    = '' 
--      ,  [NC_Middle East-North Africa_2007]  = '' 
--      ,  [PC_Middle East-North Africa_2007]  = '' 
--      ,  [NC_Middle East-North Africa_2008]  = '' 
--      ,  [PC_Middle East-North Africa_2008]  = '' 
--      ,  [NC_Middle East-North Africa_2009]  = '' 
--      ,  [PC_Middle East-North Africa_2009]  = '' 
--      ,  [NC_Middle East-North Africa_2010]  = '' 
--      ,  [PC_Middle East-North Africa_2010]  = '' 
--      ,  [NC_Middle East-North Africa_2011]  = '' 
--      ,  [PC_Middle East-North Africa_2011]  = '' 
--      ,  [NC_Middle East-North Africa_2012]  = '' 
--      ,  [PC_Middle East-North Africa_2012]  = '' 
--      ,  [NC_Sub-Saharan Africa_2007]        = '' 
--      ,  [PC_Sub-Saharan Africa_2007]        = '' 
--      ,  [NC_Sub-Saharan Africa_2008]        = '' 
--      ,  [PC_Sub-Saharan Africa_2008]        = '' 
--      ,  [NC_Sub-Saharan Africa_2009]        = '' 
--      ,  [PC_Sub-Saharan Africa_2009]        = '' 
--      ,  [NC_Sub-Saharan Africa_2010]        = '' 
--      ,  [PC_Sub-Saharan Africa_2010]        = '' 
--      ,  [NC_Sub-Saharan Africa_2011]        = '' 
--      ,  [PC_Sub-Saharan Africa_2011]        = '' 
--      ,  [NC_Sub-Saharan Africa_2012]        = '' 
--      ,  [PC_Sub-Saharan Africa_2012]        = '' 
--      ,  [V5Row]                             = 0
--  FROM 
--       [for_x].[dbo].[AllQuestions]
/***************************************************************************************************************************************************************/
)                                                                                                                                                      AS     TL
/***************************************************************************************************************************************************************/
      --,[Notes2_plus202]
      --,[Notes3_plus203]
      --,[CtryVals_p300]

WHERE
Variable
NOT IN
( 
  'GFI'
, 'GRI'
, 'SHI'
, 'GFI_rd_1d'
, 'GRI_rd_1d'
, 'SHI_rd_1d'
--
, 'GRI_01_x2'
, 'GRI_01_x2_a'
, 'GRI_01_x2_b'
--
, 'GRI_19_b'
, 'GRI_19_c'
, 'GRI_19_d'
, 'GRI_19_da'
, 'GRI_19_db'
, 'GRI_19_e'
, 'GRI_19_f'
, 'GRI_19_filter'
--
, 'GRI_20_05_x1'
--
, 'GRX_21_01'
, 'GRX_21_02'
, 'GRX_21_03'
--
, 'GRX_22'
, 'GRX_22_01'
, 'GRX_22_02'
, 'GRX_22_03'
, 'GRX_22_04'
, 'GRX_22_filter'
--
, 'GRX_23'
, 'GRX_24'
--
, 'GRX_27_01'
, 'GRX_27_02'
, 'GRX_27_03'
, 'GRX_28_01'
, 'GRX_28_02'
, 'GRX_28_03'
--
, 'SHI_01_a'
, 'SHI_01_b'
, 'SHI_01_c'
, 'SHI_01_d'
, 'SHI_01_da'
, 'SHI_01_db'
, 'SHI_01_e'
, 'SHI_01_f'
--
, 'SHI_04_b'
, 'SHI_04_c'
, 'SHI_04_d'
, 'SHI_04_da'
, 'SHI_04_db'
, 'SHI_04_e'
, 'SHI_04_f'
, 'SHI_04_filter'
, 'SHI_04_x'
--
, 'SHI_05_b'
, 'SHI_05_c'
, 'SHI_05_d'
, 'SHI_05_da'
, 'SHI_05_db'
, 'SHI_05_e'
, 'SHI_05_f'
, 'SHI_05_filter'
, 'SHI_05_x'
--
, 'SHX_14_01'
, 'SHX_14_02'
, 'SHX_14_03'
, 'SHX_14_04'
, 'SHX_15_01'
, 'SHX_15_02'
, 'SHX_15_03'
, 'SHX_15_04'
, 'SHX_15_05'
, 'SHX_15_06'
, 'SHX_15_07'
, 'SHX_15_08'
, 'SHX_15_09'
, 'SHX_15_10'
--
, 'XSG_S_99_01'
, 'XSG_S_99_02'
, 'XSG_S_99_03'
, 'XSG_S_99_04'
, 'XSG_S_99_05'
, 'XSG_S_99_06'
, 'XSG_S_99_filter'
 )