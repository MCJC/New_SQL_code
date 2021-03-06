/*********************************************************************************************************/
/**************************************************************************************************************************/
/*****                                           BackUp  current Table(s)                                             *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Std]'               )
/**************************************************************************************************************************/
ALTER TABLE
           [forum].[dbo].[Pew_Question_Std]
ADD
                                           [Display]  INT NULL
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_Std]
SET
                                           [Display]  = 0
/*------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_Std]
SET
                                           [Display]  = 1
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std]
      IN (
/*------------------------------------------------------------------------------------------------------------------------*/
/*-------    alphabetically sorted questions to be displayed (also the std short wording as a note)   --------------------*/
/*------------------------------------------------------------------------------------------------------------------------*/
             'GFI'                 -- Government Favoritism Index
           , 'GRI'                 -- Government Restrictions Index
           , 'GRI_01'              -- Does the constitution protect freedom of religion?
           , 'GRI_02'              -- Are there limits to the constitution's protection of freedom of religion?
           , 'GRI_03'              -- How do the country's constitution, laws and policies affect religious freedom?
           , 'GRI_04'              -- Does the government interfere with religious worship?
           , 'GRI_05'              -- Does the government limit public preaching?
           , 'GRI_06'              -- Does the government limit proselytizing?
           , 'GRI_07'              -- Does the government limit conversion from one religion to another?
           , 'GRI_08'              -- Does the government limit religious literature or broadcasting?
           , 'GRI_09'              -- Are foreign missionaries allowed to operate?
           , 'GRI_10'              -- Does the government regulate wearing religious clothing or symbols?
           , 'GRI_11'              -- Did the government harass or intimidate religious groups?
           , 'GRI_12'              -- Did the government use physical violence against minority religious groups?
           , 'GRI_13'              -- Did the government fail to protect religious groups from discrimination or abuse?
           , 'GRI_14'              -- Does the national government have an organization to manage religious affairs?
           , 'GRI_15'              -- Did the government denounce any religious groups as "cults" or "sects"?
           , 'GRI_16'              -- Does the government formally ban any religious group?
           , 'GRI_17'              -- Did the government attempt to remove a religious group from the country?
           , 'GRI_18'              -- Are religious groups asked to register with the government?
           , 'GRI_19'              -- Did government action or policy result in deaths, physical abuse, detention, displacement or property damage due to religion?
           --, 'GRI_19_b'            -- Did  government action or policy result in damaged property due to religion?
           --, 'GRI_19_c'            -- Did government action or policy result in detentions or abductions due to religion?
           --, 'GRI_19_d'            -- Did government action or policy displace people from their homes due to religion?
           --, 'GRI_19_e'            -- Did government action or policy result in physical assaults due to religion?
           --, 'GRI_19_f'            -- Did government action or policy result in death due to religion?
           , 'GRI_20_01'           -- Does the governement recognize a favored religion or religions?
           , 'GRI_20_02'           -- Do all religious groups receive the same level of government access and privileges?
           , 'GRI_20_03_a'         -- Does the government provide funds or resources for religious education or religious schools?
           , 'GRI_20_03_b'         -- Does the government provide funds or resources for religious property?
           , 'GRI_20_03_c'         -- Does the government provide funds or resources for religious activities other than education or property?
           , 'GRI_20_03_SUMMARY'   -- Does the government provide funds or resources to religious groups?
           , 'GRI_20_04'           -- Is religious education required in public schools?
           , 'GRI_20_05'           -- Does the national government defer in some way to religious authorities, texts or doctrines on legal issues?
           , 'GRI_20_SUMMARY'      -- Do some religious groups receive government support or favors?
           , 'SHI'                 -- Social Hostilities Index
           --, 'SHI_01_summary_a'    -- Were there crimes, malicious acts or violence motivated by religious hatred or bias?
           , 'SHI_01_summary_b'    -- How many different types of crimes, malicious acts or violence motivated by religious hatred or bias occured?
           , 'SHI_02'              -- Was there mob violence related to religion?
           , 'SHI_03'              -- Was there sectarian violence between religious groups?
           , 'SHI_04'              -- Were religion-related terrorist groups active in the country?
           , 'SHI_05'              -- Was there a religion-related war or armed conflict in the country?
           , 'SHI_06'              -- Did violence result from tensions between religious groups?
           , 'SHI_07'              -- Did groups attempt to dominate public life with their perspective on religion?
           , 'SHI_08'              -- Did religious groups try to prevent other religious groups from operating?
           , 'SHI_09'              -- Was violence or the threat of violence, including "honor killings," used to enforce religious norms?
           , 'SHI_10'              -- Were individuals assaulted or displaced in retaliation for religious activities considered offensive or threatening to the majority faith?
           , 'SHI_11'              -- Were women harassed for violating religious dress codes?
           , 'SHI_12'              -- Were there incidents of hostility over proselytizing?
           , 'SHI_13'              -- Were there incidents of hostility over conversions from one religion to another?
