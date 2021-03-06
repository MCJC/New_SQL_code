/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
USE [forum]
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + '_53 deleted by mistake]
                FROM      [forum].[dbo].[Pew_Question_Std]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 000                                                    *****/
/**************************************************************************************************************************/
TRUNCATE TABLE            [forum].[dbo].[Pew_Question_Std]

INSERT INTO               [forum].[dbo].[Pew_Question_Std]
       SELECT * FROM  [_bk_forum].[dbo].[Pew_Question_Std_20150629]
/**************************************************************************************************************************/


/**************************************************************************************************************************/
/*****                                                   STEP 001.1                                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET
           [forum].[dbo].[Pew_Question_Std].[Question_wording_std]        = 'What is the total number of incidents (includ'
                                                                           +'ing deaths, phhysical abuse, detendtions, dis'
                                                                           +'placements and property damge) resulting from'
                                                                           +' government force due to religion?'
         , [forum].[dbo].[Pew_Question_Std].[Question_short_wording_std]  = 'Total N of incidents resulting from governmen'
                                                                           +'t force'
         , [forum].[dbo].[Pew_Question_Std].[Display]                     = 0
         , [forum].[dbo].[Pew_Question_Std].[AnswerSet_num]               = 999999
         , [forum].[dbo].[Pew_Question_Std].[Editorially_Checked]         = 'NO!'
         , [forum].[dbo].[Pew_Question_Std].[Question_Label_80Chars]      = 'Number of cases of Gov causing Deaths/PhysAbu'
                                                                           +'se/Detent/Displac/PropDamg for rel'
--SELECT * FROM [forum].[dbo].[Pew_Question_Std]
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]             = 924
  AND      [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std]   = 'GRI_19_x'
GO  
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/



/**************************************************************************************************************************/
/*****                                                   STEP 001.2                                                   *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET
           [forum].[dbo].[Pew_Question_Std].[Question_wording_std]        = 'What is the total number of incidents (includ'
                                                                           +'ing deaths, phhysical abuse, detendtions, dis'
                                                                           +'placements and property damge) motivated by r'
                                                                           +'eligious hatred or bias?'
         , [forum].[dbo].[Pew_Question_Std].[Question_short_wording_std]  = 'Total N of incidents resulting from religious'
                                                                           +' hatred or bias'
         , [forum].[dbo].[Pew_Question_Std].[Display]                     = 0
         , [forum].[dbo].[Pew_Question_Std].[AnswerSet_num]               = 999999
         , [forum].[dbo].[Pew_Question_Std].[Editorially_Checked]         = 'NO!'
         , [forum].[dbo].[Pew_Question_Std].[Question_Label_80Chars]      = 'Number of cases of Deaths/PhysAbuse/Detent/Di'
                                                                           +'splac/PropDamg for rel hatred/bias'
--SELECT * FROM [forum].[dbo].[Pew_Question_Std]
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]             = 169
  AND      [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std]   = 'SHI_01_x'
GO  
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/



/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
--                                                    ALREADY ADDED!!!
--/*------------------------------------------------------------------------------------------------------------------------*/
--INSERT INTO
--           [forum].[dbo].[Pew_Question_Std]
--/*------------------------------------------------------------------------------------------------------------------------*/
--SELECT
------------------------------------------------------------------------------------------------------------------------------
--       [Question_Std_pk]            =    ROW_NUMBER()
--                                         OVER(ORDER BY [Question_abbreviation_std])
--                                      + (SELECT MAX([Question_Std_pk]) FROM [Pew_Question_Std])

------------------------------------------------------------------------------------------------------------------------------
--      ,[Question_abbreviation_std]
--      ,[Question_wording_std]
--      ,[Question_short_wording_std]
------------------------------------------------------------------------------------------------------------------------------
--      ,[Display]                    = 0
--      ,[AnswerSet_num]              = 999999
--      ,[Editorially_Checked]        = 'NO!'
------------------------------------------------------------------------------------------------------------------------------
--      ,[Question_Label_80Chars]
------------------------------------------------------------------------------------------------------------------------------
--  FROM
--  --SELECT * FROM
--    (
------------------------------------------------------------------------------------------------------------------------------
--      SELECT
--       [Question_abbreviation_std]  = 'SHI_04_x'
--      ,[Question_wording_std]       = 'What is the total number of incidents (including deaths, phhysical abuse, detendtio'
--                                     +'ns, displacements and property damge) resulting from religion-related terrorism?'
--      ,[Question_short_wording_std] = 'Total N of incidents resulting from religion-related terrorism'
--      ,[Question_Label_80Chars]     = 'Number of cases of Deaths/PhysAbuse/Detent/Displac/PropDamg for rel-r terrorism'

------------------------------------------------------------------------------------------------------------------------------
--      UNION ALL 
------------------------------------------------------------------------------------------------------------------------------
--      SELECT
--       [Question_abbreviation_std]  = 'SHI_05_x'
--      ,[Question_wording_std]       = 'What is the total number of incidents (including deaths, phhysical abuse, detendtio'
--                                     +'ns and displacements) resulting from religion-related war or armed conflict?'
--      ,[Question_short_wording_std] = 'Total N of incidents resulting from religion-related war or armed conflict'
--      ,[Question_Label_80Chars]     = 'Number of cases of Deaths/PhysAbuse/Detent/Displac for rel-related war'
------------------------------------------------------------------------------------------------------------------------------
--                                                                                ) NEWQS
------------------------------------------------------------------------------------------------------------------------------
--/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/






