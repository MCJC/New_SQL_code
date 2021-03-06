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
                INTO  [_bk_forum].[dbo].[Pew_Answer_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Answer_NoStd]'               )
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/*****                                              Store current max pk                                              *****/
/**************************************************************************************************************************/
  IF OBJECT_ID('tempdb..[#CMPK]') IS NOT NULL
  DROP TABLE            [#CMPK]
  SELECT * INTO         [#CMPK] FROM
                                    (SELECT MAX([Answer_pk]) AS [CMPK]         /* select currently max pk                 */
                                       FROM     [Pew_Answer_NoStd]      ) CM   /* from NoStdAnswers                       */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                        SECTION A: Store set of Qs-parameters as Common Table Expression                        *****/
/**************************************************************************************************************************/
WITH NSV AS                                                                    /* NewSet of Vals -common table expression */
/* select distinct * from                                                      --  select sttm. for testing Set of Values */
(                                                                              /*> Set of Vals: QWd+StdVal+NoStdVal+AnsWd */
        SELECT Q =  'RLS14all_chage1'
             , V =  0  
             , X =  0 
             , Y =  'LESS THAN YEAR OLD'


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  1  
             , X =  1 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  2  
             , X =  2 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  3  
             , X =  3 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  4  
             , X =  4 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  5  
             , X =  5 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  6  
             , X =  6 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  7  
             , X =  7 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  8  
             , X =  8 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  9  
             , X =  9 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  10  
             , X =  10 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  11  
             , X =  11 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  12  
             , X =  12 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  13  
             , X =  13 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  14  
             , X =  14 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  15  
             , X =  15 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  16  
             , X =  16 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  17  
             , X =  17 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chage1'
             , V =  99  
             , X =  99 
             , Y =  'DON''T KNOW/REFUSED'


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  0  
             , X =  0 
             , Y =  'LESS THAN YEAR OLD'


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  1  
             , X =  1 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  2  
             , X =  2 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  3  
             , X =  3 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  4  
             , X =  4 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  5  
             , X =  5 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  6  
             , X =  6 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  7  
             , X =  7 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  8  
             , X =  8 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  9  
             , X =  9 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  10  
             , X =  10 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  11  
             , X =  11 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  12  
             , X =  12 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  13  
             , X =  13 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  14  
             , X =  14 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  15  
             , X =  15 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  16  
             , X =  16 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  17  
             , X =  17 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageold'
             , V =  99  
             , X =  99 
             , Y =  'DON''T KNOW/REFUSED'


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  0  
             , X =  0 
             , Y =  'LESS THAN YEAR OLD'


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  1  
             , X =  1 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  2  
             , X =  2 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  3  
             , X =  3 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  4  
             , X =  4 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  5  
             , X =  5 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  6  
             , X =  6 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  7  
             , X =  7 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  8  
             , X =  8 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  9  
             , X =  9 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  10  
             , X =  10 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  11  
             , X =  11 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  12  
             , X =  12 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  13  
             , X =  13 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  14  
             , X =  14 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  15  
             , X =  15 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  16  
             , X =  16 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  17  
             , X =  17 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_chageyng'
             , V =  99  
             , X =  99 
             , Y =  'DON''T KNOW/REFUSED'


  UNION SELECT Q =  'RLS14all_chborn'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_chborn'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_chborn'
             , V =  99  
             , X =  9 
             , Y =  'Don''t know/refused'


  UNION SELECT Q =  'RLS14all_chchr'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_chchr'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_chchr'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t Know/Refused'


  UNION SELECT Q =  'RLS14all_chr'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_chr'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_chr'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_density'
             , V =  1  
             , X =  1 
             , Y =  'Lowest'


  UNION SELECT Q =  'RLS14all_density'
             , V =  2  
             , X =  2 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_density'
             , V =  3  
             , X =  3 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_density'
             , V =  4  
             , X =  4 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_density'
             , V =  5  
             , X =  5 
             , Y =  'Highest'


  UNION SELECT Q =  'RLS14all_educ'
             , V =  1  
             , X =  1 
             , Y =  'Less than high school (Grades 1-8 or no formal schooling)'


  UNION SELECT Q =  'RLS14all_educ'
             , V =  2  
             , X =  2 
             , Y =  'High school incomplete (Grades 9-11 or Grade 12 with NO diploma)'


  UNION SELECT Q =  'RLS14all_educ'
             , V =  3  
             , X =  3 
             , Y =  'High school graduate (Grade 12 with diploma or GED certificate)'


  UNION SELECT Q =  'RLS14all_educ'
             , V =  4  
             , X =  4 
             , Y =  'Some college, no degree (includes some community college)'


  UNION SELECT Q =  'RLS14all_educ'
             , V =  5  
             , X =  5 
             , Y =  'Two year associate degree from a college or university'


  UNION SELECT Q =  'RLS14all_educ'
             , V =  6  
             , X =  6 
             , Y =  'Four year college or university degree/Bachelor''s degree (e.g., BS, BA, AB)'


  UNION SELECT Q =  'RLS14all_educ'
             , V =  7  
             , X =  7 
             , Y =  'Some postgraduate or professional schooling, no postgraduate degree (e.g. some graduate school)'


  UNION SELECT Q =  'RLS14all_educ'
             , V =  8  
             , X =  8 
             , Y =  'Postgraduate or professional degree, including master''s, doctorate, medical or law degree (e.g., MA, MS, PhD, MD...)'


  UNION SELECT Q =  'RLS14all_educ'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_fert'
             , V =  0  
             , X =  0 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  1  
             , X =  1 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  2  
             , X =  2 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  3  
             , X =  3 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  4  
             , X =  4 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  5  
             , X =  5 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  6  
             , X =  6 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  7  
             , X =  7 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  8  
             , X =  8 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  9  
             , X =  9 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  10  
             , X =  10 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  11  
             , X =  11 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  12  
             , X =  12 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  13  
             , X =  13 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  14  
             , X =  14 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  15  
             , X =  15 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  17  
             , X =  17 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  18  
             , X =  18 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  19  
             , X =  19 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  20  
             , X =  20 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  21  
             , X =  21 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  22  
             , X =  22 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  23  
             , X =  23 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  25  
             , X =  25 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  30  
             , X =  30 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  31  
             , X =  31 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  32  
             , X =  32 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  33  
             , X =  33 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  34  
             , X =  34 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  35  
             , X =  35 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  43  
             , X =  43 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_fert'
             , V =  99  
             , X =  99 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_hh1'
             , V =  1  
             , X =  1 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh1'
             , V =  2  
             , X =  2 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh1'
             , V =  3  
             , X =  3 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh1'
             , V =  4  
             , X =  4 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh1'
             , V =  5  
             , X =  5 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh1'
             , V =  6  
             , X =  6 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh1'
             , V =  7  
             , X =  7 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh1'
             , V =  8  
             , X =  8 
             , Y =  '8 or more'


  UNION SELECT Q =  'RLS14all_hh1'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_hh3'
             , V =  1  
             , X =  1 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh3'
             , V =  2  
             , X =  2 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh3'
             , V =  3  
             , X =  3 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh3'
             , V =  4  
             , X =  4 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh3'
             , V =  5  
             , X =  5 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh3'
             , V =  6  
             , X =  6 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh3'
             , V =  7  
             , X =  7 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_hh3'
             , V =  8  
             , X =  8 
             , Y =  '8 or more'


  UNION SELECT Q =  'RLS14all_hh3'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_hisp'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_hisp'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_hisp'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_income2'
             , V =  1  
             , X =  1 
             , Y =  '150 to under $200,000'


  UNION SELECT Q =  'RLS14all_income2'
             , V =  2  
             , X =  2 
             , Y =  '200 to under $250,000'


  UNION SELECT Q =  'RLS14all_income2'
             , V =  3  
             , X =  3 
             , Y =  '250 to under $300,000 [OR]'


  UNION SELECT Q =  'RLS14all_income2'
             , V =  4  
             , X =  4 
             , Y =  '$300,000 or more'


  UNION SELECT Q =  'RLS14all_income2'
             , V =  99  
             , X =  99 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_lgbt'
             , V =  1  
             , X =  1 
             , Y =  'ONE, [+xtxtlgbt+]'


  UNION SELECT Q =  'RLS14all_lgbt'
             , V =  2  
             , X =  2 
             , Y =  'TWO, Straight, that is, not gay'


  UNION SELECT Q =  'RLS14all_lgbt'
             , V =  3  
             , X =  3 
             , Y =  'or THREE, bisexual?'


  UNION SELECT Q =  'RLS14all_lgbt'
             , V =  4  
             , X =  4 
             , Y =  '(VOL) Something else (SPECIFY)'


  UNION SELECT Q =  'RLS14all_lgbt'
             , V =  97  
             , X =  8 
             , Y =  '(VOL) Don''t know'


  UNION SELECT Q =  'RLS14all_lgbt'
             , V =  98  
             , X =  9 
             , Y =  '(VOL) Refused'


  UNION SELECT Q =  'RLS14all_qa1'
             , V =  1  
             , X =  1 
             , Y =  'Very happy'


  UNION SELECT Q =  'RLS14all_qa1'
             , V =  2  
             , X =  2 
             , Y =  'Pretty happy'


  UNION SELECT Q =  'RLS14all_qa1'
             , V =  3  
             , X =  3 
             , Y =  'Not too happy'


  UNION SELECT Q =  'RLS14all_qa1'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qa2a'
             , V =  1  
             , X =  1 
             , Y =  'Very satisfied'


  UNION SELECT Q =  'RLS14all_qa2a'
             , V =  2  
             , X =  2 
             , Y =  'Somewhat satisfied'


  UNION SELECT Q =  'RLS14all_qa2a'
             , V =  3  
             , X =  3 
             , Y =  'Somewhat dissatisfied'


  UNION SELECT Q =  'RLS14all_qa2a'
             , V =  4  
             , X =  4 
             , Y =  'Very dissatisfied'


  UNION SELECT Q =  'RLS14all_qa2a'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qa2b'
             , V =  1  
             , X =  1 
             , Y =  'Very satisfied'


  UNION SELECT Q =  'RLS14all_qa2b'
             , V =  2  
             , X =  2 
             , Y =  'Somewhat satisfied'


  UNION SELECT Q =  'RLS14all_qa2b'
             , V =  3  
             , X =  3 
             , Y =  'Somewhat dissatisfied'


  UNION SELECT Q =  'RLS14all_qa2b'
             , V =  4  
             , X =  4 
             , Y =  'Very dissatisfied'


  UNION SELECT Q =  'RLS14all_qa2b'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qb1a'
             , V =  1  
             , X =  1 
             , Y =  'Change for the better'


  UNION SELECT Q =  'RLS14all_qb1a'
             , V =  2  
             , X =  2 
             , Y =  'Change for the worse'


  UNION SELECT Q =  'RLS14all_qb1a'
             , V =  3  
             , X =  3 
             , Y =  'Hasn''t made much difference'


  UNION SELECT Q =  'RLS14all_qb1a'
             , V =  4  
             , X =  4 
             , Y =  '(VOL) Mixed changes'


  UNION SELECT Q =  'RLS14all_qb1a'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qb1b'
             , V =  1  
             , X =  1 
             , Y =  'Change for the better'


  UNION SELECT Q =  'RLS14all_qb1b'
             , V =  2  
             , X =  2 
             , Y =  'Change for the worse'


  UNION SELECT Q =  'RLS14all_qb1b'
             , V =  3  
             , X =  3 
             , Y =  'Hasn''t made much difference'


  UNION SELECT Q =  'RLS14all_qb1b'
             , V =  4  
             , X =  4 
             , Y =  '(VOL) Mixed changes'


  UNION SELECT Q =  'RLS14all_qb1b'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qb1c'
             , V =  1  
             , X =  1 
             , Y =  'Change for the better'


  UNION SELECT Q =  'RLS14all_qb1c'
             , V =  2  
             , X =  2 
             , Y =  'Change for the worse'


  UNION SELECT Q =  'RLS14all_qb1c'
             , V =  3  
             , X =  3 
             , Y =  'Hasn''t made much difference'


  UNION SELECT Q =  'RLS14all_qb1c'
             , V =  4  
             , X =  4 
             , Y =  '(VOL) Mixed changes'


  UNION SELECT Q =  'RLS14all_qb1c'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qb22'
             , V =  1  
             , X =  1 
             , Y =  'Strongly favor'


  UNION SELECT Q =  'RLS14all_qb22'
             , V =  2  
             , X =  2 
             , Y =  'Favor'


  UNION SELECT Q =  'RLS14all_qb22'
             , V =  3  
             , X =  3 
             , Y =  'Oppose'


  UNION SELECT Q =  'RLS14all_qb22'
             , V =  4  
             , X =  4 
             , Y =  'Strongly oppose'


  UNION SELECT Q =  'RLS14all_qb22'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qb2b'
             , V =  1  
             , X =  1 
             , Y =  'First Statement'


  UNION SELECT Q =  'RLS14all_qb2b'
             , V =  2  
             , X =  2 
             , Y =  'Second statement'


  UNION SELECT Q =  'RLS14all_qb2b'
             , V =  3  
             , X =  3 
             , Y =  '(VOL) Neither/Both equally'


  UNION SELECT Q =  'RLS14all_qb2b'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qb2d'
             , V =  1  
             , X =  1 
             , Y =  'First Statement'


  UNION SELECT Q =  'RLS14all_qb2d'
             , V =  2  
             , X =  2 
             , Y =  'Second statement'


  UNION SELECT Q =  'RLS14all_qb2d'
             , V =  3  
             , X =  3 
             , Y =  '(VOL) Neither/Both equally'


  UNION SELECT Q =  'RLS14all_qb2d'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qb30'
             , V =  1  
             , X =  1 
             , Y =  'Humans and other living things have evolved over time [OR]'


  UNION SELECT Q =  'RLS14all_qb30'
             , V =  2  
             , X =  2 
             , Y =  'Humans and other living things have existed in their present form since the beginning of time'


  UNION SELECT Q =  'RLS14all_qb30'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qb30b'
             , V =  1  
             , X =  1 
             , Y =  'Humans and other living things have evolved due to natural processes such as natural selection, OR'


  UNION SELECT Q =  'RLS14all_qb30b'
             , V =  2  
             , X =  2 
             , Y =  'A supreme being guided the evolution of living things for the purpose of creating humans and other life...'


  UNION SELECT Q =  'RLS14all_qb30b'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qf5'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_qf5'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_qf5'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t Know/Refused'


  UNION SELECT Q =  'RLS14all_qg3'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_qg3'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_qg3'
             , V =  3  
             , X =  8 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qg3'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t Know/Refused'


  UNION SELECT Q =  'RLS14all_qi3'
             , V =  1  
             , X =  1 
             , Y =  'Yes, did volunteer work in past seven days'


  UNION SELECT Q =  'RLS14all_qi3'
             , V =  2  
             , X =  2 
             , Y =  'No, did not do volunteer work in past seven days'


  UNION SELECT Q =  'RLS14all_qi3'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t Know/Refused'


  UNION SELECT Q =  'RLS14all_qi3b'
             , V =  1  
             , X =  1 
             , Y =  'Yes, volunteered mainly through church/other religious organization'


  UNION SELECT Q =  'RLS14all_qi3b'
             , V =  2  
             , X =  2 
             , Y =  'No, volunteering was not done mainly through church/other religious organization'


  UNION SELECT Q =  'RLS14all_qi3b'
             , V =  3  
             , X =  3 
             , Y =  '(VOL) Volunteered both through religious organization and in other way'


  UNION SELECT Q =  'RLS14all_qi3b'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t Know/Refused'


  UNION SELECT Q =  'RLS14all_qi4c'
             , V =  1  
             , X =  1 
             , Y =  'At least once a week'


  UNION SELECT Q =  'RLS14all_qi4c'
             , V =  2  
             , X =  2 
             , Y =  'Once or twice a month'


  UNION SELECT Q =  'RLS14all_qi4c'
             , V =  3  
             , X =  3 
             , Y =  'Several times a year'


  UNION SELECT Q =  'RLS14all_qi4c'
             , V =  4  
             , X =  4 
             , Y =  'Seldom'


  UNION SELECT Q =  'RLS14all_qi4c'
             , V =  5  
             , X =  5 
             , Y =  'Never'


  UNION SELECT Q =  'RLS14all_qi4c'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t Know/Refused'


  UNION SELECT Q =  'RLS14all_qi4d'
             , V =  1  
             , X =  1 
             , Y =  'At least once a week'


  UNION SELECT Q =  'RLS14all_qi4d'
             , V =  2  
             , X =  2 
             , Y =  'Once or twice a month'


  UNION SELECT Q =  'RLS14all_qi4d'
             , V =  3  
             , X =  3 
             , Y =  'Several times a year'


  UNION SELECT Q =  'RLS14all_qi4d'
             , V =  4  
             , X =  4 
             , Y =  'Seldom'


  UNION SELECT Q =  'RLS14all_qi4d'
             , V =  5  
             , X =  5 
             , Y =  'Never'


  UNION SELECT Q =  'RLS14all_qi4d'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t Know/Refused'


  UNION SELECT Q =  'RLS14all_qk10d'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_qk10d'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_qk10d'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t Know/Refused'


  UNION SELECT Q =  'RLS14all_qlan'
             , V =  1  
             , X =  1 
             , Y =  'English'


  UNION SELECT Q =  'RLS14all_qlan'
             , V =  2  
             , X =  2 
             , Y =  'Spanish'


  UNION SELECT Q =  'RLS14all_qm5a'
             , V =  1  
             , X =  1 
             , Y =  'Agree'


  UNION SELECT Q =  'RLS14all_qm5a'
             , V =  2  
             , X =  2 
             , Y =  'DISagree'


  UNION SELECT Q =  'RLS14all_qm5a'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qm5b'
             , V =  1  
             , X =  1 
             , Y =  'Agree'


  UNION SELECT Q =  'RLS14all_qm5b'
             , V =  2  
             , X =  2 
             , Y =  'DISagree'


  UNION SELECT Q =  'RLS14all_qm5b'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qm5d'
             , V =  1  
             , X =  1 
             , Y =  'Agree'


  UNION SELECT Q =  'RLS14all_qm5d'
             , V =  2  
             , X =  2 
             , Y =  'DISagree'


  UNION SELECT Q =  'RLS14all_qm5d'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qm5e'
             , V =  1  
             , X =  1 
             , Y =  'Agree'


  UNION SELECT Q =  'RLS14all_qm5e'
             , V =  2  
             , X =  2 
             , Y =  'DISagree'


  UNION SELECT Q =  'RLS14all_qm5e'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qm5f'
             , V =  1  
             , X =  1 
             , Y =  'Agree'


  UNION SELECT Q =  'RLS14all_qm5f'
             , V =  2  
             , X =  2 
             , Y =  'DISagree'


  UNION SELECT Q =  'RLS14all_qm5f'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qm5g'
             , V =  1  
             , X =  1 
             , Y =  'Agree'


  UNION SELECT Q =  'RLS14all_qm5g'
             , V =  2  
             , X =  2 
             , Y =  'DISagree'


  UNION SELECT Q =  'RLS14all_qm5g'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qp3'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_qp3'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_qp3'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1900  
             , X =  1900 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1922  
             , X =  1922 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1925  
             , X =  1925 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1926  
             , X =  1926 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1929  
             , X =  1929 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1930  
             , X =  1930 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1931  
             , X =  1931 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1935  
             , X =  1935 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1936  
             , X =  1936 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1937  
             , X =  1937 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1938  
             , X =  1938 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1939  
             , X =  1939 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1940  
             , X =  1940 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1941  
             , X =  1941 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1942  
             , X =  1942 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1943  
             , X =  1943 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1944  
             , X =  1944 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1945  
             , X =  1945 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1946  
             , X =  1946 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1947  
             , X =  1947 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1948  
             , X =  1948 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1949  
             , X =  1949 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1950  
             , X =  1950 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1951  
             , X =  1951 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1952  
             , X =  1952 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1953  
             , X =  1953 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1954  
             , X =  1954 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1955  
             , X =  1955 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1956  
             , X =  1956 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1957  
             , X =  1957 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1958  
             , X =  1958 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1959  
             , X =  1959 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1960  
             , X =  1960 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1961  
             , X =  1961 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1962  
             , X =  1962 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1963  
             , X =  1963 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1964  
             , X =  1964 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1965  
             , X =  1965 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1966  
             , X =  1966 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1967  
             , X =  1967 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1968  
             , X =  1968 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1969  
             , X =  1969 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1970  
             , X =  1970 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1971  
             , X =  1971 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1972  
             , X =  1972 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1973  
             , X =  1973 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1974  
             , X =  1974 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1975  
             , X =  1975 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1976  
             , X =  1976 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1977  
             , X =  1977 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1978  
             , X =  1978 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1979  
             , X =  1979 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1980  
             , X =  1980 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1981  
             , X =  1981 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1982  
             , X =  1982 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1983  
             , X =  1983 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1984  
             , X =  1984 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1985  
             , X =  1985 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1986  
             , X =  1986 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1987  
             , X =  1987 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1988  
             , X =  1988 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1989  
             , X =  1989 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1990  
             , X =  1990 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1991  
             , X =  1991 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1992  
             , X =  1992 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1993  
             , X =  1993 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1994  
             , X =  1994 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1995  
             , X =  1995 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1996  
             , X =  1996 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1997  
             , X =  1997 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1998  
             , X =  1998 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  1999  
             , X =  1999 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2000  
             , X =  2000 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2001  
             , X =  2001 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2002  
             , X =  2002 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2003  
             , X =  2003 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2004  
             , X =  2004 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2005  
             , X =  2005 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2006  
             , X =  2006 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2007  
             , X =  2007 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2008  
             , X =  2008 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2009  
             , X =  2009 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2010  
             , X =  2010 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2011  
             , X =  2011 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2012  
             , X =  2012 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2013  
             , X =  2013 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  2014  
             , X =  2014 
             , Y =  ''


  UNION SELECT Q =  'RLS14all_qp4'
             , V =  9999  
             , X =  9999 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qp99'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_qp99'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_qp99'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qpc1'
             , V =  1  
             , X =  1 
             , Y =  'Yes home telephone'


  UNION SELECT Q =  'RLS14all_qpc1'
             , V =  2  
             , X =  2 
             , Y =  'No home telephone'


  UNION SELECT Q =  'RLS14all_qpc1'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qpl1'
             , V =  1  
             , X =  1 
             , Y =  'Yes, have cell phone'


  UNION SELECT Q =  'RLS14all_qpl1'
             , V =  2  
             , X =  2 
             , Y =  'No, do not'


  UNION SELECT Q =  'RLS14all_qpl1'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_qpl1a'
             , V =  1  
             , X =  1 
             , Y =  'Yes, someone in household has cell phone'


  UNION SELECT Q =  'RLS14all_qpl1a'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_qpl1a'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'


  UNION SELECT Q =  'RLS14all_relcom3cat'
             , V =  1  
             , X =  1 
             , Y =  'High'


  UNION SELECT Q =  'RLS14all_relcom3cat'
             , V =  2  
             , X =  2 
             , Y =  'Medium'


  UNION SELECT Q =  'RLS14all_relcom3cat'
             , V =  3  
             , X =  3 
             , Y =  'Low'


  UNION SELECT Q =  'RLS14all_relcom3cat'
             , V =  99  
             , X =  9 
             , Y =  'DK/Ref'


  UNION SELECT Q =  'RLS14all_spchr'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_spchr'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_spchr'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t Know/Refused'


  UNION SELECT Q =  'RLS14all_sphisp'
             , V =  1  
             , X =  1 
             , Y =  'Yes'


  UNION SELECT Q =  'RLS14all_sphisp'
             , V =  2  
             , X =  2 
             , Y =  'No'


  UNION SELECT Q =  'RLS14all_sphisp'
             , V =  99  
             , X =  9 
             , Y =  '(VOL) Don''t know/Refused'



                                                                             ) /* <   Set of Values ends!                 */
/*   testset                                                                   --     alias for testing Set of Values     */
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/*****                                   SECTION B: Use the Common Table Expression                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
	INSERT INTO                                                                /* insert statement                        */
	               [Pew_Answer_NoStd]                                          /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* higher level select statement...        */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Answer_pk]          =   ROW_NUMBER()                                   /* number all rows                         */
                                OVER( ORDER BY [Qk], [X])                      /* sorted by Q_pk & NoStdAnsValue          */
                             + (SELECT     MAX([Answer_pk])                    /* add currently max pk                    */
                                  FROM         [Pew_Answer_NoStd])             /* from NoStdAnswers                       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Answer_value_NoStd] =  [X]                                             /* value coded in original dataset         */
      ,[Answer_Wording]     =  [Y]                                             /* wording exactly as original ValueLabel  */
      ,[Answer_Std_fk]      =  [SAk]                                           /* fk as StdAns_pk, pulled...              */
      ,[Question_fk]        =  [Qk]                                            /* fk as NoStdQ_pk, pulled...              */
/*------------------------------------------------------------------------------------------------------------------------*/
FROM   (                                                                       /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
         SELECT                                                                /* sub-query select statement...           */
/*------------------------------------------------------------------------------------------------------------------------*/
                 [Qk]       = ( SELECT [Question_pk]                           /* identify available Q_pk (curr unique)   */
                                  FROM [Pew_Question_NoStd]                    /* as presented in Std&NoStdQuestions view */
                                 WHERE [Question_abbreviation]       = [Q]   ) /* filter by corresponding Q_abbreviation  */
/*------------------------------------------------------------------------------------------------------------------------*/
               , [SAk]      = ( SELECT [Answer_Std_pk]                         /* identify corresponding A_pk             */
                                  FROM [Pew_Answer_Std]                        /* as stored in StdAnswers table           */
                                 WHERE [Answer_value_std]            = [V]     /* filter by already known StdValue...     */
                                 AND   [AnswerSet_number]            =         /* and by matching AnswerSetNum to...      */
                                     ( SELECT [AnswerSet_num]                  /*   identified available AnswerSetNum     */
                                         FROM [Pew_Question_NoStd]             /*   as presented in NoStdQs ...           */
                                         JOIN [Pew_Question_Std]               /*   joined to StdQs ...                   */
                                           ON [Question_Std_fk]                /*   matching the StqQ fk                  */
                                            = [Question_Std_pk]                /*   to the StqQ pk                        */
                                        WHERE [Question_abbreviation]= [Q] ) ) /*   filter by corresponding Q_abbrev      */
/*------------------------------------------------------------------------------------------------------------------------*/
      , *                                                                      /* all other variables in CTE              */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM [NSV]                                                                   /* from CTE (New Set of NoStdAnswers)      */
/*------------------------------------------------------------------------------------------------------------------------*/
                                                              )   AS NoStdAns  /* alias of sub-query                      */
/**************************************************************************************************************************/
GO


/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
SELECT                                                                         /* check results in modified table         */
         [Question_fk]
        ,[Answer_Std_fk]
        ,[Answer_value_NoStd]
        ,[Answer_Wording]
        ,[Answer_pk]
    FROM [Pew_Answer_NoStd]
       , [#CMPK]
   WHERE [Answer_pk]          > [CMPK]
ORDER BY 
         [Question_fk]
        ,[Answer_Std_fk]
/**************************************************************************************************************************/
SELECT   [c] =  COUNT(     DISTINCT
                           CAST([Answer_pk]          AS VARCHAR(MAX))
                       +   '|'
                       +   CAST([Answer_value_NoStd] AS VARCHAR(MAX))
                       +   '|'
                       +        [Answer_Wording]
                       +   '|'
                       +   CAST([Answer_Std_fk]      AS VARCHAR(MAX))
                       +   '|'
                       +   CAST([Question_fk]        AS VARCHAR(MAX))  )
        ,[K] = 'N_rows'
    FROM [Pew_Answer_NoStd]
       , [#CMPK]
   WHERE [Answer_pk]          > [CMPK]
UNION
  ALL
SELECT   [c] =  COUNT(          [Answer_pk]                            )
        ,[K] = 'N_NSApk'
    FROM [Pew_Answer_NoStd]
       , [#CMPK]
   WHERE [Answer_pk]          > [CMPK]
UNION
  ALL
SELECT   [c] =  COUNT(     DISTINCT
                           CAST([Answer_value_NoStd] AS VARCHAR(MAX))
                       +   '|'
                       +        [Answer_Wording]
                       +   '|'
                       +   CAST([Question_fk]        AS VARCHAR(MAX))  )
        ,[K] = 'N_      NSAV NSAW      NSQfk'
    FROM [Pew_Answer_NoStd]
       , [#CMPK]
   WHERE [Answer_pk]          > [CMPK]
UNION
  ALL
SELECT   [c] =  COUNT(     DISTINCT
                           CAST([Answer_value_NoStd] AS VARCHAR(MAX))
                       +   '|'
                       +   '|'
                       +   CAST([Question_fk]        AS VARCHAR(MAX))  )
        ,[K] = 'N_      NSAV           NSQfk'
    FROM [Pew_Answer_NoStd]
       , [#CMPK]
   WHERE [Answer_pk]          > [CMPK]
UNION
  ALL
SELECT   [c] =  COUNT(     DISTINCT
                           CAST([Answer_Std_fk]      AS VARCHAR(MAX))
                       +   '|'
                       +   CAST([Question_fk]        AS VARCHAR(MAX))  )
        ,[K] = 'N_                SAfk NSQfk'
    FROM [Pew_Answer_NoStd]
       , [#CMPK]
   WHERE [Answer_pk]          > [CMPK]
/**************************************************************************************************************************/
GO