/*------------------------------------------------------------------------------------------------------------------------*/
           , 'SVYc_0003'           -- Are you mostly concerned about Muslim or Christian extremist groups?
           , 'SVYc_0011'           -- Do you believe in one God, Allah, and his prophet Muhammad?
           , 'SVYc_0015'           -- Do you favor or oppose punishments like whippings and cutting off of hands for crimes like theft and robbery?
           , 'SVYc_0016'           -- Do you favor or oppose giving religious leaders and religious judges the power to decide family and property disputes?
           , 'SVYc_0017'           -- Do you favor or oppose stoning people who commit adultery?
           , 'SVYc_0018'           -- Do you favor or oppose the death penalty for people who leave Islam?
           , 'SVYc_0019'           -- Do you like Western music, movies and television?
           , 'SVYc_0024'           -- Have Western music, movies, and television hurt morality in the country?
           , 'SVYc_0027'           -- How concerned are you about extremist religious groups in the country?
           , 'SVYc_0029'           -- How important is religion in your life?
           , 'SVYc_0033'           -- How often do you pray?
           , 'SVYc_0040'           -- Is divorce morally wrong, morally acceptable, or not a moral issue?
           , 'SVYc_0043'           -- Is homosexual behavior morally wrong, morally acceptable, or not a moral issue?
           , 'SVYc_0044'           -- Is it necessary to believe in God to be moral and have good values?
           , 'SVYc_0054'           -- Do you favor or oppose making the Bible / sharia the law of the land?
           , 'SVYc_0059'           -- Do you think we should rely on a democratic form of government or a leader with a strong hand to solve the country's problems?
           , 'SVYc_0061'           -- How free are people of faiths different from yours to practice their religion in the country?
           , 'SVYc_0062'           -- How free are people of faiths different from yours to practice their religion in the country? Is this a good or bad thing?
           , 'SVYc_0064'           -- How often do you attend religious services?
           , 'SVYu_0002'           -- Are suicide bombing and other forms of violence against civilian targets justified in order to defend Islam from its enemies?
           , 'SVYu_0003'           -- To what extent are tensions between Muslims who are very religious and Muslims who are not very religious a problem in the country?
           , 'SVYu_0004'           -- To what extent are tensions between Sunnis and Shias a problem in the country?
           , 'SVYu_0032'           -- Do you believe humans and other living things have evolved or that they have existed in their present form since the beginning of time?
           , 'SVYu_0168'           -- Is it morally acceptable for married couples to choose to limit the number of children they have?
           --, 'SVYu_0181'           -- Should both Christians and non-Christians in the country be subject to Biblical law, or should Biblical law be applied only to Christians?
           , 'SVYu_0184'           -- Should sharia law be applied only to Muslims or both Muslims and non-Muslims in the country?
           , 'SVYu_0185'           -- Should sharia law be open to multiple interpretations or is there only one, true understanding of sharia?
           , 'SVYu_0189'           -- Should women have the right to decide if they wear a veil?
           , 'SVYu_0198'           -- Who should have a greater right to parents’ inheritance – sons or daughters, or should both have equal rights?
/*------------------------------------------------------------------------------------------------------------------------*/
         )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
-- check results
SELECT *
  FROM [forum].[dbo].[Pew_Question_Std]
ORDER BY
       [Display]                     DESC
      ,[Question_abbreviation_std]
/**************************************************************************************************************************/

/*------------------------------------------------------------------------------------------------------------------------*/

/**************************************************************************************************************************/
-- add three questions: 
INSERT
INTO
           [forum].[dbo].[Pew_Question_Std]
                                           (  
                                             [Question_Std_pk]
                                            ,[Question_abbreviation_std]
                                            ,[Question_wording_std]
                                            ,[Question_short_wording_std]
                                            ,[Display]
                                                                           )
          SELECT 791, 'GRI_scaled', 'Calculated Year Level of the Government Restrictions Index', 'Government Restrictions Index', 1
UNION ALL SELECT 792, 'SHI_scaled', 'Calculated Year Level of the Social Hostilities Index'     , 'Social Hostilities Index'     , 1
UNION ALL SELECT 793, 'GFI_scaled', 'Calculated Year Level of the Government Favoritism Index'  , 'Government Favoritism Index'  , 0
/**************************************************************************************************************************/
-- check results
SELECT *
  FROM [forum].[dbo].[Pew_Question_Std]
ORDER BY
       [Question_Std_pk]             DESC
/**************************************************************************************************************************/