/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
           [forum].[dbo].[Pew_Question_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
----------------------------------------------------------------------------------------------------------------------------
       [Question_Std_pk]            =    ROW_NUMBER()
                                         OVER(ORDER BY [qa])
                                      + (SELECT MAX([Question_Std_pk]) FROM [Pew_Question_Std])

----------------------------------------------------------------------------------------------------------------------------
      ,[Question_abbreviation_std]  = [qa]
      ,[Question_wording_std]       = [qw]
      ,[Question_short_wording_std] = [qw]
----------------------------------------------------------------------------------------------------------------------------
      ,[Display]                    = 0
      ,[AnswerSet_num]              = [as]
      ,[Editorially_Checked]        = 'NO!'
----------------------------------------------------------------------------------------------------------------------------
      ,[Question_Label_80Chars]     = [ql]
----------------------------------------------------------------------------------------------------------------------------
  FROM
  --SELECT * FROM
(
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'SHI_09_n'
 ,[qw] = 'How many incidents in which individuals used violence or the threat of violence'
       + '—including so-called honor killings—to try to enforce religious norms were directed'
       + ' against women?'
 ,[as] = 999999
 ,[ql] = 'Number of cases of violence against women to try to enforce religious norms'
----------------------------------------------------------------------------------------------------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'SHI_10_n'
 ,[qw] = 'How many incidents in which individuals were assaulted or displaced from their '
       + 'homes in retaliation for religious activities considered offensive or threatening '
       + 'to the majority faith were directed against women?'
 ,[as] = 999999
 ,[ql] = 'Number of cases of Assault/Displac of women for rel act offensive to maj faith'
----------------------------------------------------------------------------------------------------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'SHI_11_a_n'
 ,[qw] = 'How many incidents occurred in which women were harassed for violating secular '
       + 'dress norms?'
 ,[as] = 999999
 ,[ql] = 'Number of cases of women harassed for violating secular dress norms'
----------------------------------------------------------------------------------------------------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'SHI_11_b_n'
 ,[qw] = 'How many incidents occurred in which women were harassed for violating religious '
       + 'dress codes?'
 ,[as] = 999999
 ,[ql] = 'Number of cases of women harassed for violating religious dress codes'
----------------------------------------------------------------------------------------------------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRI_01_filter'
 ,[qw] = '(If GRI_01_x is "yes") Did the change in the constitution alter any statement '
       + 'of specific provision "freedom of religion"?'
 ,[as] = 47
 ,[ql] = '(If GRI_01_x is "yes") Did change alter specific provision "freedom of religion"'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRI_02_filter'
 ,[qw] = '(If GRI_01_x is "yes") Did the change in the constitution alter any '
       + 'stipulation that appears to qualify or substantially contradict the concept '
       + 'of "religious freedom"'
 ,[as] = 47
 ,[ql] = '(If GRI_01_x is "yes") Did change alter the concept of "religious freedom"'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRI_19_filter'
 ,[qw] = 'Were there incidents when any level of government use force toward religious '
       + 'groups that resulted in individuals being killed, physically abused, '
       + 'imprisoned, detained or displaced from their homes, or having their personal '
       + 'or religious properties damaged or destroyed?'
 ,[as] = 47
 ,[ql] = 'Were there cases of Gov causing Deaths/PhysAbuse/Detent/Displac/PropDamg for rel'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'SHI_05_filter'
 ,[qw] = 'Was there a religion-related war or armed conflict in the country (including '
       + 'ongoing displacements from previous wars)?'
 ,[as] = 47
 ,[ql] = 'Was there a religion-related war (including ongoing displacements)'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'SHI_04_filter'
 ,[qw] = 'Were religion-related terrorist groups active in the country?'
 ,[as] = 240
 ,[ql] = 'Were religion-related terrorist groups active in the country?'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'XSG_S_99_filter'
 ,[qw] = 'How many supplemental sources have been used?'
 ,[as] = 241
 ,[ql] = 'How many supplemental sources have been used?'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_34_01'
 ,[qw] = 'Does the government provide exemptions for religious groups from otherwise '
       + 'universal laws?'
 ,[as] = 47
 ,[ql] = 'Government provides exemptions for religious groups from universal laws'
------------------------------------------------------------------------------------------+---------------------------------
--UNION ALL 
------------------------------------------------------------------------------------------------------------------------------
-- SELECT
--  [qa] = 'GRX_34_02'
-- ,[qw] = 'If so, what areas do the exemptions cover? (check all that apply)'
-- ,[as] = 
-- ,[ql] = 'Areas in which the government provides exemptions for RG from universal laws'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_34_02_a'
 ,[qw] = 'Work on religious holidays (for example, Christians being allowed to take off work '
       + 'on Sundays)'
 ,[as] = 47
 ,[ql] = 'Government provides exemptions for RG from work on religious holidays'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_34_02_b'
 ,[qw] = 'Anti-discrimination laws (for example, giving religious business the right to not '
       + 'serve or provide benefits to same-sex couples)'
 ,[as] = 47
 ,[ql] = 'Government provides exemptions for RG from anti-discrimination laws'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_34_02_c'
 ,[qw] = 'Military service (for example, allowing religious groups that oppose war or national '
       + 'service to not participate in military training or activities)'
 ,[as] = 47
 ,[ql] = 'Government provides exemptions for RG from military service'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_34_02_d'
 ,[qw] = 'Taxes (for example, allowing religious groups opposed to supporting states to not'
       + ' pay taxes)'
 ,[as] = 47
 ,[ql] = 'Government provides exemptions for RG from taxes'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_34_02_e'
 ,[qw] = 'Health care provision (for example, allowing doctors to opt out of providing '
       + 'contraception or abortion services, or allowing religious organizations to exclude '
       + 'contraception of abortion services from health insurance coverage)'
 ,[as] = 47
 ,[ql] = 'Government provides exemptions for RG from health care provision'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_34_02_f'
 ,[qw] = 'Education (for example, sending children to public schools)'
 ,[as] = 47
 ,[ql] = 'Government provides exemptions for RG from education'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_34_02_g'
 ,[qw] = 'Unknown (the sources indicate religious groups are granted exemptions, but provide '
       + 'no details)'
 ,[as] = 47
 ,[ql] = 'Sources indicate religious groups are granted exemptions, but provide no details'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_34_03'
 ,[qw] = 'Were there any cases in which individuals challenged the lack of religious'
       + ' exemptions from otherwise universal laws?'
 ,[as] = 47
 ,[ql] = 'individuals challenged the lack of religious exemptions from universal laws'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_35'
 ,[qw] = 'Does the government restrict individuals'' access to the internet?'
 ,[as] = 47
 ,[ql] = 'The government restricts individuals'' access to the internet'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_35_01'
 ,[qw] = 'Does the government restrict individuals'' access to the internet through arrests based'
       + ' on internet activity?'
 ,[as] = 47
 ,[ql] = 'The government restricts access to the internet through arrests for int activity'
------------------------------------------------------------------------------------------+---------------------------------
UNION ALL 
----------------------------------------------------------------------------------------------------------------------------
 SELECT
  [qa] = 'GRX_35_02'
 ,[qw] = 'Does the government restrict individuals'' access to the internet through censoring '
       + 'of websites?'
 ,[as] = 47
 ,[ql] = 'The government restricts access to the internet through censoring of websites'
------------------------------------------------------------------------------------------+---------------------------------
                                                                                ) NEWQS
----------------------------------------------------------------------------------------------------------------------------
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/




/**************************************************************************************************************************/
/*****                                                    STEP 004                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT * FROM [forum].[dbo].[Pew_Question_Std]
WHERE [Question_abbreviation_std] IN
( 
 'GRI_19_x'
,'SHI_01_x'
,'SHI_04_x'
,'SHI_05_x'
,'GRI_01_filter'
,'GRI_02_filter'
,'GRI_19_filter'
,'GRX_34_01'
,'GRX_34_02_a'
,'GRX_34_02_b'
,'GRX_34_02_c'
,'GRX_34_02_d'
,'GRX_34_02_e'
,'GRX_34_02_f'
,'GRX_34_02_g'
,'GRX_34_03'
,'GRX_35'
,'GRX_35_01'
,'GRX_35_02'
,'SHI_04_filter'
,'SHI_05_filter'
,'SHI_09_n'
,'SHI_10_n'
,'SHI_11_a_n'
,'SHI_11_b_n'
,'XSG_S_99_filter'
                    )
/**************************************************************************************************************************/

