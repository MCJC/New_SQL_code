USE [XLSX]
GO


CREATE TABLE
    [dbo].[CENSUS] (
          [PK]                                           int IDENTITY(1,1) NOT NULL,
          [Country code]                                 int NULL,
          [Country]                                      nvarchar(255) NULL,
          [Year]                                         int NULL,
          [Sex]                                          int NULL,
          [Type]                                         nvarchar(255) NULL,
          [Cohort]                                       nvarchar(255) NULL,
          [R_Christians_E1_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Christians_E2_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Christians_E3_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Christians_E4_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Muslims_E1_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Muslims_E2_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Muslims_E3_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Muslims_E4_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Unaffiliated_E1_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Unaffiliated_E2_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Unaffiliated_E3_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Unaffiliated_E4_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Buddhists_E1_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Buddhists_E2_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Buddhists_E3_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Buddhists_E4_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Hindus_E1_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Hindus_E2_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Hindus_E3_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Hindus_E4_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Jews_E1_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Jews_E2_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Jews_E3_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Jews_E4_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Others_E1_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Others_E2_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Others_E3_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Others_E4_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Christians_Eall_K_fromSource]               decimal(36,16) NULL,
          [R_Muslims_Eall_K_fromSource]                  decimal(36,16) NULL,
          [R_Unaffiliated_Eall_K_fromSource]             decimal(36,16) NULL,
          [R_Buddhists_Eall_K_fromSource]                decimal(36,16) NULL,
          [R_Hindus_Eall_K_fromSource]                   decimal(36,16) NULL,
          [R_Jews_Eall_K_fromSource]                     decimal(36,16) NULL,
          [R_Others_Eall_K_fromSource]                   decimal(36,16) NULL,
          [R_all_E1_K_fromSource]                        decimal(36,16) NULL,
          [R_all_E2_K_fromSource]                        decimal(36,16) NULL,
          [R_all_E3_K_fromSource]                        decimal(36,16) NULL,
          [R_all_E4_K_fromSource]                        decimal(36,16) NULL,
          [R_NotStated_E1_K_fromSource]                  decimal(36,16) NULL,
          [R_NotStated_E2_K_fromSource]                  decimal(36,16) NULL,
          [R_NotStated_E3_K_fromSource]                  decimal(36,16) NULL,
          [R_NotStated_E4_K_fromSource]                  decimal(36,16) NULL,
          [R_Christians_ENotStated_K_fromSource]         decimal(36,16) NULL,
          [R_Muslims_ENotStated_K_fromSource]            decimal(36,16) NULL,
          [R_Unaffiliated_ENotStated_K_fromSource]       decimal(36,16) NULL,
          [R_Buddhists_ENotStated_K_fromSource]          decimal(36,16) NULL,
          [R_Hindus_ENotStated_K_fromSource]             decimal(36,16) NULL,
          [R_Jews_ENotStated_K_fromSource]               decimal(36,16) NULL,
          [R_Others_ENotStated_K_fromSource]             decimal(36,16) NULL,
          [R_InclNotStated_E1_K_fromSource]              decimal(36,16) NULL,
          [R_InclNotStated_E2_K_fromSource]              decimal(36,16) NULL,
          [R_InclNotStated_E3_K_fromSource]              decimal(36,16) NULL,
          [R_InclNotStated_E4_K_fromSource]              decimal(36,16) NULL,
          [MYE_Christians]                               decimal(36,16) NULL,
          [MYE_Muslims]                                  decimal(36,16) NULL,
          [MYE_Unaffiliated]                             decimal(36,16) NULL,
          [MYE_Buddhists]                                decimal(36,16) NULL,
          [MYE_Hindus]                                   decimal(36,16) NULL,
          [MYE_Jews]                                     decimal(36,16) NULL,
          [MYE_Others]                                   decimal(36,16) NULL,
          [MYE_Total]                                    decimal(36,16) NULL,
          [ComputationMethod_of_MYE]                     nvarchar(MAX) NULL
)
GO

