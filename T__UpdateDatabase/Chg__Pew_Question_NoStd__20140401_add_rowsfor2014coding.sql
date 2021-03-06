----------------------------------------------------------------------------------------------------------------------------
USE              [forum]
GO
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
/*****                                           BackUp  current Table(s)                                             *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- add 155 rows for 2013 (2014 summer coding period): 
INSERT
INTO
                          [forum].[dbo].[Pew_Question_NoStd]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
       [Question_pk]           =  ROW_NUMBER()  
								  OVER(ORDER BY [Question_abbreviation_std]) 
                                + (SELECT DISTINCT MAX([Question_pk])
                                                  FROM [Pew_Question_NoStd] )
      ,[Question_abbreviation] = [Question_abbreviation_std]
      ,[Question_wording]      = [Question_wording_std]
      ,[Data_source_fk]        = (SELECT DISTINCT [Data_source_fk]
                                             FROM [Pew_Question_NoStd]
                                            WHERE [Question_Std_fk]
                                                 =[Question_Std_pk] )
      ,[Question_Year]         = 2013
      ,[Short_wording]         = NULL
      ,[Notes]                 = 'January - December 2013'
      ,[Default_response]      = NULL
      ,[Question_Std_fk]       = [Question_Std_pk]
  FROM
       [forum].[dbo].[Pew_Question_Std]

--SELECT [Question_Std_pk]
--      ,[Question_abbreviation_std]
--      ,[Question_wording_std]
--      ,[Question_short_wording_std]
--      ,[Display]
--  FROM [forum].[dbo].[Pew_Question_Std]
WHERE
       [Question_abbreviation_std] IN (
                                          'GRI_01'
                                        , 'GRI_01_x'
                                        , 'GRI_02'
                                        , 'GRI_03'
                                        , 'GRI_04'
                                        , 'GRI_05'
                                        , 'GRI_06'
                                        , 'GRI_07'
                                        , 'GRI_08'
                                        , 'GRI_09'
                                        , 'GRI_10'
                                        , 'GRI_10_01'
                                        , 'GRI_10_02'
                                        , 'GRI_10_03'
                                        , 'GRI_11'
                                        , 'GRI_11_01a'
                                        , 'GRI_11_01b'
                                        , 'GRI_11_02'
                                        , 'GRI_11_03'
                                        , 'GRI_11_04'
                                        , 'GRI_11_05'
                                        , 'GRI_11_06'
                                        , 'GRI_11_07'
                                        , 'GRI_11_08'
                                        , 'GRI_11_09'
                                        , 'GRI_11_10'
                                        , 'GRI_11_11'
                                        , 'GRI_11_12'
                                        , 'GRI_11_13'
                                        , 'GRI_11_15'
                                        , 'GRI_11_16'
                                        , 'GRI_11_17'
                                        , 'GRI_12'
                                        , 'GRI_13'
                                        , 'GRI_14'
                                        , 'GRI_15'
                                        , 'GRI_16'
                                        , 'GRI_16_01'
                                        , 'GRI_17'
                                        , 'GRI_18'
                                        , 'GRI_19'
                                        , 'GRI_19_b'
                                        , 'GRI_19_c'
                                        , 'GRI_19_d'
                                        , 'GRI_19_e'
                                        , 'GRI_19_f'
                                        , 'GRI_20_01'
                                        , 'GRI_20_01x_01a'
                                        , 'GRI_20_01x_01b'
                                        , 'GRI_20_01x_02'
                                        , 'GRI_20_01x_03'
                                        , 'GRI_20_01x_04'
                                        , 'GRI_20_01x_05'
                                        , 'GRI_20_01x_06'
                                        , 'GRI_20_01x_07'
                                        , 'GRI_20_01x_08'
                                        , 'GRI_20_01x_09'
                                        , 'GRI_20_01x_10'
                                        , 'GRI_20_02'
                                        , 'GRI_20_03_a'
                                        , 'GRI_20_03_b'
                                        , 'GRI_20_03_c'
                                        , 'GRI_20_04'
                                        , 'GRI_20_04_x'
                                        , 'GRI_20_05'
                                        , 'GRI_20_05_x'
                                        , 'GRX_22_01'
                                        , 'GRX_22_02'
                                        , 'GRX_22_03'
                                        , 'GRX_22_04'
                                        , 'GRX_29_01'
                                        , 'GRX_29_02'
                                        , 'GRX_29_03'
                                        , 'GRX_29_04'
                                        , 'GRX_29_05'
                                        , 'GRX_30'
                                        , 'GRX_31'
                                        , 'GRX_32'
                                        , 'GRX_33'
                                        , 'SHI_01_a'
                                        , 'SHI_01_b'
                                        , 'SHI_01_c'
                                        , 'SHI_01_d'
                                        , 'SHI_01_e'
                                        , 'SHI_01_f'
                                        , 'SHI_01_x_01a'
                                        , 'SHI_01_x_01b'
                                        , 'SHI_01_x_02'
                                        , 'SHI_01_x_03'
                                        , 'SHI_01_x_04'
                                        , 'SHI_01_x_05'
                                        , 'SHI_01_x_06'
                                        , 'SHI_01_x_07'
                                        , 'SHI_01_x_08'
                                        , 'SHI_01_x_09'
                                        , 'SHI_01_x_10'
                                        , 'SHI_01_x_11'
                                        , 'SHI_01_x_12'
                                        , 'SHI_01_x_13'
                                        , 'SHI_01_x_15'
                                        , 'SHI_01_x_16'
                                        , 'SHI_01_x_17'
                                        , 'SHI_02'
                                        , 'SHI_02_01'
                                        , 'SHI_03'
                                        , 'SHI_04'
                                        , 'SHI_04_b'
                                        , 'SHI_04_c'
                                        , 'SHI_04_d'
                                        , 'SHI_04_e'
                                        , 'SHI_04_f'
                                        , 'SHI_04_x01'
                                        , 'SHI_05'
                                        , 'SHI_05_c'
                                        , 'SHI_05_d'
                                        , 'SHI_05_e'
                                        , 'SHI_05_f'
                                        , 'SHI_06'
                                        , 'SHI_07'
                                        , 'SHI_08'
                                        , 'SHI_09'
                                        , 'SHI_10'
                                        , 'SHI_11'
                                        , 'SHI_11_x'
                                        , 'SHI_12'
                                        , 'SHI_13'
                                        , 'XSG_S_01'
                                        , 'XSG_S_02'
                                        , 'XSG_S_03'
                                        , 'XSG_S_04'
                                        , 'XSG_S_05'
                                        , 'XSG_S_06'
                                        , 'XSG_S_07'
                                        , 'XSG_S_08'
                                        , 'XSG_S_09'
                                        , 'XSG_S_10'
                                        , 'XSG_S_11'
                                        , 'XSG_S_12'
                                        , 'XSG_S_13'
                                        , 'XSG_S_14'
                                        , 'XSG_S_15'
                                        , 'XSG_S_16'
                                        , 'XSG_S_17'
                                        , 'XSG_S_18'
                                        , 'XSG_S_19'
                                        , 'XSG_S_20'
                                        , 'XSG_S_21'
                                        , 'XSG_S_22'
                                        , 'XSG_S_23'
                                        , 'XSG_S_99_01'
                                        , 'XSG_S_99_02'
                                        , 'XSG_S_99_03'
                                        , 'XSG_S_99_04'
                                        , 'XSG_S_99_05'
                                        , 'XSG_S_99_06'
                                                          )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/**************************************************************************************************************************/
