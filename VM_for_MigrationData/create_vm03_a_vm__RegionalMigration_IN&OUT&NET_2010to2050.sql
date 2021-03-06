/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the view          [forum]..[vm__RegionalMigration_IN&OUT&NET_2010to2050]                        <<<<<     ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
/**** database name specification for data sources (once) ******************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [forum]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
ALTER  VIEW
                       [dbo].[vm__RegionalMigration_IN&OUT&NET_2010to2050]
AS
/***************************************************************************************************************************************************************/
WITH RegMigr --(SalesPersonID, NumberOfOrders, MostRecentOrderDate)
            AS
              (
				SELECT
						[Field_fk]
					  , [Year]                  =   '2010-2050'
					  , [Scenario_id]
					  , [Region_of_Origin]
					  , [Region_of_Destination]
					  , [Religion_group_fk]
					  , [Pew_RelL02_Display]    = CASE
                                                  WHEN    [Pew_RelL02_Display]
                                                        = 'Other Religions'
                                                  THEN    'Members of '
                                                        + [Pew_RelL02_Display]
                                                  ELSE    [Pew_RelL02_Display]
                                                  END
					  , [Total Migrants]
					  , [Display]
				FROM
				(
				SELECT
						[Field_fk]
					  , [Scenario_id]
					  , [Region_of_Origin]      = O.[SubRegion6]
					  , [Region_of_Destination] = D.[SubRegion6]
					  , [Religion_group_fk]
					  , [Pew_RelL02_Display]
					  , [Total Migrants]        = SUM([Migrant_Count])
					  , [Display]               = MIN([Display_by_Religion])
				  FROM [vm__Migration_Flow_by_Country]
					 , [Pew_Religion_Group]
					 , [Pew_Nation]                        O
					 , [Pew_Nation]                        D
				WHERE
						 [Religion_group_pk]
					 =   [Religion_group_fk]
				AND
					   O.[Nation_pk]
					 =   [Origin_Nation_fk]
				AND
					   D.[Nation_pk]
					 =   [Destination_Nation_fk]
				AND
					   D.[Nation_pk]
					 =   [Destination_Nation_fk]
				GROUP BY 
						  [Field_fk]
					  ,   [Scenario_id]
					  , O.[SubRegion6]
					  , D.[SubRegion6]
					  ,   [Religion_group_fk]
					  ,   [Pew_RelL02_Display]
				)                                                                  B
				JOIN
					  [Pew_Field]
				  ON
						 [Field_pk]
					 =   [Field_fk]
                WHERE
                      [Field_year] IN 
                         (   '2010-2015'
                           , '2015-2020'
                           , '2020-2025'
                           , '2025-2030'
                           , '2030-2035'
                           , '2035-2040'
                           , '2040-2045'
                           , '2045-2050' )
					                                                     )
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        [v_row]      = 
                         ROW_NUMBER()OVER(ORDER BY
						    ALLO.[Year]
						  , ALLO.[Scenario_id]
						  , ALLO.[Region]
						  , ALLO.[Religion]                )
      , ALLO.[Year]
      , ALLO.[Scenario_id]
      , ALLO.[Region]
      , ALLO.[Religion]
      ,      [Mill_INTO]  = CAST(ROUND( [Mill_INTO] , 2) AS DEC(8,2))
      ,      [Mill_OUT]   = CAST(ROUND( [Mill_OUT]  , 2) AS DEC(8,2))
      ,      [Mill_NET]   = CAST(ROUND(([Mill_INTO]
                                       -[Mill_OUT] ), 2) AS DEC(8,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
FROM
/**************************************************************************************************************************/
(
/**************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        [Year]
      , [Scenario_id]
      , [Region]     = [Region_of_Origin]
      , [Religion]   = [Pew_RelL02_Display]
      , [S1]         = [Religion_group_fk]
      , [Mill_OUT]   = SUM([Total Migrants])/1000000
FROM
        [RegMigr]
WHERE
        [Region_of_Origin]
     != [Region_of_Destination]
GROUP BY 
        [Year]
      , [Scenario_id]
      , [Religion_group_fk]
      , [Pew_RelL02_Display]
      , [Region_of_Origin]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
)                                                                                                                    ALLO
/**************************************************************************************************************************/
,
/**************************************************************************************************************************/
(
/**************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        [Year]
      , [Scenario_id]
      , [Region]     = [Region_of_Destination]
      , [Religion]   = [Pew_RelL02_Display]
      , [S1]         = [Religion_group_fk]
      , [Mill_INTO]  = SUM([Total Migrants])/1000000
FROM
        [RegMigr]
WHERE
        [Region_of_Origin]
     != [Region_of_Destination]
GROUP BY 
        [Year]
      , [Scenario_id]
      , [Religion_group_fk]
      , [Pew_RelL02_Display]
      , [Region_of_Destination]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
)                                                                                                                    ALLD
/**************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
WHERE
        ALLO.[Region]
      = ALLD.[Region]
  AND
        ALLO.[Religion]
      = ALLD.[Religion]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------


GO


