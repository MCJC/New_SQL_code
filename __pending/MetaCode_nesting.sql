/***************************************************************************************************************************************************************/
/*** EXAMPLE ONE: USE A TABLE (VARIASLE) DEFINED BEFORE       *************************************************************/
/***************************************************************************************************************************************************************/



declare @TAB TABLE ( QA_std NVARCHAR(MAX))

INSERT INTO @TAB SELECT DISTINCT [QA_std] FROM [vr___01_wDB_Long__NoAggregated] 



declare @ISDBCURR nvarchar(max)

set     @ISDBCURR = 


(                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/



/***************************************************************************************************************************************************************/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view *************************************************************/
/***************************************************************************************************************************************************************/
    SELECT                                                                      /*** SELECT statement (notice THERE IS alias for the recoded field           ***/
          DISTINCT                                                              /*** should be distinct to include once each variable name                   ***/
          CASE                                                                  /*** CASE to select two different wordings...                                ***/
          WHEN        [QA_std]     LIKE 'GRI_19_[b-f]'                          /*** when count variables GRI_19                                             ***/
                 OR   [QA_std]     LIKE 'SHI_01_[b-f]'                          /*** or   count variables SHI_01                                             ***/
                 OR   [QA_std]     LIKE 'SHI_04_[b-f]'                          /*** or   count variables SHI_04                                             ***/
                 OR   [QA_std]     LIKE 'SHI_05_[c-f]'                          /*** or   count variables SHI_05                                             ***/
          THEN ', ' + [QA_std] + ' = ISNULL(' + [QA_std] + ', 0)'               /*** as comma delimited code to include null values as ceros                 ***/
          ELSE ', ' + [QA_std]                                                  /*** else comma delimited field for all other QA Std (StdVarName)            ***/
          END                                                                   /*** end of CASE section, used to include two different wordings             ***/
    FROM                                                                        /*** from...                                                                 ***/
/**          [vr___01_wDB_Long__NoAggregated]      **/                                /*** name of the table which includes all field (var) names as rows          ***/
         @TAB                                     /*** name of the table which includes all field (var) names as rows          ***/
                                                                                /*** NO FILTERS needed                                                       ***/
         ORDER BY                                                               /*** sorting order using exact final field, including:                       ***/
          CASE                                                                  /*** CASE to sort using two different wordings...                            ***/
          WHEN        [QA_std]     LIKE 'GRI_19_[b-f]'                          /*** when count variables GRI_19                                             ***/
                 OR   [QA_std]     LIKE 'SHI_01_[b-f]'                          /*** or   count variables SHI_01                                             ***/
                 OR   [QA_std]     LIKE 'SHI_04_[b-f]'                          /*** or   count variables SHI_04                                             ***/
                 OR   [QA_std]     LIKE 'SHI_05_[c-f]'                          /*** or   count variables SHI_05                                             ***/
          THEN ', ' + [QA_std] + ' = ISNULL(' + [QA_std] + ', 0)'               /*** as comma delimited code to include null values as ceros                 ***/
          ELSE ', ' + [QA_std]                                                  /*** else comma delimited field for all other QA Std (StdVarName)            ***/
          END                                                                   /*** end of CASE, used to sort list of fields by two different wordings      ***/
         for xml path('')                                                       /*** Modifies the selected rowset nesting all cells into an XML string cell  ***/
/***************************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields ***************************************************************************/
/***************************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/




	EXEC dbo.LongPrint @ISDBCURR                                     /***        display the currently stored code (to be executed)                           ***/
--	EXEC              (@ISDBCURR)                                    /***        display the currently stored code (to be executed)                           ***/










/***************************************************************************************************************************************************************/
/*** EXAMPLE TWO: USE NAMES OF TABLEs as VARIABLES DEFINED BEFORE       *************************************************************/
/***************************************************************************************************************************************************************/


DECLARE @dbName nvarchar(128) = 'GRSHRcode'
DECLARE @tabName nvarchar(128) = 'Pew_Locality'

DECLARE @site nvarchar(128)
DECLARE @MYRESTO nvarchar(MAX)


DECLARE @SQL nvarchar(max) = N'SELECT TOP 1 [Locality]     FROM ' + quotename(@dbName) + N'.[dbo].' + quotename(@tabName)   

exec sp_executesql @SQL

, N'@site nvarchar(128) out', @site out

SET     @MYRESTO = (select @site)


	EXEC dbo.LongPrint @MYRESTO
	EXEC dbo.LongPrint @dbName
	EXEC dbo.LongPrint @tabName
	EXEC dbo.LongPrint @site


/***************************************************************************************************************************************************************/
/*** EXAMPLE THREE: USE NAMES OF TABLEs as VARIABLES DEFINED BEFORE       *************************************************************/
/***************************************************************************************************************************************************************/



DECLARE @dbName nvarchar(128) = 'GRSHRcode'
DECLARE @tabName nvarchar(128) = 'Pew_Locality'
DECLARE @viewName nvarchar(128) = 'vr___03_'
DECLARE @site nvarchar(128)
DECLARE @MYRESTO nvarchar(MAX)
DECLARE @SQL nvarchar(max) 




DECLARE @SQL1 nvarchar(max) = N' ALTER  VIEW        '+     quotename(@viewName) +N'
AS SELECT *  
'
DECLARE @SQL2 nvarchar(max) = N' FROM ' + quotename(@dbName) + N'.[dbo].' + quotename(@tabName)   

set @SQL  

=  @SQL1 + @SQL2





exec sp_executesql @SQL

, N'@site nvarchar(128) out', @site out
