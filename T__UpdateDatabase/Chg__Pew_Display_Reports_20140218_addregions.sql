/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to modify the table [forum].[dbo].[Pew_Display_Reports]                                                   <<<<<     ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [forum]
GO
/***************************************************************************************************************************************************************/

/***************************************************************************************************************************************************************/
SELECT
              List_fk
           ,  item_fk
           ,  Nation_fk
           ,  Locality_fk
           ,  Religion_fk
           ,  Topic_fk
           ,  Question_fk
           ,  Data_source_fk
           ,  Report_SortingNumber
           ,  GRF_Level
INTO
             #PDR_new
FROM
			 [Pew_Display_Reports]
GO
/***************************************************************************************************************************************************************/
INSERT
INTO
             #PDR_new
SELECT
              List_fk
           ,  item_fk                   = Nation_fk + 1000
           ,  Nation_fk                 = Nation_fk + 1000
           ,  Locality_fk
           ,  Religion_fk
           ,  Topic_fk
           ,  Question_fk
           ,  Data_source_fk            = CASE
                                               WHEN Report_SortingNumber = 1 AND GRF_Level = 'for_more_info' THEN 53
                                               WHEN Report_SortingNumber = 2 AND GRF_Level = 'for_more_info' THEN 54
                                               WHEN Report_SortingNumber = 1 AND GRF_Level = 'reports'       THEN 34
                                               WHEN Report_SortingNumber = 2 AND GRF_Level = 'reports'       THEN 33
                                           END
           ,  Report_SortingNumber
           ,  GRF_Level
FROM
			 [Pew_Display_Reports]
WHERE
              Nation_fk                 IN ( 1, 2, 3, 4, 5, 6)
GO
/***************************************************************************************************************************************************************/
select * from              #PDR_new
/***************************************************************************************************************************************************************/
TRUNCATE 
TABLE
			 [Pew_Display_Reports]
GO
/***************************************************************************************************************************************************************/
-- Load the data into table:
-- PKs should be included and correctly defined to do this procedure
INSERT
INTO
			 [Pew_Display_Reports]
SELECT
              Display_Reports_pk    = ROW_NUMBER()
	                                  OVER(ORDER BY
                                                        List_fk
                                                     ,  item_fk
                                                     ,  GRF_Level
                                                     ,  Report_SortingNumber  )
           ,  List_fk
           ,  item_fk
           ,  Nation_fk
           ,  Locality_fk
           ,  Religion_fk
           ,  Topic_fk
           ,  Question_fk
           ,  Data_source_fk
           ,  Report_SortingNumber
           ,  GRF_Level
FROM
             #PDR_new
GO
/***************************************************************************************************************************************************************/
