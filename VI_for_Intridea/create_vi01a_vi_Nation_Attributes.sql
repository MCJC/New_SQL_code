/* ++> create_vi01a_vi_Nation_Attributes.sql <++ */
--/* >> this query should be updated by making line 32 as line 2  !!!!!  << */
--USE [forum]
--GO
--/***************************************************************************************************************************************************************/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--/***************************************************************************************************************************************************************/
--ALTER  VIEW
--               [dbo].[vi_Nation_Attributes]
--AS
--/***************************************************************************************************************************************************************/
--SELECT
--       *
--  FROM
--        [forum_ResAnal].[dbo].[vi_Nation_Attributes]
--/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the view          [forum]..[vi_Nation_Attributes]                                               <<<<<     ***/
/***     >>>>>   This is the script used to create the table [forum_ResAnal]..[vi_Nation_Attributes]                                               <<<<<     ***/
/***             NOTE:  This is a fixed table hosted at the default place for auxiliary fixed tables: [forum_ResAnal]                                        ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
/**** database name specification for data sources (once) ******************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
USE              [forum]
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID (N'[forum_ResAnal].[dbo].[vi_Nation_Attributes]', N'U') IS NOT NULL
DROP   TABLE    [forum_ResAnal].[dbo].[vi_Nation_Attributes]                                     -- drop table if existent
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        [Nation_fk]           = [Nation_pk]
      , [Country_fk]
      , [Ctry_EditorialName]
      , [Iso_3166_Code]
      , [CtryCapital]
      , [SubRegion6]
      , [Reference_pop]
      , [Current_pop]
      , [Annual_PopGrw_rate]  =  CAST((((POWER(([CP]/[RP]),.1))-1) * 100) AS DECIMAL(5,1))  -- ((C/R)^(1/10))-1 
      , [Decade_PopGain]      =  CAST(         ([CP]-[RP])                AS BIGINT)
      , [GDP_per_capita]
      , [Life_Expectancy]
      , [Literacy_Rate]
      , [Notes]
      , [NAv_row]             =  ROW_NUMBER()OVER(ORDER BY [Nation_pk] )
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INTO            [forum_ResAnal].[dbo].[vi_Nation_Attributes]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
FROM
/***************************************************************************************************************************************************************/
(
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[NAv_row]             =  ROW_NUMBER()OVER(ORDER BY
        --                         N.[Nation_pk]            ),
        [Nation_pk]           =  N.[Nation_pk]
      , [Country_fk]          =  N.[Country_fk]
      , [Ctry_EditorialName]  =  N.[Ctry_EditorialName]
      , [Iso_3166_Code]       =  N.[ISO3166_1alpha2]
      , [CtryCapital]         =  N.[CtryCapital]
      , [SubRegion6]          =  N.[SubRegion6]
      , [Reference_pop]       =  CAST(P1.[Cnt] AS BIGINT)
      , [Current_pop]         =  CAST(P2.[Cnt] AS BIGINT)
      , [RP]                  =  P1.[Cnt]
      , [CP]                  =  P2.[Cnt]
      , [GDP_per_capita]      =  REPLACE(
                                 (CONVERT(varchar, CAST(N.[GDP_per_capita] AS money), 1))
                                                                                         , '.00', '')   /*remove zeros by replacing them*/
--      CAST(CAST(N.[GDP_per_capita] AS DECIMAL(9,2)) AS NCHAR)
      , [Life_Expectancy]     =  N.[Life_Expectancy]
      , [Literacy_Rate]       =  N.[Literacy_Rate]
      , [Notes]               =  N.[MainSources]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
  FROM
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
       [Pew_Nation]                  N 
     , [Pew_Nation_Age_Sex_Value]    P1
     , [Pew_Nation_Age_Sex_Value]    P2
     , [Pew_Field]                   F1
     , [Pew_Field]                   F2
     , [Pew_Scenario]                S1
     , [Pew_Scenario]                S2
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
WHERE
--------- filter population -------------------------------------------------------------------------------------------------------------------------------------
      P1.[Sex_fk]               =     0
  AND
      P2.[Sex_fk]               =     0
  AND
      P1.[Age_fk]               =     0
  AND
      P2.[Age_fk]               =     0
  AND
      F1.[Field_year]           = '2000'
  AND
      F2.[Field_year]           = '2010'
  AND
      S1.[Scenario_description] = 'UN population data, 2010 Revision from May 2011'
  AND
      S2.[Scenario_description] = 'Demographic scenario without switching published in 2013'
--------- link country and population ---------------------------------------------------------------------------------------------------------------------------
  AND
          [Nation_pk]
     = P1.[Nation_fk]
  AND
          [Nation_pk]
     = P2.[Nation_fk]
------- link populaton and field --------------------------------------------------------------------------------------------------------------------------------
  AND
       F1.[Field_pk]
     = P1.[Field_fk]
  AND
       F2.[Field_pk]
     = P2.[Field_fk]
--------- link populaton and scenario ---------------------------------------------------------------------------------------------------------------------------
  AND
       S1.[Scenario_id]
     = P1.[Scenario_id]
  AND
       S2.[Scenario_id]
     = P2.[Scenario_id]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/

UNION ALL

/***************************************************************************************************************************************************************/
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[NAv_row]             =  ROW_NUMBER()OVER(ORDER BY
        --                           [Nation_pk]            ),
        [Nation_pk]
      , [Country_fk]
      , [Ctry_EditorialName]
      , [Iso_3166_Code]
      , [CtryCapital]
      , [SubRegion6]
      , [Reference_pop]
      , [Current_pop]
      , [RP]
      , [CP]
      , [GDP_per_capita]      = 'Varies from $' + [min_per_capita] + ' to $' + [max_per_capita]
      , [Life_Expectancy]
      , [Literacy_Rate]
      , [Notes]
FROM
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
(
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        [Nation_pk]           =  CASE
                                     WHEN N.[SubRegion6] = 'North America'             THEN 1001
                                     WHEN N.[SubRegion6] = 'Latin America-Caribbean'   THEN 1002
                                     WHEN N.[SubRegion6] = 'Europe'                    THEN 1003
                                     WHEN N.[SubRegion6] = 'Middle East-North Africa'  THEN 1004
                                     WHEN N.[SubRegion6] = 'Sub-Saharan Africa'        THEN 1005
                                     WHEN N.[SubRegion6] = 'Asia-Pacific'              THEN 1006
                                 END
 
      , [Country_fk]          =  NULL
      , [Ctry_EditorialName]  =  N.[SubRegion6]
      , [Iso_3166_Code]       =  NULL
      , [CtryCapital]         =  NULL
      , [SubRegion6]          =  N.[SubRegion6]
      , [Reference_pop]       =  CAST(SUM(P1.[Cnt]) AS BIGINT)
      , [Current_pop]         =  CAST(SUM(P2.[Cnt]) AS BIGINT)
      , [RP]                  =  SUM(P1.[Cnt])
      , [CP]                  =  SUM(P2.[Cnt])
      , [min_per_capita]      =  REPLACE(
                                 (CONVERT(varchar, CAST(MIN(N.[GDP_per_capita]) AS money), 1))
                                                                                              , '.00', '')   /*remove zeros by replacing them*/

      , [max_per_capita]      =  REPLACE(
                                 (CONVERT(varchar, CAST(MAX(N.[GDP_per_capita]) AS money), 1))
                                                                                              , '.00', '')   /*remove zeros by replacing them*/
--      , [GDP_per_capita]      =  MAX(CAST(N.[GDP_per_capita] AS DECIMAL(9,2)))
      , [Life_Expectancy]     =  NULL
      , [Literacy_Rate]       =  NULL
      , [Notes]               =  'Population data from United Nations (updated May 2011); '
                                +'2005 GDP per capita (in 2005 PPP $). '
                                +'See each country profile page for detailed sources.'
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
  FROM
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
       [Pew_Nation]                  N 
     , [Pew_Nation_Age_Sex_Value]    P1
     , [Pew_Nation_Age_Sex_Value]    P2
     , [Pew_Field]                   F1
     , [Pew_Field]                   F2
     , [Pew_Scenario]                S1
     , [Pew_Scenario]                S2
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
WHERE
--------- filter population -------------------------------------------------------------------------------------------------------------------------------------
      P1.[Sex_fk]               =     0
  AND
      P2.[Sex_fk]               =     0
  AND
      P1.[Age_fk]               =     0
  AND
      P2.[Age_fk]               =     0
  AND
      F1.[Field_year]           = '2000'
  AND
      F2.[Field_year]           = '2010'
  AND
      S1.[Scenario_description] = 'UN population data, 2010 Revision from May 2011'
  AND
      S2.[Scenario_description] = 'Demographic scenario without switching published in 2013'
--------- link country and population ---------------------------------------------------------------------------------------------------------------------------
  AND
          [Nation_pk]
     = P1.[Nation_fk]
  AND
          [Nation_pk]
     = P2.[Nation_fk]
------- link populaton and field --------------------------------------------------------------------------------------------------------------------------------
  AND
       F1.[Field_pk]
     = P1.[Field_fk]
  AND
       F2.[Field_pk]
     = P2.[Field_fk]
--------- link populaton and scenario ---------------------------------------------------------------------------------------------------------------------------
  AND
       S1.[Scenario_id]
     = P1.[Scenario_id]
  AND
       S2.[Scenario_id]
     = P2.[Scenario_id]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
GROUP BY
        N.[SubRegion6]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
)                                                                                                                                                             AGG
/***************************************************************************************************************************************************************/

UNION ALL

/***************************************************************************************************************************************************************/
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[NAv_row]             =  ROW_NUMBER()OVER(ORDER BY
        --                           [Nation_pk]            ),
        [Nation_pk]
      , [Country_fk]
      , [Ctry_EditorialName]
      , [Iso_3166_Code]
      , [CtryCapital]
      , [SubRegion6]
      , [Reference_pop]
      , [Current_pop]
      , [RP]
      , [CP]
      , [GDP_per_capita]      = 'Varies from $' + [min_per_capita] + ' to $' + [max_per_capita]
      , [Life_Expectancy]
      , [Literacy_Rate]
      , [Notes]
FROM
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
(
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        [Nation_pk]           =  10000
      , [Country_fk]          =  NULL
      , [Ctry_EditorialName]  =  ' All Countries'
      , [Iso_3166_Code]       =  NULL
      , [CtryCapital]         =  NULL
      , [SubRegion6]          =  'World'
      , [Reference_pop]       =  CAST(SUM(P1.[Cnt]) AS BIGINT)
      , [Current_pop]         =  CAST(SUM(P2.[Cnt]) AS BIGINT)
      , [RP]                  =  SUM(P1.[Cnt])
      , [CP]                  =  SUM(P2.[Cnt])
      , [min_per_capita]      =  REPLACE(
                                 (CONVERT(varchar, CAST(MIN(N.[GDP_per_capita]) AS money), 1))
                                                                                              , '.00', '')   /*remove zeros by replacing them*/

      , [max_per_capita]      =  REPLACE(
                                 (CONVERT(varchar, CAST(MAX(N.[GDP_per_capita]) AS money), 1))
                                                                                              , '.00', '')   /*remove zeros by replacing them*/
--      , [GDP_per_capita]      =  MAX(CAST(N.[GDP_per_capita] AS DECIMAL(9,2)))
      , [Life_Expectancy]     =  NULL
      , [Literacy_Rate]       =  NULL
      , [Notes]               =  'Population data from United Nations (updated May 2011); '
                                +'2005 GDP per capita (in 2005 PPP $). '
                                +'See each country profile page for detailed sources.'
     , F1.[Field_pk]
     , S1.[Scenario_pk]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
  FROM
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
       [Pew_Nation]                  N 
     , [Pew_Nation_Age_Sex_Value]    P1
     , [Pew_Nation_Age_Sex_Value]    P2
     , [Pew_Field]                   F1
     , [Pew_Field]                   F2
     , [Pew_Scenario]                S1
     , [Pew_Scenario]                S2
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
WHERE
--------- filter population -------------------------------------------------------------------------------------------------------------------------------------
      P1.[Sex_fk]               =     0
  AND
      P2.[Sex_fk]               =     0
  AND
      P1.[Age_fk]               =     0
  AND
      P2.[Age_fk]               =     0
  AND
      F1.[Field_year]           = '2000'
  AND
      F2.[Field_year]           = '2010'
  AND
      S1.[Scenario_description] = 'UN population data, 2010 Revision from May 2011'
  AND
      S2.[Scenario_description] = 'Demographic scenario without switching published in 2013'
--------- link country and population ---------------------------------------------------------------------------------------------------------------------------
  AND
          [Nation_pk]
     = P1.[Nation_fk]
  AND
          [Nation_pk]
     = P2.[Nation_fk]
------- link populaton and field --------------------------------------------------------------------------------------------------------------------------------
  AND
       F1.[Field_pk]
     = P1.[Field_fk]
  AND
       F2.[Field_pk]
     = P2.[Field_fk]
--------- link populaton and scenario ---------------------------------------------------------------------------------------------------------------------------
  AND
       S1.[Scenario_id]
     = P1.[Scenario_id]
  AND
       S2.[Scenario_id]
     = P2.[Scenario_id]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
GROUP BY
       F1.[Field_pk]
     , F2.[Field_pk]
     , S1.[Scenario_pk]
     , S2.[Scenario_pk]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
)                                                                                                                                                             AGW
/***************************************************************************************************************************************************************/
)                                                                                                                                                      FORMERVIEW
/***************************************************************************************************************************************************************/

go