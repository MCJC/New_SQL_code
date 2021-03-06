/*****************************************************************************************************************************************************/
/*****************************************************************************************************************************************************/
/***                                                                                                                                               ***/
/***     >>>>>   This is the script used to test that all Q&A can be loaded into the data base                                           <<<<<     ***/
/***                                                                                                                                               ***/
/*****************************************************************************************************************************************************/
USE [x_LoadRLS1cUS]
GO
/*****************************************************************************************************************************************************/

/********************************************************- - - - - - - - - - - - - - - - - - -********************************************************/
/*****                                                        S T E P     B Y     S T E P                                                        *****/
/********************************************************- - - - - - - - - - - - - - - - - - -********************************************************/

/*****************************************************************************************************************************************************/
/*****                                                                  STEP 01                                                                  *****/
/*****************************************************************************************************************************************************/



SELECT *
FROM (
/*****************************************************************************************************************************************************/
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
    /* >  unmatched set                                                                                                                          */
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
          SELECT
                 [VarName]
                ,[Value]
                ,[ValueLabel]
                ,[VarLabel]
                ,[NA]
                ,[last]
                ,[vsrt]
                ,[CHKna] = CASE
                           WHEN COUNT(*) OVER(PARTITION BY [VarName])
                              = [NA]
                           THEN   ''
                           ELSE 'check'
                            END
            FROM
                 [xDataLoaded].[dbo].[CleanQAsetRLS_2014]
            LEFT
            JOIN
                 [FORUM].[dbo].[Pew_Q&A]  
              ON
                 [VarName]
                =[Question_abbreviation]
             AND
                 [Value]
                =[Answer_value_NoStd]
          WHERE  [QA_pk]
                 IS NULL
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
    /* <  unmatched set                                                                                                                          */
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*****************************************************************************************************************************************************/
                                                                                                                                                  ) UMS
/*****************************************************************************************************************************************************/
/* 01: lose answers -> check by uncommenting this 'where' statement: it should not be any cell if OK ------------------------------------------------*/
--	WHERE [CHKna] = 'check'
/* 02: manually match large sets of answers as age, years, etc... -> (use this statement) check if answers already exist or create them first -------*/
--	WHERE [NA]    > 10
/* lose answers -------------------------------------------------------------------------------------------------------------------------------------*/
--	WHERE [CHKna] = 'check'
/* lose answers -------------------------------------------------------------------------------------------------------------------------------------*/
--	WHERE [CHKna] = 'check'
/* lose answers -------------------------------------------------------------------------------------------------------------------------------------*/
--	WHERE [CHKna] = 'check'

/*****************************************************************************************************************************************************/
ORDER BY
        [VarName]
      , [Value]









/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct
       [Question_abbreviation_std]
      ,[Answer_value_Std]
      ,[Answer_Wording_std]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
      ,[Question_abbreviation]
      ,[Question_wording]
      ,[Full_set_of_Answers]
      ,[AnswerSet_num]
      ,[AnswerSet_number]
      ,[Question_Std_fk]
      ,[NA_by_set_of_Answers]
      ,[Display]
      ,[Editorially_Checked]
  FROM [forum].[dbo].[Pew_Q&A]
where
--[AnswerSet_number] in
--(169
--,170
--)

[Question_wording_std]
like
'%hisp%'


--and
--[Question_short_wording_std]
--not like
--'%if any%'

--and
--Full_set_of_Answers
--like
--'%low%'

----and
--Answer_Wording_std
--like
--'%volunt%'

and
Question_abbreviation_std
like 'SVY%'
--and
--[Question_abbreviation]
--like 'RLS%'
 




----AnswerSet_number	Answer_value_std	Answer_Wording_std	Full_set_of_Answers
----169	0.00	 0 years old	0 to 96 & 97+ & DkRef


----SELECT 
----       -- DISTINCT   --   [SVY_psraid]
----        [var]    --  =    'RLS_' + SUBSTRING([SVY_psraid], 6, 6) + [VarName]
----      , [val]    --  =    CAST([Value] AS DECIMAL(12,2))
----      , [VarName]
----      , [Value]
----      , [ValueLabel]
----  FROM  [xDataLoaded].[dbo].[CleanQAsetRLS_2014]
----  LEFT
----  JOIN [FORUM].[dbo].[Pew_Q&A]  
----    ON
----       'RLS' + SUBSTRING([SVY_psraid], 6, 6) + [VarName]
----      =[Question_abbreviation]
----   AND
----       CAST([Value] AS DECIMAL(12,2))
----      =[Answer_value_NoStd]
----WHERE  [QA_pk]
----       IS NULL
----ORDER BY
----        [VarName]
----      , [Value]

----[xDataLoaded].[dbo].[microdata_RLS_both]



----RLS07cUS_q42g
----RLS07cUS_Q31x
----RLS07A&H_q30
----Question_abbreviation
----RLS14all_qf2
----/****** Script for SelectTopNRows command from SSMS  ******/
----SELECT [QA_pk]
----      ,[Question_abbreviation]
----      ,[Question_wording]
----      ,[Question_Std_fk]
----      ,[Question_fk]
----      ,[AnswerSet_num]
----      ,[AnswerSet_number]
----      ,[Answer_Std_fk]
----      ,[Answer_fk]
----      ,[Data_source_fk]
----      ,[Pew_Data_Collection]
----      ,[Pew_Data_SubCollection]
----      ,[Data_source_name]
----      ,[Question_abbreviation_std]
----      ,[Question_abbreviation]
----      ,[Question_wording_std]
----      ,[Question_short_wording_std]
----      ,[Question_wording]
----      ,[Question_Year]
----      ,[Notes]
----      ,[Answer_value]
----      ,[Answer_value_Std]
----      ,[Answer_value_NoStd]
----      ,[Answer_Wording_std]
----      ,[Answer_Wording]
----      ,[Full_set_of_Answers]
----      ,[NA_by_set_of_Answers]
----      ,[Display]
----      ,[Editorially_Checked]
----  FROM [forum].[dbo].[Pew_Q&A]  
----WHERE
----Question_abbreviation_std
----='SVYp_0367'
----       [Question_abbreviation]
----       LIKE 'RLS%'
----and
----(     [Question_abbreviation]
----       LIKE '%EDU%'
  
----  OR [Question_short_wording_std]
----  LIKE '%EDU%'

----)

  






