CREATE TABLE
    [dbo].[SURVEY] (
          [PK]                                           int IDENTITY(1,1) NOT NULL,
          [Country code]                                 int NULL,
          [Country]                                      nvarchar(255) NULL,
          [Year]                                         int NULL,
          [Sex]                                          int NULL,
          [Type]                                         nvarchar(255) NULL,
          [Cohort]                                       nvarchar(255) NULL,
          [R_Christians_E1_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Christians_E2_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Christians_E3_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Christians_E4_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Muslims_E1_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Muslims_E2_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Muslims_E3_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Muslims_E4_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Unaffiliated_E1_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Unaffiliated_E2_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Unaffiliated_E3_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Unaffiliated_E4_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Buddhists_E1_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Buddhists_E2_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Buddhists_E3_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Buddhists_E4_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Hindus_E1_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Hindus_E2_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Hindus_E3_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Hindus_E4_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Jews_E1_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Jews_E2_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Jews_E3_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Jews_E4_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Others_E1_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Others_E2_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Others_E3_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Others_E4_K_EAbyRC]                         decimal(36,16) NULL,
          [Cell counts]                                  decimal(36,16) NULL,
          [R_Christians_E1_K_fromSource]                 decimal(36,16) NULL,
          [R_Christians_E2_K_fromSource]                 decimal(36,16) NULL,
          [R_Christians_E3_K_fromSource]                 decimal(36,16) NULL,
          [R_Christians_E4_K_fromSource]                 decimal(36,16) NULL,
          [R_Muslims_E1_K_fromSource]                    decimal(36,16) NULL,
          [R_Muslims_E2_K_fromSource]                    decimal(36,16) NULL,
          [R_Muslims_E3_K_fromSource]                    decimal(36,16) NULL,
          [R_Muslims_E4_K_fromSource]                    decimal(36,16) NULL,
          [R_Unaffiliated_E1_K_fromSource]               decimal(36,16) NULL,
          [R_Unaffiliated_E2_K_fromSource]               decimal(36,16) NULL,
          [R_Unaffiliated_E3_K_fromSource]               decimal(36,16) NULL,
          [R_Unaffiliated_E4_K_fromSource]               decimal(36,16) NULL,
          [R_Buddhists_E1_K_fromSource]                  decimal(36,16) NULL,
          [R_Buddhists_E2_K_fromSource]                  decimal(36,16) NULL,
          [R_Buddhists_E3_K_fromSource]                  decimal(36,16) NULL,
          [R_Buddhists_E4_K_fromSource]                  decimal(36,16) NULL,
          [R_Hindus_E1_K_fromSource]                     decimal(36,16) NULL,
          [R_Hindus_E2_K_fromSource]                     decimal(36,16) NULL,
          [R_Hindus_E3_K_fromSource]                     decimal(36,16) NULL,
          [R_Hindus_E4_K_fromSource]                     decimal(36,16) NULL,
          [R_Jews_E1_K_fromSource]                       decimal(36,16) NULL,
          [R_Jews_E2_K_fromSource]                       decimal(36,16) NULL,
          [R_Jews_E3_K_fromSource]                       decimal(36,16) NULL,
          [R_Jews_E4_K_fromSource]                       decimal(36,16) NULL,
          [R_Others_E1_K_fromSource]                     decimal(36,16) NULL,
          [R_Others_E2_K_fromSource]                     decimal(36,16) NULL,
          [R_Others_E3_K_fromSource]                     decimal(36,16) NULL,
          [R_Others_E4_K_fromSource]                     decimal(36,16) NULL,
          [R_Christians_Eall_K_fromSourcePewIIASA2010]   decimal(36,16) NULL,
          [R_Muslims_Eall_K_fromSourcePewIIASA2010]      decimal(36,16) NULL,
          [R_Unaffiliated_Eall_K_fromSourcePewIIASA2010] decimal(36,16) NULL,
          [R_Buddhists_Eall_K_fromSourcePewIIASA2010]    decimal(36,16) NULL,
          [R_Hindus_Eall_K_fromSourcePewIIASA2010]       decimal(36,16) NULL,
          [R_Jews_Eall_K_fromSourcePewIIASA2010]         decimal(36,16) NULL,
          [R_Others_Eall_K_fromSourcePewIIASA2010]       decimal(36,16) NULL,
          [R_all_E1_K_fromSourceWiC2010]                 decimal(36,16) NULL,
          [R_all_E2_K_fromSourceWiC2010]                 decimal(36,16) NULL,
          [R_all_E3_K_fromSourceWiC2010]                 decimal(36,16) NULL,
          [R_all_E4_K_fromSourceWiC2010]                 decimal(36,16) NULL,
          [IterativeProportionalFittingApplied]          int NULL,
          [MainSource]                                   nvarchar(MAX) NULL,
          [AdditionalNotes]                              nvarchar(MAX) NULL,
          [MYE_Christians]                               decimal(36,16) NULL,
          [MYE_Muslims]                                  decimal(36,16) NULL,
          [MYE_Unaffiliated]                             decimal(36,16) NULL,
          [MYE_Buddhists]                                decimal(36,16) NULL,
          [MYE_Hindus]                                   decimal(36,16) NULL,
          [MYE_Jews]                                     decimal(36,16) NULL,
          [MYE_Others]                                   decimal(36,16) NULL,
          [MYE_Total]                                    decimal(36,16) NULL,
          [ComputationMethod_of_MYE]                     nvarchar(MAX) NULL,
)
GO

