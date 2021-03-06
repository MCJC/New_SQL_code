/**********************************************************************************************************************************************************/
/*****                                              BackUp current Tables                                                                             *****/
/**********************************************************************************************************************************************************/
  USE [forum]
GO
/**********************************************************************************************************************************************************/
  --DECLARE @CrDt    varchar( 8)
  --SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Answer_NoStd_' + @CrDt + ']
--                FROM      [forum].[dbo].[Pew_Answer_NoStd]'               )
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Nation_Answer_' + @CrDt + ']
--                FROM      [forum].[dbo].[Pew_Nation_Answer]'               )
/**********************************************************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID('tempdb..#CODE_A') IS NOT NULL   DROP TABLE #CODE_A
IF OBJECT_ID('tempdb..#CODE_B') IS NOT NULL   DROP TABLE #CODE_B
IF OBJECT_ID('tempdb..#CODE_C') IS NOT NULL   DROP TABLE #CODE_C
IF OBJECT_ID('tempdb..#CODE_X') IS NOT NULL   DROP TABLE #CODE_X
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
GO

/**********************************************************************************************************************************************************/
/*                                                                                                                                                        */
/*                                                  M  E  T  A  C  O  D  E           Q  U  E  R  I  E  S                                                  */
/*                                                                                                                                                        */
/**********************************************************************************************************************************************************/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-    CODE EXTRACTION QUERY FROM CORRECTIONS SPREADSHEET TYPE A: {  >0 to  0  }     ---------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT * INTO #CODE_A FROM (
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
 SELECT
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
[code3] =
'
DELETE
  FROM [Pew_Answer_NoStd]
  WHERE        [Answer_pk]                       = '   + CAST(cDB.[Answer_fk]     AS NVARCHAR(MAX))  + '
GO
'
,
[code4] =
'
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = '   + CAST(rA2.[Answer_pk]     AS NVARCHAR(MAX))  + '
  WHERE                     [Nation_answer_pk]   = '   + CAST(cDB.[link_fk]       AS NVARCHAR(MAX))  + '
