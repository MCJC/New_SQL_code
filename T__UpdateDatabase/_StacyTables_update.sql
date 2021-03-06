/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create working editable tables in database [Stacy]                                                     <<<<<     ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [Stacy]
GO
/***************************************************************************************************************************************************************/
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_Data_Source_editable]'         , N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_Data_Source_editable]
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_Footnote_editable]'            , N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_Footnote_editable]
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_GRFsite_URLs_Topic_editable]'  , N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_GRFsite_URLs_Topic_editable]
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_Topic_editable]'               , N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_Topic_editable]
GO
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_Display_Footnotes_wider_and_editable]'   , N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_Display_Footnotes_wider_and_editable]
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_Display_Reports_wider_and_editable]'     , N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_Display_Reports_wider_and_editable]
GO
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
SELECT *
  INTO [Stacy].[dbo].[Pew_Data_Source_editable]
  FROM [forum].[dbo].[Pew_Data_Source]
/***************************************************************************************************************************************************************/
SELECT *
  INTO [Stacy].[dbo].[Pew_Footnote_editable]
  FROM [forum].[dbo].[Pew_Footnote]
/***************************************************************************************************************************************************************/
SELECT *
  INTO [Stacy].[dbo].[Pew_GRFsite_URLs_Topic_editable]
  FROM [forum].[dbo].[Pew_GRFsite_URLs_Topic]
/***************************************************************************************************************************************************************/
SELECT *
  INTO [Stacy].[dbo].[Pew_Topic_editable]
  FROM [forum].[dbo].[Pew_Topic]
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
SELECT [Display_Footnotes_pk]
      ,[Ctry_EditorialName]
      ,[Pew_religion]
      ,[Topic]
      ,[SubTopic]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Note_fk]
      ,[Note_SortingNumber]
      ,[Footnote_Display]
      ,[About_the_Data_link]
      ,[List_fk]
      ,[item_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Topic_fk]
      ,[Question_fk]
  INTO 
          [Stacy].[dbo].[Pew_Display_Footnotes_wider_and_editable]
  FROM
          [forum].[dbo].[Pew_Display_Footnotes]
LEFT JOIN [forum].[dbo].[Pew_Nation]  
       ON
          [Nation_fk]
         =[Nation_pk]
--LEFT JOIN forum].[dbo].[Pew_Locality]

LEFT JOIN [forum].[dbo].[Pew_Religion_Group]
       ON
          [Religion_fk]
         =[Religion_group_pk]
LEFT JOIN [forum].[dbo].[Pew_Topic]
       ON
          [Topic_fk]
         =[Topic_pk]
LEFT JOIN [forum].[dbo].[Pew_Question]
       ON
          [Question_fk]
         =[Question_pk]
LEFT JOIN [forum].[dbo].[Pew_Footnote]
       ON
          [Note_fk]
         =[Note_pk]
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
SELECT 
       [Display_Reports_pk]
      ,[Ctry_EditorialName]
      ,[Pew_religion]
      ,[Topic]
      ,[SubTopic]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Data_source_fk]              = X.[Data_source_fk]
      ,[Data_source_name]
      ,[Data_source_description]
      ,[Data_source_url]
      ,[Source_Display_Name]
      ,[Report_SortingNumber]
      ,[GRF_Level]
      ,[List_fk]
      ,[item_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Topic_fk]
      ,[Question_fk]
  INTO 
          [Stacy].[dbo].[Pew_Display_Reports_wider_and_editable]
  FROM
  ( SELECT *                              FROM [forum].[dbo].[Pew_Display_Reports]
    UNION ALL  
    SELECT  
            [Display_Reports_pk] = [Display_Reports_pk] + 10000
           ,[List_fk]
           ,[item_fk]
           ,[Nation_fk]
           ,[Locality_fk]
           ,[Religion_fk]
           ,[Topic_fk]
           ,[Question_fk]
           ,[Data_source_fk]       = NULL
           ,[Report_SortingNumber] = 0
           ,[GRF_Level]            = ''
                                          FROM [forum].[dbo].[Pew_Display_Reports]
    UNION ALL  
    SELECT  
            [Display_Reports_pk] = [Display_Reports_pk] + 20000
           ,[List_fk]
           ,[item_fk]
           ,[Nation_fk]
           ,[Locality_fk]
           ,[Religion_fk]
           ,[Topic_fk]
           ,[Question_fk]
           ,[Data_source_fk]       = NULL
           ,[Report_SortingNumber] = 0
           ,[GRF_Level]            = ''
                                          FROM [forum].[dbo].[Pew_Display_Reports]
                                                                                    ) X
LEFT JOIN [forum].[dbo].[Pew_Nation]  
       ON
          [Nation_fk]
         =[Nation_pk]
LEFT JOIN [forum].[dbo].[Pew_Religion_Group]
       ON
          [Religion_fk]
         =[Religion_group_pk]
LEFT JOIN [forum].[dbo].[Pew_Topic]
       ON
          [Topic_fk]
         =[Topic_pk]
LEFT JOIN [forum].[dbo].[Pew_Question]
       ON
          [Question_fk]
         =[Question_pk]
LEFT JOIN [forum].[dbo].[Pew_Data_Source]
       ON
          X.[Data_source_fk]
         =  [Data_source_pk]
ORDER
BY
       [List_fk]
      ,[item_fk]
      ,[Display_Reports_pk]
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
-- pend: dbo.Question_Topic__longer_and_editable
