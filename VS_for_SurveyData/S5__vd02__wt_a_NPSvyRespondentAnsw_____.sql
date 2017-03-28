/*****************************************************************************************************************************************************/
/*****************************************************************************************************************************************************/
/***                                                                                                                                               ***/
/***     >>>>>   This is the script used to load data into the table [NPew_Survey_Respondent]                                            <<<<<     ***/
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
/** >   test consistency of questions             >> IT SHOULD BE EMPTY!!!                                                                          **/
/**

	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
SELECT [M_pk]
      ,[SVY_psraid]
      ,[DetRel]
      ,[weight]
      ,[interview_date]

      ,[VarName]
      ,[Question_abbreviation]
      ,[Question_fk]

      ,[Value]
      ,[ValueLabel]
  FROM [microdata]
left join
       ( 
         SELECT 
                DISTINCT
                [Question_fk]
               ,[Question_abbreviation]
         --    ,[Question_Year]
           FROM [Pew_Q&A]  )   F
   on
       [Question_abbreviation]
     =   'RLS'
       + SUBSTRING ([SVY_psraid],6,6)
       + [VarName]
where
       [Question_abbreviation] is null
--order by
--       [Question_abbreviation]
	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/

                                                                                                                                                    **/
/** <   test consistency of questions                                                                                                               **/

/*****************************************************************************************************************************************************/
/*****                                                                  STEP 02                                                                  *****/
/*****************************************************************************************************************************************************/
/** >   test consistency of questions and answers >> IT SHOULD BE EMPTY!!!                                                                          **/
/**

	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
     WITH F AS
           ( 
              SELECT 
                     DISTINCT
                     [Question_fk]
                    ,[Answer_fk]
                    ,[Question_abbreviation]
                    ,[Answer_value_NoStd]
              --    ,[Question_Year]
                FROM [Pew_Q&A]
               WHERE [Question_abbreviation] LIKE 'RLS%'  )
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
              SELECT [M_pk]
                    ,[SVY_psraid]
                    ,[DetRel]
                    ,[weight]
                    ,[interview_date]
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/

                    ,[VarName]
                    ,[Question_abbreviation]
                    ,[Question_fk]

                    ,[Value]
                    ,[Answer_value_NoStd]
                    ,[Answer_fk]

                    ,[ValueLabel]
                FROM 
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
                     [microdata]
              LEFT
              JOIN
                     [F]
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
                 ON     [Question_abbreviation]  =     'RLS'
                                                     + SUBSTRING ([SVY_psraid],6,6)
                                                     + [VarName]
                 AND    [Answer_value_NoStd]     =          CAST([Value]   AS DECIMAL (12,2))
               WHERE    [Answer_value_NoStd]     IS     NULL
--             WHERE    [Answer_value_NoStd]     IS NOT NULL
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/

                                                                                                                                                    **/
/** <   test consistency of questions and answers >> IT SHOULD BE EMPTY!!!                                                                          **/
/*****************************************************************************************************************************************************/


/*****************************************************************************************************************************************************/
/*****                                                                  STEP 03                                                                  *****/
/*****************************************************************************************************************************************************/
/** >   load CODED data into Survey-Respondent-Answer                                                                                               **/
	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
INSERT INTO
             [Pew_Survey_Respondent_Answer]
	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
     SELECT
             [Svy_RespAnswer_pk]  =    [M_pk]
                                   +  ( ISNULL
                                      ( ( SELECT MAX([Svy_RespAnswer_pk])
                                                FROM [Pew_Survey_Respondent_Answer] ),  0 ) )
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
           , [Svy_Respondent_fk]
           , [Answer_fk]
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
--             [M_pk]
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
                FROM 
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
                       [microdata]                                           B
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
              LEFT
              JOIN
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
                     ( 
                       SELECT 
                              [Svy_Respondent_fk] = [Svy_Respondent_pk]
                             ,[SVY_psraid]
                         FROM [Pew_Survey_Respondent]
                        WHERE [SVY_psraid] LIKE 'RLS%'                  )    R
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
                 ON     B.[SVY_psraid]
                      = R.[SVY_psraid]
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
              LEFT
              JOIN
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
                     ( 
                       SELECT 
                              DISTINCT
                              [Question_fk]
                             ,[Answer_fk]
                             ,[Question_abbreviation]
                             ,[Answer_value_NoStd]
                         FROM [Pew_Q&A]
                        WHERE [Question_abbreviation] LIKE 'RLS%'       )    F
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
                 ON     [Question_abbreviation]  =   'RLS'
                                                    + SUBSTRING (B.[SVY_psraid],6,6)
                                                    +            B.[VarName]
	                  /* ---> NOTICE that matching is made though values because of missing NoStdAnsWordings from original data -----------------*/
                 AND    [Answer_value_NoStd]     =          CAST(B.[Value]     AS DECIMAL (12,2))
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
--             ORDER BY [M_pk]
	/*-------------------------------------------------------------------------------------------------------------------------------------------*/
	/****** +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++    +++++++++++++++++++++++++++++   +++++++++++++++++++++++++++++  ******/
/** <   load CODED data into Survey-Respondent-Answer                                                                                               **/
/*****************************************************************************************************************************************************/
