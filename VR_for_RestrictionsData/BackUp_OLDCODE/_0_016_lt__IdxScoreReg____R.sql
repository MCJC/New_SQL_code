/***************************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==>  script 016    ------------------------------------------------------------------------------------------ '
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the lookup table [forum_ResAnal].[dbo].[vr___11_cDB_RHIndexScore_byReg]                         <<<<<     ***/
/***     NOTES:                                                                                                                                              ***/
/***             This table includes INDEX numeric rounded values bt country, listed by each one of the 5 world regions                                      ***/
/***                                                                                                                                                         ***/
/***                                                                                                                                                         ***/
/***                                                      > > >     lookup tables work faster     < < <                                                      ***/
/***************************************************************************************************************************************************************/
USE [forum_ResAnal]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
declare @VCODE00 nvarchar(max)
declare @VCODE01 nvarchar(max)
declare @VCODE02 nvarchar(max)
declare @VCODE03 nvarchar(max)
declare @VCODE04 nvarchar(max)
declare @VCODE05 nvarchar(max)
declare @VCODE06 nvarchar(max)
declare @VCODE07 nvarchar(max)
declare @VCODE08 nvarchar(max)
declare @VCODE09 nvarchar(max)
declare @VCODE10 nvarchar(max)
declare @ALLCODE nvarchar(max)
/***************************************************************************************************************************************************************/
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/***************************************************************************************************************************************************************/


