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
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                              Store current max pk                                              *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#CMPK]') IS NOT NULL
  DROP TABLE            [#CMPK]
  SELECT * INTO         [#CMPK] FROM
                                    (SELECT MAX([Question_pk]) AS [CMPK]       /* select currently max pk                 */
                                       FROM     [Pew_Question_NoStd]    ) CM   /* from NoStdQuestions                     */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
(                                                                              /*> Set of Vals: SQW+QAbb+QWdg+QY+QNt+DSN  */
  --      SELECT S =  'StdQWording      jk  (i=NoStd|j=Std|k=DS)'
        SELECT S =  'If parent/guardian of one child: How old is this child?'
             , A =  'RLS14all_chage1'
             , W =  'CHAGE1. How old is this child?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'If parent/guardian of more than one child: How old is the oldest of these children?'
             , A =  'RLS14all_chageold'
             , W =  'CHAGEOLD. How old is the oldest of these children?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'If parent/guardian of more than one child: How old is the youngest of these children?'
             , A =  'RLS14all_chageyng'
             , W =  'CHAGEYNG. How old is the youngest of these children?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Were you raised as a ''born-again'' or as an evangelical Christian, or not?'
             , A =  'RLS14all_chborn'
             , W =  'CLEANED version of CHBORN. Were you raised as a ''born-again'' or evangelical Christian, or not?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'And was that a Christian religion, or not?'
             , A =  'RLS14all_chchr'
             , W =  'CHCHR. And was that a Christian religion, or not?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Do you think of yourself as a Christian or not?'
             , A =  'RLS14all_chr'
             , W =  'CHR. Do you think of yourself as a Christian or not? [IF R NAMED A NON-CHRISTIAN RELIGION IN PREVIOUS QUESTION (e.g. Native American, Wiccan, Pagan, etc.), DO NOT READ (ENTER ''NO'' CODE 2)]'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'density (quintiles)'
             , A =  'RLS14all_density'
             , W =  'Density quintiles based on fips code from self-reported zipcode'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'What is the highest level of school you have completed or the highest degree you have received?'
             , A =  'RLS14all_educ'
             , W =  'EDUC. What is the highest level of school you have completed or the highest degree you have received?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'How many children have you ever had? Please count all your biological children who were born alive at any time in your life.'
             , A =  'RLS14all_fert'
             , W =  'FERT. How many children have you ever had? Please count all your biological children who were born alive at any time in your life. [INTERVIEWER NOTE: IF R ASKS WHETHER ADOPTED CHILDREN OR STEPCHILDREN SHOULD BE INCLUDED, SAY: No, we''re…]'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'How many people, including yourself, live in your household?'
             , A =  'RLS14all_hh1'
             , W =  'HH1. How many people, including yourself, live in your household? INTERVIEWER NOTE: HOUSEHOLD MEMBERS INCLUDE PEOPLE WHO THINK OF THIS HOUSEHOLD AS THEIR PRIMARY PLACE OF RESIDENCE]'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'How many, including yourself (from those living in your household), are adults, age 18 and older?'
             , A =  'RLS14all_hh3'
             , W =  'HH3. How many, including yourself, are adults, age 18 and older? [ENTER NUMBER]'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Are you, yourself, of Hispanic origin or descent, such as Mexican, Puerto Rican, Cuban, or some other Spanish background?'
             , A =  'RLS14all_hisp'
             , W =  'HISP. Are you of Hispanic, Latino, or Spanish origin, such as Mexican, Puerto Rican or Cuban? Includes RACE backcodes'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'If last year (2013) your total family income from all sources, before taxes exceeds $150,000: what was your total family income?'
             , A =  'RLS14all_income2'
             , W =  'INCOME2. And was that ?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Do you personally think of yourself as ONE, [IF SEXASK=1: gay; FOR ALL OTHERS: gay or lesbian,] TWO, Straight, that is, not gay or THREE, bisexual?'
             , A =  'RLS14all_lgbt'
             , W =  'LGBT. Do you personally think of yourself as [READ IN ORDER]?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Generally, how would you say things are these days in your life - would you say that you are very happy, pretty happy, or not too happy?'
             , A =  'RLS14all_qa1'
             , W =  'Q.A1. Generally, how would you say things are these days in your life - would you say that you are very happy, pretty happy, or not too happy?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Your family life…Next, please tell me how satisfied you are with the following things. How satisfied are you with… [INSERT; RANDOMIZE]?'
             , A =  'RLS14all_qa2a'
             , W =  'Q.A2. And are you satisfied or dissatisfied with Your family life. REQUIRED PROBE: Would you say you are VERY (dis)satisfied or SOMEWHAT (dis)satisfied?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'And are you satisfied or dissatisfied with Your health. REQUIRED PROBE: Would you say you are VERY (dis)satisfied or SOMEWHAT (dis)satisfied?'
             , A =  'RLS14all_qa2b'
             , W =  'Q.A2. And are you satisfied or dissatisfied with Your health. REQUIRED PROBE: Would you say you are VERY (dis)satisfied or SOMEWHAT (dis)satisfied?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'How about a growing population of immigrants? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
             , A =  'RLS14all_qb1a'
             , W =  'Q.B1a. How about A growing population of immigrants? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'How about More women in the workforce? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
             , A =  'RLS14all_qb1b'
             , W =  'Q.B1b. How about More women in the workforce? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'How about More people having children without getting married? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
             , A =  'RLS14all_qb1c'
             , W =  'Q.B1c. How about More people having children without getting married? [READ AS NECESSARY: Has this been a change for the better, a change for the worse, or hasn''t this made much difference?]'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Do you strongly favor, favor, oppose or strongly oppose allowing gays and lesbians to marry legally?'
             , A =  'RLS14all_qb22'
             , W =  'Q.B22. Do you strongly favor, favor, oppose or strongly oppose allowing gays and lesbians to marry legally?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Which statement comes closer to your own views —even if neither is exactly right: (1) Government aid to the poor does more harm than good, by making people too dependent on government assistance  OR  (2) Government aid to the poor does more good than harm, because people can’t get out of poverty until their basic needs are met'
             , A =  'RLS14all_qb2b'
             , W =  'Q.B2b. Gov''t aid to the poor does more harm than good, by making people too dependent on gov''t assistance OR Gov''t aid to the poor does more good than harm, because people can''t get out of poverty until their basic needs are met.'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Which statement comes closer to your own views —even if neither is exactly right: (1) There are clear and absolute standards for what is right and wrong  OR  (2) Whether something is right or wrong often depends on the situation'
             , A =  'RLS14all_qb2d'
             , W =  'Q.B2d. There are clear and absolute standards for what is right and wrong OR Whether something is right or wrong often depends on the situation.'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Thinking about evolution, which comes closer to your view? Humans and other living things have evolved over time, OR Humans and other living things have existed in their present form since the beginning of time.'
             , A =  'RLS14all_qb30'
             , W =  'Q.B30. Which comes closer to your view: Humans and other living things have evolved over time OR Humans and other living things have existed in their present form since the beginning of time?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'And do you think that  (1) Humans and other living things have evolved due to natural processes such as natural selection,  OR  (2) A supreme being guided the evolution of living things for the purpose of creating humans and other life in the form it exists today?'
             , A =  'RLS14all_qb30b'
             , W =  'Q.B30b. And do you think that (1) Humans and other living things have evolved due to natural processes such as natural selection,  OR  (2) A supreme being guided the evolution of living things for the purpose of creating humans and other life in the form it exists today?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Are you personally a member of a local [synagogue/mosque/temple/church] or other house of worship, or not?'
             , A =  'RLS14all_qf5'
             , W =  'Q.F5. Are you personally a member of a local [synagogue/mosque/temple/church] or other house of worship, or not?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Do you believe in reincarnation, that people will be reborn in this world again and again?'
             , A =  'RLS14all_qg3'
             , W =  'Q.G3. Do you believe in reincarnation, that people will be reborn in this world again and again?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Thinking specifically about just the past week, that is the past seven days - did you yourself happen to do any volunteer work in the last seven days, or not?'
             , A =  'RLS14all_qi3'
             , W =  'Q.I3. Thinking specifically about just the past week, that is the past seven days - did you yourself happen to do any volunteer work in the last seven days, or not?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'If R did any volunteer work in the last seven days: And was that mainly through a church or other religious organization, or not? [INTERVIEWER INSTRUCTION: IF R SAYS THEY ONLY VOLUNTEERED THROUGH CHURCH/OTHER RELIGIOUS ORGANIZATION, RECORD AS CODE 1]'
             , A =  'RLS14all_qi3b'
             , W =  'Q.I3b. And was that mainly through a church or other religious organization, or not? [INTERVIEWER INSTRUCTION: IF R SAYS THEY ONLY VOLUNTEERED THROUGH CHURCH/OTHER RELIGIOUS ORGANIZATION, RECORD AS CODE 1]'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'How often do you... feel a strong sense of gratitude or thankfulness?'
             , A =  'RLS14all_qi4c'
             , W =  'Q.I4c. How often do you... feel a strong sense of gratitude or thankfulness?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'How often do you... think about the meaning and purpose of life?'
             , A =  'RLS14all_qi4d'
             , W =  'Q.I4d. How often do you... think about the meaning and purpose of life?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'As I read a list, please tell me if you do any of the following things: Do you and [your child/any of your children] do volunteer work together?'
             , A =  'RLS14all_qk10d'
             , W =  'Q.K10d. As I read a list, please tell me if you do any of the following things with [your child/your children].) Next, do you d. And [your child/any of your children] do volunteer work together ?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Language of Interview'
             , A =  'RLS14all_qlan'
             , W =  'Select a language:'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Focus too much on rules?'
             , A =  'RLS14all_qm5a'
             , W =  'Q.M5a. Churches and other religious organizations...Focus too much on rules? (As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one.)'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations… Are too concerned with money and power'
             , A =  'RLS14all_qm5b'
             , W =  'Q.M5b. Churches and other religious organizations...Are too concerned with money and power? (As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one.)'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Are too involved with politics'
             , A =  'RLS14all_qm5d'
             , W =  'Q.M5d. Churches and other religious organizations...Are too involved with politics? (As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one.)'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Protect and strengthen morality in society'
             , A =  'RLS14all_qm5e'
             , W =  'Q.M5e. Churches and other religious organizations...Protect and strengthen morality in society? (As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one.)'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations... Bring people together and strengthen community bonds'
             , A =  'RLS14all_qm5f'
             , W =  'Q.M5f. Churches and other religious organizations...Bring people together and strengthen community bonds? (As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one.)'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one: Churches and other religious organizations… Play an important role in helping the poor and needy'
             , A =  'RLS14all_qm5g'
             , W =  'Q.M5g. Churches and other religious organizations...Play an important role in helping the poor and needy? (As I read a short list of statements about churches and other religious organizations, please tell me if you agree or DISagree with each one.)'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Are you currently a citizen of the United States, or not?'
             , A =  'RLS14all_qp3'
             , W =  'Q.P3. Are you currently a citizen of the United States, or not?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'In what year did you come to live in the U.S?'
             , A =  'RLS14all_qp4'
             , W =  'ORIGINAL value of qp4, for reference only - In what year did you come to live in the U.S'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Do you personally know anyone who is gay or lesbian, or not?'
             , A =  'RLS14all_qp99'
             , W =  'Q.P99. Do you personally know anyone who is gay or lesbian, or not?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Do you have a working landline telephone in your house, or not?'
             , A =  'RLS14all_qpc1'
             , W =  'Q.PC1. Now thinking about your telephone use. Is there at least one telephone INSIDE your home that is currently working and is not a cell phone?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Do you own a cell phone?'
             , A =  'RLS14all_qpl1'
             , W =  'Q.PL1. Now thinking about your telephone use. Do you have a working cell phone?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Does anyone in your household have a working cell phone?'
             , A =  'RLS14all_qpl1a'
             , W =  'Q.PL1a. Does anyone in your household have a working cell phone?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'religious commitment - 3 categories'
             , A =  'RLS14all_relcom3cat'
             , W =  'religious commitment - 3 categories'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'And is that a Christian religion, or not?'
             , A =  'RLS14all_spchr'
             , W =  'SPCHR. And is that a Christian religion, or not?'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'


  UNION SELECT S =  'Is your spouse/partner of Hispanic, Latino, or Spanish origin, such as Mexican, Puerto Rican or Cuban?-Includes SPRACE backcodes'
             , A =  'RLS14all_sphisp'
             , W =  'SPHISP. Is your spouse/partner of Hispanic, Latino, or Spanish origin, such as Mexican, Puerto Rican or Cuban?-Includes SPRACE backcodes'
             , Y =   2014 
             , N =  'question not labeled as comparable for RLS 2007 & 2014'
             , D =  'Religious Landscape Survey (2014)'





  --           , A =  'QAbbreviation   ijk  (i=NoStd|j=Std|k=DS)'
  --           , W =  'QWording        ijk  (i=NoStd|j=Std|k=DS)'
  --           , Y =   0000 -- QYr     ijk  (i=NoStd|j=Std|k=DS)
  --           , N =  'QNote           ijk  (i=NoStd|j=Std|k=DS)'
  --           , D =  'DataSourceName    k  (i=NoStd|j=Std|k=DS)'

  --UNION SELECT S =  'StdQWording      jk  (i=NoStd|j=Std|k=DS)'
  --           , A =  'QAbbreviation   ijk  (i=NoStd|j=Std|k=DS)'
  --           , W =  'QWording        ijk  (i=NoStd|j=Std|k=DS)'
  --           , Y =   0000 -- QYr     ijk  (i=NoStd|j=Std|k=DS)
  --           , N =  'QNote           ijk  (i=NoStd|j=Std|k=DS)'
  --           , D =  'DataSourceName    k  (i=NoStd|j=Std|k=DS)'
                                                                             ) /* <   Set of Values ends!                 */
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
	INSERT INTO                                                                /* insert statement                        */
	               [Pew_Question_NoStd]                                        /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* select statement...                     */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Question_pk]           =   ROW_NUMBER()                                /* number all rows                         */
                                   OVER( ORDER BY [Y], [A])                    /* sorted by year & answer wording (NoStd) */
                                + (SELECT     MAX([Question_pk])               /* add currently max pk                    */
                                     FROM         [Pew_Question_NoStd])        /* from NoStdQuestions                     */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_abbreviation] =  [A]                                          /* abbreviation form VarName in dataset    */
      ,[Question_wording]      =  [W]                                          /* wording exactly as VarLabel in dataset  */
      ,[Question_Year]         =  [Y]                                          /* as coded for the survey                 */
      ,[Notes]                 =  [N]                                          /* as decided for understanding questions  */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Data_source_fk]        =  ( SELECT [Data_source_pk]                    /* fk from the selected DataSource_pk      */
                                      FROM [Pew_Data_Source]                   /* as stored in the DataSource table       */
                                     WHERE [Data_source_name]           = [D]) /* filter by the corresponding DataSource  */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_Std_fk]       =  ( SELECT [Question_Std_pk]                   /* fk from the selected QStd_pk            */
                                      FROM [Pew_Question_Std]                  /* as stored in StdQuestions table         */
                                     WHERE [Question_wording_std]       = [S]) /* filtered by using the known QWdgStd     */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdQuestions)    */
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/*****                                      Store  Data_source_fk of loaded data                                      *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#DSFK]') IS NOT NULL
  DROP TABLE            [#DSFK]
  SELECT * INTO         [#DSFK] FROM
                                    (SELECT
                                     DISTINCT [Data_source_fk]        AS DSFK  /*distinct DataSource_fk                   */
                                         FROM [Pew_Question_NoStd]             /* from NoStdQuestions                     */
                                            , [#CMPK]
                                        WHERE [Question_pk] > [CMPK])      FK  /* select recently loaded data             */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 004                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Question_NoStd]                                             /* check results in modified table         */
            , [#CMPK]
        WHERE [Question_pk]         > [CMPK]
     ORDER BY [Question_pk]                                                    /* check results in modified table         */
/**************************************************************************************************************************/
SELECT 
              [check] = CASE
                            WHEN COUNT(*) 
                                 OVER(
                                 PARTITION BY [Question_Std_fk])
                                            = 1
                           THEN   ''
                           ELSE 'check'
                            END
            , *
         FROM [Pew_Question_NoStd]
            , [#DSFK]
        WHERE [Data_source_fk]      = [DSFK]
     ORDER BY [Question_Std_fk]
            , [Question_abbreviation]
            , [Question_pk]                                                    /* check results in modified table         */
/**************************************************************************************************************************/
SELECT * FROM (                                                                /* check consistency of modified table     */
SELECT [c] =  COUNT(DISTINCT  [Question_pk]            )
      ,[K] = 'N_Qpk'
  FROM [Pew_Question_NoStd]
     , [#DSFK]
WHERE 
       [Data_source_fk] = [DSFK]
UNION ALL
SELECT [c] =  COUNT(DISTINCT  [Question_abbreviation]  )
      ,[K] = 'N_NSQA'
  FROM [Pew_Question_NoStd]
     , [#DSFK]
WHERE 
       [Data_source_fk] = [DSFK]
UNION ALL
SELECT [c] =  COUNT(DISTINCT  [Question_wording]       )
      ,[K] = 'N_NSQW'
  FROM [Pew_Question_NoStd]
     , [#DSFK]
WHERE 
       [Data_source_fk] = [DSFK]
UNION ALL
SELECT [c] =  COUNT(DISTINCT  [Question_Std_fk]        )
      ,[K] = 'N_SQfk'
  FROM [Pew_Question_NoStd]
     , [#DSFK]
WHERE 
       [Data_source_fk] = [DSFK]
                                                                           ) D /* END selection for numeric consistency   */
/**************************************************************************************************************************/
GO
