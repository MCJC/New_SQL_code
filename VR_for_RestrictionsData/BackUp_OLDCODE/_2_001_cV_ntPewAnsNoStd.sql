/***************************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==>  script 3.001    ---------------------------------------------------------------------------------------- '
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
	/***     >>>>>         This script creates views of data from the 'Global Restriction on Religion Study'                                           <<<<<     ***/
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
declare @CODE__1 nvarchar(max)
declare @CODE__2 nvarchar(max)
declare @CODE_2b nvarchar(max)
declare @CODE_2c nvarchar(max)
declare @CODE__3 nvarchar(max)
declare @ALLCODE nvarchar(max)
/***************************************************************************************************************************************************************/

/***************************************************************************************************************************************************************/
set     @CODE__1 = 
/***************************************************************************************************************************************************************/
N'
ALTER  VIEW                      [dbo].[Pew_Locality]      AS
SELECT * FROM            [forum].[dbo].[Pew_Locality]
'
/***************************************************************************************************************************************************************/

/***************************************************************************************************************************************************************/
set     @CODE__2 = 
/***************************************************************************************************************************************************************/
N'
ALTER  VIEW                      [dbo].[Pew_Nation]        AS
SELECT * FROM            [forum].[dbo].[Pew_Nation]
'
/***************************************************************************************************************************************************************/

dbo.Pew_Religion_Group

dbo.Pew_Locality_Answer
dbo.Pew_Nation_Answer

dbo.Pew_Nation_Religion_Answer

dbo.Pew_Q&A





USE [forum]
GO

/****** Object:  View [dbo].[Pew_Q&A]    Script Date: 10/27/2016 14:56:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*********************************************************************************************************/
CREATE VIEW    [dbo].[Pew_Q&A]
AS
/*********************************************************************************************************/
SELECT
       [QA_pk]                      = ROW_NUMBER()
                                            OVER(
                                        ORDER BY  
                                                [Q_pk]
                                              , [AnswerSet_number]
                                              , [Answer_value_Std]
                                              , [Answer_value_NoStd]
                                              , [Answer_Wording]     )
      ,[Question_Std_fk]
      ,[Question_fk]                = [Question_pk]
      ,[AnswerSet_num]
      ,[AnswerSet_number]
      ,[Answer_Std_fk]
      ,[Answer_fk]                  = [Answer_pk]
      ,[Data_source_fk]
      ,[Pew_Data_Collection]
      ,[Pew_Data_SubCollection]
      ,[Data_source_name]
      ,[Question_abbreviation_std]
      ,[Question_abbreviation]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
      ,[Question_wording]
      ,[Question_Year]
      ,[Notes]
      ,[Answer_value]               = CASE 
                                          WHEN      [Answer_value_Std]          IS NULL
                                                 OR [Question_abbreviation_std] LIKE 'SHI_05_b'  -- not coded for VStd
                                          THEN -1
                                          WHEN      [Question_abbreviation_std] LIKE 'GRI_19_[b-f]%'
                                                 OR [Question_abbreviation_std] LIKE 'SHI_01_[b-f]%'
                                                 OR [Question_abbreviation_std] LIKE 'SHI_04_[b-f]%'
                                                 OR [Question_abbreviation_std] LIKE 'SHI_05_[c-f]%'
                                          THEN [Answer_value_NoStd]
                                          ELSE [Answer_value_Std]
                                       END
----  ,[Answer_value]               = CASE                                    /* 1ST VERSION OF CODE */
----                                      WHEN [Answer_value_Std] IS NOT NULL
----                                      THEN [Answer_value_Std]
----                                      WHEN [Answer_value_Std] IS     NULL
----                                       AND (    [Question_abbreviation_std] LIKE 'GRI_19_[b-f]%'
----                                             OR [Question_abbreviation_std] LIKE 'SHI_01_[b-f]%'
----                                             OR [Question_abbreviation_std] LIKE 'SHI_04_[b-f]%'
----                                             OR [Question_abbreviation_std] LIKE 'SHI_05_[c-f]%'  )
----                                      THEN [Answer_value_NoStd]
----                                      ELSE -1
----                                   END
      ,[Answer_value_Std]
      ,[Answer_value_NoStd]
      ,[Answer_Wording_std]
      ,[Answer_Wording]
      ,[Full_set_of_Answers]
      ,[NA_by_set_of_Answers]
      ,[Display]
      ,[Display_NoStd]
      ,[Editorially_Checked]
  FROM
