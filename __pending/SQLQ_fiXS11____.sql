/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
       distinct
       
	   [Answer_value]
      ,[AnswerSet_number]
  FROM [forum_ResAnal].[dbo].[MYTEMPSHITABLE]
where
       [QA_std] like  'SHI_11'

--group by
--         [QA_std]
--      ,
--         [Question_Year]
--      ,
--         [Answer_value_Std]
--      ,[Answer_value]
--      ,[Answer_value_NoStd]
--      ,[Question_Std_fk]
--      ,[Question_fk]
--      ,[Answer_Std_fk]
--      ,[Answer_fk]
--      ,[AnswerSet_number]
--      ,[entity]
--      ,[link_fk]

--order by
--         [QA_std]
--      ,
--         [Question_Year]
--      ,
--         [Answer_value_Std]




/****************************************************************************************************************************************/
/******  Step 01  ***********************************************************************************************************************/
/****************************************************************************************************************************************/
--		SELECT
--		 --      distinct
--		 --      [f]                                   = sum(1)  ,

--			   [entity]
--			  --,[QA_fk]
--			  ,[link_fk]
--			  ,[Nation_Answer_fk]            = CASE WHEN [entity] = 'Ctry' THEN [link_fk] END
--			--,[Locality_Answer_fk]          = CASE WHEN [entity] = '' THEN [link_fk] END
--			--,[NationReligion_Answer_fk]    = CASE WHEN [entity] = '' THEN [link_fk] END



--			  --,[Nation_fk]
--			  --,[Locality_fk]
--			  --,[Religion_fk]
--			  --,[Region5]
--			  --,[Region6]
--			  --,[Ctry_EditorialName]
--			  --,[Locality]
--			  --,[Religion]
--			  ,
--				 [Question_Year]
--			  ,
--				 [QA_std]
--			  --,[QW_std]
--			  ,[Answer_value]
--			  ,
--				 [Answer_value_Std]
--			  ,[Answer_value_NoStd]
--			  --,[answer_wording]
--			  --,[answer_wording_std]
--			  --,[Data_source_name]
--			  ,[Question_Std_fk]
--			  ,[Question_fk]
--			  ,[Answer_Std_fk]
--			  ,[Answer_fk]
--			  ,[AnswerSet_number]
--			  --,[Question_wording_std]
--			  --,[Question_wording]
--			  --,[Question_abbreviation]
--			  --,[NA_by_set_of_Answers]
--			  --,[Full_set_of_Answers]
--			  --,[Display_by_StdQ]
--			  --,[Display_by_NoSQ]
--			  --,[Display_by_Ans]
--			  --,[Editorially_Checked]
--			  --,[Notes]


--		INTO MYTEMPSHITABLE


--		  FROM [forum_ResAnal].[dbo].[vr___01_]
--		where
--			   [QA_std] like  'SHI_11%'

--		--group by
--		--         [QA_std]
--		--      ,
--		--         [Question_Year]
--		--      ,
--		--         [Answer_value_Std]
--		--      ,[Answer_value]
--		--      ,[Answer_value_NoStd]
--		--      ,[Question_Std_fk]
--		--      ,[Question_fk]
--		--      ,[Answer_Std_fk]
--		--      ,[Answer_fk]
--		--      ,[AnswerSet_number]
--		--      ,[entity]
--		--      ,[link_fk]

--		--order by
--		--         [QA_std]
--		--      ,
--		--         [Question_Year]
--		--      ,
--		--         [Answer_value_Std]

/****************************************************************************************************************************************/
/******  Step 02  ***********************************************************************************************************************/
/****************************************************************************************************************************************/
--		SELECT [byCY_row]
--			  ,[Nation_fk]
--			  ,[Ctry_EditorialName]
--			  ,[UN_TotalPopulation]
--			  ,[Region5]
--			  ,[Region6]
--			  ,[Question_Year]
--			  ,[GRI]
--			  ,[GRI_rd_1d]
--			  ,[GRI_scaled]
--			  ,[SHI]
--			  ,[SHI_rd_1d]
--			  ,[SHI_scaled]
--			  ,[SHI_11]
--			  ,[SHI_11_a]
--			  ,[SHI_11_a_01]
--			  ,[SHI_11_a_n]
--			  ,[SHI_11_b]
--			  ,[SHI_11_b_01]
--			  ,[SHI_11_b_n]
--			  ,[SHI_11_for_index]
--			  ,[SHI_11_x]
--		  FROM [forum_ResAnal].[dbo].[vr___04_cDB_SemiWide_byCtry&Yr]
/****************************************************************************************************************************************/
/******  Step 03  ***********************************************************************************************************************/
/****************************************************************************************************************************************/





/*



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [entity]
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






*/


/*



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [entity]
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






*/