/* ++> create_vi26_vi_Field.sql <++ */
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the view [forum]..[vi_Locations_by_Question]                                                    <<<<<     ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
USE [forum]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
ALTER  VIEW
               [dbo].[vi_Field]
AS
/***************************************************************************************************************************************************************/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT 
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
          [T_row]
          =  ROW_NUMBER()
             OVER(ORDER BY  [Field_pk] )
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
      ,[Field_name]
      ,[Field_note]
      ,[Field_type]
      ,[Field_year]
      ,[Data_source_fk]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
  FROM [forum].[dbo].[Pew_Field]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
GO