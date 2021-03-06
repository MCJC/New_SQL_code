/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
	USE [x_LoadRLS1cUS]                                                        /* use wkDB - just delete for final script */
--	USE [forum]                                                                /* use final database                      */
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar(15)                                                 /* declare variable to store current date  */
  SET     @CrDt = (  REPLACE(
                     REPLACE(
                     REPLACE(
                     CONVERT(VARCHAR(19), GETDATE(), 120)
                                                         ,'-','' )
                                                         ,' ','_')
                                                         ,':','' )  )          /* store date in format YYYYMMDD_hhmmss    */
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Std]'               )
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                              Store current max pk                                              *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#CMPK]') IS NOT NULL
  DROP TABLE            [#CMPK]
  SELECT * INTO         [#CMPK] FROM
                                    (SELECT MAX([Question_Std_pk]) AS [CMPK]   /* select currently max pk                 */
                                       FROM     [Pew_Question_Std]        ) CM /* from Std Answers                        */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: SQWdg + SQShWdg + FSetAns */
/*------------------------------------------------------------------------------------------------------------------------*/


SELECT
 L = 'If parent/guardian of one child: How old is this child?'
,S = 'How old is this your (only) child?'
,F = '0 to 96 & 97+ & DkRef'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'If parent/guardian of more than one child: How old is the oldest of these children?'
,S = 'How old is the oldest of your children?'
,F = '0 to 96 & 97+ & DkRef'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'If parent/guardian of more than one child: How old is the youngest of these children?'
,S = 'How old is the youngest of your children?'
,F = '0 to 96 & 97+ & DkRef'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Were you raised as a ''born-again'' or as an evangelical Christian, or not?'
,S = 'Were you raised as ''born-again'' or evangelical Christian?'
,F = '1.00: Yes   ||   2.00: No   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'What is the highest level of school you have completed or the highest degree you have received?'
,S = 'What is the highest level of school you have completed or the highest degree you have received?'
,F = '1.00: Less than high school (Grades 1-8 or no formal schooling)   ||   2.00: High school incomplete (Grades 9-11 or Grade 12 with NO diploma)   ||   3.00: High school graduate (Grade 12 with diploma or GED certificate)   ||   4.00: Some college, no degree (includes some community college)   ||   5.00: Two year associate degree from a college or university   ||   6.00: Four year college or university degree/Bachelor''s degree (e.g., BS, BA, AB)   ||   7.00: Some postgraduate or professional schooling, no postgraduate degree (e.g. some graduate school)   ||   8.00: Postgraduate or professional degree, including master''s, doctorate, medical or law degree (e.g., MA, MS, PhD, MD...)   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'How many children have you ever had? Please count all your biological children who were born alive at any time in your life.'
,S = 'How many children have you ever had?'
,F = '0 to 49 & 50+ & DkRef'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'How many people, including yourself, live in your household?'
,S = 'How many people, including yourself, live in your household?'
,F = '1.00: 1   ||   2.00: 2   ||   3.00: 3   ||   4.00: 4   ||   5.00: 5   ||   6.00: 6   ||   7.00: 7   ||   8.00: 8 or more   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'How many, including yourself (from those living in your household), are adults, age 18 and older?'
,S = 'How many, including yourself (from those living in your household), are adults, age 18 and older?'
,F = '1.00: 1   ||   2.00: 2   ||   3.00: 3   ||   4.00: 4   ||   5.00: 5   ||   6.00: 6   ||   7.00: 7   ||   8.00: 8 or more   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'If last year (2013) your total family income from all sources, before taxes exceeds $150,000: what was your total family income?'
,S = 'If last year (2013) your total family income from all sources, before taxes exceeds $150,000: what was your total family income?'
,F = '1.00: 150 to under $200,000   ||   2.00: 200 to under $250,000   ||   3.00: 250 to under $300,000   ||   4.00: $300,000 or more   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Do you personally think of yourself as ONE, [IF SEXASK=1: gay; FOR ALL OTHERS: gay or lesbian,] TWO, Straight, that is, not gay or THREE, bisexual?'
,S = 'Do you personally think of yourself as ONE, [IF SEXASK=1: gay; FOR ALL OTHERS: gay or lesbian,] TWO, Straight, that is, not gay or THREE, bisexual?'
,F = '1.00: Gay / Gay or lesbian,   ||   2.00: Straight, that is, not gay   ||   3.00: Bisexual   ||   4.00: Something else (vol.)   ||  97.00: Don''t know (vol.)   ||  98.00: Refused (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Generally, how would you say things are these days in your life - would you say that you are very happy, pretty happy, or not too happy?'
,S = 'Generally, how would you say things are these days in your life - would you say that you are very happy, pretty happy, or not too happy?'
,F = '1.00: Very happy   ||   2.00: Pretty happy   ||   3.00: Not too happy   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'And are you satisfied or dissatisfied with Your health. REQUIRED PROBE: Would you say you are VERY (dis)satisfied or SOMEWHAT (dis)satisfied?'
,S = 'Are you satisfied or dissatisfied with Your health. REQUIRED PROBE: Would you say you are VERY (dis)satisfied or SOMEWHAT (dis)satisfied?'
,F = '1.00: Very satisfied   ||   2.00: Somewhat satisfied   ||   3.00: Somewhat dissatisfied   ||   4.00: Very dissatisfied   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'How about a growing population of immigrants? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
,S = 'How about a growing population of immigrants? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
,F = '1.00: Change for the better   ||   2.00: Change for the worse   ||   3.00: Hasn''t made much difference   ||   4.00: Mixed changes (vol.)   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'How about More women in the workforce? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
,S = 'How about More women in the workforce? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
,F = '1.00: Change for the better   ||   2.00: Change for the worse   ||   3.00: Hasn''t made much difference   ||   4.00: Mixed changes (vol.)   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'How about More people having children without getting married? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
,S = 'How about More people having children without getting married? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
,F = '1.00: Change for the better   ||   2.00: Change for the worse   ||   3.00: Hasn''t made much difference   ||   4.00: Mixed changes (vol.)   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Do you strongly favor, favor, oppose or strongly oppose allowing gays and lesbians to marry legally?'
,S = 'Do you strongly favor, favor, oppose or strongly oppose allowing gays and lesbians to marry legally?'
,F = '1.00: Strongly favor   ||   2.00: Favor   ||   3.00: Oppose   ||   4.00: Strongly oppose   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Which statement comes closer to your own views —even if neither is exactly right: (1) Government aid to the poor does more harm than good, by making people too dependent on government assistance  OR  (2) Government aid to the poor does more good than harm, because people can’t get out of poverty until their basic needs are met'
,S = 'Which statement comes closer to your own views —even if neither is exactly right: (1) Government aid to the poor does more harm than good, by making people too dependent on government assistance  OR  (2) Government aid to the poor does more good than harm, because people can’t get out of poverty until their basic needs are met'
,F = '1.00: Government aid to the poor does more harm than good, by making people too dependent on government assistance   ||   2.00: Government aid to the poor does more good than harm, because people can’t get out of poverty until their basic needs are met   ||   3.00: Neither/Both equally (vol.)   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Which statement comes closer to your own views —even if neither is exactly right: (1) There are clear and absolute standards for what is right and wrong  OR  (2) Whether something is right or wrong often depends on the situation'
,S = 'Which statement comes closer to your own views —even if neither is exactly right: (1) There are clear and absolute standards for what is right and wrong  OR  (2) Whether something is right or wrong often depends on the situation'
,F = '1.00: There are clear and absolute standards for what is right and wrong   ||   2.00: Whether something is right or wrong often depends on the situation   ||   3.00: Neither/Both equally (vol.)   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'And do you think that  (1) Humans and other living things have evolved due to natural processes such as natural selection,  OR  (2) A supreme being guided the evolution of living things for the purpose of creating humans and other life in the form it exists today?'
,S = 'And do you think that  (1) Humans and other living things have evolved due to natural processes such as natural selection,  OR  (2) A supreme being guided the evolution of living things for the purpose of creating humans and other life in the form it exists today?'
,F = '1.00: Humans and other living things have evolved due to natural processes such as natural selection   ||   2.00: A supreme being guided the evolution of living things for the purpose of creating humans and other life in the form it exists today   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Are you personally a member of a local [synagogue/mosque/temple/church] or other house of worship, or not?'
,S = 'Are you personally a member of a local [synagogue/mosque/temple/church] or other house of worship, or not?'
,F = '1.00: Yes   ||   2.00: No   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Thinking specifically about just the past week, that is the past seven days - did you yourself happen to do any volunteer work in the last seven days, or not?'
,S = 'Thinking specifically about just the past week, that is the past seven days - did you yourself happen to do any volunteer work in the last seven days, or not?'
,F = '1.00: Yes, did volunteer work in past seven days   ||   2.00: No, did not do volunteer work in past seven days   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'If R did any volunteer work in the last seven days: And was that mainly through a church or other religious organization, or not? [INTERVIEWER INSTRUCTION: IF R SAYS THEY ONLY VOLUNTEERED THROUGH CHURCH/OTHER RELIGIOUS ORGANIZATION, RECORD AS CODE 1]'
,S = 'If R did any volunteer work in the last seven days: And was that mainly through a church or other religious organization, or not?'
,F = '1.00: Yes, volunteered mainly through church/other religious organization   ||   2.00: No, volunteering was not done mainly through church/other religious organization   ||   3.00: Volunteered both through religious organization and in other way (vol.)   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'How often do you... feel a strong sense of gratitude or thankfulness?'
,S = 'How often do you... feel a strong sense of gratitude or thankfulness?'
,F = '1.00: At least once a week   ||   2.00: Once or twice a month   ||   3.00: Several times a year   ||   4.00: Seldom   ||   5.00: Never   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'How often do you... think about the meaning and purpose of life?'
,S = 'How often do you... think about the meaning and purpose of life?'
,F = '1.00: At least once a week   ||   2.00: Once or twice a month   ||   3.00: Several times a year   ||   4.00: Seldom   ||   5.00: Never   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'As I read a list, please tell me if you do any of the following things: Do you and [your child/any of your children] do volunteer work together?'
,S = 'As I read a list, please tell me if you do any of the following things: Do you and [your child/any of your children] do volunteer work together?'
,F = '1.00: Yes   ||   2.00: No   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Focus too much on rules?'
,S = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Focus too much on rules?'
,F = '1.00: Agree   ||   2.00: Disagree   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations… Are too concerned with money and power'
,S = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations… Are too concerned with money and power'
,F = '1.00: Agree   ||   2.00: Disagree   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Are too involved with politics'
,S = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Are too involved with politics'
,F = '1.00: Agree   ||   2.00: Disagree   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Protect and strengthen morality in society'
,S = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Protect and strengthen morality in society'
,F = '1.00: Agree   ||   2.00: Disagree   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Bring people together and strengthen community bonds'
,S = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Bring people together and strengthen community bonds'
,F = '1.00: Agree   ||   2.00: Disagree   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations… Play an important role in helping the poor and needy'
,S = 'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations… Play an important role in helping the poor and needy'
,F = '1.00: Agree   ||   2.00: Disagree   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'In what year did you come to live in the U.S?'
,S = 'In what year did you come to live in the U.S?'
,F = 'Years 1900 - 2055'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Do you personally know anyone who is gay or lesbian, or not?'
,S = 'Do you personally know anyone who is gay or lesbian, or not?'
,F = '1.00: Yes   ||   2.00: No   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Does anyone in your household have a working cell phone?'
,S = 'Does anyone in your household have a working cell phone?'
,F = '1.00: Yes   ||   2.00: No   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'religious commitment - 3 categories'
,S = 'religious commitment - 3 categories'
,F = '1.00: High   ||   2.00: Medium   ||   3.00: Low   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/


UNION
SELECT
 L = 'Is your spouse/partner of Hispanic, Latino, or Spanish origin, such as Mexican, Puerto Rican or Cuban?-Includes SPRACE backcodes'
,S = 'Is your spouse/partner of Hispanic, Latino, or Spanish origin, such as Mexican, Puerto Rican or Cuban?-Includes SPRACE backcodes'
,F = '1.00: Yes   ||   2.00: No   ||  99.00: DK/Ref. (vol.)'


/*------------------------------------------------------------------------------------------------------------------------*/
)                                                                              /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
	INSERT INTO                                                                /* insert statement                        */
	               [Pew_Question_Std]                                          /* target table in current database        */
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
                                          FROM [Pew_Answer_Std]                /* from StdAnswer table                    */
                                         WHERE [Full_set_of_Answers] = [F]   ) /* filter using the known FullSet of Ans   */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Editorially_Checked]        = 'NO!'                                    /* label as not editorially checked        */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_Label_80Chars]     = NULL                                     /* leave mpty the 80Chars Label field      */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdQuestions)    */
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Question_Std] ORDER BY [Question_Std_pk] DESC               /* check results in modified table         */
SELECT * FROM [Pew_Question_Std]
            , [#CMPK]
        WHERE [Question_Std_pk]
            > [CMPK]
                                 ORDER BY [Question_Std_pk]                    /* check results in modified table         */
/**************************************************************************************************************************/
SELECT * FROM (                                                                /* check consistency of modified table     */
SELECT [c] = COUNT(DISTINCT [Question_Std_pk]            )
      ,[K] = 'QSpk'
  FROM [Pew_Question_Std]
 WHERE [Question_abbreviation_std] LIKE 'Svy%'
UNION
  ALL
SELECT [c] = COUNT(DISTINCT [Question_abbreviation_std]  )
      ,[K] = 'QAS'
  FROM [Pew_Question_Std]
 WHERE [Question_abbreviation_std] LIKE 'Svy%'
UNION
  ALL
SELECT [c] = COUNT(DISTINCT [Question_wording_std]       )
      ,[K] = 'QWS'
  FROM [Pew_Question_Std]
 WHERE [Question_abbreviation_std] LIKE 'Svy%'
UNION
  ALL
SELECT [c] = COUNT(DISTINCT [Question_short_wording_std] )
      ,[K] = 'QSWS - no need'
  FROM [Pew_Question_Std]
 WHERE [Question_abbreviation_std] LIKE 'Svy%'
                                                                           ) D /* END selection for numeric consistency   */
/**************************************************************************************************************************/
GO
