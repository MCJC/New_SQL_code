/***************************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==>  script 0.002    ---------------------------------------------------------------------------------------- '
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***                                                                                                                                                         ***/
/***     >>>>>         This script creates semi-WIDE set of (working and/or final) data  from the 'Global Restriction on Religion Study'           <<<<<     ***/
/***                                                                                                                                                         ***/
/***                    -  Data of each row are by country-year (semi-wide)                                                                                  ***/
/***                    -  As any wide/semi-wide set of data, these views and lookup tables only include numeric values for GR&SH R                          ***/
/***                    -  ==> UNCOMENT  W  or  FD  initial section to run sql script (it will create view & lookup table)                                   ***/
/***                                                                                                                                                         ***/
/***                                                                                                                                                         ***/
/***                                               |                 W                 |                F D                |                                 ***/
/***                                               |        working environment        |            final  data            |                                 ***/
/***                     --------------------------+-----------------------------------+-----------------------------------+                                 ***/
/***                                    database:  |            [GRSHRcode]            |          [forum_ResAnal]          |                                 ***/
/***                     --------------------------+-----------------------------------+-----------------------------------+                                 ***/
/***                               1st step view:  |  [vr___02w]                       |  [vr___02_]                       |                                 ***/
/***                     --------------------------+-----------------------------------+-----------------------------------+                                 ***/
/***                       2ns step lookup table:  |  [vr___02_wDB_Wide__by_Ctry&Year] |  [vr___02_cDB_Wide__by_Ctry&Year] |                                 ***/
/***                     --------------------------+-----------------------------------+-----------------------------------+                                 ***/
/***                                                                                                                                                         ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/*******                                                  ***/                                                                                              /***/
/*******                                                  ***/                                                                                              /***/
--	/***                                                  ***/     USE [forum_ResAnal]                                                                      /***/
--	/***   ********************   ****************        ***/     SET ANSI_NULLS ON                                                                        /***/
--	/***   ********************   *****************       ***/     SET QUOTED_IDENTIFIER ON                                                                 /***/
--	/***   ***                    ***            ***      ***/                                                                                              /***/
--	/***   ***                    ***             ***     ***/                                                                                              /***/
--	/***   ***                    ***              ***    ***/     declare     @VIEWNAME           nvarchar(max) = N'vr___02_'                              /***/
--	/***   ****************       ***              ***    ***/     declare     @SOURCE01           nvarchar(max) = N'vr___01_'                              /***/
--	/***   ****************       ***              ***    ***/                                                                                              /***/
--	/***   ***                    ***              ***    ***/                                                                                              /***/
--	/***   ***                    ***              ***    ***/                                                                                              /***/
--	/***   ***                    ***              ***    ***/                                                                                              /***/
--	/***   ***                    ***             ***     ***/     declare     @TEMPTAB1 TABLE (QA_std nvarchar(max))                                       /***/
--	/***   ***                    ***            ***      ***/     INSERT INTO @TEMPTAB1 SELECT DISTINCT [QA_std] FROM [vr___01_cDB_Long__NoAggregated]     /***/
--	/***   ***                    *****************       ***/                                                                                              /***/
--	/***   ***                    ****************        ***/     declare     @CUDBNAME           nvarchar(max) = N'forum_ResAnal'                         /***/
--	/***                                                  ***/     declare     @TABLNAME           nvarchar(max) = N'vr___02_cDB_Wide__by_Ctry&Year'        /***/
/*******                                                  ***/                                                                                              /***/
/*******                                                  ***/                                                                                              /***/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/*******                                                  ***/                                                                                              /***/
/*******                                                  ***/                                                                                              /***/
--	/***                                                  ***/     USE [GRSHRcode]                                                                          /***/
--	/***   *****                                 *****    ***/     SET ANSI_NULLS ON                                                                        /***/
--	/***   *****                                 *****    ***/     SET QUOTED_IDENTIFIER ON                                                                 /***/
--	/***     ***                                 ***      ***/                                                                                              /***/
--	/***      ***                               ***       ***/                                                                                              /***/
--	/***       ***                             ***        ***/     declare     @VIEWNAME           nvarchar(max) = N'vr___02w'                              /***/
--	/***        ***                           ***         ***/     declare     @SOURCE01           nvarchar(max) = N'vr___01w'                              /***/
--	/***         ***           ***           ***          ***/                                                                                              /***/
--	/***          ***         *****         ***           ***/                                                                                              /***/
--	/***           ***       *** ***       ***            ***/                                                                                              /***/
--	/***            ***     ***   ***     ***             ***/                                                                                              /***/
--	/***             ***   ***     ***   ***              ***/     declare     @TEMPTAB1 TABLE (QA_std nvarchar(max))                                       /***/
--	/***              *** ***       *** ***               ***/     INSERT INTO @TEMPTAB1 SELECT DISTINCT [QA_std] FROM [vr___01_wDB_Long__NoAggregated]     /***/
--	/***              *******       *******               ***/                                                                                              /***/
--	/***               *****         *****                ***/     declare     @CUDBNAME           nvarchar(max) = N'GRSHRcode'                             /***/
--	/***                                                  ***/     declare     @TABLNAME           nvarchar(max) = N'vr___02_wDB_Wide__by_Ctry&Year'        /***/
/*******                                                  ***/                                                                                              /***/
/*******                                                  ***/                                                                                              /***/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/************************************************************/     declare     @ALLCODE            nvarchar(max)                                            /***/
/************************************************************/     declare     @SBCODE00           nvarchar(max)                                            /***/
/************************************************************/     declare     @SBCODE01           nvarchar(max)                                            /***/
/************************************************************/     declare     @SBCODE02           nvarchar(max)                                            /***/
/************************************************************/     declare     @SBCODE03           nvarchar(max)                                            /***/
/************************************************************/     declare     @ENDCODET           nvarchar(max)                                            /***/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
set     @SBCODE00 =
/***************************************************************************************************************************************************************/
N' ALTER  VIEW              '
/***************************************************************************************************************************************************************/
/*****  @VIEWNAME: name of view to be updated  *****************************************************************************************************************/
/***************************************************************************************************************************************************************/
set     @SBCODE01 =
/***************************************************************************************************************************************************************/
N'
AS
SELECT * FROM
'
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***  Long NPR aggregated by country and null values recoded as zero in known count variables  *****************************************************************/
N'
(
SELECT 
       [Nation_fk]
      ,[Region5]
      ,[Region6]
      ,[Ctry_EditorialName]
      ,[Question_Year]
'
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
(                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view *************************************************************/
/***************************************************************************************************************************************************************/
   SELECT CASE WHEN     [QA_std]     LIKE 'GRI_19_[b-f]'                        /*** SELECT /CASE for two diff wrdgs...    when count variables GRI_19       ***/
                   OR   [QA_std]     LIKE 'SHI_01_[b-f]'                        /***                                       or   count variables SHI_01       ***/
                   OR   [QA_std]     LIKE 'SHI_04_[b-f]'                        /***                                       or   count variables SHI_04       ***/
                   OR   [QA_std]     LIKE 'SHI_05_[c-f]'                        /***                                       or   count variables SHI_05       ***/
            THEN ', ' + [QA_std] + ' = ISNULL(' + [QA_std] + ', 0)'             /***           as comma delimited code to include null values as ceros       ***/
            ELSE ', ' + [QA_std]                                    END         /*** else comma delimited field for all other QA Std  / end of CASE section  ***/
    FROM                @TEMPTAB1                                               /*** temp table including all field (var) names as rows                      ***/
    ORDER BY CASE WHEN  [QA_std]     LIKE 'GRI_19_[b-f]'                        /*** CASE to sort different wordings...    when count variables GRI_19       ***/
                   OR   [QA_std]     LIKE 'SHI_01_[b-f]'                        /***                                       or   count variables SHI_01       ***/
                   OR   [QA_std]     LIKE 'SHI_04_[b-f]'                        /***                                       or   count variables SHI_04       ***/
                   OR   [QA_std]     LIKE 'SHI_05_[c-f]'                        /***                                       or   count variables SHI_05       ***/
            THEN ', ' + [QA_std] + ' = ISNULL(' + [QA_std] + ', 0)'             /***           as comma delimited code to include null values as ceros       ***/
            ELSE ', ' + [QA_std]                                    END         /*** else comma delimited field for all other QA Std  / end of CASE section  ***/
     FOR XML PATH('')                                                           /*** Modifies the selected rowset nesting all cells into an XML string cell  ***/
/***************************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields ***************************************************************************/
/***************************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
set     @SBCODE02 =
/***************************************************************************************************************************************************************/
/***  all this from...  ****************************************************************************************************************************************/
N'
FROM ( 
'
/****************************************************************************************************************************************  all this from...  ***/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***  Long NPR aggregated by country (& religion due to variable names)  ***************************************************************************************/
N'
SELECT 
       [Nation_fk]
      ,[Region5]
      ,[Region6]
      ,[Ctry_EditorialName]
      ,[Question_Year]
      ,[QA_std]
      ,[Answer_value]      = SUM([Answer_value])
  FROM
'
/***************************************************************************************************************************************************************/
/*****  @SOURCE01: name of entity used as source (1)  **********************************************************************************************************/
/***************************************************************************************************************************************************************/
set     @SBCODE03 =
/***************************************************************************************************************************************************************/
N'
GROUP BY
       [Nation_fk]
      ,[Region5]
      ,[Region6]
      ,[Ctry_EditorialName]
      ,[Question_Year]
      ,[QA_std]
)                                                                                                                                                      AS   lnpr
'
/***************************************************************************************  Long NPR aggregated by country (& religion due to variable names)  ***/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/
N'
PIVOT
(
  MAX([Answer_value])
  FOR [QA_std]
                   in (
'
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                /*** start listing of variables                                              ***/
/***************************************************************************************************************************************************************/
-- select                                                                       /*** SELECT statement to TEST stuffing procedure...                          ***/
/*** Begin stuffing function to remove the first comma in the list of fields to be retrieved (parenthesis not needed) ******************************************/
STUFF(                                                                          /*** begining of the "stuff: function                                        ***/
/***************************************************************************************************************************************************************/
(                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view *************************************************************/
/***************************************************************************************************************************************************************/
    SELECT   ', ' +  [QA_std]                                                   /*** SELECT comma delimiter concatenated to StdVarName (Q Abb Std)           ***/
    FROM            @TEMPTAB1                                                   /*** temp table including all field (var) names as rows                      ***/
    FOR XML PATH('')                                                            /*** Modifies the selected rowset nesting all cells into an XML string cell  ***/
/***************************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields ***************************************************************************/
/***************************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
, 1, 1, '')                                                                     /*** from STUFF: from position 1, change 1 character into ''                 ***/
/****************************************************************************************************************************** stuffing function ends here! ***/
                                                                                /*** end of listing of variables                                             ***/
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/***************************************************************************************************************************************************************/
N'
)
 )                                                                                                                                                     AS   pivt
  )                                                                                                                                                    AS   berc
'
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
        SET            @ALLCODE    =               @SBCODE00
                                      +  quotename(@VIEWNAME)
                                      +            @SBCODE01
                                      +            @SBCODE02
                                      +            @SOURCE01
                                      +            @SBCODE03
/***************************************************************************************************************************************************************/
/*** checking / executing SQL statement that has been stored as a string variable ******************************************************************************/
--	EXEC dbo.LongPrint @ALLCODE                                     /***        display the currently stored code (to be executed)                           ***/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
	EXEC              (@ALLCODE)                                    /***        execute the code that has been stored as text                                ***/
/***************************************************************************************************************************************************************/



/***************************************************************************************************************************************************************/
set     @ENDCODET =
/***************************************************************************************************************************************************************/
N'
  IF OBJECT_ID  (N''' + quotename(@CUDBNAME) + N'.[dbo].' + quotename(@TABLNAME) + N''', N''U'') IS NOT NULL
    DROP TABLE      ' + quotename(@CUDBNAME) + N'.[dbo].' + quotename(@TABLNAME) + N'
 SELECT * INTO      ' + quotename(@CUDBNAME) + N'.[dbo].' + quotename(@TABLNAME) + N'
          FROM      ' + quotename(@CUDBNAME) + N'.[dbo].' + quotename(@VIEWNAME) + N'
'
/***************************************************************************************************************************************************************/
--	EXEC dbo.LongPrint @ENDCODET                                    /***        display the currently stored code (to be executed)                           ***/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
	EXEC              (@ENDCODET)                                   /***        execute the code that has been stored as text                                ***/
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
--	SELECT * FROM [vr___02_wDBtWide__by_Ctry&Year]
--	SELECT * FROM [vr___02_cDB_Wide__by_Ctry&Year]
/***************************************************************************************************************************************************************/