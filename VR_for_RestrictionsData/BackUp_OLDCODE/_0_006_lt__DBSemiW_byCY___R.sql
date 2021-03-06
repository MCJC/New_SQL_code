/***************************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==>  script 006    ------------------------------------------------------------------------------------------ '
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the lookup table [forum_ResAnal].[dbo].[vr_05w_SemiWide_by_Ctry&Year]                           <<<<<     ***/
/***             This table only includes numeric values aggregated by country/religion & year (does not include descriptive wordings).                      ***/
/***                                                                                                                                                         ***/
/***                                                      > > >     lookup tables work faster     < < <                                                      ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [forum_ResAnal]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
declare @ALLCODE nvarchar(max)
/***************************************************************************************************************************************************************/
set     @ALLCODE = 
/***************************************************************************************************************************************************************/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'
ALTER  VIEW                      [dbo].[vr___04_]        AS
SELECT * FROM
'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'
 ( SELECT
           [byCY_row]           =  ROW_NUMBER()
                                   OVER(ORDER BY
                                                   [Nation_fk]
                                                 , [Question_Year] )
      ,    [Nation_fk]
      ,    [Ctry_EditorialName]
      ,    [UN_TotalPopulation]
      ,    [Region5]
      ,    [Region6]
      ,    [Question_Year]
      ,    [GRI]
      ,    [GRI_rd_1d]
      ,    [GRI_scaled]
      ,    [SHI]
      ,    [SHI_rd_1d]
      ,    [SHI_scaled]
'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view *************************************************************/
/***************************************************************************************************************************************************************/
(                                                                               /*** parenthesis to include query for the cell to be stuffed                ***/
    SELECT                                                                      /*** SELECT statement                                                        ***/
          ', '                                                                  /*** comma delimiter                                                         ***/
        +                                                                       /*** concatenated to...                                                      ***/
          [COLUMN_NAME]                                                         /*** Fiels including all Q Abb Std (StdVarName)                              ***/
    FROM                                                                        /*** from...                                                                 ***/
          [INFORMATION_SCHEMA].[COLUMNS]                                        /*** name of the sys view which includes all field (var) names as rows       ***/
WHERE                                                                           /*** FILTER:                                                                 ***/
          [TABLE_NAME] = 'vr___03_cDB_W&Xtra_byCtry&Year'                       /*** only the view vr_03                                                     ***/
  AND                                                                           /*** FILTER:                                                                 ***/
          [COLUMN_NAME] NOT IN (  'Nation_fk'                                   /*** exclude fileds initialy listed                                          ***/
                                 ,'Region5'                                     /***                                                                         ***/
                                 ,'Region6'                                     /***                                                                         ***/
                                 ,'Ctry_EditorialName'                          /***                                                                         ***/
                                 ,'Question_Year'                               /***                                                                         ***/
                                 ,'GRI'                                         /***                                                                         ***/
                                 ,'GRI_rd_1d'                                   /***                                                                         ***/
                                 ,'GRI_scaled'                                  /***                                                                         ***/
                                 ,'SHI'                                         /***                                                                         ***/
                                 ,'SHI_rd_1d'                                   /***                                                                         ***/
                                 ,'SHI_scaled'            )                     /***                                                                         ***/
  AND                                                                           /*** FILTER:                                                                 ***/
          [COLUMN_NAME] NOT LIKE  '%ny[1-3]'                                    /*** exclude complimentary "ny" fileds redundant                             ***/
  AND                                                                           /*** FILTER:                                                                 ***/
          [COLUMN_NAME] NOT LIKE  '%ny[a-f]'                                    /*** exclude complimentary "ny" fileds redundant                             ***/
         ORDER BY                                                               /*** sorting order usesd to order stored & extra variables alphabetically    ***/
          ', '                                                                  /*** including comma delimiter                        -> as part of sorting  ***/
        +                                                                       /*** concatenated to...                               -> as part of sorting  ***/
          [COLUMN_NAME]                                                         /*** Fiels including all Q Abb Std (StdVarName)       -> as part of sorting  ***/
         for xml path('')                                                       /*** Modifies the selected rowset nesting all cells into an XML string cell  ***/
/***************************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields ***************************************************************************/
/***************************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/****************************************************************************************************************************** stuffing function ends here! ***/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--- > main dataset ------------------------------------------------------------------------------------------------------------------------------------------*/
N'
  FROM [vr___03_cDB_W&Xtra_byCtry&Year]
'
/*--- < main dataset ------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
N' JOIN '
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--- > population --------------------------------------------------------------------------------------------------------------------------------------------*/
N'
       (  SELECT 
                  [FYr]                 = [Field_year]
                , [Nfk]                 = [Nation_fk]
                , [UN_TotalPopulation]  =  CAST([Cnt] AS BIGINT)
             FROM [forum].[dbo].[Pew_Nation_Age_Sex_Value]
                , [forum].[dbo].[Pew_Field]
           WHERE  [Sex_fk]       = 0
             AND  [Age_fk]       = 0
             AND  [Scenario_id]  = 3
             AND  [Field_fk]
                = [Field_pk]                                ) POP
'
/*--- < population --------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'
    ON            [FYr]                 = [Question_Year]
   AND            [Nfk]                 = [Nation_fk]
'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'
 ) SELECTED
'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
/*** This is a way for checking the SQL statement that has been stored as a string variable ********************************************************************/
--	EXEC dbo.LongPrint @ALLCODE                                     /***        display the currently stored code (to be executed)                           ***/
/*** The complete SQL statement stored as a string variable is executed as a character string ******************************************************************/
	EXEC              (@ALLCODE)                                    /***        execute the code that has been stored as text                                ***/
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/








/***************************************************************************************************************************************************************/
IF OBJECT_ID  (N'[forum_ResAnal].[dbo].[vr___04_cDB_SemiWide_byCtry&Yr]', N'U') IS NOT NULL
DROP TABLE       [forum_ResAnal].[dbo].[vr___04_cDB_SemiWide_byCtry&Yr]
SELECT *    INTO [forum_ResAnal].[dbo].[vr___04_cDB_SemiWide_byCtry&Yr]
            FROM                 [dbo].[vr___04_]
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
--	SELECT* FROM [forum_ResAnal].[dbo].[vr___04_cDB_SemiWide_byCtry&Yr]
/***************************************************************************************************************************************************************/
