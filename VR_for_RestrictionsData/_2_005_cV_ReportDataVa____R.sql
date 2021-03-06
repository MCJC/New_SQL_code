/**************************************************************************************************************************************************/
/***                                                                                                                                            ***/
/***     >>>>>   This is the script used to create the view [GRSHRYYYY].[dbo].[v05_ReportData]                                        <<<<<     ***/
/***             (values and descriptions for current & former coding years - in long format by country & variable)                             ***/
/***                                                                                                                                            ***/
/**************************************************************************************************************************************************/
/*                                                                                                                                                */
/*  REFERENCE to 2015 appears JUST ONCE in the script                                                                                             */
/*                                                                                                                                                */
/**************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==> creating view [v05_ReportData]                                                           --- '
/**************************************************************************************************************************************************/
USE              [GRSHRcode]
GO
/**************************************************************************************************************************************************/
/*********************************************************     >>>>>> these are the variables to be used                                        ***/
/**************************************************************************************************************************************************/
declare @CURR nvarchar(4)                                 /***        declare variable for storing current year (as text)                       ***/
set     @CURR=(SELECT MAX([Question_Year]) FROM [GRSH_C]) /***        set text value to current year from last-2-yr-datam table                  ***/
declare @PAST nvarchar(4)                                 /***        declare variable for storing former year (as text)                        ***/
set     @PAST=(SELECT MIN([Question_Year]) FROM [GRSH_C]) /***        set text value to current year from last-2-yr-datam table                  ***/




declare @LSTC nvarchar(MAX)                                 /***        declare variable for storing current year (as text)                ***/
set     @LSTC=
(select
STUFF( (                                              /*** >>     stuff function & parenthesis for query XML cell to be stuffed             ***/
          SELECT                                          /*** >      Begin selection (into text, in a cell, comma delimited list)          ***/
                    ', ' + [QAS]                      /***        comma delimiter concatenated to field QA (as varname)            ***/
            FROM      [AT_Qs]                              /***        from table including var names & classifications as rows             ***/


           WHERE (    [Question_fk] IS NOT NULL            /***        exnclude Q with coded, count & perxi answers                            ***/
                  AND  [QAS]        NOT LIKE 'SHI_01_x'   /***        and include %_xQ with num answers to complete previous Q  */
                  AND  [QAS]        NOT LIKE 'SHI_01_summary_b'      /*       ***/
                  AND [QClass]      NOT IN  ('COUNT')        /***        exclude descriptions                                              ***/
                  AND [QClass]      NOT IN  ('DESCR')  )      /***        exclude descriptions                                              ***/
              OR      [QAS]             LIKE 'SHI_0[4,5]_d_x_[1,2]'   /***        and include Q with num answers to complete previous Q        ***/
             FOR      XML PATH('')                             /*** <      End of selection, nesting all cells into an XML string cell         ***/
                                                               ),1, 1,'') ) /*** <<     stuff from position 1, change 1st comma into ''        ***/



declare @LSTN nvarchar(MAX)                                 /***        declare variable for storing current year (as text)                ***/
set     @LSTN=
(select
STUFF( (                                              /*** >>     stuff function & parenthesis for query XML cell to be stuffed             ***/
          SELECT                                          /*** >      Begin selection (into text, in a cell, comma delimited list)          ***/
                    ', ' + [QAS]                      /***        comma delimiter concatenated to field QA (as varname)            ***/
            FROM      [AT_Qs]                              /***        from table including var names & classifications as rows             ***/
           WHERE      [QClass]          IN  ('COUNT')        /***        exclude descriptions                                              ***/
             FOR      XML PATH('')                             /*** <      End of selection, nesting all cells into an XML string cell         ***/
                                                               ),1, 1,'') ) /*** <<     stuff from position 1, change 1st comma into ''        ***/



