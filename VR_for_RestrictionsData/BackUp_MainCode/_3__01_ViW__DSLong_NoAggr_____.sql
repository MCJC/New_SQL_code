/***************************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==>  script 3.001    ---------------------------------------------------------------------------------------- '
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the VIEW  [GRSHRcode].[dbo].[vr___01_wDB_Long__NoAggregated]                                    <<<<<     ***/
/***             This table only includes numeric values aggregated by country/religion & year (does not include descriptive wordings).                      ***/
/***                                                                                                                                                         ***/
/***                                                      > > >     lookup tables work faster     < < <                                                      ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [GRSHRcode]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
ALTER VIEW     [vr___01_wDB_Long__NoAggregated]
AS

SELECT
       [entity]                     =  [CRL]
      ,[QA_fk]                      =   0
      ,[link_fk]                    =  [lnk]
      ,[Nation_fk]                  =  [Nfk]
      ,[Locality_fk]                =  [Lfk]
      ,[Religion_fk]                =  [Rfk]
      ,[Region5]                    =  [R_5]
      ,[Region6]                    =  [R_6]
      ,[Ctry_EditorialName]         =  [CEN]
      ,[Locality]                   =  [loc]
      ,[Religion]                   =  [rel]
      ,[Question_Year]              =  [qr_Question_Year]
      ,[QA_std]                     =  [QAs]
      ,[QW_std]                     =  [qs_Question_short_wording_std]
      ,[Answer_value]               =  [AVn]
      ,[Answer_value_Std]           =  [AVs]
      ,[Answer_value_NoStd]         =  [AVn]
      ,[answer_wording]             =  [AWn]
      ,[answer_wording_std]         =  [AWs]
      ,[Data_source_name]           =  [dsn]
      ,[Question_Std_fk]            =  [QSk]
      ,[Question_fk]                =  [QRk]
      ,[Answer_Std_fk]              =  [ASk]
      ,[Answer_fk]                  =  [ARp]
      ,[AnswerSet_number]           =  [qs_AnswerSet_num]
      ,[Question_wording_std]       =  [qs_Question_wording_std]
      ,[Question_wording]           =  [qr_Question_wording]
      ,[Question_abbreviation]      =  [qr_Question_abbreviation]
      ,[NA_by_set_of_Answers]       =  [as_NA_by_set_of_Answers]
      ,[Full_set_of_Answers]        =  [as_Full_set_of_Answers]
      ,[Display_by_StdQ]            =  [qs_Display]
      ,[Display_by_NoSQ]            =  [qr_Display]
      ,[Display_by_Ans]             =  [dba]
      ,[Editorially_Checked]        =  [qs_Editorially_Checked]
      ,[Notes]                      =  [qr_Notes]
  FROM                  [v07_CodedNoAggregated]

UNION ALL

SELECT
       *
  FROM [forum_ResAnal]..[vr___01_cDB_Long__NoAggregated]