/***************************************************************************************************************************************************************/
set @vCODE00 = 
/***************************************************************************************************************************************************************/
/*   >    00    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S00    -- main code SECTION A: "alter view" statement & open parenthesis to enclose query for pivoted & sorted data ----------------------------------*/
N'
ALTER  VIEW                      [dbo].[vr___11_]        AS
SELECT * FROM
(
'
/*-  <   S00    -- main code SECTION A: "alter view" statement & open parenthesis to enclose query for pivoted & sorted data ----------------------------------*/
/*   <    00    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE01 = 
/***************************************************************************************************************************************************************/
/*   >    01    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S01    -- pivoted & sorted data SECTION A ------------------------------------------------------------------------------------------------------------*/
N'
  SELECT
        [IdxS_row] =
                      ROW_NUMBER()
                      OVER(ORDER BY
                                     [Region]
                                    ,[CEN]
                                              )
      , [Nation_fk]
      , [Ctry_EditorialName]
      , [GRI - baseline year]
      , [SHI - baseline year]
      , [GRI - previous year]
      , [SHI - previous year]
      , [GRI - latest year]
      , [SHI - latest year]
      , [Region]
  FROM
     (
'
/*-  <   S01    -- pivoted & sorted data SECTION A ------------------------------------------------------------------------------------------------------------*/
/*   <    01    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE02 = 
/***************************************************************************************************************************************************************/
/*   >    02    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S02    -- pivoted/labeled data SECTION A -------------------------------------------------------------------------------------------------------------*/
/*--->   S021   --   Row 1 of labels  -------------------------------------------------------------------------------------------------------------------------*/
N'
   SELECT
             [Nation_fk]             =  NULL
           , [Ctry_EditorialName]    =  ''''
           , [Region]                =  ''''
           , [CEN]                   =  ''A''
           , [GRI - baseline year]   =  ''baseline'' + CHAR(10) + ''year, ending''
           , [SHI - baseline year]   =  ''''
           , [GRI - previous year]   =  ''previous'' + CHAR(10) + ''year, ending''
           , [SHI - previous year]   =  ''''
           , [GRI - latest year]     =  ''latest''   + CHAR(10) + ''year, ending''
           , [SHI - latest year]     =  ''''
'
/*---<   S021   --   Row 1 of labels  -------------------------------------------------------------------------------------------------------------------------*/
+
N' UNION ALL '
+
/*--->   S022   --   Row 2 of labels  -------------------------------------------------------------------------------------------------------------------------*/
N'
   SELECT
             [Nation_fk]             =  NULL
           , [Ctry_EditorialName]    =  ''''
           , [Region]                =  ''''
           , [CEN]                   =  ''B''
           , [GRI - baseline year]   =  ''JUN 2007''
           , [SHI - baseline year]   =  ''''
           , [GRI - previous year]   =  ''DEC '' + (SELECT CAST(MAX([Year]-1) AS VARCHAR(4)) FROM [vr___05_cDB_Index_byCtryReg&Yr])
           , [SHI - previous year]   =  ''''
           , [GRI - latest year]     =  ''DEC '' + (SELECT CAST(MAX([Year]  ) AS VARCHAR(4)) FROM [vr___05_cDB_Index_byCtryReg&Yr])
           , [SHI - latest year]     =  ''''
'
/*---<   S022   --   Row 2 of labels  -------------------------------------------------------------------------------------------------------------------------*/
+
N' UNION ALL '
+
/*--->   S023   --   Row 3 of labels  -------------------------------------------------------------------------------------------------------------------------*/
N'
   SELECT
             [Nation_fk]             =  NULL
           , [Ctry_EditorialName]    =  ''COUNTRY/REGION''
           , [Region]                =  ''''
           , [CEN]                   =  ''C''
           , [GRI - baseline year]   =  ''GRI''
           , [SHI - baseline year]   =  ''SHI''
           , [GRI - previous year]   =  ''GRI''
           , [SHI - previous year]   =  ''SHI''
           , [GRI - latest year]     =  ''GRI''
           , [SHI - latest year]     =  ''SHI''
'
/*---<   S023   --   Row 3 of labels  -------------------------------------------------------------------------------------------------------------------------*/
+
N' UNION ALL '
+
/*--->   S024   --   selection of pivoted data  ---------------------------------------------------------------------------------------------------------------*/
N'
   SELECT
             *
  FROM
     (
'
/*---<   S024   --   selection of pivoted data  ---------------------------------------------------------------------------------------------------------------*/
/*-  <   S02    -- pivoted/labeled data SECTION A -------------------------------------------------------------------------------------------------------------*/
/*   <    02    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE03 = 
/***************************************************************************************************************************************************************/
/*   >    03    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S03    -- pivotable data SECTION A -------------------------------------------------------------------------------------------------------------------*/
N'
      SELECT 
             [Nation_fk]
            ,[Ctry_EditorialName]    =  CASE
                                        WHEN [Nation_fk] > 999 THEN   [Region]
                                                                    + ''     ''
                                                                    + 
                                                                      CONVERT(VARCHAR(29),
                                                                       CAST(
                                                                        (ROUND(
                                                                           SUM([w])
                                                                           OVER(PARTITION BY [Region]) 
                                                                        , 0))
                                                                       AS DECIMAL(24,0)) 
                                                                      )
                                                                    + '' countries''
                                        ELSE [Ctry_EditorialName]
                                        END
            ,[Region]
            ,[CEN]
            ,[HEAD]
            ,[IRV]
        FROM
             (
'
/*-  <   S03    -- pivotable data SECTION A -------------------------------------------------------------------------------------------------------------------*/
/*   <    03    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE04 = 
/***************************************************************************************************************************************************************/
/*   >    04    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S04    -- pre-pivotable data SECTION A ---------------------------------------------------------------------------------------------------------------*/
N'
              SELECT 
                      [Nation_fk]
                     ,[Ctry_EditorialName]
                     ,[Region]                =  [Region5]
                     ,[CEN]                   =  CASE
                                                 WHEN [Nation_fk] < 999
                                                 THEN [Ctry_EditorialName]
                                                 END
                     ,[HEAD]                  =  CASE
                                                 WHEN [Year] = ( SELECT ((MAX([Year]))    ) FROM [vr___05_cDB_Index_byCtryReg&Yr] )
                                                 THEN [Index_abbreviation] + '' - latest year''
                                                 WHEN [Year] = ( SELECT ((MAX([Year])) - 1) FROM [vr___05_cDB_Index_byCtryReg&Yr] )
                                                 THEN [Index_abbreviation] + '' - previous year''
                                                 WHEN [Year] = ( SELECT ((MIN([Year]))    ) FROM [vr___05_cDB_Index_byCtryReg&Yr] )
                                                 THEN [Index_abbreviation] + '' - baseline year''
                                                 END
                     ,[IRV]                   =  CASE
                                                 WHEN [Nation_fk] < 999
                                                 THEN CONVERT(VARCHAR(5),[I_Rounded_value])
                                                 ELSE ''''
                                                 END
                     ,[w]                     =  CASE
                                                 WHEN [Nation_fk] < 999
                                                 THEN (1/ (CAST
                                                            (COUNT([Year]) 
                                                             OVER
                                                            (PARTITION BY [Nation_fk])
                                                           AS DECIMAL(24,16)) ) )
                                                 ELSE 0
                                                 END
                 FROM
'
/*-  <   S04    -- pre-pivotable data SECTION A ---------------------------------------------------------------------------------------------------------------*/
/*   <    04    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE05 = 
/***************************************************************************************************************************************************************/
/*   >    05    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S05    -- table of indexes (by country and regions' medians) -----------------------------------------------------------------------------------------*/
N'
                      [forum_ResAnal].[dbo].[vr___05_cDB_Index_byCtryReg&Yr]
'
/*-  <   S05    -- table of indexes (by country and regions' medians) -----------------------------------------------------------------------------------------*/
/*   <    05    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE06 = 
/***************************************************************************************************************************************************************/
/*   >    06    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S06    -- pre-pivotable data SECTION B ---------------------------------------------------------------------------------------------------------------*/
N'
                WHERE
                         [ByRegion5]  = 1
               AND
                         [Index_abbreviation] != ''GFI''
               AND
                     (   [Year] >= ( SELECT ((MAX([Year])) - 1) FROM [vr___05_cDB_Index_byCtryReg&Yr] )
                      OR [Year]  = ( SELECT ((MIN([Year]))    ) FROM [vr___05_cDB_Index_byCtryReg&Yr] ) )
'
/*-  <   S06    -- pre-pivotable data SECTION B ---------------------------------------------------------------------------------------------------------------*/
/*   <    06    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE07 = 
/***************************************************************************************************************************************************************/
/*   >    07    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S07    -- pivotable data SECTION B -------------------------------------------------------------------------------------------------------------------*/
N'
             )                                                                                                                                   AS prePivtbDATA
'
/*-  <   S07    -- pivotable data SECTION B -------------------------------------------------------------------------------------------------------------------*/
/*   <    07    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE08 = 
/***************************************************************************************************************************************************************/
/*   >    08    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S08    -- pivoted/labeled data SECTION B -------------------------------------------------------------------------------------------------------------*/
N'
     )                                                                                                                                           AS    PivtbDATA
