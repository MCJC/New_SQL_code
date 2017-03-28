/*****************************************************************************************************************************************************/
/*****************************************************************************************************************************************************/
/***                                                                                                                                               ***/
/***     >>>>>   This is the script used to create the table [-----].[---].[ft_02__vl_preWideDataXLSX]                                   <<<<<     ***/
/***                                                                                                                                               ***/
/*****************************************************************************************************************************************************/
USE [x_LoadRLS1cUS]
GO
/*****************************************************************************************************************************************************/
IF OBJECT_ID           (N'[vl_preWideDataXLSX]', N'U') IS NOT NULL
DROP TABLE                [vl_preWideDataXLSX]
/*****************************************************************************************************************************************************/

/*****************************************************************************************************************************************************/
declare @ALLCODE nvarchar(max)
/*****************************************************************************************************************************************************/
set     @ALLCODE = 
/*****************************************************************************************************************************************************/
N'
/*****************************************************************************************************************************************************/
SELECT
        [Data_source_name]
      , [Svy_Respondent_pk]
      , [weight]
      , [Survey_Year]
/*      , [StdRLS_Denominations]  = [SVYp_0358]
      , [StdRLS_DenomFamilies]  = [SVYp_0359]
      , [StdRLS_RelTraditions]  = [SVYp_0360]   */
'
-------------------------------------------------------------------------------------------------------------------------------------------------------
+
-------------------------------------------------------------------------------------------------------------------------------------------------------
/*****************************************************************************************************************************************************/
(                                                                                /*** parenthesis to include query for the cell to be stuffed      ***/
/*****************************************************************************************************************************************************/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view ***************************************************/
/*****************************************************************************************************************************************************/
    SELECT                                                                      /*** SELECT statement (notice THERE IS alias for the recoded field ***/
          DISTINCT                                                              /*** should be distinct to include once each variable name         ***/
          ', '                                                                  /*** comma delimiter                                               ***/
        +                                                                       /*** concatenated to...                                            ***/
          [Question_abbreviation_std]                                           /*** Fiels including all Q Abb Std (StdVarName)                    ***/
    FROM                                                                        /*** from...                                                       ***/
          [vl_LongData]                                                            /*** name of the table which includes all field names as rows      ***/
   WHERE  [Question_abbreviation_std] NOT IN (                                  /*** start FILTER by field including QAStd (StdVarName)            ***/
                                                 'SVYp_0358'                    /*** -- [StdRLS_Denominations]                                     ***/
                                               , 'SVYp_0359'                    /*** -- [StdRLS_DenomFamilies]                                     ***/
                                               , 'SVYp_0360'                    /*** -- [StdRLS_RelTraditions]                                     ***/
                                                                )               /*** end FILTER by field including QAStd (StdVarName)              ***/
         ORDER BY                                                               /*** sorting order using exact final field, including:             ***/
          ', '                                                                  /*** comma delimiter                        -> as part of sorting  ***/
        +                                                                       /*** concatenated to...                     -> as part of sorting  ***/
          [Question_abbreviation_std]                                           /*** Field including QAStd (StdVarName)     -> as part of sorting  ***/
         for xml path('')                                                       /*** Modifies selected rowset nesting cells into XML string cell   ***/
/*****************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields *****************************************************************/
/*****************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed      ***/
/*****************************************************************************************************************************************************/
-------------------------------------------------------------------------------------------------------------------------------------------------------
+
-------------------------------------------------------------------------------------------------------------------------------------------------------
N'
INTO [vl_preWideDataXLSX]
  FROM               [vl_LongData]
PIVOT
(
  MAX([Answer_Wording_std])
  FOR [Question_abbreviation_std]
                   IN (
'
-------------------------------------------------------------------------------------------------------------------------------------------------------
+
-------------------------------------------------------------------------------------------------------------------------------------------------------
-- select                                                                       /*** SELECT statement to TEST stuffing procedure...                ***/
/*** Begin stuffing function to remove the first comma in the list of fields to be retrieved (parenthesis not needed) ********************************/
STUFF(                                                                          /*** begining of the "stuff: function                              ***/
/*****************************************************************************************************************************************************/
(                                                                                /*** parenthesis to include query for the cell to be stuffed      ***/
/*****************************************************************************************************************************************************/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view ***************************************************/
/*****************************************************************************************************************************************************/
    SELECT                                                                      /*** SELECT statement (notice THERE IS alias for the recoded field ***/
          DISTINCT                                                              /*** should be distinct to include once each variable name         ***/
          ', '                                                                  /*** comma delimiter                                               ***/
        +                                                                       /*** concatenated to...                                            ***/
          [Question_abbreviation_std]                                           /*** Fiels including all Q Abb Std (StdVarName)                    ***/
    FROM                                                                        /*** from...                                                       ***/
          [vl_LongData]                                                            /*** name of the table which includes all field names as rows      ***/
                                                                                /*** NO FILTERS needed                                             ***/
         ORDER BY                                                               /*** sorting order using exact final field, including:             ***/
          ', '                                                                  /*** comma delimiter                        -> as part of sorting  ***/
        +                                                                       /*** concatenated to...                     -> as part of sorting  ***/
          [Question_abbreviation_std]                                           /*** Field including QAStd (StdVarName)     -> as part of sorting  ***/
         for xml path('')                                                       /*** Modifies selected rowset nesting cells into XML string cell   ***/
/*****************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields *****************************************************************/
/*****************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed      ***/
/*****************************************************************************************************************************************************/
, 1, 1, '')                                                                     /*** from STUFF: from position 1, change 1 character into ''       ***/
/******************************************************************************************************************** stuffing function ends here! ***/
-------------------------------------------------------------------------------------------------------------------------------------------------------
+
-------------------------------------------------------------------------------------------------------------------------------------------------------
N'
)                                                                               /*** end of listing of variables                                   ***/
 )                                                                                                                                           AS   pivt
/*****************************************************************************************************************************************************/
'
/*****************************************************************************************************************************************************/
/*** This is a way for checking the SQL statement that has been stored as a string variable **********************************************************/
--  SELECT @ALLCODE
/*****************************************************************************************************************************************************/
-------------------------------------------------------------------------------------------------------------------------------------------------------
/*****************************************************************************************************************************************************/
/*** The complete SQL statement stored as a string variable is executed as a character string ********************************************************/
/*****************************************************************************************************************************************************/
EXEC  (@ALLCODE)
/*****************************************************************************************************************************************************/