/***  UPDATE STACY DATABASE FROM MOST RECENT VERSIONS IN FORUM DATABASE  **************************************************************************/
USE 
                 [Stacy]
GO
/**************************************************************************************************************************************************/
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_Data_Source]', N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_Data_Source]
---------------------------------------------------------------
SELECT *    INTO [Stacy].[dbo].[Pew_Data_Source]
            FROM [forum].[dbo].[Pew_Data_Source]
/**************************************************************************************************************************************************/
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_Footnote]', N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_Footnote]
---------------------------------------------------------------
SELECT *    INTO [Stacy].[dbo].[Pew_Footnote]
            FROM [forum].[dbo].[Pew_Footnote]
/**************************************************************************************************************************************************/
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_GRFsite_URLs_Topic]', N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_GRFsite_URLs_Topic]
---------------------------------------------------------------
SELECT *    INTO [Stacy].[dbo].[Pew_GRFsite_URLs_Topic]
            FROM [forum].[dbo].[Pew_GRFsite_URLs_Topic]
/**************************************************************************************************************************************************/
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_Nation]', N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_Nation]
---------------------------------------------------------------
SELECT *    INTO [Stacy].[dbo].[Pew_Nation]
            FROM [forum].[dbo].[Pew_Nation]
/**************************************************************************************************************************************************/
IF OBJECT_ID  (N'[Stacy].[dbo].[Pew_Topic]', N'U') IS NOT NULL
DROP   TABLE     [Stacy].[dbo].[Pew_Topic]
---------------------------------------------------------------
SELECT *    INTO [Stacy].[dbo].[Pew_Topic]
            FROM [forum].[dbo].[Pew_Topic]
/**************************************************************************************************************************************************/
