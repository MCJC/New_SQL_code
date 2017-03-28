/* ++> create_vi21_vi_QMetadata_Wording&Note&Source.sql <++ */
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the table [forum_ResAnal]..[vi_QMetadata_Wording&Note&Source]                                   <<<<<     ***/
/***             NOTE:  This is a fixed table hosted at the default place for auxiliary fixed tables: [forum_ResAnal]                                        ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     S T E P    B Y    S T E P :     Step   1   o f   2                                                                                                  ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE
                [forum_ResAnal]
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID (N'[forum_ResAnal].[dbo].[vi_QMetadata_Wording&Note&Source]', N'U') IS NOT NULL
DROP   TABLE    [forum_ResAnal].[dbo].[vi_QMetadata_Wording&Note&Source]         -- drop table if existent
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID('tempdb..#qdata'    )  IS NOT NULL
DROP TABLE            #qdata
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
GO
/***************************************************************************************************************************************************************/
/***  Selection of displayable questions and sources  **********************************************************************************************************/
/***
     MAKE IT CTE!!!!!!
     IN FOLLOWING SECTION CODE YEARS 07-13 OR MORE USING SELECT-CODE NOT HARD-CODE
     As mentioned in Script 10:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        -  Some Restriction questions labeled as [StdQ]..[Display] = 0 should be used
           Other questions labeled for display but not linked to NoStd question
                       GRI
           -   GRI_scaled
           -   GRI_20_03_SUMMARY
           -   GRI_20_SUMMARY
                       SHI
           -   SHI_scaled
                       SHI_01_summary_b
some linked as
Question_pk	Question_abbreviation	Question_wording	Question_Year	Notes	Data_source_fk	Question_Std_fk
650	NULL	NULL	NULL	question for aggregated values	28	168


                       and corresponding to displayable years
           (most do not do not have no-std version; GRI_20_SUMMARY & GRI_20_03_SUMMARY do for Years < 2012
                       --- previously: 'GRI_20_03_SUMMARY' AS 'GRI_20_top'
                                       'GRI_20_SUMMARY'    AS 'GRI_20_03_top'
                                       'SHI_01_summary_b'  AS 'SHI_01'
                       --  'SHI_01_summary_a'   -- removed, cannot be tabulated as displayed in GRF website (2014.06.18.jceo)
                       --  'GFI'                -- removed, it is not currently displayed in GRF website (2014.06.18.jceo)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        -  Survey      questions labeled as [StdQ]..[Display] = 1
                       and approved to be displayed... 
                             => currently all international survey questions work that way,
                                but in the future we will need:
                                            [NoSQ]..[Display] = 1
                                therefore such a field should be created
                                since all consistency should be checked, we shouls probably develop
                                tahat at the level of the ERM routines:
                                checking table/or/view by table/or/view after each update
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                                                                             ***/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT 
       [Question_std_fk]
      ,[Question_abbreviation_std]
      ,[Question_wording]
      ,[Question_wording_std]
      ,[Notes]
      ,[Source_Display_Name]
      ,[Question_Year]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
  INTO
      [#qdata]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
  FROM 
      [forum].[dbo].[Pew_Question]
  JOIN
      [forum].[dbo].[Pew_Data_Source]
   ON
       [Data_source_fk]
      =[Data_source_pk]
WHERE
       [Display]           = 1    -- this filter was added on Jul252014 to avoid pulling unnecessary data
  AND
       [Data_source_name] IN (     -- this filter was added on Mar182015 to avoid pulling unwanted sets of questions
                                 'Global Restriction on Religion Study'
                               , 'Islam & Christianity in Sub-Sharan Africa'
                               , 'Global Survey of Islam'
                             )      
----and 
----      [Question_wording_std] like '%penalty%'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UNION ALL
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT 
       DISTINCT
       [Question_std_fk]             = [StdQ_fk]
      ,[Question_abbreviation_std]   = [QA_std]
      ,[Question_wording]            = NULL
      ,[Question_wording_std]        = [QW_std]
      ,[Notes]                       = 'question for aggregated values'
      ,[Source_Display_Name]         = 'Global Restrictions on Religion studies'   
      ,[Question_Year]               = NULL
  FROM [forum_ResAnal].[dbo].[vi_Both_Svy&Rstr_Yr&Q&A_Displayable]
 WHERE [QA_std]                 IN (   'GRI_scaled'
                                     , 'GRI_20_03_SUMMARY'
                                     , 'GRI_20_SUMMARY'
                                     , 'SHI_scaled'         )
/**********************************************************************************************************  Selection of displayable questions and sources  ***/
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     S T E P    B Y    S T E P :     Step   2   o f   2                                                                                                  ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
/*****                                                                                                   *******************************************************/
/*****          Code exemplifies and explains how to use variables listed in a SELECT statement          *******************************************************/
/*****                                                                                                   *******************************************************/
/***************************************************************************************************************************************************************/
-- Declare variable needed to store SQL code
  DECLARE                                 --  declare variable
          @MyCode                         --  variable name
                   VARCHAR(MAX)           --  data type of the variable
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Declare variable needed to store minimum year
  DECLARE                                 --  declare variable
          @MinYR                          --  variable name
                   VARCHAR(MAX)           --  data type of the variable
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
  SET     @MyCode   
          =
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
           N'SELECT '
         + CHAR(13)
         + N'       [Q_Std_fk]   =   [PK]
     , [Q_Wording]  =               ISNULL(QW    , '''') '
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
(                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view *************************************************************/
/***************************************************************************************************************************************************************/
    SELECT                                                                      /*** SELECT statement (notice THERE ISN'T alias for the field                ***/
          ' + ISNULL(QW' + LTRIM(STR([Year])) + ', '''')'                       /***        concatenated year of interest                                    ***/
          FROM [forum].[dbo].[Pew_Display_by_Year]                              /***        from the table which includes years to be displayed              ***/
         WHERE [GRF_QMetadata] = 1                                              /*** FILTER: only years when question metadata shuld be displayed            ***/
         for xml path('')                                                       /*** Modifies the selected rowset nesting all cells into an XML string cell  ***/
/***************************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields ***************************************************************************/
/***************************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
N'
     , [Q_Notes]    =               ISNULL(NT    , '''') '
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
(                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view *************************************************************/
/***************************************************************************************************************************************************************/
    SELECT                                                                      /*** SELECT statement (notice THERE ISN'T alias for the field                ***/
          ' + ISNULL(NT' + LTRIM(STR([Year])) + ', '''')'                       /***        concatenated year of interest                                    ***/
          FROM [forum].[dbo].[Pew_Display_by_Year]                              /***        from the table which includes years to be displayed              ***/
         WHERE [GRF_QMetadata] = 1                                              /*** FILTER: only years when question metadata shuld be displayed            ***/
         for xml path('')                                                       /*** Modifies the selected rowset nesting all cells into an XML string cell  ***/
/***************************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields ***************************************************************************/
/***************************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
N'
     , [Q_Sources]  =               ISNULL(SS    , '''') '
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
(                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view *************************************************************/
/***************************************************************************************************************************************************************/
    SELECT                                                                      /*** SELECT statement (notice THERE ISN'T alias for the field                ***/
          ' + ISNULL(SS' + LTRIM(STR([Year])) + ', '''')'                       /***        concatenated year of interest                                    ***/
          FROM [forum].[dbo].[Pew_Display_by_Year]                              /***        from the table which includes years to be displayed              ***/
         WHERE [GRF_QMetadata] = 1                                              /*** FILTER: only years when question metadata shuld be displayed            ***/
         for xml path('')                                                       /*** Modifies the selected rowset nesting all cells into an XML string cell  ***/
/***************************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields ***************************************************************************/
/***************************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
N'
     , [Q_Years]    = SUBSTRING( (  ISNULL(YR    , '''') '
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
(                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view *************************************************************/
/***************************************************************************************************************************************************************/
    SELECT                                                                      /*** SELECT statement (notice THERE ISN'T alias for the field                ***/
          ' + ISNULL(YR' + LTRIM(STR([Year])) + ', '''')'                       /***        concatenated year of interest                                    ***/
          FROM [forum].[dbo].[Pew_Display_by_Year]                              /***        from the table which includes years to be displayed              ***/
         WHERE [GRF_QMetadata] = 1                                              /*** FILTER: only years when question metadata shuld be displayed            ***/
         for xml path('')                                                       /*** Modifies the selected rowset nesting all cells into an XML string cell  ***/
/***************************************************************************************************************************************************************/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields ***************************************************************************/
/***************************************************************************************************************************************************************/
)                                                                                /*** parenthesis to include query for the cell to be stuffed                ***/
/***************************************************************************************************************************************************************/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
+
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
           N' ), 3, 100)     '
         + CHAR(13)
         + N'INTO [forum_ResAnal].[dbo].[vi_QMetadata_Wording&Note&Source]' 
         + CHAR(13)
         + N'FROM ' 
         + CHAR(13)
         + N' ( SELECT DISTINCT
                  [PK] = [Question_Std_fk]
                , [QW] = CASE WHEN [Question_Year] IS NULL
                              THEN [Question_wording_std]
                              END
                , [NT] = CASE WHEN [Question_Year] IS NULL
                              THEN ''(Answers values are aggregated from other answers)''
                              END
                , [SS] = CASE WHEN [Question_Year] IS NULL
                              THEN [Source_Display_Name]
                              END
                , [YR] = NULL '
         + CHAR(13)
         + N'     FROM [#qdata]                           ) SET_A'
         + CHAR(13)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- print(@MyCode)
/***************************************************************************************************************************************************************/
-- Declare the variables needed for cursor to store data
  DECLARE                                 --  declare variable
          @YRID                           --  variable name
                   VARCHAR(MAX)           --  data type of the variable
-- Declare the Cursor MyCursor
   DECLARE                                -- declare the cursor
              MyCursor                    -- cursor name
                             CURSOR FOR   -- as a cursor to take values from
-- SELECT the data that will be represented by cursor
--    (i.e. "select query" to produce the table)
--    each row of the resuklting table will be stored in the cursor
--    then, from the cursor, the data will be stored in the corresponding variable(s)
    SELECT                                                                      /*** SELECT statement (notice THERE ISN'T alias for the field                ***/
            CAST([Year] AS VARCHAR(MAX))                                        /***        year of interest                                                 ***/
          FROM [forum].[dbo].[Pew_Display_by_Year]                              /***        from the table which includes years to be displayed              ***/
         WHERE [GRF_QMetadata] = 1                                              /*** FILTER: only years when question metadata shuld be displayed            ***/
/***************************************************************************************************************************************************************/
-- OPEN the cursor 
   OPEN                                   -- open
              MyCursor                    -- cursor name

	-- RETRIEVE the FIRST row from cursor & STORE it into the variable(s): 
	                    
	FETCH NEXT
	FROM     MyCursor INTO @YRID

	-- @@FETCH_STATUS returns the status of the last cursor FETCH statement issued against  
	-- any cursor currently opened by the connection. 
	--     @@FETCH_STATUS =  0 means The FETCH statement was successful. 
	--     @@FETCH_STATUS = -1 means The FETCH statement failed or the row was beyond the result set. 
	--     @@FETCH_STATUS = -2 means The row fetched is missing. 

			 WHILE  @@FETCH_STATUS = 0

  /***********************************************************************************************************/
	  -- BEGIN the procedures to be done using the values of each row of the cursor
					BEGIN

	  -- Procedures to be done
  -------------------------------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------------------------------
  SET    @MyCode   
         =
           @MyCode
         + CHAR(13)
         + N'FULL OUTER JOIN '
         + CHAR(13)
         + N' ( SELECT [Question_Std_fk]        AS  PK' +           @YRID
         + CHAR(13)
         + N'         ,  ''('                           +           @YRID
         + N': '''
         + CHAR(13)
         + N'          + [Question_wording]'
         + CHAR(13)
         + N'          + '')  '''
         + CHAR(13)
         + N'                                   AS  QW' +           @YRID
         + CHAR(13)
         + N'         ,                             NT' +           @YRID
         + CHAR(13)
         + N'          = CASE '
         + CHAR(13)
         + N'            WHEN [Notes] != '''' '
         + CHAR(13)
         + N'            THEN '
         + CHAR(13)
         + N'                    ''('                   +           @YRID
         + N': '''
         + CHAR(13)
         + N'                  + [Notes]'
         + CHAR(13)
         + N'                  + '')  '''
         + CHAR(13)
         + N'           END '
         + CHAR(13)
         + N'         ,  ''('                           +           @YRID
         + N': '''
         + CHAR(13)
         + N'          + [Source_Display_Name]'
         + CHAR(13)
         + N'          + '')  '''
         + CHAR(13)
         + N'                                   AS  SS' +           @YRID
         + CHAR(13)
         + N'         ,  '', '                          +           @YRID
         + N''''
         + CHAR(13)
         + N'                                   AS  YR' +           @YRID
         + CHAR(13)
         + N'     FROM [#qdata] '
         + CHAR(13)
         + N'    WHERE [Question_Year]           =    ' +           @YRID
         + CHAR(13)
         + N'                                             ) SET' +  @YRID
         + CHAR(13)
         + N'                      ON      PK   =   PK' +           @YRID
         + CHAR(13)
  -------------------------------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------------------------------
	  -- RETRIEVE the NEXT row from cursor & STORE it into the variable(s): 

						   FETCH NEXT                               -- retrieve the next row
								 FROM                               -- from cursor
										MyCursor                    -- cursor name
								 INTO                               -- store it into the variable(s)
									   @YRID                   --  variable name

	  -- END the procedures to be done using the values of each row of the cursor
					END
  /***********************************************************************************************************/

-- CLOSE the cursor 
   CLOSE                                  -- close
              MyCursor                    -- cursor name
/***************************************************************************************************************************************************************/
-- REMOVE the cursor reference and relase cursor from memory
-- (very Important )
DEALLOCATE                                -- remove reference and relase from memory
              MyCursor                    -- cursor name
/***************************************************************************************************************************************************************/
--		EXEC dbo.LongPrint @MyCode                                 /***        display the currently stored code (to be executed)                           ***/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
                      exec(@MyCode)
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     E N D   O F   S T E P   2   o f   2                                                                                                                 ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/


--/**************************************************************************************************************************/
--/*****                                              BackUp current Table                                              *****/
--/**************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  DECLARE                          --  declare variable
--          @TofI                    --  variable name
--                   varchar(50)     --  data type of the variable
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--/*------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO      [_bk_forum].[dbo].[vi_QMetadata_Wording&Note&Source_' + @CrDt + ']
--                FROM  [forum_ResAnal].[dbo].[vi_QMetadata_Wording&Note&Source]' )  -- 792 in Jul252014
--/*------------------------------------------------------------------------------------------------------------------------*/
--/**************************************************************************************************************************/
--/*****                                              BackUp current Table                                              *****/
--/**************************************************************************************************************************/
go