/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
--USE [x_LoadRLS1cUS]                                                          /* use working database                    */
  USE [forum]                                                                  /* use final database                      */
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Std]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: SQWdg + SQShWdg + FSetAns */
/*------------------------------------------------------------------------------------------------------------------------*/


SELECT
 L = 'race/ethnicity'
,S = 'race/ethnicity'
,F = '1.00: White NH   ||   2.00: Black NH   ||   3.00: Asian NH   ||   4.00: Other/Mi   ||   5.00: Latino   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Are you currently a citizen of the United States, or not?'
,S = 'Are you currently a citizen of the United States?'
,F = '1.00: R is not a US citizen   ||   2.00: R is a US citizen'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Indicates whether R is absolutely certain registered to vote'
,S = 'Is R absolutely certain registered to vote'
,F = '1.00: R is not absolutely certain registered to vote   ||   2.00: R is absolutely certain registered to vote'


/*------------------------------------------------------------------------------------------------------------------------*/
)                                                                              /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	               [Pew_Question_Std]                                          /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* select statement...                     */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Question_Std_pk]            =    ROW_NUMBER()                          /* number all rows                         */
                                         OVER(ORDER BY [F], [S])               /* sorted by FullSetAns & QShortWordingStd */
                                      + (SELECT MAX([Question_Std_pk])         /* add currently max pk                    */
                                           FROM [Pew_Question_Std])            /* from StdQuestions                       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_abbreviation_std]  =          'SVYp_'                         /* add survey StdQ prefix pending          */
                                      +  RIGHT('00000'                         /* > add leading zeros - keep right digits */
                                      +  CAST                                  /*  > cast numeric value                   */
                                        ( (                                    /*    start casting code                   */
                                          (SELECT COUNT([Question_Std_pk])     /*    - count N of pk's                    */
                                             FROM [Pew_Question_Std]           /*      from StdQ table                    */
                                            WHERE [Question_abbreviation_std]  /*      filtering when QAbbStd             */
                                                    LIKE 'Svy%'              ) /*      starts as 'Svy'                    */
                                         + ROW_NUMBER()                        /*    - adding the rownumber               */
                                           OVER(ORDER BY [S])                  /*      sorted by QShortWdgStd             */
                                        )                    AS varchar(4))    /*  < cast as 4-char string                */
                                                                           ,4) /* < keepping right four characterss       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_wording_std]       = [L]                                      /* wording std as to be coded              */
      ,[Question_short_wording_std] = [S]                                      /* short wording std as to be displayed    */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Display]                    = 0                                        /* set display to zero (provisionally)     */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[AnswerSet_num]              = ( SELECT DISTINCT [AnswerSet_number]     /* pull distinct AnswerSet Number          */
                                          FROM [forum].[dbo].[Pew_Answer_Std]  /* from StdAnswer table                    */
                                         WHERE [Full_set_of_Answers] = [F]   ) /* filter using the known FullSet of Ans   */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Editorially_Checked]        = 'NO!'                                    /* label as not editorially checked        */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_Label_80Chars]     = NULL                                     /* leave mpty the 80Chars Label field      */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdQuestions)    */
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Question_Std]                                               /* check results in modified table         */
/**************************************************************************************************************************/