CREATE TABLE
    [dbo].[PCTRULE] (
          [PK]                                           int IDENTITY(1,1) NOT NULL,
          [Country code]                                 int NULL,
          [Country]                                      nvarchar(255) NULL,
          [Year]                                         int NULL,
          [Sex]                                          int NULL,
          [Type]                                         nvarchar(255) NULL,
          [Cohort]                                       nvarchar(255) NULL,
          [R_Christians_E1_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Christians_E2_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Christians_E3_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Christians_E4_K_EAbyRC]                     decimal(36,16) NULL,
          [R_Muslims_E1_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Muslims_E2_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Muslims_E3_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Muslims_E4_K_EAbyRC]                        decimal(36,16) NULL,
          [R_Unaffiliated_E1_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Unaffiliated_E2_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Unaffiliated_E3_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Unaffiliated_E4_K_EAbyRC]                   decimal(36,16) NULL,
          [R_Buddhists_E1_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Buddhists_E2_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Buddhists_E3_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Buddhists_E4_K_EAbyRC]                      decimal(36,16) NULL,
          [R_Hindus_E1_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Hindus_E2_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Hindus_E3_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Hindus_E4_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Jews_E1_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Jews_E2_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Jews_E3_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Jews_E4_K_EAbyRC]                           decimal(36,16) NULL,
          [R_Others_E1_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Others_E2_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Others_E3_K_EAbyRC]                         decimal(36,16) NULL,
          [R_Others_E4_K_EAbyRC]                         decimal(36,16) NULL,
          [MYE_Christians]                               decimal(36,16) NULL,
          [MYE_Muslims]                                  decimal(36,16) NULL,
          [MYE_Unaffiliated]                             decimal(36,16) NULL,
          [MYE_Buddhists]                                decimal(36,16) NULL,
          [MYE_Hindus]                                   decimal(36,16) NULL,
          [MYE_Jews]                                     decimal(36,16) NULL,
          [MYE_Others]                                   decimal(36,16) NULL,
          [MYE_Total]                                    decimal(36,16) NULL,
)
GO


