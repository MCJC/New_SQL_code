USE [forum_ResAnal]
GO
/**************************************************************************************************************************************************/
IF OBJECT_ID (N'[forum_ResAnal].[dbo].[vx_01_dependencies]', N'U') IS NOT NULL
DROP TABLE      [forum_ResAnal].[dbo].[vx_01_dependencies]
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/***************************************************************************************************************************************************************/
CREATE TABLE
[dbo].[vx_01_dependencies] (
                              [ROWID]    INT IDENTITY
                            , [sort]        INT
                            , [child]       VarChar(MAX)
                            , [lvl]         INT
                            , [through]     VarChar(MAX)
                            , [ancestors]   VarChar(MAX)
                            , [tree]        VarChar(MAX)
                            , [ChildID]     VarChar(MAX)
                            , [ParentID]    VarChar(MAX)
                            , [ChildFullN]  VarChar(MAX)
                            , [ParentFullN] VarChar(MAX)
                                                         ) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
DECLARE @CrDt varchar( 8)                                 /***        declare variable for storing current date (as text)                       ***/
SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))       /***        set value to current date in the format YYYYMMDD                          ***/
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
/*********************************************************     >>>>>  cursor                                                                    ***/
DECLARE @CODEmain1 nvarchar(max)                          /***        declare variable for storing code during each data retreival              ***/
DECLARE @tablename nvarchar(max)                          /***        declare variable for storing data from cursor                             ***/
DECLARE MyCursor   CURSOR FOR                             /*** >>>>   declare cursor to take values from the following select sataement         ***/
/**************************************************************************************************************************************************/
SELECT [ct]                                               /*** >>>    select                                                                    ***/
  FROM                                                    /***                                                                                  ***/
(                                                         /***                                                                                  ***/
SELECT [ct]                                               /*** >>>    select concatenated text                                                  ***/
          ='[forum].[dbo].['+[TABLE_NAME]+']'             /***               table/view names                                                   ***/
  FROM      [forum].[INFORMATION_SCHEMA].[TABLES]         /*** <<<    from the system view listing tables & views in the database               ***/
UNION                                                     /***                                                                                  ***/
   ALL                                                    /***                                                                                  ***/
SELECT [ct]                                               /*** >>>    select concatenated text                                                  ***/
          ='[forum_ResAnal].[dbo].['+[TABLE_NAME]+']'     /***               table/view names                                                   ***/
  FROM      [forum_ResAnal].[INFORMATION_SCHEMA].[TABLES] /*** <<<    from the system view listing tables & views in the database               ***/
)                                          tabs_and_views /***                                                                                  ***/

--WHERE [ct] IN ( '[forum].[dbo].[Pew_Answer]', '[forum].[dbo].[vi_AgeSexValue]' )

ORDER BY [ct]                                             /*** <<<                                                                              ***/
/**************************************************************************************************************************************************/
OPEN             MyCursor                                 /*** >>>    open cursor by its name                                                   ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
FETCH NEXT FROM  MyCursor                                 /***        retrieve the next row from cursor                                         ***/
           INTO  @tablename                               /***        store it into the corresponding variable(s)                               ***/
          WHILE  @@FETCH_STATUS = 0                       /***        while the status of the last retreival has been successful                ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
BEGIN                                                     /*** >>     BEGIN the procedures using values of each row of the cursor               ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO         [vx_01_dependencies]                  /***        execute code                                                              ***/
SELECT * FROM [dbo].[GetAncestors](@tablename)            /***        execute code                                                              ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                          /*** <<     ENDING of the procedures using values of each row of the cursor           ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
FETCH NEXT FROM  MyCursor                                 /***        retrieve the next row from cursor                                         ***/
           INTO  @tablename                               /***        store it into the corresponding variable(s)                               ***/
           END                                            /***        and end when last row has been retreived                                  ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
   CLOSE         MyCursor                                 /*** <<<    close cursor by its name                                                  ***/
DEALLOCATE       MyCursor                                 /*** <<<<   remove reference and relase from memory by cursor name                    ***/
/*********************************************************     <<<<<  cursor                                                                    ***/
/**************************************************************************************************************************************************/
GO
/**************************************************************************************************************************************************/




---select * from [vx_01_dependencies] 