/*********************************************************************************************************/
       [Pew_Question]                                                                      Q
/*********************************************************************************************************/
  FULL
  OUTER
   JOIN
/*********************************************************************************************************/
(
/*********************************************************************************************************/
SELECT
       [Answer_pk]
      ,[Answer_value_NoStd]
      ,[Answer_Wording]
      ,[Question_fk]
      ,[AnswerSet_number]
      ,[Answer_value_Std]
      ,[Answer_Wording_std]
      ,[Full_set_of_Answers]
      ,[NA_by_set_of_Answers]
      ,[Answer_Std_fk]              = CASE
                                           WHEN [Answer_Std_fk] IS NULL 
                                           THEN [Answer_Std_pk]
                                           ELSE [Answer_Std_fk]
                                       END
/*-------------------------------------------------------------------------------------------------------*/
  FROM
       [Pew_Answer_NoStd]
  FULL
  OUTER
   JOIN
       [Pew_Answer_Std]
/*-------------------------------------------------------------------------------------------------------*/
     ON
            Answer_Std_fk
         =  Answer_Std_pk
/*-------------------------------------------------------------------------------------------------------*/
)                                                                                                        A
/*********************************************************************************************************/
ON
       [Question_fk]
      =[Question_pk]
/*********************************************************************************************************/
  LEFT
   JOIN
/*********************************************************************************************************/
/*-------------------------------------------------------------------------------------------------------*/
       [Pew_Data_Source]                                                                   D
/*********************************************************************************************************/
ON
       [Data_Source_fk]
      =[Data_Source_pk]
/*********************************************************************************************************/

GO








/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/*** checking / executing SQL statement that has been stored as a string variable ******************************************************************************/
--	EXEC dbo.LongPrint @ALLCODE                                     /***        display the currently stored code (to be executed)                           ***/
	EXEC              (@CODE__1)                                    /***        execute the code that has been stored as text                                ***/
	EXEC              (@CODE__2)                                    /***        execute the code that has been stored as text                                ***/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/


set     @ALLCODE = 
					  @CODE__1
					+ @CODE_2a
					+ @CODE_2b
					+ @CODE_2c
					+ @CODE__3
/***************************************************************************************************************************************************************/



/***************************************************************************************************************************************************************/
/*** checking / executing SQL statement that has been stored as a string variable ******************************************************************************/
--	EXEC dbo.LongPrint @ALLCODE                                     /***        display the currently stored code (to be executed)                           ***/
	EXEC              (@ALLCODE)                                    /***        execute the code that has been stored as text                                ***/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/








SELECT distinct

       [entity]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Region5]
      ,[Region6]
      ,[Ctry_EditorialName]
      ,[Locality]
      ,[Religion]
      
  FROM [forum_ResAnal].[dbo].[vr___01_]



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [entity]
      ,[QA_fk]
      ,[link_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Region5]
      ,[Region6]
      ,[Ctry_EditorialName]
      ,[Locality]
      ,[Religion]
      ,[Question_Year]
      ,[QA_std]
      ,[QW_std]
      ,[Answer_value]
      ,[Answer_value_Std]
      ,[Answer_value_NoStd]
      ,[answer_wording]
      ,[answer_wording_std]
      ,[Data_source_name]
      ,[Question_Std_fk]
      ,[Question_fk]
      ,[Answer_Std_fk]
      ,[Answer_fk]
      ,[AnswerSet_number]
      ,[Question_wording_std]
      ,[Question_wording]
      ,[Question_abbreviation]
      ,[NA_by_set_of_Answers]
      ,[Full_set_of_Answers]
      ,[Display_by_StdQ]
      ,[Display_by_NoSQ]
      ,[Display_by_Ans]
      ,[Editorially_Checked]
      ,[Notes]
  FROM [forum_ResAnal].[dbo].[vr___01_]