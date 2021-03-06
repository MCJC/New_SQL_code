/***************************************************************************************************************************************************************/
IF OBJECT_ID  (N'[GRSHRcode].[dbo].[vr___25INDEXTEST]', N'U') IS NOT NULL
DROP TABLE       [GRSHRcode].[dbo].[vr___25INDEXTEST]
SELECT * INTO    [GRSHRcode].[dbo].[vr___25INDEXTEST]
            FROM 
(
SELECT 

       [byCY_row]               =  ROW_NUMBER()
                                   OVER(ORDER BY
                                                   [Ctry_EditorialName]
                                                 , [Question_Year] desc    )
      ,[Question_Year]
      ,[Nation_fk]
      ,[Ctry_EditorialName]
      ,[GRI]
      ,[GRI_scaled]
      ,[SHI]
      ,[SHI_scaled]
  FROM [GRSHRcode].[dbo].[vr___03_wDB_W&Xtra_byCtry&Year]

  WHERE 
       [Ctry_EditorialName]
in (
'Bangladesh', 'Brazil', 'Burma (Myanmar)', 'China', 'Democratic Republic of the Congo', 'Egypt', 'Ethiopia', 'France', 
'Germany', 'India', 'Indonesia', 'Iran', 'Italy', 'Japan', 'Mexico', 'Nigeria', 'Pakistan', 'Philippines', 'Russia', 
'South Africa', 'Thailand', 'Turkey', 'United Kingdom', 'United States', 'Vietnam' )


) MYSELECTION


/*
Bangladesh
Brazil
Burma (Myanmar)
China
Democratic Republic of the Congo
Egypt
Ethiopia
France
Germany
India
Indonesia
Iran
Italy
Japan
Mexico
Nigeria
Pakistan
Philippines
Russia
South Africa
Thailand
Turkey
United Kingdom
United States
Vietnam
*/