/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to modify the table [forum].[dbo].[Pew_Display_Reports]                                                   <<<<<     ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [forum]
GO
/***************************************************************************************************************************************************************/
IF OBJECT_ID  (N'[forum].[dbo].[Pew_Display_Reports_new]', N'U') IS NOT NULL
DROP   TABLE     [forum].[dbo].[Pew_Display_Reports_new]
/***************************************************************************************************************************************************************/
CREATE TABLE
             [Pew_Display_Reports_new]
           (
              Display_Reports_pk  INT         NOT NULL PRIMARY KEY
             ,
              List_fk               INT
             ,
              item_fk               INT
             ,
              Nation_fk             INT
             ,
              Locality_fk           INT
             ,
              Religion_fk           INT
             ,
              Topic_fk              INT
             ,
              Question_fk           INT
             ,
              Data_source_fk        INT
             ,
              Report_SortingNumber  INT
             ,
              GRF_Level             [varchar](50) NULL
            )
GO
/***************************************************************************************************************************************************************/
-- Load the data into temp table, adding to the current values
-- NOTICE:
-- FIRST TEST using a copy of the table to verify there are no errors
-- PKs should be included and correctly defined to do this procedure
-- add flags: 
SELECT
              List_fk
           ,  item_fk
           ,  Nation_fk      = CASE WHEN List_fk = 1 THEN item_fk END
           ,  Locality_fk    = CASE WHEN List_fk = 2 THEN item_fk END
           ,  Religion_fk    = CASE WHEN List_fk = 3 THEN item_fk END
           ,  Topic_fk       = CASE WHEN List_fk = 4 THEN item_fk END
           ,  Question_fk    = CASE WHEN List_fk = 5 THEN item_fk END
           ,  Data_source_fk
           ,  Report_SortingNumber
INTO
             #PDR_new
FROM
               [Pew_Display_Reports]
/***************************************************************************************************************************************************************/
-- old/new countries
----------------------------------------------------------------------------------------------------------------------------
-- add Curacao
INSERT
INTO
             #PDR_new
SELECT 
              List_fk
           ,  item_fk                 = 238
           ,  Nation_fk               = 238
           ,  Locality_fk
           ,  Religion_fk
           ,  Topic_fk
           ,  Question_fk
           ,  Data_source_fk
           ,  Report_SortingNumber
FROM
             #PDR_new
WHERE
              Nation_fk               = 147
GO
----------------------------------------------------------------------------------------------------------------------------
-- add Sint Maarten
INSERT
INTO
             #PDR_new
SELECT 
              List_fk
           ,  item_fk                 = 239
           ,  Nation_fk               = 239
           ,  Locality_fk
           ,  Religion_fk
           ,  Topic_fk
           ,  Question_fk
           ,  Data_source_fk
           ,  Report_SortingNumber
FROM
             #PDR_new
WHERE
              Nation_fk               = 147
GO
----------------------------------------------------------------------------------------------------------------------------
-- add Caribbean Netherlands
INSERT
INTO
             #PDR_new
SELECT 
              List_fk
           ,  item_fk                 = 240
           ,  Nation_fk               = 240
           ,  Locality_fk
           ,  Religion_fk
           ,  Topic_fk
           ,  Question_fk
           ,  Data_source_fk
           ,  Report_SortingNumber
FROM
             #PDR_new
WHERE
              Nation_fk               = 147
GO
----------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/
----------------------------------------------------------------------------------------------------------------------------
-- drop the Netherlands Antilles 
----------------------------------------------------------------------------------------------------------------------------
DELETE 
             #PDR_new
WHERE
              Nation_fk               = 147
/***************************************************************************************************************************************************************/
ALTER TABLE
             #PDR_new
ADD
              GRF_Level             [varchar](50) NULL
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE
             #PDR_new
SET
              GRF_Level             = 'reports'
WHERE
              Nation_fk               IS NOT NULL
GO
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- add 'for more information" link
INSERT
INTO
             #PDR_new
SELECT 
              List_fk
           ,  item_fk
           ,  Nation_fk
           ,  Locality_fk
           ,  Religion_fk
           ,  Topic_fk
           ,  Question_fk
           ,  Data_source_fk        = CASE
                                           WHEN Report_SortingNumber = 1 THEN (SELECT [Data_source_pk]
                                                                              FROM   [for_d].[dbo].[Pew_Data_Source]
                                                                              WHERE  [Data_source_name] = 'United Nations')
                                           WHEN Report_SortingNumber = 2 THEN (SELECT [Data_source_pk]
                                                                              FROM   [for_d].[dbo].[Pew_Data_Source]
                                                                              WHERE  [Data_source_name] = 'U.S. Department of State')
                                       END
           ,  Report_SortingNumber
           ,  GRF_Level             = 'for_more_info'
FROM
             #PDR_new
WHERE
              Nation_fk                 IS NOT NULL
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Load the data into table:
-- PKs should be included and correctly defined to do this procedure
INSERT
INTO
             [Pew_Display_Reports_new]
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


--/***************************************************************************************************************************************************************/
--IF OBJECT_ID  (N'[forum].[dbo].[Pew_Display_Reports]', N'U') IS NOT NULL
--DROP   TABLE     [forum].[dbo].[Pew_Display_Reports]
--/***************************************************************************************************************************************************************/
--CREATE TABLE
--             [Pew_Display_Reports]
--           (
--              Display_Reports_pk  INT         NOT NULL PRIMARY KEY
--             ,
--              List_fk               INT
--             ,
--              item_fk               INT
--             ,
--              Nation_fk             INT
--             ,
--              Locality_fk           INT
--             ,
--              Religion_fk           INT
--             ,
--              Topic_fk              INT
--             ,
--              Question_fk           INT
--             ,
--              Data_source_fk        INT
--             ,
--              Report_SortingNumber  INT
--             ,
--              GRF_Level             [varchar](50) NULL
--            )
--GO
--/***************************************************************************************************************************************************************/
--/***************************************************************************************************************************************************************/
--INSERT
--INTO
--			 [Pew_Display_Reports]
--SELECT
--			  Display_Reports_pk
--           ,  List_fk
--           ,  item_fk
--           ,  Nation_fk
--           ,  Locality_fk
--           ,  Religion_fk
--           ,  Topic_fk
--           ,  Question_fk
--           ,  Data_source_fk
--           ,  Report_SortingNumber
--           ,  GRF_Level
--FROM
--			 [Pew_Display_Reports_new]
--/***************************************************************************************************************************************************************/
--IF OBJECT_ID  (N'[forum].[dbo].[Pew_Display_Reports_new]', N'U') IS NOT NULL
--DROP   TABLE     [forum].[dbo].[Pew_Display_Reports_new]
--/***************************************************************************************************************************************************************/
