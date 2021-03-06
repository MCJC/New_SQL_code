/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the view [V8_AggIdx_by_VarVal]                                                                  <<<<<     ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [forum_ResAnal]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
ALTER  VIEW
               [dbo].[V8_AggIdx_by_VarVal]
AS
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***  Begining of select statement (values by country/year/question)  ******************************************************************************************/
/***************************************************************************************************************************************************************/
SELECT
          V7Row
          =  ROW_NUMBER()
             OVER(ORDER BY
                             Variable
                           , Value
                           , INDX
                                          )
        , Variable
        , Value
        , INDX
        , AVRG
        , NCtries = STR(NCtries)
FROM
/***************************************************************************************************************************************************************/
(
/*** union of both GRI & SHI aggregate views by C/Y/Q/A ********************************************************************************************************/
/***************************************************************************************************************************************************************/
/*** Aggregate view by C/Y/Q/A *********************************************************************************************************************************/
SELECT
       [Variable]
      ,[Value]
      ,INDX     =     'GRI'
      ,AVRG     = AVG([GRI])
      ,NCtries  = SUM([CntWg])
  FROM
/***************************************************************************************************************************************************************/
(
/***************************************************************************************************************************************************************/
SELECT 
       [GRI]
      ,[Question_Year]
      ,[Variable]
      ,[Value]
      ,[CntWg]
  FROM 
       [V4_L_by_CYV]
WHERE 
       [Question_Year] = 2012
  AND 
    (
       [Variable]      LIKE 'SH%'
   OR
       [Variable]      LIKE 'GR%'
   OR
       [Variable]      LIKE 'GF%'
   OR
       [Variable]      LIKE 'XS%'
    )
/*** <<< recode for total events *******************************************************************************************************************************/
)                                                                                                                                                      AS    RTE
/***************************************************************************************************************************************************************/
GROUP BY
       [Variable]
      ,[Value]
/********************************************************************************************************************************* Aggregate view by C/Y/Q/A ***/
UNION
/*** Aggregate view by C/Y/Q/A *********************************************************************************************************************************/
SELECT
       [Variable]
      ,[Value]
      ,INDX     =     'SHI'
      ,AVRG     = AVG([SHI])
      ,NCtries  = SUM([CntWg])
  FROM
/***************************************************************************************************************************************************************/
(
/***************************************************************************************************************************************************************/
SELECT 
       [SHI]
      ,[Question_Year]
      ,[Variable]
      ,[Value]
      ,[CntWg]

  FROM 
       [V4_L_by_CYV]
WHERE 
       [Question_Year] = 2012
  AND 
    (
       [Variable]      LIKE 'SH%'
   OR
       [Variable]      LIKE 'GR%'
   OR
       [Variable]      LIKE 'GF%'
   OR
       [Variable]      LIKE 'XS%'
    )
/*** <<< recode for total events *******************************************************************************************************************************/
)                                                                                                                                                      AS    RTE
/***************************************************************************************************************************************************************/
GROUP BY
       [Variable]
      ,[Value]
/********************************************************************************************************************************* Aggregate view by C/Y/Q/A ***/
)                                                                                                                                                      AS    UBA
/******************************************************************************************************** union of both GRI & SHI aggregate views by C/Y/Q/A ***/

/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