----/***      Create views setting them to 'a'                                                                                                      ***/
----/**************************************************************************************************************************************************/
----/*********************************************************     >>>>>  cursor                                                                    ***/
----DECLARE @CODEmain2 nvarchar(max)                          /***        declare variable for storing code during each data retreival              ***/
----DECLARE @viewname  nvarchar(max)                          /***        declare variable for storing data from cursor                             ***/
----DECLARE MyCursor   CURSOR FOR                             /*** >>>>   declare cursor to take values from the following select sataement         ***/
----/**************************************************************************************************************************************************/
----      SELECT [VAR] =  'v01_EnteredValues'                 /*** >>>    select view names                                                         ***/
----UNION SELECT [VAR] =  'v02_AllCodedValues'                /*** >>>       ... view names                                                         ***/
----UNION SELECT [VAR] =  'v03_WideChanges'                   /*** >>>       ... view names                                                         ***/
----UNION SELECT [VAR] =  'v04_Descriptions'                  /*** >>>       ... view names                                                         ***/
----UNION SELECT [VAR] =  'v05_ReportData'                    /*** >>>       ... view names                                                         ***/
----UNION SELECT [VAR] =  'v06_NDLongNoAggreg'                /*** >>>       ... view names                                                         ***/
----/**************************************************************************************************************************************************/
----OPEN             MyCursor                                 /*** >>>    open cursor by its name                                                   ***/
----/*------------------------------------------------------------------------------------------------------------------------------------------------*/
----FETCH NEXT FROM  MyCursor                                 /***        retrieve the next row from cursor                                         ***/
----           INTO  @viewname                                /***        store it into the corresponding variable(s)                               ***/
----          WHILE  @@FETCH_STATUS = 0                       /***        while the status of the last retreival has been successful                ***/
----/*------------------------------------------------------------------------------------------------------------------------------------------------*/
----BEGIN                                                     /*** >>     BEGIN the procedures using values of each row of the cursor               ***/
----/*------------------------------------------------------------------------------------------------------------------------------------------------*/
----SET     @CODEmain2 =                                      /*** >      the code to be stored as string (for each row of the cursor) begins here: ***/
----N'CREATE VIEW [' + @viewname + '] AS SELECT [a] = ''a'' ' /*               set the view to be blanked to "a"                                      */
----                                                          /*** <      the code to be stored as string ends here                                 ***/
----PRINT  (@CODEmain2)                                       /***        display the currently stored code (to be executed)                        ***/
----EXEC   (@CODEmain2)                                       /***        execute the code that has been stored as text                             ***/
----/*------------------------------------------------------------------------------------------------------------------------------------------------*/
----                                                          /*** <<     ENDING of the procedures using values of each row of the cursor           ***/
----/*------------------------------------------------------------------------------------------------------------------------------------------------*/
----FETCH NEXT FROM  MyCursor                                 /***        retrieve the next row from cursor                                         ***/
----           INTO  @viewname                                /***        store it into the corresponding variable(s)                               ***/
----           END                                            /***        and end when last row has been retreived                                  ***/
----/*------------------------------------------------------------------------------------------------------------------------------------------------*/
----   CLOSE         MyCursor                                 /*** <<<    close cursor by its name                                                  ***/
----DEALLOCATE       MyCursor                                 /*** <<<<   remove reference and relase from memory by cursor name                    ***/
----/*********************************************************     <<<<<  cursor                                                                    ***/
----/**************************************************************************************************************************************************/
----GO

----SELECT [ct]
---- =                                             /*** >>>    select concatenated text                                                  ***/
----              'DROP ' +  REPLACE([TABLE_TYPE], 'BASE ', '')        /***               edited table type (base )"TABLE' or "VIEW"                         ***/
----              + '  [' + [TABLE_NAME] + ']'                /***               table/view names                                                   ***/
----FROM        [INFORMATION_SCHEMA].[TABLES]  
----where
---- [TABLE_NAME]
----like 'vr%'
----or 
---- [TABLE_NAME] like 'V[1-9]_%'


----order by
----[TABLE_TYPE], [TABLE_NAME]





----SELECT [ct] =                                             /*** >>>    select concatenated text                                                  ***/
----               'UNION ALL SELECT [a] = (select count(*) from [' + [TABLE_NAME] + ']),                         [b] = (select count(*) from [forum_ResAnal]..[' + [TABLE_NAME] + ']) '
----FROM        [INFORMATION_SCHEMA].[TABLES]  
----where
---- [TABLE_NAME]
----like 'vr%'
----or 
---- [TABLE_NAME] like 'V[1-9]_%'

---- [forum].[dbo].[Pew_Indexes]



----order by
----[TABLE_TYPE], [TABLE_NAME]


