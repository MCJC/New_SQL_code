/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>         This script loads  - STEP BY STEP -  new coded data for GR & SH on R                                                        <<<<<     ***/
/***                                                                                                                                                         ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [forum]
GO
/***************************************************************************************************************************************************************/
/***       >>>>>         Std Q's were not loaded before....                                                                                        <<<<<     ***/
--	/***********************************************************************************************************************************************************/
--	/*****     BackUp  current Table                                                                                                                       *****/
--	/***********************************************************************************************************************************************************/
--	  DECLARE @CrDt    varchar( 8)
--	  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--	EXEC ( ' SELECT *
--					INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + ']
--					FROM      [forum].[dbo].[Pew_Question_Std]'               )
--	/***********************************************************************************************************************************************************/
--	INSERT INTO               [forum].[dbo].[Pew_Question_Std]                                                    /* insert statement into target in main DB */
----	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--	SELECT                                                                                                          /* select statement...                     */
--	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--		   [Question_Std_pk]               =   1                                                                    /* new Std Question                        */
--									           + (SELECT        MAX([Question_Std_pk])                              /* add currently max pk                    */
--										           FROM [forum]..[Pew_Question_Std])                                /* from StdQuestions                       */
--	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--		  ,[Question_abbreviation_std]      = 'SHI_11_a_01'
--		  ,[Question_wording_std]           = 'Did the score for SHI_11_a depend solely on information from the two IRF reports before this year''s report?'
--		  ,[Question_short_wording_std]     = 'Did the score for SHI_11_a depend solely on information from the two IRF reports before this year''s report?'
--		  ,[Display]                        =  0
--		  ,[AnswerSet_num]                  =  47
--		  ,[Editorially_Checked]            = 'NO!'
--	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--	/***********************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/

/***************************************************************************************************************************************************************/
/***       >>>>>         NoStd Q's were not loaded before....                                                                                   <<<<<     ***/
--	/***********************************************************************************************************************************************************/
--	/*****     BackUp  current Table                                                                                                                       *****/
--	/***********************************************************************************************************************************************************/
--	  DECLARE @CrDt    varchar( 8)
--	  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--	EXEC ( ' SELECT *
--					INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
--					FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
--	/***********************************************************************************************************************************************************/
--	INSERT INTO               [forum].[dbo].[Pew_Question_NoStd]                                                    /* insert statement into target in main DB */
--	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--	SELECT                                                                                                          /* select statement...                     */
--	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--		   [Question_pk]                   =   1                                                                    /* new NoStd Question                      */
--									           + (SELECT     MAX([Question_pk])                                     /* add currently max pk                    */
--										       FROM [forum]..[Pew_Question_NoStd])                                  /* from NoStdQuestions                     */
--	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--		  ,[Question_abbreviation]         =  'SHI_11_a_01'
--		  ,[Question_wording]              =  'Did the score for SHI_11_a depend solely on information from the two IRF reports before this year''s report?'
--		  ,[Question_Year]                 =   2015
--		  ,[Notes]                         =  'January - December 2015'
--		  ,[Display]                       =   0
--		  ,[Data_source_fk]                =   30
--		  ,[Question_Std_fk]               =   ( SELECT              [Question_Std_pk]
--										           FROM [forum]..[Pew_Question_Std]
--										          WHERE              [Question_abbreviation_std]  = 'SHI_11_a_01' )
--	/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/
--	/***********************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/

