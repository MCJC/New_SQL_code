/*****************************************************************************************************************************************/
/*****                                                     BackUp current  Table                                                     *****/
/*****************************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
EXEC (' SELECT * INTO  [_bk_forum].[dbo].[Pew_Nation_Answer_' + @CrDt + ']
                 FROM      [forum].[dbo].[Pew_Nation_Answer]'               )
/*****************************************************************************************************************************************/
--      changes on [Pew_Nation_Answer]
------    DUPLICATE rows were added to the table
/*****************************************************************************************************************************************/
--DELETE
--SELECT * 
           FROM [forum].[dbo].[Pew_Nation_Answer]
           WHERE [Nation_answer_pk]
		      IN 
                (
				  SELECT [link_fk]
					FROM 
                         (    SELECT  [Nation_answer_pk]
									, [Question_abbreviation_std]
									, [Ctry_EditorialName]
							    FROM  [forum].[dbo].[Pew_Nation_Answer]
									, [forum].[dbo].[Pew_Answer]
									, [forum].[dbo].[Pew_Question]
									, [forum].[dbo].[Pew_Nation]
							   WHERE  [Answer_fk]
									 =[Answer_pk]
							     AND  [Question_fk]
									 =[Question_pk]
							     AND  [Nation_fk]
									 =[Nation_pk]													) MTA

							RIGHT
							JOIN
                         (    SELECT  [RANK]
									= (DENSE_RANK()
											 OVER(
									 PARTITION BY   AMD.[Ctry_EditorialName]
												  , AMD.[QA_std]
										 ORDER BY       [link_fk]             ))
									,     [link_fk]
									, AMD.[entity]
									, AMD.[Ctry_EditorialName]
									, AMD.[QA_std]
							    FROM  
								    ( SELECT * 
									   FROM  [forum_ResAnal]..[vr___01_cDB_Long__NoAggregated]
									  WHERE  [Question_Year] = 2014                           ) AMD
                                   ,( SELECT
											 [entity]
											,[QA_fk]
											--,[link_fk]
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
											,[dupliCount] = COUNT(*)
										FROM [forum_ResAnal].[dbo].[vr___01_cDB_Long__NoAggregated]
									   WHERE [Question_Year] = 2014
									GROUP BY [entity]
											,[QA_fk]
											--,[link_fk]
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
											 HAVING  COUNT(*) > 1                             ) DIx

							    WHERE	 AMD.[Ctry_EditorialName]
									  =	 DIx.[Ctry_EditorialName]
								  AND	 AMD.[QA_std]
									  =  DIx.[QA_std]
																									) MFQ

					  ON   MTA.[Nation_answer_pk]
						  =MFQ.[link_fk]
					 AND   MTA.[Question_abbreviation_std]
						  =MFQ.[QA_std]
					 AND   MTA.[Ctry_EditorialName]
						  =MFQ.[Ctry_EditorialName]
				   WHERE	   [RANK]
						  =    2
																											);
GO