----TABLE  [vr___0______NationLocalityTOOL]
----TABLE  [vr___0______QuestiReligionTOOL]
----TABLE  [vr___01_cDB_Long__NoAggregated]
----TABLE  [vr___02_cDB_Wide__by_Ctry&Year]
----TABLE  [vr___03_cDB_W&Xtra_byCtry&Year]
----TABLE  [vr___asked20160113]
----TABLE  [vr_00_GRSHR_Q&A]
----TABLE  [vr_00_GRSHR_QLabels]
----TABLE  [vr_04w_R&H_Index_by_CtryRegion&Yr]
----TABLE  [vr_05w_SemiWide_by_Ctry&Year]
----TABLE  [vr_06w_LongData_ALL]
----TABLE  [vr_06w_LongData_ALL_bkup]
----TABLE  [vr_07w_weights]
----TABLE  [vr_08__QAttributes]
----TABLE  [vrd_w_01_proGRSHRadm_01]
----TABLE  [vrp__01_cDB_SelDataBYCtry&Year]
----TABLE  [vrp__02_cDB_Label_of_Variables]
----TABLE  [vrx_w_01_Basic_TopLinesAll_00]
----TABLE  [vrx_w_02_proTopLines_00]
----TABLE  [vrx_w_03_Basic_TopLines_by_Region_00]
----TABLE  [vrx_w_04_Vars_by_Ctry_source_00]
----TABLE  [vrx_w_05_proRRIdxSbyR_00]
----TABLE  [vrx_w_06_proRRIdxMedians_00]
----VIEW  [vr_01_DB_Long_NoAggregated]
----VIEW  [vr_02_W_by_Ctry&Year]
----VIEW  [vr_03_W&Extras_by_Ctry&Year]
----VIEW  [vr_LongCodedData_in_DB]

----VIEW  [V1_DB_Long]
----VIEW  [V2_W_by_Ctry&Year]
----VIEW  [V3_W&Extras_by_Ctry&Year]
----VIEW  [V4_L_by_CYV]
----VIEW  [V5_LRestr_by_CYV]
----VIEW  [V6_Basic&Index]
----VIEW  [V7_LRestr_by_CV]
----VIEW  [V7_LRestr_by_VarVal]
----VIEW  [V8_AggIdx_by_VarVal]
----VIEW  [V9_AggIdx_by_Yr]




------ WHERE      [TABLE_NAME] LIKE 'vr%'                       /***                                                                                  ***/
------    OR      [TABLE_NAME] LIKE 'V[1-9]_%'                  /***                                                                                  ***/
------)                                          tabs_and_views /***                                                                                  ***/
------ORDER BY [ct]                                             /*** <<<                                                                              ***/
------/**************************************************************************************************************************************************/















------[dbo].[Pew_Indexes]
------[dbo].[Pew_Nation_Religion_Value]
------[dbo].[Pew_Question_Displayable]
------[[dbo].[v__AllCodedData]dbo].[Restrictions_byCtry]
------[dbo].[v_Current_Survey_Questions]
------[dbo].[v_Current_Survey_Questions]
------[dbo].[v_Data_for_WRD_Religion_Comparison]
------[dbo].[v_GRI_20_01_all]
------[dbo].[V_Pew_LongIndex]
------[dbo].[v_Religion_Group_for_Surveys]
------[dbo].[vi_CutPoints]
------[dbo].[vi_ForMoreInformationLinks_by_Region_or_Ctry]
------[dbo].[vi_ForMoreInformationLinks_by_Religion]
------[dbo].[vi_Locations_by_Question]
------[dbo].[vi_QuestionMetadata_Svy&Restr]
------[dbo].[vi_Reportable_DataSource_Joins]
------[dbo].[vi_ReportLinks_by_Region_or_Ctry]
------[dbo].[vi_ReportLinks_by_Religion]
------[dbo].[vi_Restrictions_byCtryYr]
------[dbo].[vi_Restrictions_Ctry&Q&Yr_Displayable]
------[dbo].[vi_Restrictions_Index_by_CtryRegion&Yr]
------[dbo].[vi_Restrictions_Q&Yr_Displayable]
------[dbo].[vi_Restrictions_Tables_by_region&world]
------[dbo].[vi_Sources_by_Tabs&Charts]
------[dbo].[vi_Thresholds]
------[dbo].[vi_Topic&Question_Displayable]
------[dbo].[vi_Topic&Question_link_RelatedPewResearchReports]


















----    SELECT 
----         [ChildN] AS [through],
----         [ChildID]
----		    AS [through_ID],
----        [ParentFullN]  AS [ancestors],
----        Tree = '<-' + REPLICATE('-',(lvl * 4)) + ']  ' + LEFT('               ',(16-(lvl * 4))) + [ParentFullN] --, 
------        sort = '|x' + REPLICATE('x',(lvl * 4)) 
----    FROM cte
----order by
----        '|x' + REPLICATE('x',(lvl * 4)) 


------    ) vf
------   ORDER
------	  BY
------        Tree 


------select * from SO