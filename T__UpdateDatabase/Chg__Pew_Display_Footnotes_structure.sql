/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the table [forum].[dbo].[Pew_Display_Footnotes]                                                 <<<<<     ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [forum]
GO
/***************************************************************************************************************************************************************/
IF OBJECT_ID  (N'[forum].[dbo].[Pew_Display_Footnotes_new]', N'U') IS NOT NULL
DROP   TABLE     [forum].[dbo].[Pew_Display_Footnotes_new]
/***************************************************************************************************************************************************************/
CREATE TABLE
             [Pew_Display_Footnotes_new]
           (
              Display_Footnotes_pk  INT         NOT NULL PRIMARY KEY
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
              Note_fk               INT
             ,
              Note_SortingNumber    INT
            )
GO
/***************************************************************************************************************************************************************/
-- Load the data into the table, adding to the current values
-- NOTICE:
-- FIRST TEST using a copy of the table to verify there are no errors
-- PKs should be included and correctly defined to do this procedure
-- add flags: 
INSERT
INTO
             [Pew_Display_Footnotes_new]
SELECT
              Display_Footnotes_pk
           ,  List_fk
           ,  item_fk
           ,  Nation_fk    = CASE WHEN List_fk = 1 THEN item_fk END
           ,  Locality_fk  = CASE WHEN List_fk = 2 THEN item_fk END
           ,  Religion_fk  = CASE WHEN List_fk = 3 THEN item_fk END
           ,  Topic_fk     = CASE WHEN List_fk = 4 THEN item_fk END
           ,  Question_fk  = CASE WHEN List_fk = 5 THEN item_fk END
           ,  Note_fk
           ,  Note_SortingNumber
FROM
             [Pew_Display_Footnotes]
/***************************************************************************************************************************************************************/
--/***************************************************************************************************************************************************************/
--IF OBJECT_ID  (N'[forum].[dbo].[Pew_Display_Footnotes]', N'U') IS NOT NULL
--DROP   TABLE     [forum].[dbo].[Pew_Display_Footnotes]
--/***************************************************************************************************************************************************************/
--CREATE TABLE
--             [Pew_Display_Footnotes]
--           (
--              Display_Footnotes_pk  INT         NOT NULL PRIMARY KEY
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
--              Note_fk               INT
--             ,
--              Note_SortingNumber    INT
--            )
--GO
--/***************************************************************************************************************************************************************/
---- Load the data into the table, adding to the current values
---- NOTICE:
---- FIRST TEST using a copy of the table to verify there are no errors
---- PKs should be included and correctly defined to do this procedure
---- add flags: 
--INSERT
--INTO
--             [Pew_Display_Footnotes]
--SELECT
--              Display_Footnotes_pk
--           ,  List_fk
--           ,  item_fk
--           ,  Nation_fk
--           ,  Locality_fk
--           ,  Religion_fk
--           ,  Topic_fk
--           ,  Question_fk
--           ,  Note_fk
--           ,  Note_SortingNumber
--FROM
--             [Pew_Display_Footnotes_new]
--/***************************************************************************************************************************************************************/
--IF OBJECT_ID  (N'[forum].[dbo].[Pew_Display_Footnotes_new]', N'U') IS NOT NULL
--DROP   TABLE     [forum].[dbo].[Pew_Display_Footnotes_new]
--/***************************************************************************************************************************************************************/
