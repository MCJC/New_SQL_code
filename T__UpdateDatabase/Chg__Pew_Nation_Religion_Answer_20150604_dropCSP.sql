/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE                          --  declare variable
          @TofI                    --  variable name
                   varchar(50)     --  data type of the variable
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Nation_Religion_Answer_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Nation_Religion_Answer]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
-- After asking Neha Saghal on June 4 2015, CSP data shuld be dropped from the database
/**************************************************************************************************************************/
/*****                                                                                                                *****/
/*****                            basic cleaning for unvalid links to [Pew_Answer_NoStd]                              *****/
/*****                                                                                                                *****/
/**************************************************************************************************************************/
/**************************************************************************************************************************/
/* >   .  check consistency of Country/Religion/Province/Individual data linked to answers ********************************/
/*------------------------------------------------------------------------------------------------------------------------*/
	SELECT *                                                                   /* start TEST from this statement...       */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM                                                                         /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
(
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Svy_RespAnswer_pk]
         ,[Ent_fk]               = [Svy_Respondent_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PSRA'
                                                               FROM [forum].[dbo].[Pew_Survey_Respondent_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
   union
   all
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Pew_Survey_Answer_pk] 
         ,[Ent_fk]               = [Nation_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PSA'
                                                               FROM [forum].[dbo].[Pew_Survey_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
   union
   all
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Nation_religion_answer_pk]
         ,[Ent_fk]               = [Nation_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PNRA'
                                                               FROM [forum].[dbo].[Pew_Nation_Religion_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
   union
   all
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Nation_answer_pk]
         ,[Ent_fk]               = [Nation_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PNA'
                                                               FROM [forum].[dbo].[Pew_Nation_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
   union
   all
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Locality_answer_pk]
         ,[Ent_fk]               = [Locality_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PLA'
                                                               FROM [forum].[dbo].[Pew_Locality_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
                                                                                                            ) PewLinkedAns    --> 2,362,835
/*------------------------------------------------------------------------------------------------------------------------*/
	inner
--	left
--	right
--	full
	join
/*------------------------------------------------------------------------------------------------------------------------*/
(
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          *
                                                               FROM [forum].[dbo].[Pew_Answer_NoStd]                          -->    30,479
/*------------------------------------------------------------------------------------------------------------------------*/
                                                                                                            ) PewAnsNoStdT
/*------------------------------------------------------------------------------------------------------------------------*/
ON
       [Ans_fk]               
     = [Answer_pk]
/*------------------------------------------------------------------------------------------------------------------------*/  --> 2,362,835
/* <   .  check consistency of Country/Religion/Province/Individual data linked to answers ********************************/
/**************************************************************************************************************************/
/* >   .  check Country/Religion/Province/Individual data linked to answers unlinked to StdQs *****************************/
/*------------------------------------------------------------------------------------------------------------------------*/
	SELECT *                                                                   /* start TEST from this statement...       */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM                                                                         /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
(
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Svy_RespAnswer_pk]
         ,[Ent_fk]               = [Svy_Respondent_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PSRA'
                                                               FROM [forum].[dbo].[Pew_Survey_Respondent_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
   union
   all
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Pew_Survey_Answer_pk] 
         ,[Ent_fk]               = [Nation_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PSA'
                                                               FROM [forum].[dbo].[Pew_Survey_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
   union
   all
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Nation_religion_answer_pk]
         ,[Ent_fk]               = [Nation_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PNRA'
                                                               FROM [forum].[dbo].[Pew_Nation_Religion_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
   union
   all
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Nation_answer_pk]
         ,[Ent_fk]               = [Nation_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PNA'
                                                               FROM [forum].[dbo].[Pew_Nation_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
   union
   all
/*------------------------------------------------------------------------------------------------------------------------*/
   SELECT 
          [Tab_fk]               = [Locality_answer_pk]
         ,[Ent_fk]               = [Locality_fk]
         ,[Ans_fk]               = [Answer_fk]
         ,[Tab_id]               = 'PLA'
                                                               FROM [forum].[dbo].[Pew_Locality_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
                                                                                                            ) PewLinkedAns    --> 2,362,835
/*------------------------------------------------------------------------------------------------------------------------*/
INNER JOIN
/*------------------------------------------------------------------------------------------------------------------------*/
(                                                                              /* >>   As lnkd to NoStdQs unlnkd to StdQs */
SELECT *                                                                       /* start TEST from this statement...       */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM                                                                         /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
       [forum].[dbo].[Pew_Answer_NoStd]                                        /* TEST old number of rows...              */
/*------------------------------------------------------------------------------------------------------------------------*/
LEFT                                                                           /*                                         */
JOIN                                                                           /*                                         */
(                                                                              /* >    NoStdQs unlinked to StdQs          */
	SELECT *                                                                   /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM                                                                         /*                                         */
       [forum].[dbo].[Pew_Question_NoStd]                                      /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
LEFT                                                                           /*                                         */
 JOIN                                                                          /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
       [forum].[dbo].[Pew_Question_Std]                                        /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
   ON                                                                          /*                                         */
       [Question_Std_pk]                                                       /*                                         */
      =[Question_Std_fk]                                                       /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
WHERE                                                                          /*                                         */
       [Question_Std_pk]        IS NULL                                        /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
                                                                   ) NSQultSQ  /* <    NoStdQs unlinked to StdQs          */
/*------------------------------------------------------------------------------------------------------------------------*/
   ON                                                                          /*                                         */
       [Question_pk]                                                           /*                                         */
      =[Question_fk]                                                           /* TEST number of rows...                  */  -->    30,610
/*------------------------------------------------------------------------------------------------------------------------*/
WHERE                                                                          /*                                         */
        [Question_pk]       IS NOT NULL                                        /*                                         */  -->        56
                                                                   ) AlNSQulQ  /* <<   As lnkd to NoStdQs unlnkd to StdQs */
/*------------------------------------------------------------------------------------------------------------------------*/
ON                                                                             /*                                         */
       [Ans_fk]                                                                /*                                         */
     = [Answer_pk]                                                             /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/  -->     2,679
/* <   .  check Country/Religion/Province/Individual data linked to answers unlinked to StdQs *****************************/
/**************************************************************************************************************************/
/**************************************************************************************************************************/
/* >   .  delete Country-Religion data linked to answers which are unlinked to StdQs **************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	DELETE                                               PNRA                  /* deletion statement!                     */
/*------------------------------------------------------------------------------------------------------------------------*/
--	SELECT *                                                                   /* start TEST from this statement...       */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM                                                                         /*                                         */
       [forum].[dbo].[Pew_Nation_Religion_Answer]      PNRA                    /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------*/
INNER JOIN
/*------------------------------------------------------------------------------------------------------------------------*/
(                                                                              /* >>   As lnkd to NoStdQs unlnkd to StdQs */
SELECT *                                                                       /* start TEST from this statement...       */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM                                                                         /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
       [forum].[dbo].[Pew_Answer_NoStd]                                        /* TEST old number of rows...              */
/*------------------------------------------------------------------------------------------------------------------------*/
LEFT                                                                           /*                                         */
JOIN                                                                           /*                                         */
(                                                                              /* >    NoStdQs unlinked to StdQs          */
	SELECT *                                                                   /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM                                                                         /*                                         */
       [forum].[dbo].[Pew_Question_NoStd]                                      /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
LEFT                                                                           /*                                         */
 JOIN                                                                          /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
       [forum].[dbo].[Pew_Question_Std]                                        /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
   ON                                                                          /*                                         */
       [Question_Std_pk]                                                       /*                                         */
      =[Question_Std_fk]                                                       /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
WHERE                                                                          /*                                         */
       [Question_Std_pk]        IS NULL                                        /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
                                                                   ) NSQultSQ  /* <    NoStdQs unlinked to StdQs          */
/*------------------------------------------------------------------------------------------------------------------------*/
   ON                                                                          /*                                         */
       [Question_pk]                                                           /*                                         */
      =[Question_fk]                                                           /* TEST number of rows...                  */  --> 30,610
/*------------------------------------------------------------------------------------------------------------------------*/
WHERE                                                                          /*                                         */
        [Question_pk]       IS NOT NULL                                        /*                                         */  -->        56
                                                                   ) AlNSQulQ  /* <<   As lnkd to NoStdQs unlnkd to StdQs */
/*------------------------------------------------------------------------------------------------------------------------*/
ON                                                                             /*                                         */
       [Answer_fk]                                                             /*                                         */
     = [Answer_pk]                                                             /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/  -->     2,679
/* >   .  delete Country-Religion data linked to answers which are unlinked to StdQs **************************************/
