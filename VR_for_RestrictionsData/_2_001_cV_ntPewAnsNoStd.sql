-- WE SHOULD GET THIS:


USE [GRSHRcode]
GO

/****** Object:  View [dbo].[v01_EnteredValues]    Script Date: 2/15/17 2:14:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW     [dbo].[v01_EnteredValues]
AS
      SELECT
               G.[RowID]
             , G.[Question_Year]
             , G.[Nation_fk]
             , G.[Ctry_EditorialName]
             , GRI_01_x, GRI_01_x_DES, GRI_01_filter, GRI_01, GRI_01_DES, GRI_01_yBe, GRI_01_yBe_DES, GRI_02_filter, GRI_02, GRI_02_DES, GRI_02_yBe, GRI_02_yBe_DES, GRI_03, GRI_03_DES, GRI_20_01, GRI_20_01_DES, GRI_20_01x_01a, GRI_20_01x_01b, GRI_20_01x_02, GRI_20_01x_03, GRI_20_01x_04, GRI_20_01x_05, GRI_20_01x_06, GRI_20_01x_07, GRI_20_01x_08, GRI_20_01x_09, GRI_20_01x_11, GRI_20_01x_10, GRI_20_01_x_01, GRI_20_01_x_01_DES, GRI_20_01_x_02, GRI_20_01_x_02_DES, GRI_20_02, GRI_20_02_DES, GRI_20_03_a, GRI_20_03_a_DES, GRI_20_03_a_xx, GRI_20_03_b, GRI_20_03_b_DES, GRI_20_03_b_xx, GRI_20_03_c, GRI_20_03_c_DES, GRI_20_03_c_xx, GRI_20_04_x, GRI_20_04_x_DES, GRI_20_04, GRI_20_04_DES, GRI_20_05, GRI_20_05_DES, GRI_20_05_x, GRI_10, GRI_10_DES, GRI_10_01, GRI_10_02, GRI_10_03, GRI_05, GRI_05_DES, GRI_06, GRI_06_DES, GRI_08, GRI_08_DES, GRI_08_a, GRI_09, GRI_09_DES, GRI_07, GRI_07_DES, GRI_04, GRI_04_DES, GRI_18, GRI_18_DES, GRI_16, GRI_16_DES, GRI_16_01, GRI_16_01_DES, GRI_15, GRI_15_DES, GRI_11, GRI_11_DES, GRI_11_01a, GRI_11_01b, GRI_11_02, GRI_11_03, GRI_11_04, GRI_11_05, GRI_11_06, GRI_11_07, GRI_11_08, GRI_11_09, GRI_11_10, GRI_11_11, GRI_11_12, GRI_11_13, GRI_11_16, GRI_11_15, GRI_11_17, GRI_17, GRI_17_DES, GRI_12, GRI_12_DES, GRI_13, GRI_13_DES, GRI_14, GRI_14_DES, GRX_22_01, GRX_22_01_DES, GRX_22_02, GRX_22_02_DES, GRX_22_03, GRX_22_03_DES, GRX_22_04, GRX_22_04_DES, GRX_22_x, GRX_22_x_01, GRX_22_x_02, GRX_22_x_03, GRX_22_x_04, GRX_29_01, GRX_29_02, GRX_29_02_DES, GRX_29_03, GRX_29_03_DES, GRX_29_04, GRX_29_04_DES, GRX_29_05, GRX_29_05_DES, GRX_30, GRX_30_DES, GRX_31, GRX_31_DES, GRX_32, GRX_32_DES, GRX_36, GRX_36_DES, GRI_19_filter, GRI_19_b, GRI_19_b_DES, GRI_19_c, GRI_19_c_DES, GRI_19_d, GRI_19_d_DES, GRI_19_e, GRI_19_e_DES, GRI_19_f, GRI_19_f_DES, GRI_19_x, GRI_19, SHI_01_a, SHI_01_a_DES, SHI_01_x_01a, SHI_01_x_01b, SHI_01_x_02, SHI_01_x_03, SHI_01_x_04, SHI_01_x_05, SHI_01_x_06, SHI_01_x_07, SHI_01_x_08, SHI_01_x_09, SHI_01_x_10, SHI_01_x_11, SHI_01_x_12, SHI_01_x_13, SHI_01_x_16, SHI_01_x_15, SHI_01_x_17, SHI_01_b, SHI_01_b_DES, SHI_01_c, SHI_01_c_DES, SHI_01_d, SHI_01_d_DES, SHI_01_e, SHI_01_e_DES, SHI_01_f, SHI_01_f_DES, SHI_01_x, SHI_01_summary_b, SHI_02, SHI_02_DES, SHI_02_01, SHI_03, SHI_03_DES, SHI_04_filter, SHI_04_filter_DES, SHI_04_x01, SHI_04_x01_DES, SHI_04_b, SHI_04_b_DES, SHI_04_c, SHI_04_c_DES, SHI_04_d, SHI_04_d_DES, SHI_04_d_x_1, SHI_04_d_x_1_n, SHI_04_d_x_2, SHI_04_d_x_2_n, SHI_04_e, SHI_04_e_DES, SHI_04_f, SHI_04_f_DES, SHI_04_f_x_01a, SHI_04_f_x_01b, SHI_04_f_x_02, SHI_04_f_x_03, SHI_04_f_x_04, SHI_04_f_x_05, SHI_04_f_x_06, SHI_04_f_x_07, SHI_04_f_x_08, SHI_04_f_x_09, SHI_04_f_x_10, SHI_04_f_x_11, SHI_04_f_x_12, SHI_04_f_x_13, SHI_04_f_x_16, SHI_04_f_x_15, SHI_04_f_x_17, SHI_04_x, SHI_04, SHI_05_filter, SHI_05_c, SHI_05_c_DES, SHI_05_d, SHI_05_d_DES, SHI_05_d_x_1, SHI_05_d_x_1_n, SHI_05_d_x_2, SHI_05_d_x_2_n, SHI_05_e, SHI_05_e_DES, SHI_05_f, SHI_05_f_DES, SHI_05_01, SHI_05_01_DES, SHI_05_x, SHI_05, SHI_06, SHI_06_DES, SHI_06_01, SHI_13, SHI_13_DES, SHI_13_01, SHI_12, SHI_12_DES, SHI_12_01, SHI_08, SHI_08_DES, SHI_08_01, SHI_07, SHI_07_DES, SHI_07_01, SHI_11_b, SHI_11_b_DES, SHI_11_b_01, SHI_11_b_n, SHI_11_a, SHI_11_a_DES, SHI_11_a_n, SHI_09, SHI_09_DES, SHI_09_01, SHI_09_n, SHI_10, SHI_10_DES, SHI_10_01, SHI_10_n, XSG_S_01, XSG_S_02, XSG_S_03, XSG_S_04, XSG_S_05, XSG_S_06, XSG_S_07, XSG_S_08, XSG_S_09, XSG_S_10, XSG_S_11, XSG_S_12, XSG_S_13, XSG_S_14, XSG_S_15, XSG_S_16, XSG_S_17, XSG_S_18, XSG_S_19, XSG_S_20, XSG_S_21, XSG_S_22, XSG_S_23, XSG_S_99_filter, XSG_S_99_01, XSG_S_99_01_DES, XSG_S_99_02, XSG_S_99_02_DES, XSG_S_99_03, XSG_S_99_03_DES, XSG_S_99_04, XSG_S_99_04_DES, XSG_S_99_05, XSG_S_99_05_DES, XSG_S_99_06, XSG_S_99_06_DES                
			 
			 FROM [GRI_Ctry]   G
                      , [SHI_Ctry]   S
                      , [Sources]    X
                  WHERE
                         G.[Nation_fk]
                       = S.[Nation_fk]
                    AND
                         G.[Nation_fk]
                       = X.[Nation_fk]        
GO







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