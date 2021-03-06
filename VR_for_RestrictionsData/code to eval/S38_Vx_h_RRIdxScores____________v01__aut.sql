/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the view [for_x].[dbo].[Vx_h_RRIndexScores]                                                            <<<<<     ***/
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
               [dbo].[Vx_h_RRIndexScores]
AS
/***************************************************************************************************************************************************************/
/*** > pivoted data ********************************************************************************************************************************************/
SELECT 
       [VxhRow]
                   =  ROW_NUMBER()
                      OVER(ORDER BY
                                     [Region]
                                    ,[CEN]
                                              )
      ,[Nation_fk]
      ,[Ctry_EditorialName]
      ,[GRI - MID-2007]
      ,[SHI - MID-2007]
      ,[GRI - END-2011]
      ,[SHI - END-2011]
      ,[GRI - END-2012]
      ,[SHI - END-2012]
      ,[Region]
      ,[GRI - MID-2008]
      ,[SHI - MID-2008]
      ,[GRI - MID-2009]
      ,[SHI - MID-2009]
      ,[GRI - MID-2010]
      ,[SHI - MID-2010]
      ,[GFI - MID-2007]
      ,[GFI - MID-2008]
      ,[GFI - MID-2009]
      ,[GFI - MID-2010]
      ,[GFI - END-2011]
      ,[GFI - END-2012]
      ,[CEN]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
  FROM
/***************************************************************************************************************************************************************/
/*** > pivotable data ******************************************************************************************************************************************/
(
SELECT 
       [Nation_fk]
      ,[Ctry_EditorialName]    =  LTRIM(RTRIM([Ctry_EditorialName]))
      ,[Region]
      ,[CEN]                   =  [Ctry_EditorialName]
      ,[HEAD]                  =  [Index_abbreviation] + ' - ' + [Index_Year]
      ,[I_Rounded_value]
  FROM
       [forum].[dbo].[Pew_Indexes]
UNION All
SELECT 
       [Nation_fk]             = NULL
      ,[Ctry_EditorialName]    = 'Americas     35 countries'
      ,[Region]                = 'Americas'
      ,[CEN]                   = ' '
      ,[HEAD]                  = 'GFI - MID-2007'
      ,[I_Rounded_value]       = NULL
UNION All
SELECT 
       [Nation_fk]             = NULL
      ,[Ctry_EditorialName]    = 'Asia-Pacific     50 countries'
      ,[Region]                = 'Asia-Pacific'
      ,[CEN]                   = ' '
      ,[HEAD]                  = 'GFI - MID-2007'
      ,[I_Rounded_value]       = NULL
UNION All
SELECT 
       [Nation_fk]             = NULL
      ,[Ctry_EditorialName]    = 'Europe     45 countries'
      ,[Region]                = 'Europe'
      ,[CEN]                   = ' '
      ,[HEAD]                  = 'GFI - MID-2007'
      ,[I_Rounded_value]       = NULL
UNION All
SELECT 
       [Nation_fk]             = NULL
      ,[Ctry_EditorialName]    = 'Middle East-North Africa     20 countries'
      ,[Region]                = 'Middle East-North Africa'
      ,[CEN]                   = ' '
      ,[HEAD]                  = 'GFI - MID-2007'
      ,[I_Rounded_value]       = NULL
UNION All
SELECT 
       [Nation_fk]             = NULL
      ,[Ctry_EditorialName]    = 'Sub-Saharan Africa     48 countries'
      ,[Region]                = 'Sub-Saharan Africa'
      ,[CEN]                   = ' '
      ,[HEAD]                  = 'GFI - MID-2007'
      ,[I_Rounded_value]       = NULL
)                                                                                   AS this
/*** < pivotable data ******************************************************************************************************************************************/
PIVOT  ( MAX([I_Rounded_value])    
         FOR [HEAD]
IN ( 
       [GRI - MID-2007]
     , [GRI - MID-2008]
     , [GRI - MID-2009]
     , [GRI - MID-2010]
     , [GRI - END-2011]
     , [GRI - END-2012]
     , [SHI - MID-2007]
     , [SHI - MID-2008]
     , [SHI - MID-2009]
     , [SHI - MID-2010]
     , [SHI - END-2011]
     , [SHI - END-2012]
     , [GFI - MID-2007]
     , [GFI - MID-2008]
     , [GFI - MID-2009]
     , [GFI - MID-2010]
     , [GFI - END-2011]
     , [GFI - END-2012]
                        )
                           ) AS pivt
/*** < pivoted data ********************************************************************************************************************************************/

/***************************************************************************************************************************************************************/

/*** > pivoted data ********************************************************************************************************************************************/
