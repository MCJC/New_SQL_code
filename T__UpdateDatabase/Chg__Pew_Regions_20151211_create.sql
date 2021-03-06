USE [forum]
GO
/**************************************************************************************************************************************************/
IF OBJECT_ID  (N'[forum].[dbo].[Pew_Region]', N'U') IS NOT NULL
DROP   TABLE     [forum].[dbo].[Pew_Region]
/**************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/**************************************************************************************************************************************************/
-- create
CREATE TABLE
                 [forum].[dbo].[Pew_Region]
           (
              [Region_pk]             [INT]         NOT NULL
            , [Region_EditorialName]  [VARCHAR](50)     NULL
      --    , [ISO3166_1alpha2]       [varchar](10)     NULL
			, CONSTRAINT
			  [PK_Pew_Region] PRIMARY KEY CLUSTERED 
            ( [Region_pk] ASC )
			                     WITH (   PAD_INDEX = OFF
								        , STATISTICS_NORECOMPUTE = OFF
										, IGNORE_DUP_KEY = OFF
										, ALLOW_ROW_LOCKS = ON
										, ALLOW_PAGE_LOCKS = ON          ) ON [PRIMARY]
                                                                                        ) ON           [PRIMARY] 
/**************************************************************************************************************************************************/
GO
/**************************************************************************************************************************************************/
SET ANSI_PADDING OFF
GO
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
-- Ad data to the table (currently used values):
INSERT INTO
                 [forum].[dbo].[Pew_Region]
          SELECT [K] =  1000 , [N] = 'Americas'
 UNION    SELECT [K] =  1001 , [N] = 'North America'
 UNION    SELECT [K] =  1002 , [N] = 'Latin America-Caribbean'
 UNION    SELECT [K] =  1003 , [N] = 'Europe'
 UNION    SELECT [K] =  1004 , [N] = 'Middle East-North Africa'
 UNION    SELECT [K] =  1005 , [N] = 'Sub-Saharan Africa'
 UNION    SELECT [K] =  1006 , [N] = 'Asia-Pacific'
 UNION    SELECT [K] = 10000 , [N] = 'World'
/**************************************************************************************************************************************************/
select * from    [forum].[dbo].[Pew_Region]          
/**************************************************************************************************************************************************/
