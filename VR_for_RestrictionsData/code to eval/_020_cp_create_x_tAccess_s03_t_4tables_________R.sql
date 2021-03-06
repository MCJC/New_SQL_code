/**********************************************************************************/
USE [GRSHR_admin]
GO
/**********************************************************************************/
IF OBJECT_ID (N'[GRSHR_admin].[dbo].[Country]', N'U') IS NOT NULL
DROP   TABLE    [GRSHR_admin].[dbo].[Country]
------------------------------------------------------------------------------------
SELECT DISTINCT
       [Nation_fk]
      ,[Ctry_EditorialName]
  INTO [GRSHR_admin].[dbo].[Country]
  FROM [GRSHR_admin].[dbo].[Basic]
  ORDER BY
       [Ctry_EditorialName]
/**********************************************************************************/
IF OBJECT_ID (N'[GRSHR_admin].[dbo].[QYear]', N'U') IS NOT NULL
DROP   TABLE    [GRSHR_admin].[dbo].[QYear]
------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
------------------------------------------------------------------------------------
CREATE TABLE 
      [dbo].[QYear]
(
      [QYear_pk]                           [int]            NOT NULL
	, [Question_Year]                      [int]                NULL
    , CONSTRAINT
      [QYear_pk]
    PRIMARY KEY CLUSTERED 
    (
	  [QYear_pk]
	                      ASC
                         ) WITH (  PAD_INDEX             = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  
                                                                ) ON [PRIMARY]
                                                                ) ON [PRIMARY]
GO
------------------------------------------------------------------------------------
SET ANSI_PADDING OFF
GO
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
INSERT
  INTO
       [GRSHR_admin].[dbo].[QYear]
SELECT 
       [QYear_pk] = ROW_NUMBER()OVER(ORDER BY [Question_Year])
      ,[Question_Year]
  FROM 
       (  SELECT DISTINCT
                 [Question_Year]
            FROM [GRSHR_admin].[dbo].[Basic]  ) D
/**********************************************************************************/
IF OBJECT_ID (N'[GRSHR_admin].[dbo].[QStd]', N'U') IS NOT NULL
DROP   TABLE    [GRSHR_admin].[dbo].[QStd]
------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
------------------------------------------------------------------------------------
CREATE TABLE 
      [dbo].[QStd]
(
      [QStd_pk]                            [int]            NOT NULL
	, [QA_std]                             [nvarchar](50)       NULL
	, [QW_std]                             [nvarchar](500)      NULL
	, [Question_Year]                      [int]                NULL
	, [Ctry_EditorialName]                 [nvarchar](50)       NULL
    , CONSTRAINT
      [QStd_pk]
    PRIMARY KEY CLUSTERED 
    (
	  [QStd_pk]
	                      ASC
                         ) WITH (  PAD_INDEX             = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  
                                                                ) ON [PRIMARY]
                                                                ) ON [PRIMARY]
GO
------------------------------------------------------------------------------------
SET ANSI_PADDING OFF
GO
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
INSERT
  INTO
       [GRSHR_admin].[dbo].[QStd]
SELECT 
       [QStd_pk] = ROW_NUMBER()OVER(ORDER BY [QA_std], [QW_std])
      ,[QA_std]
      ,[QW_std]
      ,[Question_Year]
      ,[Ctry_EditorialName]
  FROM 
       (  SELECT DISTINCT
                 [QA_std]
                ,[QW_std]
                ,[Question_Year]
                ,[Ctry_EditorialName]
            FROM [GRSHR_admin].[dbo].[Basic]  ) D
/**********************************************************************************/
/**********************************************************************************/
IF OBJECT_ID (N'[GRSHR_admin].[dbo].[AStd]', N'U') IS NOT NULL
DROP   TABLE    [GRSHR_admin].[dbo].[AStd]
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
------------------------------------------------------------------------------------
CREATE TABLE 
      [dbo].[AStd]
(
      [AStd_pk]                            [int]            NOT NULL
	, [QA_std]                             [nvarchar](50)       NULL
	, [AV_std]                             [decimal](38, 2)     NULL
	, [AW_std]                             [nvarchar](400)      NULL
	, [Year_from]                          [int]                NULL
	, [Year_to]                            [int]                NULL
    , CONSTRAINT
      [AStd_pk]
    PRIMARY KEY CLUSTERED 
    (
	  [AStd_pk]
	                      ASC
                         ) WITH (  PAD_INDEX             = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  
                                                                ) ON [PRIMARY]
                                                                ) ON [PRIMARY]
GO
------------------------------------------------------------------------------------
SET ANSI_PADDING OFF
GO
------------------------------------------------------------------------------------
INSERT
  INTO
       [GRSHR_admin].[dbo].[AStd]
------------------------------------------------------------------------------------
SELECT
       [AStd_pk]                     =  ROW_NUMBER()
                                        OVER(ORDER BY
                                                      [Question_abbreviation_std]
                                                    , [Answer_value]                )

	  ,[QA_std]                      =  [Question_abbreviation_std]
      ,[AV_std]                      =  [Answer_value]
      ,[AW_std]                      =  [Answer_Wording_std]
      ,[Year_from]                   =  [min_yr]
      ,[Year_to]                     =  [max_yr]
-- select *
FROM
/**********************************************************************************/
(
/**********************************************************************************/
SELECT
       DISTINCT
       [Question_abbreviation_std]
      ,[Answer_value]
      ,[answer_wording_std]
      ,[Answer_Val&StdWd]            =  CAST([Answer_value]      AS CHAR(8))
                                       +     [answer_wording_std]
      ,[AnsExists]                   =  1
      ,[min_yr]                      =  MIN([Question_Year]) OVER(PARTITION BY [Question_abbreviation_std])
      ,[max_yr]                      =  MAX([Question_Year]) OVER(PARTITION BY [Question_abbreviation_std])
  FROM [forum].[dbo].[Pew_Question]  
     , [forum].[dbo].[Pew_Answer]
WHERE
       [Question_pk]
      =[Question_fk]
AND
       [answer_wording_std]
       IS NOT NULL
------------------------------------------------------------------------------------       
-- clean out errors
AND
       [Question_abbreviation_std]
       NOT IN ( 'SHI_04_b_text', 'SHI_04_e_text' )
AND
       NOT
       ( [Question_abbreviation_std] = 'SHI_01_a' 
        AND
         [answer_wording_std]        = 'No cases were found' )
------------------------------------------------------------------------------------       
/**********************************************************************************/
)                                                                                 T
/**********************************************************************************/