/******************************************************************************************************/
/*                                                                                                    */
/*  Add sheet - label as table (dbTabName)                                                            */
/*                                                                                                    */
/*  Use "DataConnectionWizard" to pull data from DB (truncated) table                                 */
/*      - this establishes conection to have data uploaded by updating sheet                          */
/*                                                                                                    */
/*  Add row in data table and paste field names to check consistency                                  */
/*      - do not paste pk field name                                                                  */
/*                                                                                                    */
/*  Select data range in data table and check if there are merged cells                               */
/*      - in such a case, unmerge cells and revise/update contents to fit cell by cell                */
/*                                                                                                    */
/*  Copy selected data range from data table to truncated table                                       */
/*                                                                                                    */
/*  Select range of numeric values (counts & percentages)                                             */
/*  Replace all coded non-numeric values based on the following rules:                                */
/*                                                                                                    */
/*      -> it is necessary to "matcn entire cell contents" (option should be selected)                */
/*                                                                                                    */
/*      -    0        should be replaced by       -9          * it means missing data                 */
/*      -    X        should be replaced by     -999          * it data not to be displayed           */
/*      -    NA       should be replaced by     -888          * it means dfata not available          */
/*      -    unknown  should be replaced by    -8888          * unknown non-numric code               */
/*                                                                                                    */
/*  Add sequencial PK and save table to the database                                                  */
/*                                                                                                    */
/******************************************************************************************************/

SELECT *
  FROM [XLSX].[dbo].[CENSUS]

SELECT *
  FROM [XLSX].[dbo].[SURVEY]

SELECT *
  FROM [XLSX].[dbo].[PCTRULE]








