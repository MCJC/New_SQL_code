
                 IF OBJECT_ID  (N'[forum_ResAnal]..[vry16_02__YtoYChngsMedGRIbyReg]', N'U') IS NOT NULL 
              DROP TABLE        [forum_ResAnal]..[vry16_02__YtoYChngsMedGRIbyReg]


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 

[sorting] = ROW_NUMBER() OVER(order by

       [Ctry_EditorialName]
      ,[QW_std]
      ,[Question_Year]
)



      ,[QW_std]
      , [Ctry_EditorialName]
      ,[Question_Year]
      ,[Answer_value]


into   [forum_ResAnal].[dbo].[vry16_02__YtoYChngsMedGRIbyReg]     ----2.	Year-to-year changes (2007-2014) in median GRI level by region and global median

  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]


  where entity = 'Indexes & Median Indexes'
  and Nation_fk > 500
  and QAS like 'GRI_rd%'
and        [Region5] != ''



  

