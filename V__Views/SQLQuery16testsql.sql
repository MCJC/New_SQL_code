use forum
go

CREATE VIEW v_pr_RegionalMigration

AS

WITH RegMigr --(SalesPersonID, NumberOfOrders, MostRecentOrderDate)
            AS
              (
				SELECT
						[Field_fk]
					  , [Year]                  =   [Field_year]
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
				  FROM [v__Migration_Flow_by_Country]
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
				GROUP BY 
						  [Field_fk]
					  ,   [Scenario_id]
					  , O.[SubRegion6]
					  , D.[SubRegion6]
					  ,   [Religion_group_fk]
					  ,   [Pew_RelL02_Display]
				)                                                                  B
				JOIN
					  for_d..[Pew_Field]
				  ON
						 [Field_pk]
					 =   [Field_fk]                                                    )
SELECT
        [v_row]      = 
                         ROW_NUMBER()OVER(ORDER BY
						    [Year]
						  , [Scenario_id]
						  , [S0]
						  , [S1]
						  , [S2]                )
      , [Field_fk]
      , [Year]
      , [Scenario_id]
      , [CategMigr]
      , [NMigrants]
FROM
(
SELECT
        [Field_fk]
      , [Year]
      , [Scenario_id]
      , [S0]         = [Pew_RelL02_Display]
      , [S1]         = [Region_of_Origin]
      , [S2]         = [Region_of_Destination]
      , [CategMigr]  = CASE
                       WHEN
                              [Region_of_Origin]
                            !=[Region_of_Destination]
                       THEN
                              [Pew_RelL02_Display]
                            + ' migrating from '
                            + [Region_of_Origin]
                            + ' to '
                            + [Region_of_Destination]
                       WHEN
                              [Region_of_Origin]
                            = [Region_of_Destination]
                       THEN
                              [Pew_RelL02_Display]
                            + ' migrating among countries of '
                            + [Region_of_Origin]
                       END
      , [NMigrants]  = [Total Migrants]
FROM
        [RegMigr]
UNION ALL
SELECT
        [Field_fk]
      , [Year]
      , [Scenario_id]
      , [S0]         = [Pew_RelL02_Display]
      , [S1]         = [Region_of_Origin]
      , [S2]         = 'X'
      , [CategMigr]  = 
                              'Total number of '
                            + [Pew_RelL02_Display]
                            + ' migrating from '
                            + [Region_of_Origin]
      , [NMigrants]  = SUM([Total Migrants])
FROM
        [RegMigr]
WHERE
        [Region_of_Origin]
     != [Region_of_Destination]
GROUP BY 
        [Field_fk]
      , [Year]
      , [Scenario_id]
      , [Pew_RelL02_Display]
      , [Region_of_Origin]
UNION ALL
SELECT
        [Field_fk]
      , [Year]
      , [Scenario_id]
      , [S0]         = [Pew_RelL02_Display]
      , [S1]         = [Region_of_Destination]
      , [S2]         = 'XX'
      , [CategMigr]  = 
                              'Total number of '
                            + [Pew_RelL02_Display]
                            + ' migrating to '
                            + [Region_of_Destination]
      , [NMigrants]  = SUM([Total Migrants])
FROM
        [RegMigr]
WHERE
        [Region_of_Origin]
     != [Region_of_Destination]
GROUP BY 
        [Field_fk]
      , [Year]
      , [Scenario_id]
      , [Pew_RelL02_Display]
      , [Region_of_Destination]
) MYALL
GO







       