select * 
into test_table
 from (


SELECT                                                           /* statement                         */
		[temp_pk]                               =  ROW_NUMBER()
                                                         OVER(
												     ORDER BY   [Country code]                                              ,
                                                                CASE WHEN [Subset_of_Data] like 'Educational%'   THEN 1
                                                                     WHEN [Subset_of_Data] like '%PewIIASA2010'  THEN 3
																     WHEN [Subset_of_Data] like '%WiC2010'       THEN 4
																                                                 ELSE 2 END ,
																[ReligiousCommunity]                                        ,
													            [Sex]                                                       ,
																[Cohort]                                                    ,
																[EducationalAttainment]                                           )
      , [Country code]
	  , [Country]
      , [ReligiousCommunity]
	  , [Sex]
	  , [Year]
	  , [Cohort]
	  , [EducationalAttainment]
      , [type_of_data]
	  , [Subset_of_Data]
	  , [Count]
	  , [Share]
	  , [Pew share]
	  , [Cell counts]
	  , [IterativeProportionalFittingApplied]
	  , [MainSource]
	  , [AdditionalNotes]



--distinct ([Subset_of_Data]) 
from

(
/******************************************************************************************************/
SELECT                                                           /* statement                         */
		[Country code]
	  , [Country]
	  , [Year]
	  , [Sex]
	  , [Cohort]
      , [ReligiousCommunity]                    =  SUBSTRING(                [longcodename] 
	                                                         ,3
															 ,CHARINDEX('_E',[longcodename])-3)
	  , [EducationalAttainment]                 =  SUBSTRING(                [longcodename]
															 ,CHARINDEX('_E',[longcodename])+1
	                                                         ,2)
      , [type_of_data]                          =  [xlssheet]
	  , [Subset_of_Data]                        =  CASE
	                                               WHEN
												   SUBSTRING(                [longcodename]
															 ,CHARINDEX('_K',[longcodename])+3
	                                                         ,100)                              = 'EAbyRC'
										           THEN 'Educational attainment by religious community'
												      + ' based on '
													  + [xlssheet] 																											
	                                               WHEN
												   SUBSTRING(                [longcodename]
															 ,CHARINDEX('_K',[longcodename])+3
	                                                         ,100)                              = 'fromSource'
										           THEN 'Data from source ('
													  + [xlssheet] 																											
												      + ')'
	                                               WHEN
												   SUBSTRING(                [longcodename]
															 ,CHARINDEX('_K',[longcodename])+3
	                                                         ,100)                              = 'fromSourcePewIIASA2010'
										           THEN 'Data from source (PewIIASA2010)'
	                                               WHEN
												   SUBSTRING(                [longcodename]
															 ,CHARINDEX('_K',[longcodename])+3
	                                                         ,100)                              = 'fromSourceWiC2010'
										           THEN 'Data from source (WiC2010)'
												   END
	  , [Count]
	  , [Share]
	  , [Pew share]
	  , [Cell counts]
	  , [IterativeProportionalFittingApplied]
	  , [MainSource]
	  , [AdditionalNotes]




---select [a] = SUBSTRING('R_Muslim_E2_K_SurveyEAbyRC',3,CHARINDEX('_E','R_Muslim_E2_K_SurveyEAbyRC')-3)



-- select *
  FROM                                                           /* statement                         */
/******************************************************************************************************/
(                                                                /* >> longest shape - set of data    */
/******************************************************************************************************/
/******************************************************************************************************/
SELECT                                                           /* statement                         */
			[xlssheet]       = 'census'                     ,    /* new variable to identify set      */
			[Country code]                                  ,    /* existing variable(s) to keep      */
			[Country]                                       ,
			[Year]                                          ,
			[Sex]                                           ,
			[Type]                                          ,
			[Cohort]                                        ,
			[longcodename]                                  ,
			[longcodevals]                                  ,
            [Cell counts]                           = NULL  ,
            [IterativeProportionalFittingApplied]   = NULL  ,
            [MainSource]                            = ''    ,
            [AdditionalNotes]                       = ''         /* newvar: stores setofvars_1 names  */
/*----------------------------------------------------------------------------------------------------*/
  FROM    [CENSUS]                                               /* statement                         */
/*----------------------------------------------------------------------------------------------------*/
                                                      AS C2      /* alias of table of data to be used */
unpivot (                                                        /* statement                         */
       longcodevals                                              /* newvar: stores setofvars_1 values */
       for                                                       /* statement                         */
       longcodename                                              /* newvar: stores setofvars_1 names  */
       in (                                                      /* statement                         */
/*----------------------------------------------------------------------------------------------------*/
          [R_Christians_E1_K_EAbyRC]                      ,      /* 1st name of the setofvars_1       */
          [R_Christians_E2_K_EAbyRC]                      ,
          [R_Christians_E3_K_EAbyRC]                      ,
          [R_Christians_E4_K_EAbyRC]                      ,
          [R_Muslims_E1_K_EAbyRC]                         ,
          [R_Muslims_E2_K_EAbyRC]                         ,
          [R_Muslims_E3_K_EAbyRC]                         ,
          [R_Muslims_E4_K_EAbyRC]                         ,
          [R_Unaffiliated_E1_K_EAbyRC]                    ,
          [R_Unaffiliated_E2_K_EAbyRC]                    ,
          [R_Unaffiliated_E3_K_EAbyRC]                    ,
          [R_Unaffiliated_E4_K_EAbyRC]                    ,
          [R_Buddhists_E1_K_EAbyRC]                       ,
          [R_Buddhists_E2_K_EAbyRC]                       ,
          [R_Buddhists_E3_K_EAbyRC]                       ,
          [R_Buddhists_E4_K_EAbyRC]                       ,
          [R_Hindus_E1_K_EAbyRC]                          ,
          [R_Hindus_E2_K_EAbyRC]                          ,
          [R_Hindus_E3_K_EAbyRC]                          ,
          [R_Hindus_E4_K_EAbyRC]                          ,
          [R_Jews_E1_K_EAbyRC]                            ,
          [R_Jews_E2_K_EAbyRC]                            ,
          [R_Jews_E3_K_EAbyRC]                            ,
          [R_Jews_E4_K_EAbyRC]                            ,
          [R_Others_E1_K_EAbyRC]                          ,
          [R_Others_E2_K_EAbyRC]                          ,
          [R_Others_E3_K_EAbyRC]                          ,
          [R_Others_E4_K_EAbyRC]                          ,
          [R_Christians_Eall_K_fromSource]                ,
          [R_Muslims_Eall_K_fromSource]                   ,
          [R_Unaffiliated_Eall_K_fromSource]              ,
          [R_Buddhists_Eall_K_fromSource]                 ,
          [R_Hindus_Eall_K_fromSource]                    ,
          [R_Jews_Eall_K_fromSource]                      ,
          [R_Others_Eall_K_fromSource]                    ,
          [R_all_E1_K_fromSource]                         ,
          [R_all_E2_K_fromSource]                         ,
          [R_all_E3_K_fromSource]                         ,
          [R_all_E4_K_fromSource]                         ,
          [R_NotStated_E1_K_fromSource]                   ,
          [R_NotStated_E2_K_fromSource]                   ,
          [R_NotStated_E3_K_fromSource]                   ,
          [R_NotStated_E4_K_fromSource]                   ,
          [R_Christians_ENotStated_K_fromSource]          ,
          [R_Muslims_ENotStated_K_fromSource]             ,
          [R_Unaffiliated_ENotStated_K_fromSource]        ,
          [R_Buddhists_ENotStated_K_fromSource]           ,
          [R_Hindus_ENotStated_K_fromSource]              ,
          [R_Jews_ENotStated_K_fromSource]                ,
          [R_Others_ENotStated_K_fromSource]              ,
          [R_InclNotStated_E1_K_fromSource]               ,
          [R_InclNotStated_E2_K_fromSource]               ,
          [R_InclNotStated_E3_K_fromSource]               ,
          [R_InclNotStated_E4_K_fromSource]                      /* last name of the setofvars_1      */
/*----------------------------------------------------------------------------------------------------*/
          )                                                      /* statement                         */
        )                                                        /* statement                         */
       as UP                                                     /* statement                         */
/******************************************************************************************************/
/******************************************************************************************************/

UNION ALL

/******************************************************************************************************/
/******************************************************************************************************/
SELECT                                                           /* statement                         */
			[xlssheet]       = 'survey'                     ,    /* new variable to identify set      */
			[Country code]                                  ,    /* existing variable(s) to keep      */
			[Country]                                       ,
			[Year]                                          ,
			[Sex]                                           ,
			[Type]                                          ,
			[Cohort]                                        ,
			[longcodename]                                  ,
			[longcodevals]                                  ,
            [Cell counts]                                   ,
            [IterativeProportionalFittingApplied]           ,
            [MainSource]                                    ,
            [AdditionalNotes]                                    /* newvar: stores setofvars_1 names  */
/*----------------------------------------------------------------------------------------------------*/
  FROM    [SURVEY]                                               /* statement                         */
/*----------------------------------------------------------------------------------------------------*/
                                                      AS C2      /* alias of table of data to be used */
unpivot (                                                        /* statement                         */
       longcodevals                                              /* newvar: stores setofvars_1 values */
       for                                                       /* statement                         */
       longcodename                                              /* newvar: stores setofvars_1 names  */
       in (                                                      /* statement                         */
/*----------------------------------------------------------------------------------------------------*/
          [R_Christians_E1_K_EAbyRC]                      ,      /* 1st name of the setofvars_1       */
          [R_Christians_E2_K_EAbyRC]                      ,
          [R_Christians_E3_K_EAbyRC]                      ,
          [R_Christians_E4_K_EAbyRC]                      ,
          [R_Muslims_E1_K_EAbyRC]                         ,
          [R_Muslims_E2_K_EAbyRC]                         ,
          [R_Muslims_E3_K_EAbyRC]                         ,
          [R_Muslims_E4_K_EAbyRC]                         ,
          [R_Unaffiliated_E1_K_EAbyRC]                    ,
          [R_Unaffiliated_E2_K_EAbyRC]                    ,
          [R_Unaffiliated_E3_K_EAbyRC]                    ,
          [R_Unaffiliated_E4_K_EAbyRC]                    ,
          [R_Buddhists_E1_K_EAbyRC]                       ,
          [R_Buddhists_E2_K_EAbyRC]                       ,
          [R_Buddhists_E3_K_EAbyRC]                       ,
          [R_Buddhists_E4_K_EAbyRC]                       ,
          [R_Hindus_E1_K_EAbyRC]                          ,
          [R_Hindus_E2_K_EAbyRC]                          ,
          [R_Hindus_E3_K_EAbyRC]                          ,
          [R_Hindus_E4_K_EAbyRC]                          ,
          [R_Jews_E1_K_EAbyRC]                            ,
          [R_Jews_E2_K_EAbyRC]                            ,
          [R_Jews_E3_K_EAbyRC]                            ,
          [R_Jews_E4_K_EAbyRC]                            ,
          [R_Others_E1_K_EAbyRC]                          ,
          [R_Others_E2_K_EAbyRC]                          ,
          [R_Others_E3_K_EAbyRC]                          ,
          [R_Others_E4_K_EAbyRC]                          ,
          [R_Christians_E1_K_fromSource]                  ,
          [R_Christians_E2_K_fromSource]                  ,
          [R_Christians_E3_K_fromSource]                  ,
          [R_Christians_E4_K_fromSource]                  ,
          [R_Muslims_E1_K_fromSource]                     ,
          [R_Muslims_E2_K_fromSource]                     ,
          [R_Muslims_E3_K_fromSource]                     ,
          [R_Muslims_E4_K_fromSource]                     ,
          [R_Unaffiliated_E1_K_fromSource]                ,
          [R_Unaffiliated_E2_K_fromSource]                ,
          [R_Unaffiliated_E3_K_fromSource]                ,
          [R_Unaffiliated_E4_K_fromSource]                ,
          [R_Buddhists_E1_K_fromSource]                   ,
          [R_Buddhists_E2_K_fromSource]                   ,
          [R_Buddhists_E3_K_fromSource]                   ,
          [R_Buddhists_E4_K_fromSource]                   ,
          [R_Hindus_E1_K_fromSource]                      ,
          [R_Hindus_E2_K_fromSource]                      ,
          [R_Hindus_E3_K_fromSource]                      ,
          [R_Hindus_E4_K_fromSource]                      ,
          [R_Jews_E1_K_fromSource]                        ,
          [R_Jews_E2_K_fromSource]                        ,
          [R_Jews_E3_K_fromSource]                        ,
          [R_Jews_E4_K_fromSource]                        ,
          [R_Others_E1_K_fromSource]                      ,
          [R_Others_E2_K_fromSource]                      ,
          [R_Others_E3_K_fromSource]                      ,
          [R_Others_E4_K_fromSource]                      ,
          [R_Christians_Eall_K_fromSourcePewIIASA2010]    ,
          [R_Muslims_Eall_K_fromSourcePewIIASA2010]       ,
          [R_Unaffiliated_Eall_K_fromSourcePewIIASA2010]  ,
          [R_Buddhists_Eall_K_fromSourcePewIIASA2010]     ,
          [R_Hindus_Eall_K_fromSourcePewIIASA2010]        ,
          [R_Jews_Eall_K_fromSourcePewIIASA2010]          ,
          [R_Others_Eall_K_fromSourcePewIIASA2010]        ,
          [R_all_E1_K_fromSourceWiC2010]                  ,
          [R_all_E2_K_fromSourceWiC2010]                  ,
          [R_all_E3_K_fromSourceWiC2010]                  ,
          [R_all_E4_K_fromSourceWiC2010]                         /* last name of the setofvars_1      */
/*----------------------------------------------------------------------------------------------------*/
          )                                                      /* statement                         */
        )                                                        /* statement                         */
       as UP                                                     /* statement                         */
/******************************************************************************************************/
/******************************************************************************************************/

UNION ALL

/******************************************************************************************************/
/******************************************************************************************************/
SELECT                                                           /* statement                         */
			[xlssheet]       = 'pctrul'                     ,    /* new variable to identify set      */
			[Country code]                                  ,    /* existing variable(s) to keep      */
			[Country]                                       ,
			[Year]                                          ,
			[Sex]                                           ,
			[Type]                                          ,
			[Cohort]                                        ,
			[longcodename]                                  ,
			[longcodevals]                                  ,
            [Cell counts]                           = NULL  ,
            [IterativeProportionalFittingApplied]   = NULL  ,
            [MainSource]                            = ''    ,
            [AdditionalNotes]                       = ''         /* newvar: stores setofvars_1 names  */
/*----------------------------------------------------------------------------------------------------*/
  FROM    [PCTRULE]                                              /* statement                         */
/*----------------------------------------------------------------------------------------------------*/
                                                      AS C2      /* alias of table of data to be used */
unpivot (                                                        /* statement                         */
       longcodevals                                              /* newvar: stores setofvars_1 values */
       for                                                       /* statement                         */
       longcodename                                              /* newvar: stores setofvars_1 names  */
       in (                                                      /* statement                         */
/*----------------------------------------------------------------------------------------------------*/
          [R_Christians_E1_K_EAbyRC]                      ,      /* 1st name of the setofvars_1       */
          [R_Christians_E2_K_EAbyRC]                      ,
          [R_Christians_E3_K_EAbyRC]                      ,
          [R_Christians_E4_K_EAbyRC]                      ,
          [R_Muslims_E1_K_EAbyRC]                         ,
          [R_Muslims_E2_K_EAbyRC]                         ,
          [R_Muslims_E3_K_EAbyRC]                         ,
          [R_Muslims_E4_K_EAbyRC]                         ,
          [R_Unaffiliated_E1_K_EAbyRC]                    ,
          [R_Unaffiliated_E2_K_EAbyRC]                    ,
          [R_Unaffiliated_E3_K_EAbyRC]                    ,
          [R_Unaffiliated_E4_K_EAbyRC]                    ,
          [R_Buddhists_E1_K_EAbyRC]                       ,
          [R_Buddhists_E2_K_EAbyRC]                       ,
          [R_Buddhists_E3_K_EAbyRC]                       ,
          [R_Buddhists_E4_K_EAbyRC]                       ,
          [R_Hindus_E1_K_EAbyRC]                          ,
          [R_Hindus_E2_K_EAbyRC]                          ,
          [R_Hindus_E3_K_EAbyRC]                          ,
          [R_Hindus_E4_K_EAbyRC]                          ,
          [R_Jews_E1_K_EAbyRC]                            ,
          [R_Jews_E2_K_EAbyRC]                            ,
          [R_Jews_E3_K_EAbyRC]                            ,
          [R_Jews_E4_K_EAbyRC]                            ,
          [R_Others_E1_K_EAbyRC]                          ,
          [R_Others_E2_K_EAbyRC]                          ,
          [R_Others_E3_K_EAbyRC]                          ,
          [R_Others_E4_K_EAbyRC]                                 /* last name of the setofvars_1      */
/*----------------------------------------------------------------------------------------------------*/
          )                                                      /* statement                         */
        )                                                        /* statement                         */
       as UP                                                     /* statement                         */
/******************************************************************************************************/
/******************************************************************************************************/
)                                                    LSODS       /* << longest shape - set of data    */
/******************************************************************************************************/
pivot (AVG([longcodevals])                                       /* currvar: storing values           */
       for [Type]                                                /* currvar: storing newvars names    */
	    in (                                                     /* statement                         */
/*----------------------------------------------------------------------------------------------------*/
             [Count]      ,                                      /* 1st name of the set of newvars    */
			 [Share]      ,
			 [Pew share]                                         /* last name of the set of newvars   */
/*----------------------------------------------------------------------------------------------------*/
           )                                                     /* statement                         */
      )                                                          /* statement                         */
       as MidLong                                                /* statement                         */
/******************************************************************************************************/
/******************************************************************************************************/
) lllalal

) testtable

/******************************************************************************************************/
/******************************************************************************************************/





--) tas order by [longcodevals]



--/******************************************************************************************************/
--SELECT                                                           /* statement                         */
--          [Country code]                                  ,      /* existing variable(s) to keep      */
--          [Country]                                       ,
--          [Year]                                          ,
--          [Sex]                                           ,
--          [Type]                                          ,
--          [Cohort]                                        ,
--          [MYE_Christians]                                ,
--          [MYE_Muslims]                                   ,
--          [MYE_Unaffiliated]                              ,
--          [MYE_Buddhists]                                 ,
--          [MYE_Hindus]                                    ,
--          [MYE_Jews]                                      ,
--          [MYE_Others]                                    ,
--          [MYE_Total]                                     ,
--          [ComputationMethod_of_MYE]                      ,

--          [Cell counts]                                  decimal(36,16) NULL,



-- *
--  FROM [XLSX].[dbo].[CENSUS]