-- check results
SELECT *
  FROM [forum].[dbo].[Pew_Question_NoStd]
ORDER BY
       [Question_pk]             DESC
/**************************************************************************************************************************/
-- update source values when they are missing
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk] = (SELECT DISTINCT [Data_source_pk]
                                                                             FROM [Pew_Data_Source]
                                                                            WHERE [Data_source_description]
                                                                                = 'Government Use of Force toward Religion')
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_abbreviation] IN (
                                                                            'GRX_30'
                                                                          , 'GRX_31'
                                                                          , 'GRX_32'
                                                                          , 'GRX_33'  )
/**************************************************************************************************************************/
-- check results
SELECT *
  FROM [forum].[dbo].[Pew_Question_NoStd]
WHERE  [forum].[dbo].[Pew_Question_NoStd].[Question_abbreviation] IN (
                                                                       'GRX_30'
                                                                     , 'GRX_31'
                                                                     , 'GRX_32'
                                                                      , 'GRX_33'  )
/**************************************************************************************************************************/



      IN (
             167    -- SHI_01_summary_a
           , 168    -- SHI_01_summary_b
           , 169    -- SHI_01_x
           , 237    -- SHX_14
           , 761    -- SHI_01_x_17
                                          )
/*------------------------------------------------------------------------------------------------------------------------*/


