/**************************************************************************************************************************************************/
/***                                                                                                                                            ***/
/***     >>>>>   This is the script used to create the view [GRSHRYYYY].[dbo].[v06_NDLongNoAggreg]                                    <<<<<     ***/
/***             (Data to be appended to [forum_ResAnal]..[vrc_01_DB_Long_NoAggregated] --in the SAME FORMAT)                                   ***/
/***                                                                                                                                            ***/
/**************************************************************************************************************************************************/
/*                                                                                                                                                */
/*  REFERENCE to 2015 appears JUST ONCE in the script                                                                                             */
/*                                                                                                                                                */
/**************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==> creating view [v06_NDLongNoAggreg]                                                       --- '
/**************************************************************************************************************************************************/
USE              [GRSHR2015]
GO
---- NOTES: 
  -- these variables, calculated as persisted during coding period, should be also used in the aggregated data 
  -- currently used from [forum_ResAnal].[dbo].[vr_06w_LongData_ALL] but from final [forum] data once loaded...
  --    [GRI_19_x]
  --    [SHI_04_x]
  --    [SHI_05_x]
  --    [SHI_01_x]
  --    [SHI_01_summary_b]    --- should be rescaled to 1-6 for coding or scaled 1-6 for lookup table?



/**************************************************************************************************************************************************/
/*********************************************************     >>>>>> these are the variables to be used                                        ***/
/**************************************************************************************************************************************************/
declare @NCUR nvarchar(4)                                 /***        declare variable for storing current year (as text)                       ***/
set     @NCUR = (SELECT DISTINCT CAST([Q_Yr] AS NVARCHAR) /***        set value to current year                                                 ***/
                 FROM [v02_AllCodedValues]                /***        from main view used as source                                             ***/
                 WHERE  [Q_Yr] = ( (SELECT MAX([Q_Yr])    /***        filtered using max numeric year value                                     ***/
                        FROM [v02_AllCodedValues]) - 0 )) /***        from the same main view used as source  (as the value is)                 ***/
/**************************************************************************************************************************************************/
declare @CODEmain nvarchar(max)                           /***        declare variable for storing the main code to be executed                 ***/
set     @CODEmain =                                       /***        start storing text as part of the main code to be executed                ***/
/**************************************************************************************************************************************************/
/*********************************************************     <<<<<< these have been the variables to be used                                  ***/
/**************************************************************************************************************************************************/
/*********************************************************     >>>>>> this is the code to be executed                                           ***/
/**************************************************************************************************************************************************/
N'
ALTER VIEW     [v06_NDLongNoAggreg]
AS

SELECT
           entity              = ''CR&P''
      ,    link_fk             = 0
      ,   [VRD].[Nation_fk]
      ,         [Locality_fk]         = NULL
      ,         [Religion_fk]         = NULL
      ,   [COU].[Region5]
      ,   [COU].[Region6]
      ,   [VRD].[Ctry_EditorialName]
      ,         [Locality]            = ''''
      ,         [Religion]            = ''''
      ,         [Question_Year]       = '                            + @NCUR + '
      ,         [QA_std]              = [VRD].[Variable]
      ,         [QW_std]              = [AQU].[Question_wording_std]
      ,         [Answer_value]        = [VRD].[Value_Year_'          + @NCUR + ']
      ,         [answer_wording]      = [VRD].[Descr_Year_'          + @NCUR + ']
      ,         [answer_wording_std]  = [VRD].[Wrdng_Year_'          + @NCUR + ']
      ,         [Question_fk]         = 0
      ,         [Answer_fk]           = 0
      ,         [Notes]               = ''January - December '       + @NCUR + '''

  FROM          [v05_ReportData]                               [VRD]
     ,          [Countries]                                    [COU]
     ,          [All_Questions]                                [AQU]

 WHERE    [VRD].[Nation_fk]
        = [COU].[Nation_fk]
   AND    [VRD].[Variable]
        = [AQU].[Question_abbreviation_std]
'
/**************************************************************************************************************************************************/
/*********************************************************     <<<<<< this has been the code to be executed                                     ***/
/**************************************************************************************************************************************************/

/**************************************************************************************************************************************************/
/*********************************************************     >>>>>> statements to display/execute code stored in the variable @CODEmain       ***/
/**************************************************************************************************************************************************/
--	EXEC dbo.LongPrint @CODEmain                          /***        display the currently stored code (to be executed)                        ***/
	EXEC              (@CODEmain)                         /***        execute the code that has been stored as text                             ***/
/**************************************************************************************************************************************************/
/*********************************************************     <<<<<< statements to display/execute code stored in the variable @CODEmain       ***/
/**************************************************************************************************************************************************/
GO

/**************************************************************************************************************************************************/
/*********************************************************     >>>>>> statements to TEST the VIEW                                               ***/
--	          SELECT * FROM                   [v06_NDLongNoAggreg]
--	UNION ALL SELECT * FROM  [forum_ResAnal]..[vrc_01_DB_Long_NoAggregated]
/*********************************************************     <<<<<< statements to TEST the VIEW                                               ***/
/**************************************************************************************************************************************************/
