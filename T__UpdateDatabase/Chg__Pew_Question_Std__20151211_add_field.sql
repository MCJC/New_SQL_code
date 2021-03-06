/*****************************************************************************************************************************************************************/
/*****************************************************************************************************************************************************************/
/*****     BackUp  current Table                                                                                                                             *****/
/*****************************************************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*---------------------------------------------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Std]'               )
/*****************************************************************************************************************************************************************/
/*****     Create & populate new field                                                                                                                       *****/
/*****************************************************************************************************************************************************************/

ALTER TABLE
           [forum].[dbo].[Pew_Question_Std]
ADD
                                           [In_PubDataSet]     [VARCHAR](MAX) NULL
/*---------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_Std]
SET
                                           [In_PubDataSet]  =  '-'
/*---------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------------------------------------------------------*/
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_1'                        WHERE [Question_abbreviation_std] = 'GRI_01 '
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_2'                        WHERE [Question_abbreviation_std] = 'GRI_02'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_3'                        WHERE [Question_abbreviation_std] = 'GRI_03'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_4'                        WHERE [Question_abbreviation_std] = 'GRI_04'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_5'                        WHERE [Question_abbreviation_std] = 'GRI_05'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_6'                        WHERE [Question_abbreviation_std] = 'GRI_06'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_7'                        WHERE [Question_abbreviation_std] = 'GRI_07'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_8'                        WHERE [Question_abbreviation_std] = 'GRI_08_for_index'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_9'                        WHERE [Question_abbreviation_std] = 'GRI_09'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_10'                       WHERE [Question_abbreviation_std] = 'GRI_10'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_11'                       WHERE [Question_abbreviation_std] = 'GRI_11'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_11_Christianity'          WHERE [Question_abbreviation_std] = 'GRI_11_xG1'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_11_Islam'                 WHERE [Question_abbreviation_std] = 'GRI_11_xG2'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_11_Buddhism'              WHERE [Question_abbreviation_std] = 'GRI_11_xG3'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_11_Hinduism'              WHERE [Question_abbreviation_std] = 'GRI_11_xG4'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_11_Judaism'               WHERE [Question_abbreviation_std] = 'GRI_11_xG5'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_11_Folk_Religions'        WHERE [Question_abbreviation_std] = 'GRI_11_xG7'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_11_Other_Religions'       WHERE [Question_abbreviation_std] = 'GRI_11_xG6'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_12'                       WHERE [Question_abbreviation_std] = 'GRI_12'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_13'                       WHERE [Question_abbreviation_std] = 'GRI_13'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_14'                       WHERE [Question_abbreviation_std] = 'GRI_14'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_15'                       WHERE [Question_abbreviation_std] = 'GRI_15'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_16'                       WHERE [Question_abbreviation_std] = 'GRI_16_ny'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_16_reasons'               WHERE [Question_abbreviation_std] = 'GRI_16'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_17'                       WHERE [Question_abbreviation_std] = 'GRI_17'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_18'                       WHERE [Question_abbreviation_std] = 'GRI_18'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_19'                       WHERE [Question_abbreviation_std] = 'GRI_19_ny'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_19_extent'                WHERE [Question_abbreviation_std] = 'GRI_19'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_19_Abuse'                 WHERE [Question_abbreviation_std] = 'GRI_19_e_scaled'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_19_Deaths'                WHERE [Question_abbreviation_std] = 'GRI_19_f_scaled'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_19_Displacements'         WHERE [Question_abbreviation_std] = 'GRI_19_d_scaled'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_19_Detentions'            WHERE [Question_abbreviation_std] = 'GRI_19_c_scaled'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_19_Property_Damage'       WHERE [Question_abbreviation_std] = 'GRI_19_b_scaled'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_20_1'                     WHERE [Question_abbreviation_std] = 'GRI_20_01'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_20_2'                     WHERE [Question_abbreviation_std] = 'GRI_20_02'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_20_3'                     WHERE [Question_abbreviation_std] = 'GRI_20_03_top'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_20_3_a'                   WHERE [Question_abbreviation_std] = 'GRI_20_03_a'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_20_3_b'                   WHERE [Question_abbreviation_std] = 'GRI_20_03_b'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_20_3_c'                   WHERE [Question_abbreviation_std] = 'GRI_20_03_c'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_20_4'                     WHERE [Question_abbreviation_std] = 'GRI_20_04'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRI_Q_20_5'                     WHERE [Question_abbreviation_std] = 'GRI_20_05'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_Harassment'             WHERE [Question_abbreviation_std] = 'SHI_01_a_dummy'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_PropertyDamage'         WHERE [Question_abbreviation_std] = 'SHI_01_b_dummy'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_Detentions'             WHERE [Question_abbreviation_std] = 'SHI_01_c_dummy'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_Displacements'          WHERE [Question_abbreviation_std] = 'SHI_01_d_dummy'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_Assaults'               WHERE [Question_abbreviation_std] = 'SHI_01_e_dummy'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_Deaths'                 WHERE [Question_abbreviation_std] = 'SHI_01_f_dummy'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_Extent'                 WHERE [Question_abbreviation_std] = 'SHI_01'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_harass_Christianity'    WHERE [Question_abbreviation_std] = 'SHI_01_xG1'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_harass_Islam'           WHERE [Question_abbreviation_std] = 'SHI_01_xG2'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_harass_Buddhism'        WHERE [Question_abbreviation_std] = 'SHI_01_xG3'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_harass_Hinduism'        WHERE [Question_abbreviation_std] = 'SHI_01_xG4'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_harass_Judaism'         WHERE [Question_abbreviation_std] = 'SHI_01_xG5'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_harass_Folk_Religions'  WHERE [Question_abbreviation_std] = 'SHI_01_xG7'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_1_harass_Other_Religions' WHERE [Question_abbreviation_std] = 'SHI_01_xG6'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_2'                        WHERE [Question_abbreviation_std] = 'SHI_02'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_3'                        WHERE [Question_abbreviation_std] = 'SHI_03'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_4'                        WHERE [Question_abbreviation_std] = 'SHI_04_ny'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_4_extent'                 WHERE [Question_abbreviation_std] = 'SHI_04'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_5'                        WHERE [Question_abbreviation_std] = 'SHI_05_ny'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_5_extent'                 WHERE [Question_abbreviation_std] = 'SHI_05'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_6'                        WHERE [Question_abbreviation_std] = 'SHI_06'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_7'                        WHERE [Question_abbreviation_std] = 'SHI_07'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_8'                        WHERE [Question_abbreviation_std] = 'SHI_08'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_9'                        WHERE [Question_abbreviation_std] = 'SHI_09'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_10'                       WHERE [Question_abbreviation_std] = 'SHI_10'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_11'                       WHERE [Question_abbreviation_std] = 'SHI_11_for_index'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_12'                       WHERE [Question_abbreviation_std] = 'SHI_12'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'SHI_Q_13'                       WHERE [Question_abbreviation_std] = 'SHI_13'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRX_22_blasphemy'               WHERE [Question_abbreviation_std] = 'GRX_22_01_ny'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRX_22_apostasy'                WHERE [Question_abbreviation_std] = 'GRX_22_02_ny'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRX_22_hate_speech'             WHERE [Question_abbreviation_std] = 'GRX_22_03_ny'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRX_22_criticism_of_religion'   WHERE [Question_abbreviation_std] = 'GRX_22_04_ny'
UPDATE [forum].[dbo].[Pew_Question_Std] SET [In_PubDataSet]  = 'GRX_30'                         WHERE [Question_abbreviation_std] = 'GRX_30'
/*---------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*****************************************************************************************************************************************************************/
-- check results
SELECT *
  FROM [forum].[dbo].[Pew_Question_Std]
 ORDER
    BY
       [In_PubDataSet]
      ,[Question_abbreviation_std] DESC
/*****************************************************************************************************************************************************************/
/*****************************************************************************************************************************************************************/