Data_source_pk	Data_source_name	Data_source_description
27	Global Restriction on Religion Study	Government Use of Force toward Religion


update
new data sources
Question_pk	Question_abbreviation	Question_wording	Data_source_fk
1689	GRX_30	Is there a police force that enforces religious norms?	NULL
1690	GRX_31	Does the government restrict the ability of individuals to profess or act upon beliefs that are atheistic, agnostic, or reject organized religion?	NULL
1691	GRX_32	Was there any government harassment of individuals because they did not adhere to a religious tradition or did not participate in religious activities?	NULL
1692	GRX_33	Does the government have any policies or laws criminalizing homosexual behavior or discriminating against individuals based on gender identity or sexual orientation?	NULL



  VALUES
     'GRX_30',
     'Is there a police force that enforces religious norms?',
     'Is there a police force that enforces religious norms?',
     0                                                                                             ),






          SELECT 1608, 3, 'question for aggregated values', 529
UNION ALL SELECT 1609, 3, 'question for aggregated values', 530
UNION ALL SELECT 1610, 3, 'question for aggregated values', 531
UNION ALL SELECT 1611, 3, 'question for aggregated values', 791
UNION ALL SELECT 1612, 3, 'question for aggregated values', 792
UNION ALL SELECT 1613, 3, 'question for aggregated values', 793
/**************************************************************************************************************************/



Question_pk	Question_abbreviation	Question_wording	Data_source_fk	Question_Year	Short_wording	Notes	Default_response	Question_Std_fk
1557	SHI_07	Did organized groups use force or coercion in an attempt to dominate public life with their perspective on religion, including preventing some religious groups from operating in the country?	30	2012	NULL	January - December 2012	NULL	222


UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk] = 27
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_Std_fk]
      IN (
               47    -- GRI_11_x
            , 636    -- GRI_11_17
            , 106    -- GRX_21
            , 118    -- GRX_25
                                          )
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk] = 30
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_Std_fk]
      IN (
             254    -- SHX_27
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk] = 1
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_Std_fk]
      IN (
              525    -- XSG_01c11
            , 527    -- XSG_25c26c24
            , 528    -- XSG_27c25
                                          )
/**************************************************************************************************************************/
-- check results
SELECT 
       [Question_abbreviation]
      ,[Question_pk]
      ,[Data_source_fk]
      ,[Notes]
      ,[Question_Std_fk]
      ,[Question_abbreviation_std]
      ,[Question_short_wording_std]
  FROM [forum].[dbo].[Pew_Question]
WHERE
       [Question_abbreviation]     is null
   OR
       [Question_abbreviation_std] is null

ORDER BY
       [Question_abbreviation]
/**************************************************************************************************************************/