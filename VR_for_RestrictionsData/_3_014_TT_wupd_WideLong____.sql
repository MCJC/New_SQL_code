USE    [GRSHRcode]

DROP
 TABLE [GRSHRcode].[dbo].[tr___06_wDB_LongData_ALL_byCYQ]
DROP
 TABLE [GRSHRcode].[dbo].[tr___07_wDB_WideData_ALL_byCY]


SELECT *
  INTO [GRSHRcode].[dbo].[tr___06_wDB_LongData_ALL_byCYQ]
  FROM [GRSHRcode].[dbo].[vr___06_wDB_LongData_ALL_byCYQ]
SELECT *
  INTO [GRSHRcode].[dbo].[tr___07_wDB_WideData_ALL_byCY]
  FROM [GRSHRcode].[dbo].[vr___07_wDB_WideData_ALL_byCY]






