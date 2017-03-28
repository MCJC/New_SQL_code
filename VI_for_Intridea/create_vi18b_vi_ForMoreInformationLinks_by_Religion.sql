/* ++> create_vi18b_vi_ForMoreInformationLinks_by_Religion.sql <++ */
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the view [forum]..[vi_ForMoreInformationLinks_by_Religion]                                      <<<<<     ***/
/***                                                                                                                                                         ***/
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
               [dbo].[vi_ForMoreInformationLinks_by_Religion]
AS
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
          [RLRv_row]
          =  ROW_NUMBER()
             OVER(ORDER BY
                            R.[Religion_fk]
                          , R.[Report_SortingNumber]      )
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--       , Display_Reports_pk
--       , R.Data_source_fk
       , R.Religion_fk
       , G.Pew_RelL02_Display
       , R.Report_SortingNumber
--       , S.Data_source_name
--       , S.Data_source_description
       , S.Source_Display_Name
       , S.Data_source_url
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
FROM
     [Pew_Data_Source]              AS S
JOIN [Pew_Display_Reports]          AS R
  ON    Data_source_fk
      = Data_source_pk
JOIN [Pew_Religion_Group]           AS G
  ON    Religion_fk
      = Religion_group_pk
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
WHERE
        GRF_Level = 'for_more_info'
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/
go