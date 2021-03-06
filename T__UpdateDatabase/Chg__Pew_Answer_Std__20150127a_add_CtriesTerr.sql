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
                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Answer_Std]'               )
/**************************************************************************************************************************/

DELETE FROM               [forum].[dbo].[Pew_Answer_Std]
WHERE                     [AnswerSet_number] IN (234, 235)   --- educ and regions


/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
--     [x_LoadRLS1cUS].[dbo].[Pew_Answer_Std]
               [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
----------------------------------------------------------------------------------------------------------------------------
       [Answer_Std_pk]          =      (ROW_NUMBER () 
                                              OVER (ORDER BY [C] ))
                                   +   (SELECT MAX([Answer_Std_pk])
                                          FROM     [Pew_Answer_Std]
                                         WHERE     [Answer_Std_pk] < 999990)
----------------------------------------------------------------------------------------------------------------------------
      ,[AnswerSet_number]       =      ( 1 )
                                   +   (SELECT MAX([AnswerSet_number])
                                          FROM     [Pew_Answer_Std]
                                         WHERE     [AnswerSet_number] < 999990)
----------------------------------------------------------------------------------------------------------------------------
      ,[Answer_value_std]       =   [C]
      ,[Answer_Wording_std]     =   [D]
      ,[Full_set_of_Answers]    =   '315 Countries or Territories'
      ,[NA_by_set_of_Answers]   =    315
----------------------------------------------------------------------------------------------------------------------------
  FROM
----------------------------------------------------------------------------------------------------------------------------
(
      SELECT C =  [Nation_pk], D = [Ctry_EditorialName]        FROM [forum].[dbo].[Pew_Nation]
UNION SELECT C =    00601.00 , D = 'Agalega'
UNION SELECT C =    00602.00 , D = 'Rodrigues'
UNION SELECT C =    00603.00 , D = 'Saint Brandon'
UNION SELECT C =    00604.00 , D = 'Zanzibar'
UNION SELECT C =    00605.00 , D = 'Ascension'
UNION SELECT C =    00606.00 , D = 'Tristan da Cunha'
UNION SELECT C =    00607.00 , D = 'Sabah'
UNION SELECT C =    00608.00 , D = 'Sarawak'
UNION SELECT C =    00609.00 , D = 'Nagorno-Karabakh'
UNION SELECT C =    00610.00 , D = 'Northern-Cyprus'
UNION SELECT C =    00611.00 , D = 'Abkhazia'
UNION SELECT C =    00612.00 , D = 'South Ossetia'
UNION SELECT C =    00613.00 , D = 'East Jerusalem'
UNION SELECT C =    00614.00 , D = 'Transnistria'
UNION SELECT C =    00615.00 , D = 'Guernsey'
UNION SELECT C =    00616.00 , D = 'Jersey'
UNION SELECT C =    00617.00 , D = 'Aland Islands'
UNION SELECT C =    00618.00 , D = 'Svalbard Island'
UNION SELECT C =    00619.00 , D = 'Jan Mayen Island'
UNION SELECT C =    00620.00 , D = 'Canary Islands'
UNION SELECT C =    00621.00 , D = 'Ceuta'
UNION SELECT C =    00622.00 , D = 'Melilla'
UNION SELECT C =    00623.00 , D = 'Bonaire'
UNION SELECT C =    00624.00 , D = 'Saba'
UNION SELECT C =    00625.00 , D = 'Sint Eustatius'
UNION SELECT C =    00626.00 , D = 'Saint-Barthélemy'
UNION SELECT C =    00627.00 , D = 'Saint-Martin (French part)'
UNION SELECT C =    00628.00 , D = 'Christmas Island'
UNION SELECT C =    00629.00 , D = 'Cocos (Keeling) Islands'
UNION SELECT C =    00630.00 , D = 'Norfolk Island'
UNION SELECT C =    00631.00 , D = 'Pitcairn'
UNION SELECT C =    00632.00 , D = 'Tibet'
UNION SELECT C =    00701.00 , D = 'Outside the U.S.'
UNION SELECT C =    00702.00 , D = 'Outside the U.S. - Don''t know where (vol.)'
UNION SELECT C =    00703.00 , D = 'Outside the U.S. - Refused to say where (vol.)'
UNION SELECT C =    00704.00 , D = 'Outside the U.S. - DK/Ref. (vol.)'
UNION SELECT C =    00705.00 , D = 'Korea'
UNION SELECT C =    00706.00 , D = 'USSR'
UNION SELECT C =    00707.00 , D = 'Yugoslavia'
UNION SELECT C =    00708.00 , D = 'Serbia and Montenegro'
UNION SELECT C =    00709.00 , D = 'Netherlands Antilles'
UNION SELECT C =    01000.00 , D = 'Americas'
UNION SELECT C =    01001.00 , D = 'North America'
UNION SELECT C =    01002.00 , D = 'Latin America-Caribbean'
UNION SELECT C =    01003.00 , D = 'Europe'
UNION SELECT C =    01004.00 , D = 'Middle East-North Africa'
UNION SELECT C =    01005.00 , D = 'Sub-Saharan Africa'
UNION SELECT C =    01006.00 , D = 'Asia-Pacific'
UNION SELECT C =    02100.00 , D = 'Africa'
UNION SELECT C =    02110.00 , D = 'Eastern Africa'
UNION SELECT C =    02120.00 , D = 'Middle Africa'
UNION SELECT C =    02130.00 , D = 'Northern Africa'
UNION SELECT C =    02140.00 , D = 'Southern Africa'
UNION SELECT C =    02150.00 , D = 'Western Africa'
UNION SELECT C =    02210.00 , D = 'Latin America and the Caribbean'
UNION SELECT C =    02211.00 , D = 'Caribbean'
UNION SELECT C =    02212.00 , D = 'Central America'
UNION SELECT C =    02213.00 , D = 'South America'
UNION SELECT C =    02220.00 , D = 'Northern America'
UNION SELECT C =    02300.00 , D = 'Asia'
UNION SELECT C =    02310.00 , D = 'Eastern Asia'
UNION SELECT C =    02320.00 , D = 'South-Central Asia'
UNION SELECT C =    02321.00 , D = 'Central Asia'
UNION SELECT C =    02322.00 , D = 'Southern Asia'
UNION SELECT C =    02330.00 , D = 'South-Eastern Asia'
UNION SELECT C =    02340.00 , D = 'Western Asia'
UNION SELECT C =    02410.00 , D = 'Eastern Europe'
UNION SELECT C =    02420.00 , D = 'Northern Europe'
UNION SELECT C =    02430.00 , D = 'Southern Europe'
UNION SELECT C =    02440.00 , D = 'Western Europe'
UNION SELECT C =    02500.00 , D = 'Oceania'
UNION SELECT C =    02510.00 , D = 'Australia and New Zealand'
UNION SELECT C =    02520.00 , D = 'Melanesia'
UNION SELECT C =    02530.00 , D = 'Micronesia'
UNION SELECT C =    02540.00 , D = 'Polynesia'
UNION SELECT C =    08001.00 , D = 'Middle East'
UNION SELECT C =    08002.00 , D = 'Antarctica'
UNION SELECT C =    09997.00 , D = 'Undesignated'
UNION SELECT C =    09998.00 , D = 'Other/Unclear/Undetermined (vol.)'
UNION SELECT C =    09999.00 , D = 'DK/Ref. (vol.)'
UNION SELECT C =    10000.00 , D = 'World'
)   XXX 
----------------------------------------------------------------------------------------------------------------------------
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT * FROM [forum].[dbo].[Pew_Answer_Std]
/**************************************************************************************************************************/