declare @LSTD nvarchar(MAX)                                 /***        declare variable for storing current year (as text)                ***/
set     @LSTD=
(select
STUFF( (                                              /*** >>     stuff function & parenthesis for query XML cell to be stuffed             ***/
          SELECT                                          /*** >      Begin selection (into text, in a cell, comma delimited list)          ***/
                    ', ' + [QAS]                      /***        comma delimiter concatenated to field QA (as varname)            ***/
            FROM      [AT_Qs]                              /***        from table including var names & classifications as rows             ***/
           WHERE (    [Question_fk] IS NOT NULL            /***  excludes GRI_01_yBe_DES, GRI_02_yBe_DES & SHI_04_filter_DES          ***/
                  AND [QClass]          IN ('DESCR')  )      /***        exclude descriptions                                              ***/
             FOR      XML PATH('')                             /*** <      End of selection, nesting all cells into an XML string cell         ***/
                                                               ),1, 1,'') ) /*** <<     stuff from position 1, change 1st comma into ''        ***/




/**************************************************************************************************************************************************/
declare @CODEmain nvarchar(max)                           /***        declare variable for storing the main code to be executed                 ***/
set     @CODEmain =                                       /***        start storing text as part of the main code to be executed                ***/
/**************************************************************************************************************************************************/
/*********************************************************     <<<<<< these have been the variables to be used                                  ***/
/**************************************************************************************************************************************************/
/*********************************************************     >>>>>> this is the code to be executed                                           ***/
/**************************************************************************************************************************************************/
/*********************************************************     >>>>>  this is part 1 of the code: main select statement                         ***/
/**************************************************************************************************************************************************/
N'
ALTER VIEW     [v05_ReportData]
AS

SELECT 
        E.[Nation_fk]
      , E.[Ctry_EditorialName]
      , E.[Variable]
      , E.[Change]
      , E.[Value' + @CURR + ']
      , E.[Value' + @PAST + ']
      , E.[DecodedValue_' + @CURR + ']
      , E.[DecodedValue_' + @PAST + ']
      , D.[Descr_' + @CURR + '] 
      , D.[Descr_' + @PAST + '] 

FROM(
     SELECT 
            [Nation_fk]
           ,[Ctry_EditorialName]
           ,[Variable]
           ,[Change]              =   [Value' + @CURR + ']
                                    - [Value' + @PAST + ']
           ,[Value' + @CURR + ']
           ,[Value' + @PAST + ']
           ,[DecodedValue_' + @CURR + '] = [' + @CURR + ']
           ,[DecodedValue_' + @PAST + '] = [' + @PAST + ']
       FROM(
            SELECT
                    *
                  ,[Value' + @CURR + '] = CAST(LEFT([' + @CURR + '],4) AS NUMERIC(38,2)) 
                  ,[Value' + @PAST + '] = CAST(LEFT([' + @PAST + '],4) AS NUMERIC(38,2)) 
              FROM(
                   SELECT
                          [Nation_fk]
                         ,[Ctry_EditorialName]
                         ,[Question_Year]
                         ,[Variable]
                         ,[Value]
                    FROM(
                          SELECT * FROM [v02_AllCodedValues]
                                                                                                                  ) AS [YrVals]
                 UNPIVOT(      [Value]
                          FOR  [Variable]
                           IN( ' + @LSTC + ' )
                                                                                                                  ) AS [LongValsC]
                                                                                                                  ) AS [nnahys__C]
             PIVOT( MAX( [Value] )
                    FOR  [Question_Year] 
                     IN( [' + @PAST + '], [' + @CURR + '] )
                                                                                                                  ) AS [ValsYearC]
                                                                                                                  ) AS [ReptDataC]
UNION ALL
     SELECT 
            [Nation_fk]
           ,[Ctry_EditorialName]
           ,[Variable]
           ,[Change]              =   [Value' + @CURR + ']
                                    - [Value' + @PAST + ']
           ,[Value' + @CURR + ']
           ,[Value' + @PAST + ']
           ,[DecodedValue_'    + @CURR + '] =
            CASE WHEN      ['  + @CURR + '] > 0
                 THEN RIGHT((''        ''
                    +  CAST([' + @CURR + '] AS VARCHAR(8))),8)  +  ''  - 1+ cases or events were found''
                 WHEN       [' + @CURR + '] = 0
                 THEN RIGHT((''        ''
                    +  CAST([' + @CURR + '] AS VARCHAR(8))),8)  +  ''  - No cases or events were found''
            END
           ,[DecodedValue_'    + @PAST + '] =
            CASE WHEN       [' + @PAST + '] > 0
                 THEN RIGHT((''        ''
                    +  CAST([' + @PAST + '] AS VARCHAR(8))),8)  +  ''  - 1+ cases or events were found''
                 WHEN       [' + @PAST + '] = 0
                 THEN RIGHT((''        ''
                    +  CAST([' + @PAST + '] AS VARCHAR(8))),8)  +  ''  - No cases or events were found''
            END
       FROM(
            SELECT
                    *
                  ,[Value' + @CURR + '] = CAST(LEFT([' + @CURR + '],8) AS NUMERIC(38,2)) 
                  ,[Value' + @PAST + '] = CAST(LEFT([' + @PAST + '],8) AS NUMERIC(38,2)) 
              FROM(
                   SELECT
                          [Nation_fk]
                         ,[Ctry_EditorialName]
                         ,[Question_Year]
                         ,[Variable]
                         ,[Value]
                    FROM(
                          SELECT * FROM [v02_AllCodedValues]
                                                                                                                  ) AS [YrVals]
                 UNPIVOT(      [Value]
                          FOR  [Variable]
                           IN( ' + @LSTN + ' )
                                                                                                                  ) AS [LongValsC]
                                                                                                                  ) AS [nnahys__C]
             PIVOT( MAX( [Value] )
                    FOR  [Question_Year] 
                     IN( [' + @PAST + '], [' + @CURR + '] )
                                                                                                                  ) AS [ValsYearC]
                                                                                                                  ) AS [ReptDataC]



                                                                                                                  ) AS [E]


