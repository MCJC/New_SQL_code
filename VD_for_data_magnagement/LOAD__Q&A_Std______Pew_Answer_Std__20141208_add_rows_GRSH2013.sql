/*****************************************************************************************************************************************************/
/*****                                                           BackUp  current Table                                                           *****/
/*****************************************************************************************************************************************************/
USE [forum]
GO
--/*****************************************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + ']
--                FROM      [xRLS2].[dbo].[Pew_Answer_Std]'               )
--/*****************************************************************************************************************************************************/
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID('tempdb..#WorkingAQSets')             IS NOT NULL
DROP TABLE           [#WorkingAQSets]
GO
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
-- create working table
WITH [DS] AS
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
(
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT
         [Q]
       , [x]
       , [L]
       , [S]
       , [V]
       , [W]
       , [C]  = 1       
FROM
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
(
   SELECT [QA_std]
         ,[Qlabel]  [x]
         ,[QW_std]  [L]
         ,[QsWstd]  [S]
     FROM [forum_ResAnal].[dbo].[vr_00_GRSHR_QLabels]  )  L
right outer join
(
-------------------------------------------------------------------------------------------------------------------------------------------------------
-- questions added this year:
          SELECT [Q] = 'GRX_30'               , [V] = 0.00 , [W] = 'No'
UNION ALL SELECT [Q] = 'GRX_30'               , [V] = 1.00 , [W] = 'Yes'
UNION ALL SELECT [Q] = 'GRX_31'               , [V] = 0.00 , [W] = 'No'
UNION ALL SELECT [Q] = 'GRX_31'               , [V] = 1.00 , [W] = 'Yes'
UNION ALL SELECT [Q] = 'GRX_32'               , [V] = 0.00 , [W] = 'No'
UNION ALL SELECT [Q] = 'GRX_32'               , [V] = 0.50 , [W] = 'Yes, in limited ways'
UNION ALL SELECT [Q] = 'GRX_32'               , [V] = 1.00 , [W] = 'Yes, widespread harassment'
UNION ALL SELECT [Q] = 'GRX_33'               , [V] = 0.00 , [W] = 'No'
UNION ALL SELECT [Q] = 'GRX_33'               , [V] = 0.33 , [W] = 'No, the government does not criminalize homosexual beh'
                                                                 + 'avior or discriminate against individuals based on gen'
                                                                 + 'der identity or sexual orientation, but it does not pr'
                                                                 + 'otect individuals against such discrimination'
UNION ALL SELECT [Q] = 'GRX_33'               , [V] = 0.67 , [W] = 'Yes, the government does not criminalize homosexual be'
                                                                 + 'havior, but it does discriminate against individuals b'
                                                                 + 'ased on gender identity or sexual orientation'
UNION ALL SELECT [Q] = 'GRX_33'               , [V] = 1.00 , [W] = 'Yes, the government criminalizes homosexual behavior e'
                                                                 + 'ither directly or indirectly'
-------------------------------------------------------------------------------------------------------------------------------------------------------
UNION ALL SELECT [Q] = 'GRI_scaled'           , [V] = 1.00 , [W] = 'Low'
UNION ALL SELECT [Q] = 'GRI_scaled'           , [V] = 2.00 , [W] = 'Moderate'
UNION ALL SELECT [Q] = 'GRI_scaled'           , [V] = 3.00 , [W] = 'High'
UNION ALL SELECT [Q] = 'GRI_scaled'           , [V] = 4.00 , [W] = 'Very High'
UNION ALL SELECT [Q] = 'SHI_scaled'           , [V] = 1.00 , [W] = 'Low'
UNION ALL SELECT [Q] = 'SHI_scaled'           , [V] = 2.00 , [W] = 'Moderate'
UNION ALL SELECT [Q] = 'SHI_scaled'           , [V] = 3.00 , [W] = 'High'
UNION ALL SELECT [Q] = 'SHI_scaled'           , [V] = 4.00 , [W] = 'Very High'
UNION ALL SELECT [Q] = 'GFI_scaled'           , [V] = 1.00 , [W] = 'Low'
UNION ALL SELECT [Q] = 'GFI_scaled'           , [V] = 2.00 , [W] = 'Moderate'
UNION ALL SELECT [Q] = 'GFI_scaled'           , [V] = 3.00 , [W] = 'High'
UNION ALL SELECT [Q] = 'GFI_scaled'           , [V] = 4.00 , [W] = 'Very High'
UNION ALL SELECT [Q] = 'GRI'                  , [V] = 0.00 , [W] = 'scale 0 - [+.] - 10'
UNION ALL SELECT [Q] = 'SHI'                  , [V] = 0.00 , [W] = 'scale 0 - [+.] - 10'
UNION ALL SELECT [Q] = 'GFI'                  , [V] = 0.00 , [W] = 'scale 0 - [+.] - 10'
UNION ALL SELECT [Q] = 'GRI_rd_1d'            , [V] = 0.00 , [W] = 'scale 0.0 - [+.] - 10.0'
UNION ALL SELECT [Q] = 'SHI_rd_1d'            , [V] = 0.00 , [W] = 'scale 0.0 - [+.] - 10.0'
UNION ALL SELECT [Q] = 'GFI_rd_1d'            , [V] = 0.00 , [W] = 'scale 0.0 - [+.] - 10.0'
-------------------------------------------------------------------------------------------------------------------------------------------------------
UNION ALL SELECT [Q] = 'GRI_19_b'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_c'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_d'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_da'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'GRI_19_da'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_db'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'GRI_19_db'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_e'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_f'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_x'             , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'GRI_19_x'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_20_05_x1'         , [V] = 0.00 , [W] = 'No provisions of sharia law adopted in any province'
UNION ALL SELECT [Q] = 'GRI_20_05_x1'         , [V] = 1.00 , [W] = 'Provisions of sharia law adopted in 1+ provinces'
UNION ALL SELECT [Q] = 'SHI_01_b'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_c'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_d'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_da'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_01_da'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_db'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_01_db'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_e'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_f'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_b'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_c'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_d'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_da'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_04_da'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_db'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_04_db'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_e'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_f'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_b'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_c'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_d'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_da'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_05_da'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_db'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_05_db'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_e'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_f'             , [V] = 1.00 , [W] = '1+ cases were found'
-------------------------------------------------------------------------------------------------------------------------------------------------------
UNION ALL SELECT  [Q] = 'GRI_08_a'            , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_08_a'            , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_08_for_index'    , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_08_for_index'    , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG1'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG1'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG2'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG2'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG3'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG3'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG4'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG4'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG5'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG5'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG6'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG6'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG7'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG7'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  0.33 , [W] = 'Security reasons stated as rationale'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  0.67 , [W] = 'Nonsecurity reasons stated as rationale'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  1.00 , [W] = 'Both security and nonsecurity reasons stated as rationale'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.20 , [W] = '1-9 cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.40 , [W] = '10-200 cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.60 , [W] = '201-1,000 cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.80 , [W] = '1,001-9,999 cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  1.00 , [W] = '10,000+ cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  0.01 , [W] = 'Yes ^'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.02 , [W] = 'Property damage'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.03 , [W] = 'Detentions / abductions'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.04 , [W] = 'Displacement from homes'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.05 , [W] = 'Physical assaults'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.06 , [W] = 'Deaths'
UNION ALL SELECT  [Q] = 'GRI_20'              , [V] =  0.00 , [W] = 'scale 0 - [+.01667] - 1'
UNION ALL SELECT  [Q] = 'GRI_20_03_top'       , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_20_03_top'       , [V] =  0.50 , [W] = 'Yes, but with no obvious favoritism to a particular group or groups'
UNION ALL SELECT  [Q] = 'GRI_20_03_top'       , [V] =  1.00 , [W] = 'Yes, and with obvious favoritism to a particular group or groups'
UNION ALL SELECT  [Q] = 'GRI_20_top'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_20_top'          , [V] =  0.50 , [W] = 'Yes, the government provides support  to religious groups, but it '
                                                                                 + 'does so on a more-or-less fair and equal basis'
UNION ALL SELECT  [Q] = 'GRI_20_top'          , [V] =  1.00 , [W] = 'Yes, the government gives preferential support or favors to some '
                                                                                 + 'religious group(s) and clearly discriminates against others'
UNION ALL SELECT  [Q] = 'GRX_22_01_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_01_ny'        , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_01_ny'        , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_22_01_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_22_02_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_02_ny'        , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_02_ny'        , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_22_02_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_22_03_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_03_ny'        , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_03_ny'        , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_22_03_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_22_04_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_04_ny'        , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_04_ny'        , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_22_04_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_22_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_ny'           , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_ny'           , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  0.33 , [W] = 'Yes, there were cases of obvious government discrimination or harass'
                                                                                 + 'ment that did not, however, involve physical violence'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  0.67 , [W] = 'Yes, and it involved physical violence, but no-one was killed'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  1.00 , [W] = 'Yes, and it involved physical violence, and it resulted in deaths'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_25_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_25_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_25_ny'           , [V] =  0.02 , [W] = 'Yes, but the implicated events, groups or individuals were entirely '
                                                                                 + 'outside the country'
UNION ALL SELECT  [Q] = 'GRX_25_ny'           , [V] =  0.03 , [W] = 'Yes, and the implicated events, groups or individuals were in the '
                                                                                + 'country'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.00 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.17 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.33 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.50 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.67 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.83 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  1.00 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01_a_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_a_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_b_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_b_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_c_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_c_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_d_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_d_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_e_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_e_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_f_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_f_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  0.01 , [W] = 'Yes ^'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.01 , [W] = 'Harassment/Intimidation'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.02 , [W] = 'Property damage'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.03 , [W] = 'Detentions/abductions'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.04 , [W] = 'Displacement from homes'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.05 , [W] = 'Physical assaults'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.06 , [W] = 'Deaths'
UNION ALL SELECT  [Q] = 'SHI_01_xG1'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG1'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG2'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG2'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG3'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG3'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG4'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG4'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG5'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG5'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG6'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG6'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG7'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG7'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.25 , [W] = 'Yes, but their activity was limited to recruitment or fundraising'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.50 , [W] = 'Yes, with violence that resulted in some casualties (1-9 injuries'
                                                                                 + ' or deaths)'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.75 , [W] = 'Yes, with violence that resulted in multiple casualties (10-50 in'
                                                                                 + 'juries or deaths)'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  1.00 , [W] = 'Yes, with violence that resulted in many casualties (more than 50'
                                                                                 + ' injuries or deaths)'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.25 , [W] = 'Yes, with fewer than 10,000 casualties or people displaced'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.50 , [W] = 'Yes, with tens of thousands of casualties or people displaced'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.75 , [W] = 'Yes, with hundreds of thousands of casualties or people displaced'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  1.00 , [W] = 'Yes, with millions of casualties or people displaced'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  0.33 , [W] = 'At the local level'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  0.67 , [W] = 'At the regional level'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  1.00 , [W] = 'At the national level'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_11_a'            , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_11_a'            , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_11_for_index'    , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_11_for_index'    , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  0.33 , [W] = 'Yes, there were cases of obvious social discrimination or harassm'
                                                                                 + 'ent that did not, however, involve physical violence'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  0.67 , [W] = 'Yes, and it involved physical violence, but no-one was killed'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  1.00 , [W] = 'Yes, and it involved physical violence, and it resulted in deaths'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  0.33 , [W] = 'Yes, but they engaged in crimes or malicious acts motivated by re'
                                                                                 + 'ligious hatred or bias that fell short of violence'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  0.67 , [W] = 'Yes, and it involved physical violence, but no-one was killed'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  1.00 , [W] = 'Yes, and it involved physical violence, and it resulted in deaths'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHX_27_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHX_27_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHX_27_ny'           , [V] =  0.02 , [W] = 'Yes, but the implicated events, groups or individuals were entire'
                                                                                 + 'ly outside the country'
UNION ALL SELECT  [Q] = 'SHX_27_ny'           , [V] =  0.03 , [W] = 'Yes, and the implicated events, groups or individuals were in the'
                                                                                 + ' country'
UNION ALL SELECT  [Q] = 'XSG_01_xG1'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG1'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG2'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG2'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG3'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG3'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG4'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG4'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG5'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG5'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG6'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG6'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG7'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG7'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  0.33 , [W] = 'Yes, there was no physical violence'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  0.67 , [W] = 'Yes, and it involved physical violence, but no-one was killed'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  1.00 , [W] = 'Yes, and it involved physical violence, and it resulted in deaths'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_25n27_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_25n27_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_25n27_ny'        , [V] =  0.02 , [W] = 'Yes, but the implicated events, groups or individuals were entire'
                                                                                 + 'ly outside the country'
UNION ALL SELECT  [Q] = 'XSG_25n27_ny'        , [V] =  0.03 , [W] = 'Yes, and the implicated events, groups or individuals were in the'
                                                                                 + ' country'
-------------------------------------------------------------------------------------------------------------------------------------------------------
) QS                              
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
on 
         QS.[Q]
      =   L.[QA_std]
------order by
------         QS.[Q]
------       , QS.[V]
)
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
--   select * from DS

/**************************************************************************************************************************/
SELECT * INTO        [#WorkingAQSets] FROM
/**************************************************************************************************************************/
(
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT
-------------------------------------------------------------------------------------------------------------------------------------------------------
        [mykey]                      = ROW_NUMBER()
                                       OVER(ORDER BY [Question_abbreviation_std], [Q] )
      ,[Question_Std_fk]
      ,[Q]
      ,[Question_abbreviation_std]
      ,[V]
      ,[Answer_value]
      ,[Answer_value_Std]
      ,[Answer_value_NoStd]
      ,[W]
      ,[Answer_Wording_std]
      ,[AnswerSet_num]            = CASE WHEN [Q] IN ( 'GRI_19_x' ) 
                                         THEN 999999 
                                         ELSE [AnswerSet_num]                 END  -- Un-Coded Numeric/Count values
      ,[Answer_Std_fk]            = CASE WHEN [Q] IN ( 'GRI_19_x' ) 
                                          AND [V] = 0
                                         THEN 999998 
                                         WHEN [Q] IN ( 'GRI_19_x' ) 
                                          AND [V] = 1
                                         THEN 999999 
                                         ELSE [Answer_Std_fk]                 END  -- Un-Coded Numeric/Count values
       , [x]
       , [L]
       , [S]
       , [A]
       , [C]

FROM
(
SELECT
           [K] =  ROW_NUMBER()
                  OVER(ORDER BY [Q], [V] )
      ,    [N] =  ROW_NUMBER()
                  OVER(PARTITION BY [Q] ORDER BY [V] )
      , S1.[Q]
      , S1.[V]
      , S1.[W]
      , S1.[x]
      , S1.[L]
      , S1.[S]
      ,    [A] = STUFF(
                 ( SELECT '   ||'
                         + STR(S2.[V], 7,2 ) 
                         + ': ' 
                         +        [W]
                     FROM [DS] S2
                    WHERE      S1.[Q]
                             = S2.[Q]
                 ORDER BY      S1.[Q] 
                 FOR XML PATH('') ), 1, 8, '')
      ,    [C] = SUM([C])OVER(PARTITION BY [Q])
FROM [DS] S1
GROUP
   BY         [Q]
            , [V]
            , [W]
            , [x]
            , [L]
            , [S]
            , [C]
)                                        N
LEFT
JOIN
     [Pew_Q&A] X
ON      [V] = [Answer_value_Std]
  AND   [W] = [Answer_Wording_std]
  AND   [A] = [Full_set_of_Answers]
/*****************************************************************************************************************************************************/
)  WKS
/*****************************************************************************************************************************************************/
GO
/*****************************************************************************************************************************************************/
/*****                                                           end  of working table                                                           *****/

/*****                                                           add std questions....                                                           *****/


--select * from [#WorkingAQSets]






--SELECT     DISTINCT                                             -- all : 97 q
--         S.[Q]
--  FROM   [#WorkingAQSets]

--SELECT     DISTINCT                                             -- already there
--         S.[Q]
--       , Q.[Question_Std_fk]
--  FROM   [#WorkingAQSets]    S
--     ,   [Pew_Question]      Q
--WHERE  Q.[Question_abbreviation_std]      IS NOT NULL
--  AND  Q.[Question_abbreviation_std] = [Q]                      -- cases: _39
--GO






--/**************************************************************************************************************************/
--/**************************************************************************************************************************/
--/*------------------------------------------------------------------------------------------------------------------------*/
--IF OBJECT_ID('tempdb..#UPDTS')             IS NOT NULL
--DROP TABLE           [#UPDTS]
--GO
--/*------------------------------------------------------------------------------------------------------------------------*/
--SELECT
--/*------------------------------------------------------------------------------------------------------------------------*/
--       [k] = ROW_NUMBER()
--             OVER(ORDER BY CASE WHEN [Q] LIKE '%_rd_1d' THEN 1
--                                WHEN [Q] LIKE 'GRI_08%' THEN 2
--                                WHEN [Q] LIKE 'SHI_11%' THEN 3
--                                                        ELSE 4 END
--                             , [Q]                                   )
--/*------------------------------------------------------------------------------------------------------------------------*/
--      ,[Question_abbreviation_std]     = [Q]
--      ,[Question_wording_std]          = [L]
--      ,[Question_short_wording_std]    = [S]
--      ,[Display]                       =  0
--      ,[AnswerSet_num]                 = -1
--      ,[Editorially_Checked]           = 'NO!'
--      ,[Question_Label_80Chars]        = [x]
--/*------------------------------------------------------------------------------------------------------------------------*/
--INTO #UPDTS
--FROM
--/*------------------------------------------------------------------------------------------------------------------------*/
--( SELECT
--         DISTINCT                                             -- not already there
--         S.[Q]
--       , S.[x]
--       , S.[L]
--       , S.[S]
--       , Q.[Question_Std_fk]
--  FROM   [#WorkingAQSets]    S
--LEFT JOIN
--         [Pew_Question]      Q
--ON     Q.[Question_abbreviation_std] = s.[Q]
--WHERE  Q.[Question_abbreviation_std]      IS     NULL    ) D  -- cases: _58
--/*------------------------------------------------------------------------------------------------------------------------*/
--GO
--/**************************************************************************************************************************/
--/*****                                 Create BackUp "Source Table for Updates" BUSTU                                 *****/
--/**************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--/*------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + '_BUSTU]
--                FROM                    [#UPDTS]'                              )
--/*------------------------------------------------------------------------------------------------------------------------*/
--GO
--/**************************************************************************************************************************/
--/**************************************************************************************************************************/





--/**************************************************************************************************************************/
--/**************************************************************************************************************************/
--/*------------------------------------------------------------------------------------------------------------------------*/
--IF OBJECT_ID('tempdb..#UPDTS')             IS NOT NULL
--DROP TABLE           [#UPDTS]
--GO
--/*---------------------------------------------------------------------------------------- setp 07: creation of [#UPDTS] -*/
--SELECT
--/*------------------------------------------------------------------------------------------------------------------------*/
--       [k]                         --- base for [Answer_Std_pk]
--      ,[s]                         --- base for [AnswerSet_number]
--/*------------------------------------------------------------------------------------------------------------------------*/
--      ,[Answer_value_std]        = [V]
--      ,[Answer_Wording_std]      = [W]
--      ,[Full_set_of_Answers]     = [A]
--      ,[NA_by_set_of_Answers]    = [C]
--/*------------------------------------------------------------------------------------------------------------------------*/
--INTO #UPDTS
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 06 -*/
--SELECT                                                      -- MERGE S03 & S05
--         S05.[s]
--       , S03.[k]
------------------------------------------------------------------------------------------------------------------------------
--       , S03.[V]
--       , S03.[W]
--       ,     [A] = CASE WHEN S03.[W] = 'scale 0 - [+.] - 10'       ----   SCALED VALUES RECODED
--                          OR S03.[W] = 'scale 0.0 - [+.] - 10.0'   ----   SCALED VALUES RECODED
--                          OR S03.[W] = 'scale 0 - [+.01667] - 1'   ----   SCALED VALUES RECODED
--                          OR S03.[W] = 'scale 0 - [+.1667] - 1'    ----   SCALED VALUES RECODED

--                        THEN S03.[W]
--                        ELSE S03.[A]                          END
--       , S03.[C]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 03 -*/
--SELECT                                                      -- add sorting N by answer
--         [k] = ROW_NUMBER()
--               OVER(ORDER BY [A], [V] )
------------------------------------------------------------------------------------------------------------------------------
--       , [A]
--       , [V]
--       , [W]
--       , [C]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(

--/*-------------------------------------------------------------------------------------------------------------- setp 02 -*/
--SELECT     DISTINCT                                         -- all DISTINCT ans not yet in DB as StdAns: 89
--         [A]
--       , [V]
--       , [W]
--       , [C]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 01 -*/
--SELECT     DISTINCT                                         -- all answers not yet included in DB as StdAns: 121
--         S.[A]
--       , S.[V]
--       , S.[W]
--       , S.[AnswerSet_num]
--  --   , Q.[AnswerSet_num]     --fixed to -1 in Step02
--  --     , Q.[Question_Std_fk]
--       , S.[Q]
--       , S.[C]
--  FROM   [#WorkingAQSets]    S
--     ,   [Pew_Question]      Q
--WHERE  Q.[Question_abbreviation_std] = [Q]  
--  AND  S.[AnswerSet_num]             IS NULL         -- not yet coded for this question in DB
--  AND  Q.[AnswerSet_num]             = -1            -- no answer set identified among current sets
--/*-------------------------------------------------------------------------------------------------------------- setp 01 -*/
--)                                                                                                             S01
--/*-------------------------------------------------------------------------------------------------------------- setp 02 -*/
--)                                                                                                             S02
--/*-------------------------------------------------------------------------------------------------------------- setp 03 -*/
--)                                                                                                             S03
------------------------------------------------------------------------------------------------------------------------------
--INNER
--JOIN
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 05 -*/
--SELECT                                                      -- add sorting N by answer
--         [s] = ROW_NUMBER()
--               OVER(ORDER BY [A] )
------------------------------------------------------------------------------------------------------------------------------
--       , [A]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 04 -*/
--SELECT     DISTINCT                                  -- DISTINCT sets of answers (not in DB, filter as S01): 11
--         S.[A]
--  FROM   [#WorkingAQSets]    S
--     ,   [Pew_Question]      Q
--WHERE  Q.[Question_abbreviation_std] = [Q]  
--  AND  S.[AnswerSet_num]             IS NULL         -- not yet coded for this question in DB
--  AND  Q.[AnswerSet_num]             = -1            -- no answer set identified among current sets
--/*-------------------------------------------------------------------------------------------------------------- setp 04 -*/
--)                                                                                                             S04
--/*-------------------------------------------------------------------------------------------------------------- setp 05 -*/
--)                                                                                                             S05
------------------------------------------------------------------------------------------------------------------------------
--ON
--         S03.[A]
--       = S05.[A]
------------------------------------------------------------------------------------------------------------------------------
--/*-------------------------------------------------------------------------------------------------------------- setp 06 -*/
--)                                                                                                             S06
--/*---------------------------------------------------------------------------------------- setp 07: creation of [#UPDTS] -*/
--GO
--/**************************************************************************************************************************/
--/*****                                 Create BackUp "Source Table for Updates" BUSTU                                 *****/
--/**************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--/*------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + '_BUSTU]
--                FROM                    [#UPDTS]'                              )
--/*------------------------------------------------------------------------------------------------------------------------*/
--GO
--/**************************************************************************************************************************/
--/**************************************************************************************************************************/











--/*******  ERROR I EXCLUDED -9 *********************************************************************************************/
--/**************************************************************************************************************************/
--/*------------------------------------------------------------------------------------------------------------------------*/
--IF OBJECT_ID('tempdb..#UPDTS')             IS NOT NULL
--DROP TABLE           [#UPDTS]
--GO
--/*---------------------------------------------------------------------------------------- setp 07: creation of [#UPDTS] -*/
--SELECT
--/*------------------------------------------------------------------------------------------------------------------------*/
--       [k]                         --- base for [Answer_Std_pk]
--      ,[s]                         --- base for [AnswerSet_number]
--/*------------------------------------------------------------------------------------------------------------------------*/
--      ,[Answer_value_std]        = [V]
--      ,[Answer_Wording_std]      = [W]
--      ,[Full_set_of_Answers]     = [A]
--      ,[NA_by_set_of_Answers]    = [C]
--/*------------------------------------------------------------------------------------------------------------------------*/
--INTO #UPDTS
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 06 -*/
--SELECT                                                      -- MERGE S03 & S05
--         S05.[s]
--       , S03.[k]
------------------------------------------------------------------------------------------------------------------------------
--       , S03.[V]
--       , S03.[W]
--       ,     [A] = CASE WHEN S03.[W] = 'scale 0 - [+.] - 10'       ----   SCALED VALUES RECODED
--                          OR S03.[W] = 'scale 0.0 - [+.] - 10.0'   ----   SCALED VALUES RECODED
--                          OR S03.[W] = 'scale 0 - [+.01667] - 1'   ----   SCALED VALUES RECODED
--                          OR S03.[W] = 'scale 0 - [+.1667] - 1'    ----   SCALED VALUES RECODED

--                        THEN S03.[W]
--                        ELSE S03.[A]                          END
--       , S03.[C]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 03 -*/
--SELECT                                                      -- add sorting N by answer
--         [k] = ROW_NUMBER()
--               OVER(ORDER BY [A], [V] )
------------------------------------------------------------------------------------------------------------------------------
--       , [A]
--       , [V]
--       , [W]
--       , [C]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(

--/*-------------------------------------------------------------------------------------------------------------- setp 02 -*/
--SELECT     DISTINCT                                         -- all DISTINCT ans not yet in DB as StdAns: 89
--         [A]
--       , [V]
--       , [W]
--       , [C]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 01 -*/
--SELECT     DISTINCT                                         -- all answers not yet included in DB as StdAns: 121
--         S.[A]
--       , S.[V]
--       , S.[W]
--       , S.[AnswerSet_num]
--  --   , Q.[AnswerSet_num]     --fixed to -1 in Step02
--  --     , Q.[Question_Std_fk]
--       , S.[Q]
--       , S.[C]
--  FROM   [#WorkingAQSets]    S
--     ,   [Pew_Question]      Q
--WHERE  Q.[Question_abbreviation_std] = [Q]  
--  AND  S.[AnswerSet_num]             IS NULL         -- not yet coded for this question in DB
--  AND  Q.[AnswerSet_num]             <  1            -- no answer set identified among current sets
--/*-------------------------------------------------------------------------------------------------------------- setp 01 -*/
--)                                                                                                             S01
--/*-------------------------------------------------------------------------------------------------------------- setp 02 -*/
--)                                                                                                             S02
--/*-------------------------------------------------------------------------------------------------------------- setp 03 -*/
--)                                                                                                             S03
------------------------------------------------------------------------------------------------------------------------------
--INNER
--JOIN
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 05 -*/
--SELECT                                                      -- add sorting N by answer
--         [s] = ROW_NUMBER()
--               OVER(ORDER BY [A] )
------------------------------------------------------------------------------------------------------------------------------
--       , [A]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 04 -*/
--SELECT     DISTINCT                                  -- DISTINCT sets of answers (not in DB, filter as S01): 11
--         S.[A]
--  FROM   [#WorkingAQSets]    S
--     ,   [Pew_Question]      Q
--WHERE  Q.[Question_abbreviation_std] = [Q]  
--  AND  S.[AnswerSet_num]             IS NULL         -- not yet coded for this question in DB
--  AND  Q.[AnswerSet_num]             <  1            -- no answer set identified among current sets
--/*-------------------------------------------------------------------------------------------------------------- setp 04 -*/
--)                                                                                                             S04
--/*-------------------------------------------------------------------------------------------------------------- setp 05 -*/
--)                                                                                                             S05
------------------------------------------------------------------------------------------------------------------------------
--ON
--         S03.[A]
--       = S05.[A]
------------------------------------------------------------------------------------------------------------------------------
--/*-------------------------------------------------------------------------------------------------------------- setp 06 -*/
--)                                                                                                             S06
--/*---------------------------------------------------------------------------------------- setp 07: creation of [#UPDTS] -*/
--GO
--/**************************************************************************************************************************/
--/*****                                 Create BackUp "Source Table for Updates" BUSTU                                 *****/
--/**************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--/*------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + '_BUSTU]
--                FROM                    [#UPDTS]'                              )
--/*------------------------------------------------------------------------------------------------------------------------*/
--GO
--/**************************************************************************************************************************/
--/**************************************************************************************************************************/




--/*******  ERROR I EXCLUDED -9 *********************************************************************************************/
--/**************************************************************************************************************************/
--/*------------------------------------------------------------------------------------------------------------------------*/
--IF OBJECT_ID('tempdb..#UPDTS')             IS NOT NULL
--DROP TABLE           [#UPDTS]
--GO
--/*---------------------------------------------------------------------------------------- setp 07: creation of [#UPDTS] -*/
--SELECT
--/*------------------------------------------------------------------------------------------------------------------------*/
--       [k]                         --- base for [Answer_Std_pk]
--      ,[s]                         --- base for [AnswerSet_number]
--/*------------------------------------------------------------------------------------------------------------------------*/
--      ,[Answer_value_std]        = [V]
--      ,[Answer_Wording_std]      = [W]
--      ,[Full_set_of_Answers]     = [A]
--      ,[NA_by_set_of_Answers]    = [C]
--/*------------------------------------------------------------------------------------------------------------------------*/
--INTO #UPDTS
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 06 -*/
--SELECT                                                      -- MERGE S03 & S05
--         S05.[s]
--       , S03.[k]
------------------------------------------------------------------------------------------------------------------------------
--       , S03.[V]
--       , S03.[W]
--       ,     [A] = CASE WHEN S03.[W] = 'scale 0 - [+.] - 10'       ----   SCALED VALUES RECODED
--                          OR S03.[W] = 'scale 0.0 - [+.] - 10.0'   ----   SCALED VALUES RECODED
--                          OR S03.[W] = 'scale 0 - [+.01667] - 1'   ----   SCALED VALUES RECODED
--                          OR S03.[W] = 'scale 0 - [+.1667] - 1'    ----   SCALED VALUES RECODED

--                        THEN S03.[W]
--                        ELSE S03.[A]                          END
--       , S03.[C]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 03 -*/
--SELECT                                                      -- add sorting N by answer
--         [k] = ROW_NUMBER()
--               OVER(ORDER BY [A], [V] )
------------------------------------------------------------------------------------------------------------------------------
--       , [A]
--       , [V]
--       , [W]
--       , [C]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(

--/*-------------------------------------------------------------------------------------------------------------- setp 02 -*/
--SELECT     DISTINCT                                         -- all DISTINCT ans not yet in DB as StdAns: 89
--         [A]
--       , [V]
--       , [W]
--       , [C]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 01 -*/
--SELECT     DISTINCT                                         -- all answers not yet included in DB as StdAns: 7
--         S.[A]
--       , S.[V]
--       , S.[W]
--       , S.[AnswerSet_num]
--  --   , Q.[AnswerSet_num]     --fixed to -1 in Step02
--  --     , Q.[Question_Std_fk]
--       , S.[Q]
--       , S.[C]
--  FROM   [#WorkingAQSets]    S
--     ,   [Pew_Question]      Q
--WHERE  Q.[Question_abbreviation_std] = [Q]  
--  AND  S.[AnswerSet_num]             IS NULL         -- not yet coded for this question in DB
--  AND  Q.[AnswerSet_num]             <  -1            -- no answer set identified among current sets
--/*-------------------------------------------------------------------------------------------------------------- setp 01 -*/
--)                                                                                                             S01
--/*-------------------------------------------------------------------------------------------------------------- setp 02 -*/
--)                                                                                                             S02
--/*-------------------------------------------------------------------------------------------------------------- setp 03 -*/
--)                                                                                                             S03
------------------------------------------------------------------------------------------------------------------------------
--INNER
--JOIN
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 05 -*/
--SELECT                                                      -- add sorting N by answer
--         [s] = ROW_NUMBER()
--               OVER(ORDER BY [A] )
------------------------------------------------------------------------------------------------------------------------------
--       , [A]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 04 -*/
--SELECT     DISTINCT                                  -- DISTINCT sets of answers (not in DB, filter as S01): 11
--         S.[A]
--  FROM   [#WorkingAQSets]    S
--     ,   [Pew_Question]      Q
--WHERE  Q.[Question_abbreviation_std] = [Q]  
--  AND  S.[AnswerSet_num]             IS NULL         -- not yet coded for this question in DB
--  AND  Q.[AnswerSet_num]             <  -1            -- no answer set identified among current sets
--/*-------------------------------------------------------------------------------------------------------------- setp 04 -*/
--)                                                                                                             S04
--/*-------------------------------------------------------------------------------------------------------------- setp 05 -*/
--)                                                                                                             S05
------------------------------------------------------------------------------------------------------------------------------
--ON
--         S03.[A]
--       = S05.[A]
------------------------------------------------------------------------------------------------------------------------------
--/*-------------------------------------------------------------------------------------------------------------- setp 06 -*/
--)                                                                                                             S06
--/*---------------------------------------------------------------------------------------- setp 07: creation of [#UPDTS] -*/
--GO
--/**************************************************************************************************************************/
--/*****                                 Create BackUp "Source Table for Updates" BUSTU                                 *****/
--/**************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--/*------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + '_BUSTU_add]
--                FROM                    [#UPDTS]'                              )
--/*------------------------------------------------------------------------------------------------------------------------*/
--GO
--/**************************************************************************************************************************/
--/**************************************************************************************************************************/

































--/**************************************************************************************************************************/
--/**************************************************************************************************************************/
--/*------------------------------------------------------------------------------------------------------------------------*/
--IF OBJECT_ID('tempdb..#UPDTS')             IS NOT NULL
--DROP TABLE           [#UPDTS]
--GO
--/*---------------------------------------------------------------------------------------- setp 04: creation of [#UPDTS] -*/
--SELECT
--/*------------------------------------------------------------------------------------------------------------------------*/
--       *
--INTO #UPDTS
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 03 -*/
--SELECT   DISTINCT                                         -- all DISTINCT Qs: 68
--         [k]
--       , [Q]
--       , [s]
--       --, [C]
--       , [ASc_in_DB]
--       , [ASc_found]
--       --, [A]
--       --, [Full_set_of_Answers]
--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 02 -*/
--SELECT                                                      -- MERGE & CHECK CODES
--         [A]
--       , [V]
--       , [W]
--       , [C]
--       , [k]
--       , [Q]
--       , [ASc_in_DB]
--       , [ASc_found]
--       , [s]                     = CASE
--                                   WHEN [Q] IN ( 'GRI_19_x' )             -- Un-Coded Numeric/Count values
--                                   THEN 999999
--                                   ELSE [AnswerSet_number]
--                                   END
--       , [Answer_value_Std]
--       , [Answer_Wording_std]
--       , [Full_set_of_Answers]

--FROM
------------------------------------------------------------------------------------------------------------------------------
--(
--/*-------------------------------------------------------------------------------------------------------------- setp 01 -*/
--SELECT     DISTINCT                                         -- answers not having set of answers coded in DB: 202
--           [A]       = CASE
--                       WHEN S.[W] = 'scale 0 - [+.] - 10'       ----   SCALED VALUES RECODED
--                         OR S.[W] = 'scale 0.0 - [+.] - 10.0'   ----   SCALED VALUES RECODED
--                         OR S.[W] = 'scale 0 - [+.01667] - 1'   ----   SCALED VALUES RECODED
--                         OR S.[W] = 'scale 0 - [+.1667] - 1'    ----   SCALED VALUES RECODED
--                       THEN S.[W]
--                       ELSE S.[A]
--                       END
--       , S.[V]
--       , S.[W]
--       , [ASc_in_DB] = S.[AnswerSet_num]
--       , [ASc_found] = Q.[AnswerSet_num]     --fixed to -1 in Step02
--       ,   [k]       = Q.[Question_Std_fk]
--       , S.[Q]
--       , S.[C]
--  FROM   [#WorkingAQSets]    S
--     ,   [Pew_Question]      Q
--WHERE      Q.[Question_abbreviation_std] = [Q]  
--  AND (    Q.[AnswerSet_num]             = -9            -- pending to identify answer set
--        OR Q.[AnswerSet_num]             = -1            -- no answer set identified among current sets
--      )
--/*-------------------------------------------------------------------------------------------------------------- setp 01 -*/
--)                                                                                                             S01
------------------------------------------------------------------------------------------------------------------------------
--LEFT
--JOIN
------------------------------------------------------------------------------------------------------------------------------
--       [forum].[dbo].[Pew_Answer_Std]                                                                       PAStd
--ON      [V] = [Answer_value_Std]
--  AND   [W] = [Answer_Wording_std]
--  AND   [A] = [Full_set_of_Answers]
---- where AnswerSet_number is NULL
--/*-------------------------------------------------------------------------------------------------------------- setp 02 -*/
--)                                                                                                             S02
--/*-------------------------------------------------------------------------------------------------------------- setp 03 -*/
--)                                                                                                             S03
--/*---------------------------------------------------------------------------------------- setp 04: creation of [#UPDTS] -*/
--GO
--/**************************************************************************************************************************/
--/*****                                 Create BackUp "Source Table for Updates" BUSTU                                 *****/
--/**************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--/*------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + '_BUSTU_SetsOfAns]
--                FROM                    [#UPDTS]'                                        )
--/*------------------------------------------------------------------------------------------------------------------------*/
--GO
--/**************************************************************************************************************************/
--/**************************************************************************************************************************/


















SELECT
        [Answer_Std_pk]         =  ( SELECT  MAX([Answer_Std_pk])  
                                       FROM      [Pew_Answer_Std]
                                      WHERE      [Answer_Std_pk]  < 999990 )
                                  +  ROW_NUMBER()
                                   OVER(ORDER BY [q], [V] )
      , [AnswerSet_number]      =  ( SELECT  MAX([AnswerSet_number])  
                                       FROM      [Pew_Answer_Std]
                                      WHERE      [AnswerSet_number]  < 999990 )
                                  +  ROW_NUMBER()
                                   OVER([A]ORDER BY [A], [V] )
                                   
                                   
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
-- add rows
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
           [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
----------------------------------------------------------------------------------------------------------------------------
        [Answer_Std_pk]         =  ( SELECT  MAX([Answer_Std_pk])  
                                       FROM      [Pew_Answer_Std]
                                      WHERE      [Answer_Std_pk]  < 999990 )
                                  +  ROW_NUMBER()
                                   OVER(ORDER BY [A], [V] )
      , [AnswerSet_number]      =  ( SELECT  MAX([AnswerSet_number])  
                                       FROM      [Pew_Answer_Std]
                                      WHERE      [AnswerSet_number]  < 999990 )
                                  +  ROW_NUMBER()
                                   OVER([A]ORDER BY [A], [V] )
      , [Answer_value_std]      = [V]
      , [Answer_Wording_std]    = [W]
      , [Full_set_of_Answers]   = [Q]
      , [NA_by_set_of_Answers]  = COUNT([Answer_Std_pk])
                                  OVER(PARTITION BY [V] )
--select *
FROM
(
----------------------------------------------------------------------------------------------------------------------------
-- questions added this year:
          SELECT [Q] = 'GRX_30'               , [V] = 0.00 , [W] = 'No'
UNION ALL SELECT [Q] = 'GRX_30'               , [V] = 1.00 , [W] = 'Yes'
UNION ALL SELECT [Q] = 'GRX_31'               , [V] = 0.00 , [W] = 'No'
UNION ALL SELECT [Q] = 'GRX_31'               , [V] = 1.00 , [W] = 'Yes'
UNION ALL SELECT [Q] = 'GRX_32'               , [V] = 0.00 , [W] = 'No'
UNION ALL SELECT [Q] = 'GRX_32'               , [V] = 0.50 , [W] = 'Yes, in limited ways'
UNION ALL SELECT [Q] = 'GRX_32'               , [V] = 1.00 , [W] = 'Yes, widespread harassment'
UNION ALL SELECT [Q] = 'GRX_33'               , [V] = 0.00 , [W] = 'No'
UNION ALL SELECT [Q] = 'GRX_33'               , [V] = 0.33 , [W] = 'No, the government does not criminalize homosexual beh'
                                                                 + 'avior or discriminate against individuals based on gen'
                                                                 + 'der identity or sexual orientation, but it does not pr'
                                                                 + 'otect individuals against such discrimination'
UNION ALL SELECT [Q] = 'GRX_33'               , [V] = 0.67 , [W] = 'Yes, the government does not criminalize homosexual be'
                                                                 + 'havior, but it does discriminate against individuals b'
                                                                 + 'ased on gender identity or sexual orientation'
UNION ALL SELECT [Q] = 'GRX_33'               , [V] = 1.00 , [W] = 'Yes, the government criminalizes homosexual behavior e'
                                                                 + 'ither directly or indirectly'
--------------------------------------------------------------------------------------------------------------------------------------------------
UNION ALL SELECT [Q] = 'GRI_scaled'           , [V] = 1.00 , [W] = 'Low'
UNION ALL SELECT [Q] = 'GRI_scaled'           , [V] = 2.00 , [W] = 'Moderate'
UNION ALL SELECT [Q] = 'GRI_scaled'           , [V] = 3.00 , [W] = 'High'
UNION ALL SELECT [Q] = 'GRI_scaled'           , [V] = 4.00 , [W] = 'Very High'
UNION ALL SELECT [Q] = 'SHI_scaled'           , [V] = 1.00 , [W] = 'Low'
UNION ALL SELECT [Q] = 'SHI_scaled'           , [V] = 2.00 , [W] = 'Moderate'
UNION ALL SELECT [Q] = 'SHI_scaled'           , [V] = 3.00 , [W] = 'High'
UNION ALL SELECT [Q] = 'SHI_scaled'           , [V] = 4.00 , [W] = 'Very High'
UNION ALL SELECT [Q] = 'GFI_scaled'           , [V] = 1.00 , [W] = 'Low'
UNION ALL SELECT [Q] = 'GFI_scaled'           , [V] = 2.00 , [W] = 'Moderate'
UNION ALL SELECT [Q] = 'GFI_scaled'           , [V] = 3.00 , [W] = 'High'
UNION ALL SELECT [Q] = 'GFI_scaled'           , [V] = 4.00 , [W] = 'Very High'
UNION ALL SELECT [Q] = 'GRI'                  , [V] = 0.00 , [W] = 'scale 0 - [+.] - 10'
UNION ALL SELECT [Q] = 'SHI'                  , [V] = 0.00 , [W] = 'scale 0 - [+.] - 10'
UNION ALL SELECT [Q] = 'GFI'                  , [V] = 0.00 , [W] = 'scale 0 - [+.] - 10'
UNION ALL SELECT [Q] = 'GRI_rd_1d'            , [V] = 0.00 , [W] = 'scale 0.0 - [+.] - 10.0'
UNION ALL SELECT [Q] = 'SHI_rd_1d'            , [V] = 0.00 , [W] = 'scale 0.0 - [+.] - 10.0'
UNION ALL SELECT [Q] = 'GFI_rd_1d'            , [V] = 0.00 , [W] = 'scale 0.0 - [+.] - 10.0'
--------------------------------------------------------------------------------------------------------------------------------------------------
UNION ALL SELECT [Q] = 'GRI_19_b'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_c'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_d'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_da'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'GRI_19_da'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_db'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'GRI_19_db'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_e'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_f'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_19_x'             , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'GRI_19_x'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'GRI_20_05_x1'         , [V] = 0.00 , [W] = 'No provisions of sharia law adopted in any province'
UNION ALL SELECT [Q] = 'GRI_20_05_x1'         , [V] = 1.00 , [W] = 'Provisions of sharia law adopted in 1+ provinces'
UNION ALL SELECT [Q] = 'SHI_01_b'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_c'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_d'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_da'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_01_da'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_db'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_01_db'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_e'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_01_f'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_b'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_c'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_d'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_da'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_04_da'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_db'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_04_db'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_e'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_04_f'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_b'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_c'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_d'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_da'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_05_da'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_db'            , [V] = 0.00 , [W] = 'No cases were found'
UNION ALL SELECT [Q] = 'SHI_05_db'            , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_e'             , [V] = 1.00 , [W] = '1+ cases were found'
UNION ALL SELECT [Q] = 'SHI_05_f'             , [V] = 1.00 , [W] = '1+ cases were found'
--------------------------------------------------------------------------------------------------------------------------------------------------
UNION ALL SELECT  [Q] = 'GRI_08_a'            , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_08_a'            , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_08_for_index'    , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_08_for_index'    , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG1'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG1'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG2'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG2'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG3'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG3'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG4'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG4'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG5'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG5'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG6'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG6'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_11_xG7'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_11_xG7'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  0.33 , [W] = 'Security reasons stated as rationale'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  0.67 , [W] = 'Nonsecurity reasons stated as rationale'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  1.00 , [W] = 'Both security and nonsecurity reasons stated as rationale'
UNION ALL SELECT  [Q] = 'GRI_16_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.20 , [W] = '1-9 cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.40 , [W] = '10-200 cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.60 , [W] = '201-1,000 cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.80 , [W] = '1,001-9,999 cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  1.00 , [W] = '10,000+ cases of government force'
UNION ALL SELECT  [Q] = 'GRI_19_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  0.01 , [W] = 'Yes ^'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.02 , [W] = 'Property damage'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.03 , [W] = 'Detentions / abductions'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.04 , [W] = 'Displacement from homes'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.05 , [W] = 'Physical assaults'
UNION ALL SELECT  [Q] = 'GRI_19_summ_ny'      , [V] =  1.06 , [W] = 'Deaths'
UNION ALL SELECT  [Q] = 'GRI_20'              , [V] =  0.00 , [W] = 'scale 0 - [+.01667] - 1'
UNION ALL SELECT  [Q] = 'GRI_20_03_top'       , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_20_03_top'       , [V] =  0.50 , [W] = 'Yes, but with no obvious favoritism to a particular group or groups'
UNION ALL SELECT  [Q] = 'GRI_20_03_top'       , [V] =  1.00 , [W] = 'Yes, and with obvious favoritism to a particular group or groups'
UNION ALL SELECT  [Q] = 'GRI_20_top'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRI_20_top'          , [V] =  0.50 , [W] = 'Yes, the government provides support  to religious groups, but it '
                                                                                 + 'does so on a more-or-less fair and equal basis'
UNION ALL SELECT  [Q] = 'GRI_20_top'          , [V] =  1.00 , [W] = 'Yes, the government gives preferential support or favors to some '
                                                                                 + 'religious group(s) and clearly discriminates against others'
UNION ALL SELECT  [Q] = 'GRX_22_01_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_01_ny'        , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_01_ny'        , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_22_01_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_22_02_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_02_ny'        , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_02_ny'        , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_22_02_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_22_03_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_03_ny'        , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_03_ny'        , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_22_03_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_22_04_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_04_ny'        , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_04_ny'        , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_22_04_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_22_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_22_ny'           , [V] =  0.67 , [W] = 'Yes, but penalties are not enforced'
UNION ALL SELECT  [Q] = 'GRX_22_ny'           , [V] =  1.00 , [W] = 'Yes, and penalties are enforced'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  0.33 , [W] = 'Yes, there were cases of obvious government discrimination or harass'
                                                                                 + 'ment that did not, however, involve physical violence'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  0.67 , [W] = 'Yes, and it involved physical violence, but no-one was killed'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  1.00 , [W] = 'Yes, and it involved physical violence, and it resulted in deaths'
UNION ALL SELECT  [Q] = 'GRX_24_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_25_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'GRX_25_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'GRX_25_ny'           , [V] =  0.02 , [W] = 'Yes, but the implicated events, groups or individuals were entirely '
                                                                                 + 'outside the country'
UNION ALL SELECT  [Q] = 'GRX_25_ny'           , [V] =  0.03 , [W] = 'Yes, and the implicated events, groups or individuals were in the '
                                                                                + 'country'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.00 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.17 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.33 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.50 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.67 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  0.83 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01'              , [V] =  1.00 , [W] = 'scale 0 - [+.1667] - 1'
UNION ALL SELECT  [Q] = 'SHI_01_a_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_a_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_b_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_b_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_c_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_c_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_d_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_d_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_e_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_e_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_f_dummy'      , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_f_dummy'      , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  0.01 , [W] = 'Yes ^'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.01 , [W] = 'Harassment/Intimidation'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.02 , [W] = 'Property damage'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.03 , [W] = 'Detentions/abductions'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.04 , [W] = 'Displacement from homes'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.05 , [W] = 'Physical assaults'
UNION ALL SELECT  [Q] = 'SHI_01_summary_a_ny' , [V] =  1.06 , [W] = 'Deaths'
UNION ALL SELECT  [Q] = 'SHI_01_xG1'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG1'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG2'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG2'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG3'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG3'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG4'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG4'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG5'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG5'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG6'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG6'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_01_xG7'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_01_xG7'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.25 , [W] = 'Yes, but their activity was limited to recruitment or fundraising'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.50 , [W] = 'Yes, with violence that resulted in some casualties (1-9 injuries'
                                                                                 + ' or deaths)'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.75 , [W] = 'Yes, with violence that resulted in multiple casualties (10-50 in'
                                                                                 + 'juries or deaths)'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  1.00 , [W] = 'Yes, with violence that resulted in many casualties (more than 50'
                                                                                 + ' injuries or deaths)'
UNION ALL SELECT  [Q] = 'SHI_04_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.25 , [W] = 'Yes, with fewer than 10,000 casualties or people displaced'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.50 , [W] = 'Yes, with tens of thousands of casualties or people displaced'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.75 , [W] = 'Yes, with hundreds of thousands of casualties or people displaced'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  1.00 , [W] = 'Yes, with millions of casualties or people displaced'
UNION ALL SELECT  [Q] = 'SHI_05_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  0.33 , [W] = 'At the local level'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  0.67 , [W] = 'At the regional level'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  1.00 , [W] = 'At the national level'
UNION ALL SELECT  [Q] = 'SHI_07_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_11_a'            , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_11_a'            , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHI_11_for_index'    , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHI_11_for_index'    , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  0.33 , [W] = 'Yes, there were cases of obvious social discrimination or harassm'
                                                                                 + 'ent that did not, however, involve physical violence'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  0.67 , [W] = 'Yes, and it involved physical violence, but no-one was killed'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  1.00 , [W] = 'Yes, and it involved physical violence, and it resulted in deaths'
UNION ALL SELECT  [Q] = 'SHX_25_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  0.33 , [W] = 'Yes, but they engaged in crimes or malicious acts motivated by re'
                                                                                 + 'ligious hatred or bias that fell short of violence'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  0.67 , [W] = 'Yes, and it involved physical violence, but no-one was killed'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  1.00 , [W] = 'Yes, and it involved physical violence, and it resulted in deaths'
UNION ALL SELECT  [Q] = 'SHX_26_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHX_27_ny'           , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'SHX_27_ny'           , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'SHX_27_ny'           , [V] =  0.02 , [W] = 'Yes, but the implicated events, groups or individuals were entire'
                                                                                 + 'ly outside the country'
UNION ALL SELECT  [Q] = 'SHX_27_ny'           , [V] =  0.03 , [W] = 'Yes, and the implicated events, groups or individuals were in the'
                                                                                 + ' country'
UNION ALL SELECT  [Q] = 'XSG_01_xG1'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG1'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG2'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG2'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG3'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG3'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG4'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG4'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG5'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG5'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG6'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG6'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_01_xG7'          , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_01_xG7'          , [V] =  1.00 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  0.33 , [W] = 'Yes, there was no physical violence'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  0.67 , [W] = 'Yes, and it involved physical violence, but no-one was killed'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  1.00 , [W] = 'Yes, and it involved physical violence, and it resulted in deaths'
UNION ALL SELECT  [Q] = 'XSG_242526_ny'       , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_25n27_ny'        , [V] =  0.00 , [W] = 'No'
UNION ALL SELECT  [Q] = 'XSG_25n27_ny'        , [V] =  0.01 , [W] = 'Yes'
UNION ALL SELECT  [Q] = 'XSG_25n27_ny'        , [V] =  0.02 , [W] = 'Yes, but the implicated events, groups or individuals were entire'
                                                                                 + 'ly outside the country'
UNION ALL SELECT  [Q] = 'XSG_25n27_ny'        , [V] =  0.03 , [W] = 'Yes, and the implicated events, groups or individuals were in the'
                                                                                 + ' country'
--------------------------------------------------------------------------------------------------------------------------------------------------
) QS                              





       [Answer_Std_pk]            =      ROW_NUMBER()
                                     OVER(ORDER BY [Answer_fk] )
                                  + (SELECT    MAX([Answer_pk])
                                     FROM [forum].[dbo].[Pew_Answer_NoStd])
----------------------------------------------------------------------------------------------------------------------------
      ,[Answer_value_NoStd]
      ,[Answer_Wording]
      ,[Answer_Std_fk]
----------------------------------------------------------------------------------------------------------------------------
      ,[Question_fk]          =   [Question_fk] + 131
-- select *  ---------------------------------------------------------------------------------------------------------------
  FROM
/*------------------------------------------------------------------------------------------------------------------------*/
           [forum].[dbo].[Pew_Q&A]
/*------------------------------------------------------------------------------------------------------------------------*/
WHERE
           [forum].[dbo].[Pew_Q&A].[Question_abbreviation] LIKE 'RLS07%'
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT * FROM [forum]..[Pew_Answer_NoStd]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT * FROM [forum]..[Pew_Q&A] WHERE [Question_abbreviation] LIKE 'RLS07%'
SELECT * FROM [forum]..[Pew_Q&A] WHERE [Question_abbreviation] LIKE 'RLS07cUS%'
SELECT * FROM [forum]..[Pew_Q&A] WHERE [Question_abbreviation] LIKE 'RLS07A&H%'
/**************************************************************************************************************************/


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT * -- max([Answer_Std_pk])  
  FROM [forum].[dbo].[Pew_Answer_Std]
  where Answer_Std_pk
< 999990


< 999990


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Answer_Std_pk]
      ,[AnswerSet_number]
      ,[Answer_value_std]
      ,[Answer_Wording_std]
      ,[Full_set_of_Answers]
      ,[NA_by_set_of_Answers]
      ,count([Answer_Std_pk]) OVER(PARTITION BY [AnswerSet_number] ) As rk1
  FROM [forum].[dbo].[Pew_Answer_Std]