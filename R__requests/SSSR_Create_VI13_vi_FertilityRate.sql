/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
----------------------------------------------------------------------------------------------------------------------------
USE              [for_d]
GO
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
IF OBJECT_ID('tempdb..#EXTRACTED') IS NOT NULL 
 DROP TABLE  #EXTRACTED
/**************************************************************************************************************************/
SELECT
         [YearPeriod] =   FD.Field_year
       ,                 AXV.Nation_fk
       ,                 AXV.Country
       ,                 AXV.Region
       ,                 AXV.Religion
       ,                 AXV.Religion_fk
       ,                 AXV.Age_fk
       , [ASFR]       =  FER.Rate
       , [RatePop]    = (FER.Rate           -- we will later divide by 1000 & multiply times 5
                       * AXV.Population  )
       , [Pop]        =  AXV.Population
       ,                 FER.Display
INTO
       #EXTRACTED
FROM 
       [forum_ResAnal].[dbo].[vi_AgeSexValue]      AXV
JOIN   [Pew_Nation_Religion_Fertility_Value]       FER
        ON  FER.Nation_fk
          = AXV.Nation_fk
        AND FER.Age_fk
          = AXV.Age_fk
        AND FER.Religion_Group_fk
          = AXV.Religion_fk
JOIN   [Pew_Field]                                  FD
        ON  FER.Field_fk
          = FD.Field_pk
        AND SUBSTRING(FD.Field_year, 1, 4)
          = AXV.Year
JOIN   [Pew_Preferred_Scenario]                    PPS
        ON  FER.Nation_fk
          = PPS.Nation_fk
        AND FER.Field_fk
          = PPS.Field_fk
        AND FER.Scenario_id
          = PPS.Preferred_Scenario_id
WHERE
        AXV.Sex_fk      = 2
  AND
        FER.Measurement = 'ASFR'
----------------------------------------------------------------------------------------------------------------------------
AND
         FD.Field_year      = '2010-2015'
AND
        AXV.Region          = 'Latin America-Caribbean'
AND
        AXV.Nation_fk      NOT IN (
                                       8
                                   ,  11
                                   ,  15
                                  -- ,  52
                                   , 238
                                   ,  71
                                   ,  81
                                   ,  82
                                   , 129
                                   , 179
                                        )
                                  --!= 28
AND
        AXV.Nation_fk      NOT IN (
                                      28
                                  -- ,  150
                                  -- ,  161
                                  ---- ,  52
                                  -- , 238
                                  -- ,  71
                                  -- ,  81
                                  -- ,  82
                                  -- , 129
                                  -- , 179
                                        )
                                  --!= 28
        
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/

--select * from        #EXTRACTED


/**************************************************************************************************************************/
IF OBJECT_ID('tempdb..#_WRCRel_ASFR') IS NOT NULL 
 DROP TABLE           #_WRCRel_ASFR
/***   aggregate ASFR by religion and all religions together -global, by region, and country-   ***************************/
SELECT
----------------------------------------------------------------------------------------------------------------------------
          ASFRv_row
          =  ROW_NUMBER()
             OVER(ORDER BY
                             [YearPeriod]
                           , [level] DESC
                           , [Nation_fk]
                           , [Religion]
                           , [Age_fk]        )
     , *