PIVOT  ( MAX([IRV])    
         FOR [HEAD]
IN ( 
       [GRI - baseline year]
     , [SHI - baseline year]
     , [GRI - previous year]
     , [SHI - previous year]
     , [GRI - latest year]
     , [SHI - latest year]
                             )
                                ) AS pivt
'
/*-  <   S08    -- pivoted/labeled data SECTION B -------------------------------------------------------------------------------------------------------------*/
/*   <    08    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE09 = 
/***************************************************************************************************************************************************************/
/*   >    09    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S09    -- pivoted & sorted data SECTION B -- final parenthesis for enclosing pivoted & labeled data --------------------------------------------------*/
N'
)                                                                                                                                                AS PvtLabelDATA
'
/*-  <   S09    -- pivoted & sorted data SECTION B -- final parenthesis for enclosing pivoted & labeled data --------------------------------------------------*/
/*   <    09    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/
set @vCODE10 = 
/***************************************************************************************************************************************************************/
/*   >    10    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >   S10    -- main code SECTION B: final parenthesis enclosing query for pivoted & sorted data -----------------------------------------------------------*/
N'
)                                                                                                                                                AS  PvtSortDATA
'
/*-  <   S10    -- main code SECTION B: final parenthesis enclosing query for pivoted & sorted data -----------------------------------------------------------*/
/*   <    10    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
/*                                                                                                                                                             */
/*           - + -           - + -           - + -           - + -          - - + - -          - + -           - + -           - + -           - + -           */
/*                                                                                                                                                             */
/***************************************************************************************************************************************************************/






/***************************************************************************************************************************************************************/
set     @ALLCODE =
/***************************************************************************************************************************************************************/
/*   >  ALLCODE >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>    >>>     ***/
/*-  >          -----------------------------------------------------------------------------------------------------------------------------------------------*/
                  (@vCODE00)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE01)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE02)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE03)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE04)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE05)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE06)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE07)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE08)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE09)                                                                                         /***        ... partial code ...        ***/
               +  (@vCODE10)                                                                                         /***        ... partial code ...        ***/
/*-  <          -----------------------------------------------------------------------------------------------------------------------------------------------*/
/*   <  ALLCODE <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<    <<<     ***/
/***************************************************************************************************************************************************************/
--	EXEC dbo.LongPrint @ALLCODE                                     /***        display the currently stored code (to be executed)                           ***/
/***************************************************************************************************************************************************************/
	EXEC  (@ALLCODE)
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/








/***************************************************************************************************************************************************************/
IF OBJECT_ID  (N'[forum_ResAnal].[dbo].[vr___11_cDB_RHIndexScore_byReg]', N'U') IS NOT NULL
DROP TABLE       [forum_ResAnal].[dbo].[vr___11_cDB_RHIndexScore_byReg]
SELECT * INTO    [forum_ResAnal].[dbo].[vr___11_cDB_RHIndexScore_byReg]
            FROM                 [dbo].[vr___11_]
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
--	SELECT* FROM [forum_ResAnal].[dbo].[vr___11_cDB_RHIndexScore_byReg]
/***************************************************************************************************************************************************************/