----/** >   test consistency of questions             >> IT SHOULD BE EMPTY!!!                                                                          **/
----/**

----	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
----SELECT [M_pk]
----      ,[SVY_psraid]
----      ,[DetRel]
----      ,[weight]
----      ,[interview_date]

----      ,[VarName]
----      ,[Question_abbreviation]
----      ,[Question_fk]

----      ,[Value]
----      ,[ValueLabel]
----  FROM [microdata]
----left join
----       ( 
----         SELECT 
----                DISTINCT
----                [Question_fk]
----               ,[Question_abbreviation]
----         --    ,[Question_Year]
----           FROM [Pew_Q&A]  )   F
----   on
----       [Question_abbreviation]
----     =   'RLS'
----       + SUBSTRING ([SVY_psraid],6,6)
----       + [VarName]
----where
----       [Question_abbreviation] is null
------order by
------       [Question_abbreviation]
----	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/

----                                                                                                                                                    **/
----/** <   test consistency of questions                                                                                                               **/

----/*****************************************************************************************************************************************************/
----/*****                                                                  STEP 02                                                                  *****/
----/*****************************************************************************************************************************************************/
----/** >   test consistency of questions and answers >> IT SHOULD BE EMPTY!!!                                                                          **/
----/**

----	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
----     WITH F AS
----           ( 
----              SELECT 
----                     DISTINCT
----                     [Question_fk]
----                    ,[Answer_fk]
----                    ,[Question_abbreviation]
----                    ,[Answer_value_NoStd]
----              --    ,[Question_Year]
----                FROM [Pew_Q&A]
----               WHERE [Question_abbreviation] LIKE 'RLS%'  )
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----              SELECT [M_pk]
----                    ,[SVY_psraid]
----                    ,[DetRel]
----                    ,[weight]
----                    ,[interview_date]
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/

----                    ,[VarName]
----                    ,[Question_abbreviation]
----                    ,[Question_fk]

----                    ,[Value]
----                    ,[Answer_value_NoStd]
----                    ,[Answer_fk]

----                    ,[ValueLabel]
----                FROM 
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----                     [microdata]
----              LEFT
----              JOIN
----                     [F]
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----                 ON     [Question_abbreviation]  =     'RLS'
----                                                     + SUBSTRING ([SVY_psraid],6,6)
----                                                     + [VarName]
----                 AND    [Answer_value_NoStd]     =          CAST([Value]   AS DECIMAL (12,2))
----               WHERE    [Answer_value_NoStd]     IS     NULL
------             WHERE    [Answer_value_NoStd]     IS NOT NULL
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/

----                                                                                                                                                    **/
----/** <   test consistency of questions and answers >> IT SHOULD BE EMPTY!!!                                                                          **/
----/*****************************************************************************************************************************************************/


----/*****************************************************************************************************************************************************/
----/*****                                                                  STEP 03                                                                  *****/
----/*****************************************************************************************************************************************************/
----/** >   load CODED data into Survey-Respondent-Answer                                                                                               **/
----	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
----INSERT INTO
----             [Pew_Survey_Respondent_Answer]
----	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
----     SELECT
----             [Svy_RespAnswer_pk]  =    [M_pk]
----                                   +  ( ISNULL
----                                      ( ( SELECT MAX([Svy_RespAnswer_pk])
----                                                FROM [Pew_Survey_Respondent_Answer] ),  0 ) )
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----           , [Svy_Respondent_fk]
----           , [Answer_fk]
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
------             [M_pk]
----/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
----                FROM 
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----                       [microdata]                                           B
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----              LEFT
----              JOIN
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----                     ( 
----                       SELECT 
----                              [Svy_Respondent_fk] = [Svy_Respondent_pk]
----                             ,[SVY_psraid]
----                         FROM [Pew_Survey_Respondent]
----                        WHERE [SVY_psraid] LIKE 'RLS%'                  )    R
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----                 ON     B.[SVY_psraid]
----                      = R.[SVY_psraid]
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----              LEFT
----              JOIN
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----                     ( 
----                       SELECT 
----                              DISTINCT
----                              [Question_fk]
----                             ,[Answer_fk]
----                             ,[Question_abbreviation]
----                             ,[Answer_value_NoStd]
----                         FROM [Pew_Q&A]
----                        WHERE [Question_abbreviation] LIKE 'RLS%'       )    F
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----                 ON     [Question_abbreviation]  =   'RLS'
----                                                    + SUBSTRING (B.[SVY_psraid],6,6)
----                                                    +            B.[VarName]
----	                  /* ---> NOTICE that matching is made though values because of missing NoStdAnsWordings from original data -----------------*/
----                 AND    [Answer_value_NoStd]     =          CAST(B.[Value]     AS DECIMAL (12,2))
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
------             ORDER BY [M_pk]
----	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
----	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
----/** <   load CODED data into Survey-Respondent-Answer                                                                                               **/
----/*****************************************************************************************************************************************************/
----/****** Script for SelectTopNRows command from SSMS  ******/