LEFT JOIN


(
         SELECT
          [Nation_fk]
        , [Variable]
        , [Descr_' + @CURR + '] = [' + @CURR + '] 
        , [Descr_' + @PAST + '] = [' + @PAST + '] 


from(

  SELECT
          [Nation_fk]
         ,[Ctry_EditorialName]
         ,[Question_Year]
         ,[Variable]            = REPLACE ([Variable], ''_DES'' , '''' ) 
         ,[Value]
     FROM
         ( SELECT * FROM [v02_AllCodedValues]  )  [YrVals]
          unpivot (      [Value]
                    for  [Variable]
                     in ( ' + @LSTD + ' )                                                          ) AS LongVals
) nnahys

pivot
(
  MAX(Value)
  for [Question_Year] in ([' + @PAST + '], [' + @CURR + '])
) piv
) D


ON 
        E.[Nation_fk]
     =  D.[Nation_fk]
 AND
        E.[Variable]
     =  D.[Variable]






/*********************************************************     statement to add variables coded in Excel (summer 2016)                          ***/
/**************************************************************************************************************************************************/

union all 
select *
  from [GRSHRcode].[dbo].[v05_ReportData_XLSX]


/**************************************************************************************************************************************************/
/*********************************************************     statement to add variables coded in Excel (summer 2016)                          ***/






'

/**************************************************************************************************************************************************/
/*********************************************************     >>>>>> statements to display/execute code stored in the variable @CODEmain       ***/
/**************************************************************************************************************************************************/
--	EXEC dbo.LongPrint @CODEmain                          /***        display the currently stored code (to be executed)                        ***/
	EXEC              (@CODEmain)                         /***        execute the code that has been stored as text                             ***/
/**************************************************************************************************************************************************/
/*********************************************************     <<<<<< statements to display/execute code stored in the variable @CODEmain       ***/
/**************************************************************************************************************************************************/
GO

----select * FROM [GRSHRcode].[dbo].[v05_ReportData]


/*
add excel data

select *
 into [GRSHRcode].[dbo].[v05_ReportData_XLSX]
from
(
 SELECT 
       [Nation_fk]
      ,[Ctry_EditorialName]
      ,[Variable]                  = 'SHI_11_a_01'
      ,[Change]                    = 0.00
      ,[Value2015]                 = CASE WHEN [Nation_fk] IN  (13,117,125,127,204)
                                          THEN 1.00
                                          ELSE 0.00
                                      END
      ,[Value2014]                 = NULL
      ,[DecodedValue_2015]         = CASE WHEN [Nation_fk] IN  (13,117,125,127,204)
                                          THEN '1.00   - Yes'
                                          ELSE '0.00   - No'
                                      END
      ,[DecodedValue_2014]         = ''
      ,[Descr_2015]                = ''
      ,[Descr_2014]                = ''
  FROM [GRSHRcode].[dbo].[v05_ReportData]
 WHERE [Variable] = 'SHI_11_a'
--AND [Ctry_EditorialName] IN (
--'AUSTRIA',
--'Liechtenstein',
--'Maldives',
--'Malta',
--'Tajikistan')
UNION ALL
 SELECT 
       [Nation_fk]
      ,[Ctry_EditorialName]
      ,[Variable]                  = 'SHI_11_b_01'
      ,[Change]                    = 0.00
      ,[Value2015]                 = CASE WHEN [Nation_fk] IN  (100)
                                          THEN 1.00
                                          ELSE 0.00
                                      END
      ,[Value2014]                 = NULL
      ,[DecodedValue_2015]         = CASE WHEN [Nation_fk] IN  (100)
                                          THEN '1.00   - Yes'
                                          ELSE '0.00   - No'
                                      END
      ,[DecodedValue_2014]         = ''
      ,[Descr_2015]                = ''
      ,[Descr_2014]                = ''
  FROM [GRSHRcode].[dbo].[v05_ReportData]
 WHERE [Variable] = 'SHI_11_b'
--AND [Ctry_EditorialName] IN ('Israel')
) mydata



[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[forum].[].[Pew_Answer_NOStd]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[forum].[].[Pew_Answer_Std]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[forum].[].[Pew_Data_Source]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[forum].[].[Pew_Locality_Answer]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[forum].[].[Pew_Nation_Answer]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[forum].[].[Pew_Nation_Religion_Answer]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[forum].[].[Pew_Question_NoStd]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[forum].[].[Pew_Question_Std]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[GRSHRcode].[dbo].[All_Questions]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[GRSHRcode].[dbo].[Countries]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[GRSHRcode].[dbo].[v05_ReportData]
[GRSHRcode].[dbo].[v07_CodedNoAggregated]	[GRSHRcode].[dbo].[v06_CompletedCtry]

*/



  /*   Answer_Wording_std
No cases or events were found
1+ cases or events were found  */

/**************************************************************************************************************************************************/
/*********************************************************     <<<<<  this has been part 1 of the code: main select statement                   ***/
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
/*********************************************************     >>>>>  this is part 2 of the code: select data of last year & added vars         ***/
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
/*********************************************************     <<<<<  this has been part 2 of the code: select data of last year & added vars   ***/
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
/*********************************************************     >>>>>  this is part 3 of the code: select data of current year                   ***/
/**************************************************************************************************************************************************/
/*********************************************************     >>>>   this is part 3.1.1 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     <<<<   this is part 3.1.1 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     >>>>   this is part 3.1.2 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     <<<<   this is part 3.1.2 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     >>>>   this is part 3.1.3 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     <<<<   this is part 3.1.3 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     >>>>   this is part 3.2.1 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     <<<<   this is part 3.2.1 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     >>>>   this is part 3.2.2 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     <<<<   this is part 3.2.2 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     >>>>   this is part 3.2.3 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     <<<<   this is part 3.2.3 of the code                                            ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     >>>>   this is part 3.3 of the code                                              ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*********************************************************     <<<<   this is part 3.3 of the code                                              ***/
/**************************************************************************************************************************************************/
/*********************************************************     <<<<<  this has been part 3 of the code: select data of current year             ***/
/**************************************************************************************************************************************************/
/*********************************************************     <<<<<< this has been the code to be executed                                     ***/
/**************************************************************************************************************************************************/