GO
'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [clk_Nation_answer_pk]              =   clk.[Nation_answer_pk]
      , [clk_Nation_fk]                     =   clk.[Nation_fk]
      , [clk_Answer_fk]                     =   clk.[Answer_fk]
      , [clk_display]                       =   clk.[display]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [nuV_c]                             =   nuV.[c]
      , [nuV_y]                             =   nuV.[y]
      , [nuV_q]                             =   nuV.[q]
      , [nuV_v]                             =   nuV.[v]
      , [nuV_nv]                            =   nuV.[nv]
      , [nuV_nW]                            =   '------'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [cDB_entity]                        =   cDB.[entity]
      , [cDB_QA_fk]                         =   cDB.[QA_fk]
      , [cDB_link_fk]                       =   cDB.[link_fk]
      , [cDB_Nation_fk]                     =   cDB.[Nation_fk]
      , [cDB_Locality_fk]                   =   cDB.[Locality_fk]
      , [cDB_Religion_fk]                   =   cDB.[Religion_fk]
      , [cDB_Region5]                       =   cDB.[Region5]
      , [cDB_Region6]                       =   cDB.[Region6]
      , [cDB_Ctry_EditorialName]            =   cDB.[Ctry_EditorialName]
      , [cDB_Locality]                      =   cDB.[Locality]
      , [cDB_Religion]                      =   cDB.[Religion]
      , [cDB_Question_Year]                 =   cDB.[Question_Year]
      , [cDB_QA_std]                        =   cDB.[QA_std]
      , [cDB_QW_std]                        =   cDB.[QW_std]
      , [cDB_Answer_value]                  =   cDB.[Answer_value]
      , [cDB_Answer_value_Std]              =   cDB.[Answer_value_Std]
      , [cDB_Answer_value_NoStd]            =   cDB.[Answer_value_NoStd]
      , [cDB_answer_wording]                =   cDB.[answer_wording]
      , [cDB_answer_wording_std]            =   cDB.[answer_wording_std]
      , [cDB_Data_source_name]              =   cDB.[Data_source_name]
      , [cDB_Question_Std_fk]               =   cDB.[Question_Std_fk]
      , [cDB_Question_fk]                   =   cDB.[Question_fk]
      , [cDB_Answer_Std_fk]                 =   cDB.[Answer_Std_fk]
      , [cDB_Answer_fk]                     =   cDB.[Answer_fk]
      , [cDB_AnswerSet_number]              =   cDB.[AnswerSet_number]
      , [cDB_Question_wording_std]          =   cDB.[Question_wording_std]
      , [cDB_Question_wording]              =   cDB.[Question_wording]
      , [cDB_Question_abbreviation]         =   cDB.[Question_abbreviation]
      , [cDB_NA_by_set_of_Answers]          =   cDB.[NA_by_set_of_Answers]
      , [cDB_Full_set_of_Answers]           =   cDB.[Full_set_of_Answers]
      , [cDB_Display_by_StdQ]               =   cDB.[Display_by_StdQ]
      , [cDB_Display_by_NoSQ]               =   cDB.[Display_by_NoSQ]
      , [cDB_Display_by_Ans]                =   cDB.[Display_by_Ans]
      , [cDB_Editorially_Checked]           =   cDB.[Editorially_Checked]
      , [cDB_Notes]                         =   cDB.[Notes]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [rA2_Answer_pk]                     =   rA2.[Answer_pk]
      , [rA2_Answer_value_NoStd]            =   rA2.[Answer_value_NoStd]
      , [rA2_Answer_Wording]                =   rA2.[Answer_Wording]
      , [rA2_Answer_Std_fk]                 =   rA2.[Answer_Std_fk]
      , [rA2_Question_fk]                   =   rA2.[Question_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  FROM 
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
       [forum].[dbo].[Pew_Nation_Answer]                                                          clk
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     ,(
	          SELECT [c] = 'Thailand' , [y] = 2014, [q] = 'GRX_22_01' , [v] = '1',[nv] = 0 
      )                                                                                           nuV
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     , [forum_ResAnal].[dbo].[vr___01_cDB_Long__NoAggregated]                                     cDB
     , [forum].[dbo].[Pew_Answer_NoStd]                                                           rA2
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
WHERE
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        clk.[Nation_answer_pk]
      = cDB.[link_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     (      cDB.[Ctry_EditorialName]  = nuV.[c]
        AND cDB.[Question_Year]       = nuV.[y]
        AND cDB.[QA_std]              = nuV.[q]
        AND cDB.[Answer_value]        = nuV.[v]  )
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        cDB.[Question_fk]
      = rA2.[Question_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        nuV.[nv]
      = rA2.[Answer_value_NoStd]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                                                                                                                 ) QCODE_A
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/**********************************************************************************************************************************************************/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-    CODE EXTRACTION QUERY FROM CORRECTIONS SPREADSHEET TYPE B: {  >0 to >0  }     ---------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT * INTO #CODE_B FROM (
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
 SELECT
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
[code2] =
'
UPDATE [Pew_Answer_NoStd] 
    SET                     [Answer_value_NoStd] = '   + CAST(nuV.[nv]            AS NVARCHAR(MAX))  + '
                          , [Answer_Wording]     = ''' +      nuV.[nw]                               + '''
                          , [Answer_Std_fk]      = '   + CAST(sA1.[Answer_Std_pk] AS NVARCHAR(MAX))  + '
  WHERE        [Answer_pk]                       = '   + CAST(cDB.[Answer_fk]     AS NVARCHAR(MAX))  + '
GO
'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [clk_Nation_answer_pk]              =   clk.[Nation_answer_pk]
      , [clk_Nation_fk]                     =   clk.[Nation_fk]
      , [clk_Answer_fk]                     =   clk.[Answer_fk]
      , [clk_display]                       =   clk.[display]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [nuV_c]                             =   nuV.[c]
      , [nuV_y]                             =   nuV.[y]
      , [nuV_q]                             =   nuV.[q]
      , [nuV_v]                             =   nuV.[v]
      , [nuV_nv]                            =   nuV.[nv]
      , [nuV_nw]                            =   nuV.[nw]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [cDB_entity]                        =   cDB.[entity]
      , [cDB_QA_fk]                         =   cDB.[QA_fk]
      , [cDB_link_fk]                       =   cDB.[link_fk]
      , [cDB_Nation_fk]                     =   cDB.[Nation_fk]
      , [cDB_Locality_fk]                   =   cDB.[Locality_fk]
      , [cDB_Religion_fk]                   =   cDB.[Religion_fk]
      , [cDB_Region5]                       =   cDB.[Region5]
      , [cDB_Region6]                       =   cDB.[Region6]
      , [cDB_Ctry_EditorialName]            =   cDB.[Ctry_EditorialName]
      , [cDB_Locality]                      =   cDB.[Locality]
      , [cDB_Religion]                      =   cDB.[Religion]
      , [cDB_Question_Year]                 =   cDB.[Question_Year]
      , [cDB_QA_std]                        =   cDB.[QA_std]
      , [cDB_QW_std]                        =   cDB.[QW_std]
      , [cDB_Answer_value]                  =   cDB.[Answer_value]
      , [cDB_Answer_value_Std]              =   cDB.[Answer_value_Std]
      , [cDB_Answer_value_NoStd]            =   cDB.[Answer_value_NoStd]
      , [cDB_answer_wording]                =   cDB.[answer_wording]
      , [cDB_answer_wording_std]            =   cDB.[answer_wording_std]
      , [cDB_Data_source_name]              =   cDB.[Data_source_name]
      , [cDB_Question_Std_fk]               =   cDB.[Question_Std_fk]
      , [cDB_Question_fk]                   =   cDB.[Question_fk]
      , [cDB_Answer_Std_fk]                 =   cDB.[Answer_Std_fk]
      , [cDB_Answer_fk]                     =   cDB.[Answer_fk]
      , [cDB_AnswerSet_number]              =   cDB.[AnswerSet_number]
      , [cDB_Question_wording_std]          =   cDB.[Question_wording_std]
      , [cDB_Question_wording]              =   cDB.[Question_wording]
      , [cDB_Question_abbreviation]         =   cDB.[Question_abbreviation]
      , [cDB_NA_by_set_of_Answers]          =   cDB.[NA_by_set_of_Answers]
      , [cDB_Full_set_of_Answers]           =   cDB.[Full_set_of_Answers]
      , [cDB_Display_by_StdQ]               =   cDB.[Display_by_StdQ]
      , [cDB_Display_by_NoSQ]               =   cDB.[Display_by_NoSQ]
      , [cDB_Display_by_Ans]                =   cDB.[Display_by_Ans]
      , [cDB_Editorially_Checked]           =   cDB.[Editorially_Checked]
      , [cDB_Notes]                         =   cDB.[Notes]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [rA1_Answer_pk]                     =   rA1.[Answer_pk]
      , [rA1_Answer_value_NoStd]            =   rA1.[Answer_value_NoStd]
      , [rA1_Answer_Wording]                =   rA1.[Answer_Wording]
      , [rA1_Answer_Std_fk]                 =   rA1.[Answer_Std_fk]
      , [rA1_Question_fk]                   =   rA1.[Question_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [rQ1_Question_pk]                   =   rQ1.[Question_pk]
      , [rQ1_Question_abbreviation]         =   rQ1.[Question_abbreviation]
      , [rQ1_Question_wording]              =   rQ1.[Question_wording]
      , [rQ1_Question_Year]                 =   rQ1.[Question_Year]
      , [rQ1_Notes]                         =   rQ1.[Notes]
      , [rQ1_Display]                       =   rQ1.[Display]
      , [rQ1_Data_source_fk]                =   rQ1.[Data_source_fk]
      , [rQ1_Question_Std_fk]               =   rQ1.[Question_Std_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [sQ1_Question_Std_pk]               =   sQ1.[Question_Std_pk]
      , [sQ1_Question_abbreviation_std]     =   sQ1.[Question_abbreviation_std]
      , [sQ1_Question_wording_std]          =   sQ1.[Question_wording_std]
      , [sQ1_Question_short_wording_std]    =   sQ1.[Question_short_wording_std]
      , [sQ1_Display]                       =   sQ1.[Display]
      , [sQ1_AnswerSet_num]                 =   sQ1.[AnswerSet_num]
      , [sQ1_Editorially_Checked]           =   sQ1.[Editorially_Checked]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [sA1_Answer_Std_pk]                 =   sA1.[Answer_Std_pk]
      , [sA1_AnswerSet_number]              =   sA1.[AnswerSet_number]
      , [sA1_Answer_value_std]              =   sA1.[Answer_value_std]
      , [sA1_Answer_Wording_std]            =   sA1.[Answer_Wording_std]
      , [sA1_Full_set_of_Answers]           =   sA1.[Full_set_of_Answers]
      , [sA1_NA_by_set_of_Answers]          =   sA1.[NA_by_set_of_Answers]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  FROM 
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
       [forum].[dbo].[Pew_Nation_Answer]                                                          clk
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     ,(
	          SELECT [c] = 'Afghanistan' , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0.67',[nv] = 1       , [nw] = 'Abdullah tasked the Ministry of Interior and the Ministry of Culture to charge the English-language newspaper Afghan Express with blasphemy for publishing an article that reportedly questioned the existence of God. (USCIRF 2015) | Blasphemy and apostasy by Muslims are considered capital crimes. (FH 2015) | "There were no reported convictions for apostasy during the year." (IRF 2014)'
        UNION SELECT [c] = 'Yemen'       , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0.67',[nv] = 1       , [nw] = 'The constitution of Yemen declares Islam the state religion, and that Islamic law is the source of all legislation. The ''blasphemy'' laws prohibit ''ridicule'' of religion and apostasy—which includes ''denouncing Islam'', and for which a blasphemy conviction may constitute as evidence—is punishable with death. Article 194 of the penal code states: ''It is punishable by imprisonment not exceeding 3 years, and a fine, whoever: 1. Publicly broadcasts [or communicates] views including ridicule and contempt of religion, in its beliefs, practices, or teachings. 2. Whoever publicly incites contempt for people or communities, thus disturbing public peace.'' Denouncing Islam or converting from Islam to another religion is considered apostasy, which is a capital offence. The government does not enforce the death penalty for apostasy in practice: the law allows those charged with apostasy three opportunities to repent, which absolves them from the death penalty. (http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/yemen/)'
        UNION SELECT [c] = 'Afghanistan' , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0.67',[nv] = 1       , [nw] = 'Abdullah tasked the Ministry of Interior and the Ministry of Culture to charge the English-language newspaper Afghan Express with blasphemy for publishing an article that reportedly questioned the existence of God. (USCIRF 2015) | Blasphemy and apostasy by Muslims are considered capital crimes. (FH 2015) | "There were no reported convictions for apostasy during the year." (IRF 2014)'
        UNION SELECT [c] = 'Bahrain'     , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0.67',[nv] = 1       , [nw] = 'Blasphemy: The government arrested individuals on charges related to blasphemy and defamation of religion. (IRF 2014); Apostasy - "Societal pressure reinforced the constitution''s implication that Muslims were forbidden to change their religion." (IRF 2014)'
        UNION SELECT [c] = 'Poland'      , [y] = 2014, [q] = 'GRX_22_04' , [v] = '0.67',[nv] = 1       , [nw] = '“Whoever offends religious feelings of other people by publicly insulting an object of religious cult or a place for public holding of religious ceremonies, is subject to a fine, restriction of liberty or loss of liberty for up to 2 years” [Poland penal code]. (http://wbj.pl/blasphemy-law-ruled-constitutional/) | ""The Polish Constitution guarantees freedom of expression but in recent years several individuals, in particular artists and musicians, have found themselves subject to charges of blasphemy brought under Article 196 of the penal code, which allows Catholic clergy and activists to exert their influence in the public sphere: ''Anyone found guilty of offending religious feelings through public defamation of an object or place of worship is liable to a fine, restriction of liberty or a maximum two-year prison sentence''...Due to the focus on religious objects or places of worship, the use of religious symbols in different forms of art has led to many Article 196 cases (see below)...Although Article 196 does not protect any particular religion, in practice it is only used to investigate alleged insults against Christian religious symbols...Apostasy in Poland is an arduous process that requires a handwritten letter of resignation from the Catholic Church, provision of baptism certificate with an appropriate annotation, which is the sole document that can confirm official defection from the Church, the presence of two witnesses and at least two visits to the rector of the relevant parish."" (http://end-blasphemy-laws.org/countries/europe/poland/)'
      )                                                                                           nuV
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     , [forum_ResAnal].[dbo].[vr___01_cDB_Long__NoAggregated]                                     cDB
     , [forum].[dbo].[Pew_Answer_NoStd]                                                           rA1
     , [forum].[dbo].[Pew_Question_NoStd]                                                         rQ1
     , [forum].[dbo].[Pew_Question_Std]                                                           sQ1
     , [forum].[dbo].[Pew_Answer_Std]                                                             sA1
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
WHERE
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        clk.[Nation_answer_pk]
      = cDB.[link_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     (      cDB.[Ctry_EditorialName]  = nuV.[c]
        AND cDB.[Question_Year]       = nuV.[y]
        AND cDB.[QA_std]              = nuV.[q]
        AND cDB.[Answer_value]        = nuV.[v]  )
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        cDB.[Answer_fk]
      = rA1.[Answer_pk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        cDB.[Question_fk]
      = rQ1.[Question_pk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        cDB.[Question_Std_fk]
      = sQ1.[Question_Std_pk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        cDB.[AnswerSet_number]
      = sA1.[AnswerSet_number]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        nuV.[nv]
      = sA1.[Answer_value_std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                                                                                                                 ) QCODE_B
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/**********************************************************************************************************************************************************/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-    CODE EXTRACTION QUERY FROM CORRECTIONS SPREADSHEET TYPE C: {   0 to >0  }     ---------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT * INTO #CODE_C FROM (
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
 SELECT
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
[code4] =
'UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = '
+ CAST( 
                 ROW_NUMBER()OVER(ORDER BY cDB.[Question_Year], cDB.[Nation_fk], cDB.[QA_std])
                 + (SELECT MAX([Answer_pk]) FROM [Pew_Answer_NoStd])
  AS
  NVARCHAR(MAX))
+
'
  WHERE                     [Nation_answer_pk]   = '
+ CAST( 
                 cDB.[link_fk]
  AS
  NVARCHAR(MAX))
+ 
'
GO
'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [k]                                 =   ROW_NUMBER()
                                                OVER(ORDER BY
                                                cDB.[Question_Year]
                                               ,cDB.[Nation_fk]
                                               ,cDB.[QA_std]                  )
                                            + (     SELECT MAX([Answer_pk])
                                                      FROM [Pew_Answer_NoStd] )
      , [v]                                 =   nuV.[nV]
      , [w]                                 =   nuV.[nW]
      , [A]                                 =   sA1.[Answer_Std_pk]
      , [Q]                                 =   cDB.[Question_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [clk_Nation_answer_pk]              =   clk.[Nation_answer_pk]
      , [clk_Nation_fk]                     =   clk.[Nation_fk]
      , [clk_Answer_fk]                     =   clk.[Answer_fk]
      , [clk_display]                       =   clk.[display]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [nuV_c]                             =   nuV.[c]
      , [nuV_y]                             =   nuV.[y]
      , [nuV_q]                             =   nuV.[q]
      , [nuV_v]                             =   nuV.[v]
      , [nuV_nv]                            =   nuV.[nv]
      , [nuV_nw]                            =   nuV.[nw]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [cDB_entity]                        =   cDB.[entity]
      , [cDB_QA_fk]                         =   cDB.[QA_fk]
      , [cDB_link_fk]                       =   cDB.[link_fk]
      , [cDB_Nation_fk]                     =   cDB.[Nation_fk]
      , [cDB_Locality_fk]                   =   cDB.[Locality_fk]
      , [cDB_Religion_fk]                   =   cDB.[Religion_fk]
      , [cDB_Region5]                       =   cDB.[Region5]
      , [cDB_Region6]                       =   cDB.[Region6]
      , [cDB_Ctry_EditorialName]            =   cDB.[Ctry_EditorialName]
      , [cDB_Locality]                      =   cDB.[Locality]
      , [cDB_Religion]                      =   cDB.[Religion]
      , [cDB_Question_Year]                 =   cDB.[Question_Year]
      , [cDB_QA_std]                        =   cDB.[QA_std]
      , [cDB_QW_std]                        =   cDB.[QW_std]
      , [cDB_Answer_value]                  =   cDB.[Answer_value]
      , [cDB_Answer_value_Std]              =   cDB.[Answer_value_Std]
      , [cDB_Answer_value_NoStd]            =   cDB.[Answer_value_NoStd]
      , [cDB_answer_wording]                =   cDB.[answer_wording]
      , [cDB_answer_wording_std]            =   cDB.[answer_wording_std]
      , [cDB_Data_source_name]              =   cDB.[Data_source_name]
      , [cDB_Question_Std_fk]               =   cDB.[Question_Std_fk]
      , [cDB_Question_fk]                   =   cDB.[Question_fk]
      , [cDB_Answer_Std_fk]                 =   cDB.[Answer_Std_fk]
      , [cDB_Answer_fk]                     =   cDB.[Answer_fk]
      , [cDB_AnswerSet_number]              =   cDB.[AnswerSet_number]
      , [cDB_Question_wording_std]          =   cDB.[Question_wording_std]
      , [cDB_Question_wording]              =   cDB.[Question_wording]
      , [cDB_Question_abbreviation]         =   cDB.[Question_abbreviation]
      , [cDB_NA_by_set_of_Answers]          =   cDB.[NA_by_set_of_Answers]
      , [cDB_Full_set_of_Answers]           =   cDB.[Full_set_of_Answers]
      , [cDB_Display_by_StdQ]               =   cDB.[Display_by_StdQ]
      , [cDB_Display_by_NoSQ]               =   cDB.[Display_by_NoSQ]
      , [cDB_Display_by_Ans]                =   cDB.[Display_by_Ans]
      , [cDB_Editorially_Checked]           =   cDB.[Editorially_Checked]
      , [cDB_Notes]                         =   cDB.[Notes]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [sA1_Answer_Std_pk]                 =   sA1.[Answer_Std_pk]
      , [sA1_AnswerSet_number]              =   sA1.[AnswerSet_number]
      , [sA1_Answer_value_std]              =   sA1.[Answer_value_std]
      , [sA1_Answer_Wording_std]            =   sA1.[Answer_Wording_std]
      , [sA1_Full_set_of_Answers]           =   sA1.[Full_set_of_Answers]
      , [sA1_NA_by_set_of_Answers]          =   sA1.[NA_by_set_of_Answers]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  FROM 
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
       [forum].[dbo].[Pew_Nation_Answer]                                                          clk
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     ,(
              SELECT [c] = 'Brunei'         , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0',[nv] = 1, [nw] = '"In 2014, the State Mufti, Yang Berhormat PehinUdana Khatib Datu Seri Maharaja Dato Seri Setia Ustaz Hj Abdul AzizJuned, declared apostasy an offence punishable by death for any Muslims who choose to disassociate themselves from the faith. The State Mufti said that those who had made blasphemous statements or performed sacrilegious actions and had not repented would be liable for a death sentence." (http://end-blasphemy-laws.org/countries/asia-central-southern-and-south-eastern/brunei/) | "Since then, the first phase of sharia law, which include fines and prison sentences for ''crimes'' such as pregnancies outside of wedlock, propagating religions other than Islam, and not attending mandatory Friday prayers, has been rolled out. Brunei is currently in the process of implementing the second phase, which will introduce harsh punishments such as floggings and cutting off hands for property offenses...Last year, the Sultan of Brunei, Hassanal Bolikah, made headlines when he announced that he would impose sharia law (in three phases) in his Southeast Asian sultanate...The third and final phase, which will be implemented later this year or in 2016, will introduce executions, including stoning, for offenses like adultery, abortion, homosexuality/sodomy, and even blasphemy." (The Diplomat, May 2015 - http://thediplomat.com/2015/05/the-implications-of-bruneis-sharia-law/); See also:  http://www.bt.com.bn/news-national/2014/12/15/implementation-syariah-law#sthash.iZBHdfg2.dpbs'
        UNION SELECT [c] = 'India'          , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0',[nv] = 1, [nw] = '"Despite the famously secular constitution of the world’s largest democracy, concerns about Hindu nationalism and interreligious tension have risen under the presidency of Narendra Modi. Playing into this threat, ''blasphemy'' laws exist and are being increasingly used and cited. Section 295 of the Indian Penal Code criminalises insult to religion; it allows up to three years imprisonment and fines for ''whoever, with deliberate and malicious intention of outraging the religious feelings of any class of citizens of India, by words, either spoken or written, or by signs or by visible representations or otherwise, insults or attempts to insult the religion or the religious beliefs of a class.'' In addition, in 2011 the Indian Ministry of Communications and Information Technology issued new rules requiring operators of social media networks to screen and remove blasphemous content within 36 hours of receiving a complaint." (http://end-blasphemy-laws.org/countries/asia-central-southern-and-south-eastern/india/) | There are active “anti-conversion” laws in six of the 28 states: Gujarat, Odisha, Chhattisgarh, Madhya Pradesh, Himachal Pradesh, and Arunachal Pradesh. Arunachal Pradesh’s anti-conversion law is not implemented due to a continuing lack of enabling legislation. Authorities explain these laws as protective measures meant to shield vulnerable individuals from being induced to change their faith. For example, the Gujarat law proscribes religious conversions through “allurement, force, or fraud.” (IRF 2014)'
        UNION SELECT [c] = 'Iraq'           , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0',[nv] = 1, [nw] = '""A devastating series of incursions by terror group ''ISIS'' has caused major human rights violations from 2014, with militants targeting religious minorities including non-compliant Muslims and ‘apostates’. Iraq’s penal code prohibits “insult” to religious rituals, symbols or sacred persons and objects. Under Article 372 of the penal code: ''The following persons are punishable by a period of imprisonment not exceeding 3 years or by a fine not exceeding 300 dinars: Anyone who publicly abuses the beliefs of any religious community, or insults any of its rituals Anyone who publicly insults a symbol or person who constitutes an object of sanctification, glorification, and respect to a religious community.''" (http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/iraq/) | ""Government laws and regulations prevent the conversion of Muslims to other religions, require conversion of minor children to Islam if either parent converts to Islam, and outlaw the practice of some faiths. In the IKR there were several cases of single-Christian-parent families affected by the conversion policy. In some cases, the Christian parent fled with the minor children to avoid conversion of the children to Islam. The country’s civil and penal codes do not contain legal remedies or penalties for conversion from Islam."" (IRF 2014)'
        UNION SELECT [c] = 'Mauritania'     , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0',[nv] = 1, [nw] = 'SM Note: Under article 62 of the penal code, apostasy is explicitly penalized. (http://www.refworld.org/pdfid/491c1ffc2.pdf); Blasphemy could presumably be prosecuted under this code. See: http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/mauritania/'
        UNION SELECT [c] = 'Morocco'        , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0',[nv] = 1, [nw] = '"Article 220 of the penal code stipulates that ''anyone who employs incitements to shake the faith of a Muslim or to convert him to another religion'' incurs a sentence of 3 to 6 months’ imprisonment and a fine of 115 to 575 MAD. In practice, it is used against all religious minorities, as an excuse to interrupt religious meetings and rituals, and against apostates and converts, mostly Christians and non religious. Many foreign missionaries are declared as a danger and expelled from the country...A 2002 law restricting media freedom prohibits expression deemed critical of ''Islam, the institution of the monarchy, or territorial integrity.'' Such expression may be punishable by imprisonment...Apostasy is not a crime under civil or criminal law, however there is plenty of scope under blasphemy laws (see below) for apostates to be punished...In 2013 the council issued a fatwa ratifying the Shari’a ruling according to which any Muslim who abandons Islam should be executed, stipulating that the Islamic Law considers anyone born from a Muslim parents, or a Muslim father, as a Muslim, and prohibits apostasy and disbelief, and upon refusal of return to Islam, the Islamic sentence for apostasy must be applied." (http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/morocco-and-western-sahara/)'
        UNION SELECT [c] = 'Nigeria'        , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0',[nv] = 1, [nw] = '""Under the Customary system, applicable nationwide, ''blasphemy'' is prohibited under section 204 of the Criminal Code. Section 204, ''Insult to religion'', states: ''Any person who does an act which any class of persons consider as a public insult on their religion, with the intention that they should consider the act such an insult, and any person who does an unlawful act with the knowledge that any class of persons will consider it such an insult, is guilty of a misdemeanour, and is liable to imprisonment for two years.'' States subject to Sharia courts can and do implement severe punishments for crimes such as ''blasphemy'', including execution...In addition to handing down executions, predominantly Muslim states have frequently seen riots, violence and murder after blasphemy accusations, sometimes against individual Muslims accused, but with potential for wider violence when the accused is Christian."" (http://end-blasphemy-laws.org/countries/africa-sub-saharan/nigeria/) | Apostasy from 2013 coding: ""The Global Campaign to Stop Killing and Stoning Women and the Women Living Under Muslim Laws report of 1 March 2010, Stoning is Not Our Culture: A Comparative Analysis of Human Rights and Religious Discourses in Iran and Nigeria, observed: ''The present system of Shari''a in Nigeria has been described as political Shari''a? due to its concentration on hudud punishments. In each of the twelve northern states implementing Shari''a, the penal codes dictate fixed punishments for the hudud offenses of zina (including fornication, adultery, and same-sex sexual relations), rape, theft, robbery, drinking of alcohol, and apostasy. Other sanctions introduced by the expansion of Shari''a include retaliatory punishment (qisas) and monetary compensation for murder (diyeh)."" ( RefWOrld UK:Home Office, Country of Oirgin Information Report 2013 http://www.refworld.org/cgi-bin/texis/vtx/rwmain?page=search&docid=51bf06554&skip=0&publisher=UKHO&coi=NGA&advsearch=y&process=y&allwords=&exactphrase=apostasy&atleastone=&without=&title=&monthfrom=&yearfrom=&monthto=&yearto=&coa=&language=&citation=).  Aló The same USCIRF report noted further:  “Aggrieved parties have the right to appeal judgments to Shari’a appellate courts. The Highest appellate court for the Shari’a remains the Supreme Court, manned by common law judges who need not have, and do not usually possess any formal training in Shari’a criminal law. No state criminalized apostasy or penalized individuals for converting to another religion…In Zamfara State, a Shari’a court must hear all criminal cases involving Muslims. Other states, including Niger and Kano States, which utilize the Shari’a legal system, permit Muslims to choose common law courts for criminal cases. Civil society groups alleged that some Qadis apply harsher penalties in adultery and fornication cases against women than in commensurate cases against men and require stronger evidence to convict men than to convict women.” (Ref World UK: Home Office 9.06.2009 http://www.refworld.org/cgi-bin/texis/vtx/rwmain?page=search&docid=4a3662742&skip=0&publisher=UKHO&coi=NGA&advsearch=y&process=y&allwords=&exactphrase=apostasy&atleastone=&without=&title=&monthfrom=&yearfrom=&monthto=&yearto=&coa=&language=&citation=).'
        UNION SELECT [c] = 'Poland'         , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0',[nv] = 1, [nw] = '“Whoever offends religious feelings of other people by publicly insulting an object of religious cult or a place for public holding of religious ceremonies, is subject to a fine, restriction of liberty or loss of liberty for up to 2 years” [Poland penal code]. (http://wbj.pl/blasphemy-law-ruled-constitutional/) | ""The Polish Constitution guarantees freedom of expression but in recent years several individuals, in particular artists and musicians, have found themselves subject to charges of blasphemy brought under Article 196 of the penal code, which allows Catholic clergy and activists to exert their influence in the public sphere: ''Anyone found guilty of offending religious feelings through public defamation of an object or place of worship is liable to a fine, restriction of liberty or a maximum two-year prison sentence''...Due to the focus on religious objects or places of worship, the use of religious symbols in different forms of art has led to many Article 196 cases (see below)...Although Article 196 does not protect any particular religion, in practice it is only used to investigate alleged insults against Christian religious symbols...Apostasy in Poland is an arduous process that requires a handwritten letter of resignation from the Catholic Church, provision of baptism certificate with an appropriate annotation, which is the sole document that can confirm official defection from the Church, the presence of two witnesses and at least two visits to the rector of the relevant parish."" (http://end-blasphemy-laws.org/countries/europe/poland/)'
        UNION SELECT [c] = 'Tunisia'        , [y] = 2014, [q] = 'GRX_22_01' , [v] = '0',[nv] = 1, [nw] = 'Blasphemy: "The penal code criminalizes speech likely ''to cause harm to the public order or public morals.'' Another provision of the penal code criminalizes undermining public morals by ''intentionally disturbing other persons in a way that offends the sense of public decency.'' The telecommunications code criminalizes ''harming others or disrupting their lives through public communication networks.'' Speech that is deemed offensive to traditional religious values, including speech deemed blasphemous, is prosecuted under these provisions. […] There were reports of abuses of religious freedom during the year. The government occasionally prosecuted individuals for speech that it deemed blasphemous or offensive to the country’s Islamic norms." (IRF 2014)'
        UNION SELECT [c] = 'India'          , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = '"Despite the famously secular constitution of the world’s largest democracy, concerns about Hindu nationalism and interreligious tension have risen under the presidency of Narendra Modi. Playing into this threat, ''blasphemy'' laws exist and are being increasingly used and cited. Section 295 of the Indian Penal Code criminalises insult to religion; it allows up to three years imprisonment and fines for ''whoever, with deliberate and malicious intention of outraging the religious feelings of any class of citizens of India, by words, either spoken or written, or by signs or by visible representations or otherwise, insults or attempts to insult the religion or the religious beliefs of a class.'' In addition, in 2011 the Indian Ministry of Communications and Information Technology issued new rules requiring operators of social media networks to screen and remove blasphemous content within 36 hours of receiving a complaint." (http://end-blasphemy-laws.org/countries/asia-central-southern-and-south-eastern/india/) | There are active “anti-conversion” laws in six of the 28 states: Gujarat, Odisha, Chhattisgarh, Madhya Pradesh, Himachal Pradesh, and Arunachal Pradesh. Arunachal Pradesh’s anti-conversion law is not implemented due to a continuing lack of enabling legislation. Authorities explain these laws as protective measures meant to shield vulnerable individuals from being induced to change their faith. For example, the Gujarat law proscribes religious conversions through “allurement, force, or fraud.” (IRF 2014)'
        UNION SELECT [c] = 'Iraq'           , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = '""A devastating series of incursions by terror group ''ISIS'' has caused major human rights violations from 2014, with militants targeting religious minorities including non-compliant Muslims and ‘apostates’. Iraq’s penal code prohibits “insult” to religious rituals, symbols or sacred persons and objects. Under Article 372 of the penal code: ''The following persons are punishable by a period of imprisonment not exceeding 3 years or by a fine not exceeding 300 dinars: Anyone who publicly abuses the beliefs of any religious community, or insults any of its rituals… Anyone who publicly insults a symbol or person who constitutes an object of sanctification, glorification, and respect to a religious community.''"" (http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/iraq/) | ""Government laws and regulations prevent the conversion of Muslims to other religions, require conversion of minor children to Islam if either parent converts to Islam, and outlaw the practice of some faiths. In the IKR there were several cases of single-Christian-parent families affected by the conversion policy. In some cases, the Christian parent fled with the minor children to avoid conversion of the children to Islam. The country’s civil and penal codes do not contain legal remedies or penalties for conversion from Islam."" (IRF 2014)'
        UNION SELECT [c] = 'Kuwait'         , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = '"There are laws against blasphemy, apostasy, and proselytizing, and the government enforces them. The government, however, financially supports Sunni Muslims who proselytize foreign residents." (IRF 2014)'
        UNION SELECT [c] = 'Maldives'       , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = '"The government interprets the conversion by a Muslim to another religion as a violation of Islamic law, which could result in punishment, including loss of the convert’s citizenship. There are no known cases of the goverbnment discovering converts and rescinding their citizenship." (IRF 2014) | "The constitution prohibits utterances contrary to tenets of Islam or the government’s religious policies. The law limits a citizen’s right to freedom of expression in order to protect the ''basic tenets of Islam'' and prohibits criticism of the government’s policies on religion." (HRR 2014)'
        UNION SELECT [c] = 'Mauritania'     , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = 'SM Note: Under article 62 of the penal code, apostasy is explicitly penalized. (http://www.refworld.org/pdfid/491c1ffc2.pdf); Blasphemy could presumably be prosecuted under this code. See: http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/mauritania/'
        UNION SELECT [c] = 'Morocco'        , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = '"Article 220 of the penal code stipulates that ''anyone who employs incitements to shake the faith of a Muslim or to convert him to another religion'' incurs a sentence of 3 to 6 months’ imprisonment and a fine of 115 to 575 MAD. In practice, it is used against all religious minorities, as an excuse to interrupt religious meetings and rituals, and against apostates and converts, mostly Christians and non religious. Many foreign missionaries are declared as a danger and expelled from the country...A 2002 law restricting media freedom prohibits expression deemed critical of ''Islam, the institution of the monarchy, or territorial integrity.'' Such expression may be punishable by imprisonment...Apostasy is not a crime under civil or criminal law, however there is plenty of scope under blasphemy laws (see below) for apostates to be punished...In 2013 the council issued a fatwa ratifying the Shari’a ruling according to which any Muslim who abandons Islam should be executed, stipulating that the Islamic Law considers anyone born from a Muslim parents, or a Muslim father, as a Muslim, and prohibits apostasy and disbelief, and upon refusal of return to Islam, the Islamic sentence for apostasy must be applied." (http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/morocco-and-western-sahara/)'
        UNION SELECT [c] = 'Nigeria'        , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = '""Under the Customary system, applicable nationwide, ''blasphemy'' is prohibited under section 204 of the Criminal Code. Section 204, ''Insult to religion'', states:''Any person who does an act which any class of persons consider as a public insult on their religion, with the intention that they should consider the act such an insult, and any person who does an unlawful act with the knowledge that any class of persons will consider it such an insult, is guilty of a misdemeanour, and is liable to imprisonment for two years.'' States subject to Sharia courts can and do implement severe punishments for crimes such as ''blasphemy'', including execution...In addition to handing down executions, predominantly Muslim states have frequently seen riots, violence and murder after blasphemy accusations, sometimes against individual Muslims accused, but with potential for wider violence when the accused is Christian."" (http://end-blasphemy-laws.org/countries/africa-sub-saharan/nigeria/) | Apostasy from 2013 coding: ""The Global Campaign to Stop Killing and Stoning Women and the Women Living Under Muslim Laws report of 1 March 2010, Stoning is Not Our Culture: A Comparative Analysis of Human Rights and Religious Discourses in Iran and Nigeria, observed: ''The present system of Shari''a in Nigeria has been described as political Shari''a? due to its concentration on hudud punishments. In each of the twelve northern states implementing Shari''a, the penal codes dictate fixed punishments for the hudud offenses of zina (including fornication, adultery, and same-sex sexual relations), rape, theft, robbery, drinking of alcohol, and apostasy. Other sanctions introduced by the expansion of Shari''a include retaliatory punishment (qisas) and monetary compensation for murder (diyeh)."" ( RefWOrld UK:Home Office, Country of Oirgin Information Report 2013 http://www.refworld.org/cgi-bin/texis/vtx/rwmain?page=search&docid=51bf06554&skip=0&publisher=UKHO&coi=NGA&advsearch=y&process=y&allwords=&exactphrase=apostasy&atleastone=&without=&title=&monthfrom=&yearfrom=&monthto=&yearto=&coa=&language=&citation=). The same USCIRF report noted further: “Aggrieved parties have the right to appeal judgments to Shari’a appellate courts. The Highest appellate court for the Shari’a remains the Supreme Court, manned by common law judges who need not have, and do not usually possess any formal training in Shari’a criminal law. No state criminalized apostasy or penalized individuals for converting to another religion…In Zamfara State, a Shari’a court must hear all criminal cases involving Muslims. Other states, including Niger and Kano States, which utilize the Shari’a legal system, permit Muslims to choose common law courts for criminal cases. Civil society groups alleged that some Qadis apply harsher penalties in adultery and fornication cases against women than in commensurate cases against men and require stronger evidence to convict men than to convict women.” (Ref World UK: Home Office 9.06.2009 http://www.refworld.org/cgi-bin/texis/vtx/rwmain?page=search&docid=4a3662742&skip=0&publisher=UKHO&coi=NGA&advsearch=y&process=y&allwords=&exactphrase=apostasy&atleastone=&without=&title=&monthfrom=&yearfrom=&monthto=&yearto=&coa=&language=&citation=).'
        UNION SELECT [c] = 'Oman'           , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = '"Apostasy is not a criminal or civil offense, but the Personal Status and Family Legal Code prohibits a father who converts from Islam from retaining paternal rights over his children...The law also prescribes a maximum three-year sentence and fine of 500 rials ($1,300) for anyone who “publicly blasphemes God or His prophets,” commits an affront to religious groups by spoken or written word, or breaches the peace of a lawful religious gathering." (IRF 2014)'
        UNION SELECT [c] = 'Pakistan'       , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = '"Section 295-C of Pakistan’s penal code makes the death penalty mandatory for blasphemy, although no one has yet been executed for the crime.." (HRW 2015) | For more  blasphemy examples see: http://end-blasphemy-laws.org/countries/asia-central-southern-and-south-eastern/pakistan/ | Apostasy: "The marriages of non-Muslim men remain legal upon conversion to Islam. If a non-Muslim woman converts to Islam and her marriage was performed according to her previous religious beliefs, the government considers the marriage dissolved. Children born to non-Muslim women who convert to Islam after marriage to a non-Muslim man are considered illegitimate, and therefore ineligible for inheritance. The only way to legitimize the marriage, and render the children legitimate, is for the husband also to convert to Islam. The children of a Muslim man and a Muslim woman who both convert to another religious group are considered illegitimate, and the government may take custody of the children." (IRF 2014)'
        UNION SELECT [c] = 'Syria'          , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = '"The government restricts proselytizing and conversion. The government prohibits the conversion of Muslims to other religions, since this is deemed contrary to sharia. The government does not permit conversion from Islam to Christianity, but does recognize Christian converts to Islam. The penal code prohibits ''causing tension between religious communities.'' [...] A Muslim woman may not legally marry a Christian man, but a Christian woman may legally marry a Muslim man. If a Christian woman marries a Muslim man, she is not allowed to be buried in a Muslim cemetery unless she converts to Islam. If a person wishes to convert from Christianity to Islam, the law states that the presiding Muslim cleric must inform the prospective convert’s diocese." (IRF 2014)'
        UNION SELECT [c] = 'Western Sahara' , [y] = 2014, [q] = 'GRX_22_02' , [v] = '0',[nv] = 1, [nw] = 'SM Note: Follows Morocco coding'
        UNION SELECT [c] = 'Oman'           , [y] = 2014, [q] = 'GRX_22_03' , [v] = '0',[nv] = 1, [nw] = '"Apostasy is not a criminal or civil offense, but the Personal Status and Family Legal Code prohibits a father who converts from Islam from retaining paternal rights over his children...The law also prescribes a maximum three-year sentence and fine of 500 rials ($1,300) for anyone who “publicly blasphemes God or His prophets,” commits an affront to religious groups by spoken or written word, or breaches the peace of a lawful religious gathering." (IRF 2014)'
        UNION SELECT [c] = 'Pakistan'       , [y] = 2014, [q] = 'GRX_22_03' , [v] = '0',[nv] = 1, [nw] = '"Section 295-C of Pakistan’s penal code makes the death penalty mandatory for blasphemy, although no one has yet been executed for the crime.." (HRW 2015) | For more  blasphemy examples see: http://end-blasphemy-laws.org/countries/asia-central-southern-and-south-eastern/pakistan/ | Apostasy: "The marriages of non-Muslim men remain legal upon conversion to Islam. If a non-Muslim woman converts to Islam and her marriage was performed according to her previous religious beliefs, the government considers the marriage dissolved. Children born to non-Muslim women who convert to Islam after marriage to a non-Muslim man are considered illegitimate, and therefore ineligible for inheritance. The only way to legitimize the marriage, and render the children legitimate, is for the husband also to convert to Islam. The children of a Muslim man and a Muslim woman who both convert to another religious group are considered illegitimate, and the government may take custody of the children." (IRF 2014)'
        UNION SELECT [c] = 'Burma (Myanmar)', [y] = 2014, [q] = 'GRX_22_04' , [v] = '0',[nv] = 1, [nw] = 'Criticism: "The government took actions against individuals whose actions were construed to be insulting to religion. On December 17, authorities arrested Htin Lin Oo, a member of the National League for Democracy (NLD), for insulting religion, which could result in a maximum three-year prison term. Htin Lin Oo gave a speech in October in which he criticized extremist interpretations of Buddhism. The NLD subsequently stripped him of his membership." (IRF 2014) | A New Zealander and two Burmese men have been found guilty of insulting religion in Myanmar over a poster promoting a drinks event depicting Buddha with headphones. Philip Blackwood, who managed the VGastro Bar in Yangon, was arrested in December along with bar owner Tun Thurein and colleague Htut Ko Ko Lwin. They have each been sentenced to two and a half years in jail. Burmese law makes it illegal to insult or damage any religion. (HRWF 2015)'
        UNION SELECT [c] = 'Germany'        , [y] = 2014, [q] = 'GRX_22_04' , [v] = '0',[nv] = 1, [nw] = 'German criminal law - Section 166 - ""Defamation of religions, religious and ideological associations: (1) Whosoever publicly or through dissemination of written materials (section 11(3)) defames the religion or ideology of others in a manner that is capable of disturbing the public peace, shall be liable to imprisonment not exceeding three years or a fine. (2) Whosoever publicly or through dissemination of written materials (section 11(3)) defames a church or other religious or ideological association within Germany, or their institutions or customs in a manner that is capable of disturbing the public peace, shall incur the same penalty."" (https://www.gesetze-im-internet.de/englisch_stgb/englisch_stgb.html)'
        UNION SELECT [c] = 'India'          , [y] = 2014, [q] = 'GRX_22_04' , [v] = '0',[nv] = 1, [nw] = '"Despite the famously secular constitution of the world’s largest democracy, concerns about Hindu nationalism and interreligious tension have risen under the presidency of Narendra Modi. Playing into this threat, ''blasphemy'' laws exist and are being increasingly used and cited. Section 295 of the Indian Penal Code criminalises insult to religion; it allows up to three years imprisonment and fines for ''whoever, with deliberate and malicious intention of outraging the religious feelings of any class of citizens of India, by words, either spoken or written, or by signs or by visible representations or otherwise, insults or attempts to insult the religion or the religious beliefs of a class.'' In addition, in 2011 the Indian Ministry of Communications and Information Technology issued new rules requiring operators of social media networks to screen and remove blasphemous content within 36 hours of receiving a complaint." (http://end-blasphemy-laws.org/countries/asia-central-southern-and-south-eastern/india/) | There are active “anti-conversion” laws in six of the 28 states: Gujarat, Odisha, Chhattisgarh, Madhya Pradesh, Himachal Pradesh, and Arunachal Pradesh. Arunachal Pradesh’s anti-conversion law is not implemented due to a continuing lack of enabling legislation. Authorities explain these laws as protective measures meant to shield vulnerable individuals from being induced to change their faith. For example, the Gujarat law proscribes religious conversions through “allurement, force, or fraud.” (IRF 2014)'
        UNION SELECT [c] = 'Iraq'           , [y] = 2014, [q] = 'GRX_22_04' , [v] = '0',[nv] = 1, [nw] = '""A devastating series of incursions by terror group ''ISIS'' has caused major human rights violations from 2014, with militants targeting religious minorities including non-compliant Muslims and ‘apostates’. Iraq’s penal code prohibits “insult” to religious rituals, symbols or sacred persons and objects. Under Article 372 of the penal code: ''The following persons are punishable by a period of imprisonment not exceeding 3 years or by a fine not exceeding 300 dinars: Anyone who publicly abuses the beliefs of any religious community, or insults any of its rituals… Anyone who publicly insults a symbol or person who constitutes an object of sanctification, glorification, and respect to a religious community.''"" (http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/iraq/) | ""Government laws and regulations prevent the conversion of Muslims to other religions, require conversion of minor children to Islam if either parent converts to Islam, and outlaw the practice of some faiths. In the IKR there were several cases of single-Christian-parent families affected by the conversion policy. In some cases, the Christian parent fled with the minor children to avoid conversion of the children to Islam. The country’s civil and penal codes do not contain legal remedies or penalties for conversion from Islam."" (IRF 2014)'
        UNION SELECT [c] = 'Mauritania'     , [y] = 2014, [q] = 'GRX_22_04' , [v] = '0',[nv] = 1, [nw] = 'SM Note: Under article 62 of the penal code, apostasy is explicitly penalized. (http://www.refworld.org/pdfid/491c1ffc2.pdf); Blasphemy could presumably be prosecuted under this code. See: http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/mauritania/'
        UNION SELECT [c] = 'Nigeria'        , [y] = 2014, [q] = 'GRX_22_04' , [v] = '0',[nv] = 1, [nw] = '""Under the Customary system, applicable nationwide, ''blasphemy'' is prohibited under section 204 of the Criminal Code. Section 204, ''Insult to religion'', states:''Any person who does an act which any class of persons consider as a public insult on their religion, with the intention that they should consider the act such an insult, and any person who does an unlawful act with the knowledge that any class of persons will consider it such an insult, is guilty of a misdemeanour, and is liable to imprisonment for two years.'' States subject to Sharia courts can and do implement severe punishments for crimes such as ''blasphemy'', including execution...In addition to handing down executions, predominantly Muslim states have frequently seen riots, violence and murder after blasphemy accusations, sometimes against individual Muslims accused, but with potential for wider violence when the accused is Christian."" (http://end-blasphemy-laws.org/countries/africa-sub-saharan/nigeria/) | Apostasy from 2013 coding: ""The Global Campaign to Stop Killing and Stoning Women and the Women Living Under Muslim Laws report of 1 March 2010, Stoning is Not Our Culture: A Comparative Analysis of Human Rights and Religious Discourses in Iran and Nigeria, observed: ''The present system of Shari''a in Nigeria has been described as political Shari''a? due to its concentration on hudud punishments. In each of the twelve northern states implementing Shari''a, the penal codes dictate fixed punishments for the hudud offenses of zina (including fornication, adultery, and same-sex sexual relations), rape, theft, robbery, drinking of alcohol, and apostasy. Other sanctions introduced by the expansion of Shari''a include retaliatory punishment (qisas) and monetary compensation for murder (diyeh)."" ( RefWOrld UK:Home Office, Country of Oirgin Information Report 2013 http://www.refworld.org/cgi-bin/texis/vtx/rwmain?page=search&docid=51bf06554&skip=0&publisher=UKHO&coi=NGA&advsearch=y&process=y&allwords=&exactphrase=apostasy&atleastone=&without=&title=&monthfrom=&yearfrom=&monthto=&yearto=&coa=&language=&citation=). The same USCIRF report noted further: “Aggrieved parties have the right to appeal judgments to Shari’a appellate courts. The Highest appellate court for the Shari''a remains the Supreme Court, manned by common law judges who need not have, and do not usually possess any formal training in Shari’a criminal law. No state criminalized apostasy or penalized individuals for converting to another religion…In Zamfara State, a Shari’a court must hear all criminal cases involving Muslims. Other states, including Niger and Kano States, which utilize the Shari’a legal system, permit Muslims to choose common law courts for criminal cases. Civil society groups alleged that some Qadis apply harsher penalties in adultery and fornication cases against women than in commensurate cases against men and require stronger evidence to convict men than to convict women.” (Ref World UK: Home Office 9.06.2009 http://www.refworld.org/cgi-bin/texis/vtx/rwmain?page=search&docid=4a3662742&skip=0&publisher=UKHO&coi=NGA&advsearch=y&process=y&allwords=&exactphrase=apostasy&atleastone=&without=&title=&monthfrom=&yearfrom=&monthto=&yearto=&coa=&language=&citation=).'
        UNION SELECT [c] = 'Pakistan'       , [y] = 2014, [q] = 'GRX_22_04' , [v] = '0',[nv] = 1, [nw] = '"Section 295-C of Pakistan’s penal code makes the death penalty mandatory for blasphemy, although no one has yet been executed for the crime.." (HRW 2015) | For more  blasphemy examples see: http://end-blasphemy-laws.org/countries/asia-central-southern-and-south-eastern/pakistan/ | Apostasy: "The marriages of non-Muslim men remain legal upon conversion to Islam. If a non-Muslim woman converts to Islam and her marriage was performed according to her previous religious beliefs, the government considers the marriage dissolved. Children born to non-Muslim women who convert to Islam after marriage to a non-Muslim man are considered illegitimate, and therefore ineligible for inheritance. The only way to legitimize the marriage, and render the children legitimate, is for the husband also to convert to Islam. The children of a Muslim man and a Muslim woman who both convert to another religious group are considered illegitimate, and the government may take custody of the children." (IRF 2014)'
        UNION SELECT [c] = 'Syria'          , [y] = 2014, [q] = 'GRX_22_04' , [v] = '0',[nv] = 1, [nw] = '"The government restricts proselytizing and conversion. The government prohibits the conversion of Muslims to other religions, since this is deemed contrary to sharia. The government does not permit conversion from Islam to Christianity, but does recognize Christian converts to Islam. The penal code prohibits ''causing tension between religious communities.'' [...] A Muslim woman may not legally marry a Christian man, but a Christian woman may legally marry a Muslim man. If a Christian woman marries a Muslim man, she is not allowed to be buried in a Muslim cemetery unless she converts to Islam. If a person wishes to convert from Christianity to Islam, the law states that the presiding Muslim cleric must inform the prospective convert’s diocese." (IRF 2014)'
        UNION SELECT [c] = 'Western Sahara' , [y] = 2014, [q] = 'GRX_22_04' , [v] = '0',[nv] = 1, [nw] = 'SM Note: Follows Morocco coding'
      )                                                                                           nuV
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     , [forum_ResAnal].[dbo].[vr___01_cDB_Long__NoAggregated]                                     cDB
     , [forum].[dbo].[Pew_Answer_Std]                                                             sA1
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
WHERE
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        clk.[Nation_answer_pk]
      = cDB.[link_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     (      cDB.[Ctry_EditorialName]  = nuV.[c]
        AND cDB.[Question_Year]       = nuV.[y]
        AND cDB.[QA_std]              = nuV.[q]
        AND cDB.[Answer_value]        = nuV.[v]  )
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        cDB.[AnswerSet_number]
      = sA1.[AnswerSet_number]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        nuV.[nv]
      = sA1.[Answer_value_std]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                                                                                                                 ) QCODE_C
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/**********************************************************************************************************************************************************/
/**********************************************************************************************************************************************************/
    SELECT [code4] 
      INTO [#CODE_X]
      FROM (
                   SELECT [code4] FROM [#CODE_A]
            UNION
              ALL
                   SELECT [code4] FROM [#CODE_C]
           ) A_AND_C
/**********************************************************************************************************************************************************/
declare @ALLCODE nvarchar(max)
/**********************************************************************************************************************************************************/
set     @ALLCODE = 
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'
/*  THIS IS THE CODE TO BE EXECUTED                                                             */

/*  1.    CHANGES IN [Pew_Answer_NoStd]                                                         */
/*  1.1.  ADD ROWS COORESPONDING TO NEW NO-STD ANSWERS (not coded before)                       */

INSERT
  INTO [Pew_Answer_NoStd]
SELECT
                            [Answer_pk]          = [k]
                           ,[Answer_value_NoStd] = [v]
                           ,[Answer_Wording]     = [w]
                           ,[Answer_Std_fk]      = [A]
                           ,[Question_fk]        = [Q]
  FROM                       #CODE_C
GO

/*  1.2.  CHANGE NON-ZERO NO-STD ANSWERS TO DIFFERENT NON-ZERO VALUES                           */

'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
(                                                                                /*** parenthesis to include query for the cell to be stuffed           ***/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view ********************************************************/
    SELECT [code2] FROM [#CODE_B]                                                /*** selection statemet                                                ***/
                   for xml path('')                                              /*** nesting all selected cells into a unique XML string cell          ***/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields **********************************************************************/
, type).value('.', 'nvarchar(max)')                                              /*** parenth + datatype & escaped whitespace chs (avoids XML datatype) ***/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'

/*  1.3.  DELETE ROWS COORESPONDING TO NON-ZERO NO-STD ANSWERS WHICH ARE NOT NEEDED ANY MORE    */

'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
(                                                                                /*** parenthesis to include query for the cell to be stuffed           ***/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view ********************************************************/
    SELECT [code3] FROM [#CODE_A]                                                /*** selection statemet                                                ***/
                   for xml path('')                                              /*** nesting all selected cells into a unique XML string cell          ***/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields **********************************************************************/
, type).value('.', 'nvarchar(max)')                                              /*** parenth + datatype & escaped whitespace chs (avoids XML datatype) ***/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'

/*  2.    CHANGES IN [Pew_Nation_Answer]                                                         */
/*  2.1.  CHANGE ANSWER TO ADDED ANSWERS OR ZERO VALUES (non-zero to non-zero keep answer key)  */

'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
(                                                                                /*** parenthesis to include query for the cell to be stuffed           ***/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view ********************************************************/
    SELECT [code4] FROM [#CODE_X]                                                /*** selection statement                                               ***/
                   for xml path('')                                              /*** nesting all selected cells into a unique XML string cell          ***/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields **********************************************************************/
, type).value('.', 'nvarchar(max)')                                              /*** parenth + datatype & escaped whitespace chs (avoids XML datatype) ***/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'
/*  THE CODE TO BE EXECUTED ENDS HERE !!!                                                       */
'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
/*** checking / executing SQL statement that has been stored as a string variable ******************************************************************************/
	EXEC dbo.LongPrint @ALLCODE                                     /***        display the currently stored code (to be executed)                           ***/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--	EXEC              (@ALLCODE)                                    /***        execute the code that has been stored as text                                ***/
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
----SELECT * FROM  #CODE_A
----SELECT * FROM  #CODE_B
----SELECT * FROM  #CODE_C
/***************************************************************************************************************************************************************/

(1 row(s) affected)

(5 row(s) affected)

(30 row(s) affected)

(31 row(s) affected)

/*  THIS IS THE CODE TO BE EXECUTED                                                             */

/*  1.    CHANGES IN [Pew_Answer_NoStd]                                                         */
/*  1.1.  ADD ROWS COORESPONDING TO NEW NO-STD ANSWERS (not coded before)                       */

INSERT
  INTO [Pew_Answer_NoStd]
SELECT
                            [Answer_pk]          = [k]
                           ,[Answer_value_NoStd] = [v]
                           ,[Answer_Wording]     = [w]
                           ,[Answer_Std_fk]      = [A]
                           ,[Question_fk]        = [Q]
  FROM                       #CODE_C
GO

/*  1.2.  CHANGE NON-ZERO NO-STD ANSWERS TO DIFFERENT NON-ZERO VALUES                           */


UPDATE [Pew_Answer_NoStd] 
    SET                     [Answer_value_NoStd] = 1
                          , [Answer_Wording]     = 'Abdullah tasked the Ministry of Interior and the Ministry of Culture to charge the English-language newspaper Afghan Express with blasphemy for publishing an article that reportedly questioned the existence of God. (USCIRF 2015) | Blasphemy and apostasy by Muslims are considered capital crimes. (FH 2015) | "There were no reported convictions for apostasy during the year." (IRF 2014)'
                          , [Answer_Std_fk]      = 10095
  WHERE        [Answer_pk]                       = 34815
GO

UPDATE [Pew_Answer_NoStd] 
    SET                     [Answer_value_NoStd] = 1
                          , [Answer_Wording]     = 'The constitution of Yemen declares Islam the state religion, and that Islamic law is the source of all legislation. The ''blasphemy'' laws prohibit ''ridicule'' of religion and apostasy—which includes ''denouncing Islam'', and for which a blasphemy conviction may constitute as evidence—is punishable with death. Article 194 of the penal code states: ''It is punishable by imprisonment not exceeding 3 years, and a fine, whoever: 1. Publicly broadcasts [or communicates] views including ridicule and contempt of religion, in its beliefs, practices, or teachings. 2. Whoever publicly incites contempt for people or communities, thus disturbing public peace.'' Denouncing Islam or converting from Islam to another religion is considered apostasy, which is a capital offence. The government does not enforce the death penalty for apostasy in practice: the law allows those charged with apostasy three opportunities to repent, which absolves them from the death penalty. (http://end-blasphemy-laws.org/countries/middle-east-and-north-africa/yemen/)'
                          , [Answer_Std_fk]      = 10095
  WHERE        [Answer_pk]                       = 34816
GO

UPDATE [Pew_Answer_NoStd] 
    SET                     [Answer_value_NoStd] = 1
                          , [Answer_Wording]     = 'Blasphemy: The government arrested individuals on charges related to blasphemy and defamation of religion. (IRF 2014); Apostasy - "Societal pressure reinforced the constitution''s implication that Muslims were forbidden to change their religion." (IRF 2014)'
                          , [Answer_Std_fk]      = 10095
  WHERE        [Answer_pk]                       = 34847
GO

UPDATE [Pew_Answer_NoStd] 
    SET                     [Answer_value_NoStd] = 1
                          , [Answer_Wording]     = 'Abdullah tasked the Ministry of Interior and the Ministry of Culture to charge the English-language newspaper Afghan Express with blasphemy for publishing an article that reportedly questioned the existence of God. (USCIRF 2015) | Blasphemy and apostasy by Muslims are considered capital crimes. (FH 2015) | "There were no reported convictions for apostasy during the year." (IRF 2014)'
                          , [Answer_Std_fk]      = 10095
  WHERE        [Answer_pk]                       = 34850
GO

UPDATE [Pew_Answer_NoStd] 
    SET                     [Answer_value_NoStd] = 1
                          , [Answer_Wording]     = '“Whoever offends religious feelings of other people by publicly insulting an object of religious cult or a place for public holding of religious ceremonies, is subject to a fine, restriction of liberty or loss of liberty for up to 2 years” [Poland penal code]. (http://wbj.pl/blasphemy-law-ruled-constitutional/) | ""The Polish Constitution guarantees freedom of expression but in recent years several individuals, in particular artists and musicians, have found themselves subject to charges of blasphemy brought under Article 196 of the penal code, which allows Catholic clergy and activists to exert their influence in the public sphere: ''Anyone found guilty of offending religious feelings through public defamation of an object or place of worship is liable to a fine, restriction of liberty or a maximum two-year prison sentence''...Due to the focus on religious objects or places of worship, the use of religious symbols in different forms of art has led to many Article 196 cases (see below)...Although Article 196 does not protect any particular religion, in practice it is only used to investigate alleged insults against Christian religious symbols...Apostasy in Poland is an arduous process that requires a handwritten letter of resignation from the Catholic Church, provision of baptism certificate with an appropriate annotation, which is the sole document that can confirm official defection from the Church, the presence of two witnesses and at least two visits to the rector of the relevant parish."" (http://end-blasphemy-laws.org/countries/europe/poland/)'
                          , [Answer_Std_fk]      = 10095
  WHERE        [Answer_pk]                       = 34935
GO


/*  1.3.  DELETE ROWS COORESPONDING TO NON-ZERO NO-STD ANSWERS WHICH ARE NOT NEEDED ANY MORE    */


DELETE
  FROM [Pew_Answer_NoStd]
  WHERE        [Answer_pk]                       = 34830
GO


/*  2.    CHANGES IN [Pew_Nation_Answer]                                                         */
/*  2.1.  CHANGE ANSWER TO ADDED ANSWERS OR ZERO VALUES (non-zero to non-zero keep answer key)  */


UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 34800
  WHERE                     [Nation_answer_pk]   = 188799
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36769
  WHERE                     [Nation_answer_pk]   = 172628
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36770
  WHERE                     [Nation_answer_pk]   = 176836
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36771
  WHERE                     [Nation_answer_pk]   = 178235
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36772
  WHERE                     [Nation_answer_pk]   = 178236
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36773
  WHERE                     [Nation_answer_pk]   = 178238
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36774
  WHERE                     [Nation_answer_pk]   = 178557
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36775
  WHERE                     [Nation_answer_pk]   = 178558
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36776
  WHERE                     [Nation_answer_pk]   = 178560
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36777
  WHERE                     [Nation_answer_pk]   = 179749
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36778
  WHERE                     [Nation_answer_pk]   = 181479
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36779
  WHERE                     [Nation_answer_pk]   = 181907
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36780
  WHERE                     [Nation_answer_pk]   = 181908
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36781
  WHERE                     [Nation_answer_pk]   = 181910
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36782
  WHERE                     [Nation_answer_pk]   = 182766
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36783
  WHERE                     [Nation_answer_pk]   = 182767
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36784
  WHERE                     [Nation_answer_pk]   = 182983
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36785
  WHERE                     [Nation_answer_pk]   = 183842
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36786
  WHERE                     [Nation_answer_pk]   = 183843
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36787
  WHERE                     [Nation_answer_pk]   = 183845
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36788
  WHERE                     [Nation_answer_pk]   = 184060
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36789
  WHERE                     [Nation_answer_pk]   = 184061
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36790
  WHERE                     [Nation_answer_pk]   = 184171
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36791
  WHERE                     [Nation_answer_pk]   = 184172
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36792
  WHERE                     [Nation_answer_pk]   = 184173
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36793
  WHERE                     [Nation_answer_pk]   = 185032
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36794
  WHERE                     [Nation_answer_pk]   = 188372
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36795
  WHERE                     [Nation_answer_pk]   = 188374
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36796
  WHERE                     [Nation_answer_pk]   = 189339
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36797
  WHERE                     [Nation_answer_pk]   = 190858
GO
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = 36798
  WHERE                     [Nation_answer_pk]   = 190860
GO

/*  THE CODE TO BE EXECUTED ENDS HERE !!!                                                       */