----------------------------------------------------------------------------------------------------------------------------
INTO   [#_WRCRel_ASFR]
----------------------------------------------------------------------------------------------------------------------------
FROM
/**************************************************************************************************************************/
(
/**************************************************************************************************************************/
------------------ (1) temp table for computing global ---------------------------------------------------------------------
/**************************************************************************************************************************/
------------------ (2) temp table for computing global by religion ---------------------------------------------------------
/**************************************************************************************************************************/
------------------ (3) temp table for computing by region ------------------------------------------------------------------
SELECT 
----------------------------------------------------------------------------------------------------------------------------
         [YearPeriod]
       , [level]           =  2
       , [Region]
       , [Nation_fk]       =  CASE
                                   WHEN [Region] = 'North America'             THEN 1001
                                   WHEN [Region] = 'Latin America-Caribbean'   THEN 1002
                                   WHEN [Region] = 'Europe'                    THEN 1003
                                   WHEN [Region] = 'Middle East-North Africa'  THEN 1004
                                   WHEN [Region] = 'Sub-Saharan Africa'        THEN 1005
                                   WHEN [Region] = 'Asia-Pacific'              THEN 1006
                              END
       , [Country]         = [Region]
       , [Religion_fk]     =  52   -- hard coded, table will not change
       , [Religion]        = 'All Religions'
       , [Age_fk]
       , [ASFR]            = SUM(RatePop) / SUM(Pop)
       , [Display]         = 1     -- region ferltility default to be displayed
----------------------------------------------------------------------------------------------------------------------------
--INTO   #Region_ASBR
----------------------------------------------------------------------------------------------------------------------------
FROM   #EXTRACTED
----------------------------------------------------------------------------------------------------------------------------
GROUP BY [YearPeriod], [Age_fk], [Region]
--ORDER BY [YearPeriod], [Age_fk], [Region]
/**************************************************************************************************************************/
UNION ALL
/**************************************************************************************************************************/
------------------ (4) temp table for computing by region by religion ------------------------------------------------------
SELECT 
----------------------------------------------------------------------------------------------------------------------------
         [YearPeriod]
       , [level]           =  2
       , [Region]
       , [Nation_fk]       =  CASE
                                   WHEN [Region] = 'North America'             THEN 1001
                                   WHEN [Region] = 'Latin America-Caribbean'   THEN 1002
                                   WHEN [Region] = 'Europe'                    THEN 1003
                                   WHEN [Region] = 'Middle East-North Africa'  THEN 1004
                                   WHEN [Region] = 'Sub-Saharan Africa'        THEN 1005
                                   WHEN [Region] = 'Asia-Pacific'              THEN 1006
                              END
       , [Country]         = [Region]
       , [Religion_fk]
       , [Religion]
       , [Age_fk]
       , [ASFR]            = SUM(RatePop) / SUM(Pop)
       , [Display]         = 1     -- region ferltility by religion default to be displayed
----------------------------------------------------------------------------------------------------------------------------
--INTO   #RegionBirths
----------------------------------------------------------------------------------------------------------------------------
FROM   #EXTRACTED
----------------------------------------------------------------------------------------------------------------------------
GROUP BY [YearPeriod], [Age_fk], [Region], [Religion_fk], [Religion]
--ORDER BY [YearPeriod], [Age_fk], [Region], [Religion_fk], [Religion]
/**************************************************************************************************************************/
UNION ALL
/**************************************************************************************************************************/
------------------ (5) temp table for computing by nation ------------------------------------------------------------------
SELECT 
----------------------------------------------------------------------------------------------------------------------------
         [YearPeriod]
       , [level]           =  1
       , [Region]
       , [Nation_fk]
       , [Country]
       , [Religion_fk]     =  52   -- hard coded, table will not change
       , [Religion]        = 'All Religions'
       , [Age_fk]
       , [ASFR]            = SUM(RatePop) / SUM(Pop)
       , [Display]         = 1     -- country ferltility default to be displayed
----------------------------------------------------------------------------------------------------------------------------
--INTO   #ctry_ASBR
----------------------------------------------------------------------------------------------------------------------------
FROM   #EXTRACTED
----------------------------------------------------------------------------------------------------------------------------
GROUP BY [YearPeriod], [Age_fk], [Nation_fk], [Country], [Region]
--ORDER BY [YearPeriod], [Age_fk], [Nation_fk], [Country]
/**************************************************************************************************************************/
UNION ALL
/**************************************************************************************************************************/
------------------ (6) temp table for computing by country by religion -----------------------------------------------------
SELECT 
----------------------------------------------------------------------------------------------------------------------------
         [YearPeriod]
       , [level]           =  1
       , [Region]
       , [Nation_fk]
       , [Country]
       , [Religion_fk]
       , [Religion]
       , [Age_fk]
       , [ASFR]            = [ASFR]
       , [Display]                 -- country erltility by religion will be displayed if labeled to display
----------------------------------------------------------------------------------------------------------------------------
--INTO   #ctryBirths
----------------------------------------------------------------------------------------------------------------------------
FROM   #EXTRACTED
/**************************************************************************************************************************/
)                                                                                                                   AS ASFR
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/


/**************************************************************************************************************************/
IF OBJECT_ID('tempdb..#_FertilityRate') IS NOT NULL 
 DROP TABLE           #_FertilityRate
/***   extract TFR from ASFR   ********************************************************************************************/
SELECT
----------------------------------------------------------------------------------------------------------------------------
          TFRv_row
          =  ROW_NUMBER()
             OVER(ORDER BY
                             [YearPeriod]
                           , [level] DESC
                           , [Nation_fk]
                           , [Religion]      )
     , [YearPeriod]
     , [level]
     , [Region]
     , [Nation_fk]
     , [Country]
     , [Religion_fk]
     , [Religion]
     , [TFR]             = ( SUM([ASFR]) * 5 ) / 1000
     , [Display]         =   MIN([Display])      -- display according to minimum quality of aggregated rows
----------------------------------------------------------------------------------------------------------------------------
INTO   [#_FertilityRate]
----------------------------------------------------------------------------------------------------------------------------
FROM   [#_WRCRel_ASFR]
----------------------------------------------------------------------------------------------------------------------------
GROUP BY
       [YearPeriod]
     , [level]
     , [Region]
     , [Nation_fk]
     , [Country]
     , [Religion_fk]
     , [Religion]
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/

-- select * from [#EXTRACTED]
-- select * from [#_WRCRel_ASFR]
select * from [#_FertilityRate]
