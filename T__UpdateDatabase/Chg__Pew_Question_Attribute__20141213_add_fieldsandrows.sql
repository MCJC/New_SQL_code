/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*
   This script is a temporary solution to pull notes (and eventually sorting order). The script wil requires more
   work: 
   -  pks should be linked  --  but currently not all QAStd are stored in the main Pew_QAStd table, so we
                                should load them and link them through Pew_AStd to have it properly coded.
      provisionally:   the data will work being hosted at forum_ResAnalan
                       and linked though QAStd
                                                                                                                          */
/**************************************************************************************************************************/
--USE [forum]
--GO
--/**************************************************************************************************************************/
--IF OBJECT_ID           (N'[forum].[dbo].[Pew_Question_Attribute]', N'U') IS NOT NULL
--DROP TABLE                [forum].[dbo].[Pew_Question_Attribute]
--/*------------------------------------------------------------------------------------------------------------------------*/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--SET ANSI_PADDING ON
--GO
--/*------------------------------------------------------------------------------------------------------------------------*/
--CREATE TABLE
--    [Pew_Question_Attribute]
--(
--	[Attribute_pk]                     [int]         NOT NULL,
--    [Question_Std_fk]                  [int]             NULL,
--	[attk]                             [nvarchar](20)    NULL,
--	[attr]                             [nvarchar](max)   NULL,
--    CONSTRAINT
--    [PK_Question_Attribute]
--    PRIMARY KEY CLUSTERED 
--    (
--	  [Attribute_pk]
--	                      ASC
--                         )WITH (  PAD_INDEX              = OFF,
--                                  STATISTICS_NORECOMPUTE = OFF,
--                                  IGNORE_DUP_KEY         = OFF,
--                                  ALLOW_ROW_LOCKS        = ON ,
--                                  ALLOW_PAGE_LOCKS       = ON  ) ON [PRIMARY]
--                                                                               ) ON [PRIMARY]
--/*------------------------------------------------------------------------------------------------------------------------*/
--GO
--/*------------------------------------------------------------------------------------------------------------------------*/
--SET ANSI_PADDING OFF
--GO
--/**************************************************************************************************************************/
--INSERT INTO
--           [forum].[dbo].[Pew_Question_Attribute]
/*------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID           (N'[forum_ResAnal].[dbo].[Pew_Question_Attribute]', N'U') IS NOT NULL
DROP TABLE                [forum_ResAnal].[dbo].[Pew_Question_Attribute]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
        [VxQAttr]
                           =  ROW_NUMBER()
                              OVER(ORDER BY
                              [Question_Std_pk]
                             ,[attk]             )
      , [Question_Std_fk]  =  [Question_Std_pk]
      , [Variable]
      , [attk]
      , [attr]
/*** temporaru table (see notes) ******************************************************************************************/
INTO    [forum_ResAnal].[dbo].[Pew_Question_Attribute]
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
FROM
/*------------------------------------------------------------------------------------------------------------------------*/
(
/*------------------------------------------------------------------------------------------------------------------------*/
----    SELECT 
----            [Variable]
----          , [attk]      =  'TopLine label'
----          , [attr]      =  [Label_minus4]
----      FROM  [for_x].[dbo].[AllQuestions]
----    UNION
----      ALL
    SELECT 
            [Variable]
          , [attk]      =  'SortKey'
          , [attr]      =  RIGHT( '0000'
                                 +(CONVERT(VARCHAR(3), [Q_Number] ))
                                                                     ,3)
      FROM  [for_x].[dbo].[AllQuestions]
    UNION
      ALL
    SELECT 
            [Variable]
          , [attk]      =  'XNote01'
          , [attr]      =  [Notes1_plus201]
      FROM  [for_x].[dbo].[AllQuestions]
    UNION
      ALL
    SELECT 
            [Variable]
          , [attk]      =  'XNote02'
          , [attr]      =  [Notes2_plus202]
      FROM [for_x].[dbo].[AllQuestions]
    UNION
      ALL
    SELECT 
            [Variable]
          , [attk]      =  'XNote03'
          , [attr]      =  [Notes3_plus203]
      FROM [for_x].[dbo].[AllQuestions]
    UNION
      ALL
/*------------------------------------------------------------------------------------------------------------------------*/
    SELECT 
            [Variable]  =  'GRI_08_a'
          , [attk]      =  'TopLine label'
          , [attr]      =  'GRI_08_a'
    UNION
      ALL
    SELECT 
            [Variable]  =  'GRX_30'
          , [attk]      =  'TopLine label'
          , [attr]      =  'GRX_30'
    UNION
      ALL
    SELECT 
            [Variable]  =  'GRX_31'
          , [attk]      =  'TopLine label'
          , [attr]      =  'GRX_31'
    UNION
      ALL
    SELECT 
            [Variable]  =  'GRX_32'
          , [attk]      =  'TopLine label'
          , [attr]      =  'GRX_32'
    UNION
      ALL
    SELECT 
            [Variable]  =  'GRX_33'
          , [attk]      =  'TopLine label'
          , [attr]      =  'GRX_33'
    UNION
      ALL
    SELECT 
            [Variable]  =  'SHI_11_a'
          , [attk]      =  'TopLine label'
          , [attr]      =  'SHI_11_a'
/*------------------------------------------------------------------------------------------------------------------------*/
    UNION ALL SELECT [Variable]  =  'GRI_scaled'          , [attk] = 'TopLine label', [attr] = 'GRI'
    UNION ALL SELECT [Variable]  =  'SHI_scaled'          , [attk] = 'TopLine label', [attr] = 'SHI'
    UNION ALL SELECT [Variable]  =  'GFI_scaled'          , [attk] = 'TopLine label', [attr] = 'GFI'
    UNION ALL SELECT [Variable]  =  'GRI_rd_1d'           , [attk] = 'TopLine label', [attr] = 'GRI'
    UNION ALL SELECT [Variable]  =  'SHI_rd_1d'           , [attk] = 'TopLine label', [attr] = 'SHI'
    UNION ALL SELECT [Variable]  =  'GFI_rd_1d'           , [attk] = 'TopLine label', [attr] = 'GFI'
    UNION ALL SELECT [Variable]  =  'GRI'                 , [attk] = 'TopLine label', [attr] = 'GRI'
    UNION ALL SELECT [Variable]  =  'SHI'                 , [attk] = 'TopLine label', [attr] = 'SHI'
    UNION ALL SELECT [Variable]  =  'GFI'                 , [attk] = 'TopLine label', [attr] = 'GFI'
    UNION ALL SELECT [Variable]  =  'GRI_01_x'            , [attk] = 'TopLine label', [attr] = 'GRI_01_x'
    UNION ALL SELECT [Variable]  =  'GRI_01_x2'           , [attk] = 'TopLine label', [attr] = 'GRI_01_x2'
    UNION ALL SELECT [Variable]  =  'GRI_01_x2_a'         , [attk] = 'TopLine label', [attr] = 'GRI_01_x2_a'
    UNION ALL SELECT [Variable]  =  'GRI_01'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.1'
    UNION ALL SELECT [Variable]  =  'GRI_01_x2_b'         , [attk] = 'TopLine label', [attr] = 'GRI_01_x2_b'
    UNION ALL SELECT [Variable]  =  'GRI_02'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.2'
    UNION ALL SELECT [Variable]  =  'GRI_03'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.3'
    UNION ALL SELECT [Variable]  =  'GRI_04'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.4'
    UNION ALL SELECT [Variable]  =  'GRI_05'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.5'
    UNION ALL SELECT [Variable]  =  'GRI_06'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.6'
    UNION ALL SELECT [Variable]  =  'GRI_07'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.7'
    UNION ALL SELECT [Variable]  =  'GRI_08_for_index'    , [attk] = 'TopLine label', [attr] = 'GRI.Q.8'
    UNION ALL SELECT [Variable]  =  'GRI_08'              , [attk] = 'TopLine label', [attr] = 'GRI_08'
    UNION ALL SELECT [Variable]  =  'GRI_09'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.9'
    UNION ALL SELECT [Variable]  =  'GRI_10'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.10'
    UNION ALL SELECT [Variable]  =  'GRI_10_01'           , [attk] = 'TopLine label', [attr] = 'GRI_10_01'
    UNION ALL SELECT [Variable]  =  'GRI_10_02'           , [attk] = 'TopLine label', [attr] = 'GRI_10_02'
    UNION ALL SELECT [Variable]  =  'GRI_10_03'           , [attk] = 'TopLine label', [attr] = 'GRI_10_03'
    UNION ALL SELECT [Variable]  =  'GRI_11'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.11'
    UNION ALL SELECT [Variable]  =  'GRI_11_01a'          , [attk] = 'TopLine label', [attr] = 'GRI_11_01a'
    UNION ALL SELECT [Variable]  =  'GRI_11_01b'          , [attk] = 'TopLine label', [attr] = 'GRI_11_01b'
    UNION ALL SELECT [Variable]  =  'GRI_11_02'           , [attk] = 'TopLine label', [attr] = 'GRI_11_02'
    UNION ALL SELECT [Variable]  =  'GRI_11_03'           , [attk] = 'TopLine label', [attr] = 'GRI_11_03'
    UNION ALL SELECT [Variable]  =  'GRI_11_04'           , [attk] = 'TopLine label', [attr] = 'GRI_11_04'
    UNION ALL SELECT [Variable]  =  'GRI_11_05'           , [attk] = 'TopLine label', [attr] = 'GRI_11_05'
    UNION ALL SELECT [Variable]  =  'GRI_11_06'           , [attk] = 'TopLine label', [attr] = 'GRI_11_06'
    UNION ALL SELECT [Variable]  =  'GRI_11_07'           , [attk] = 'TopLine label', [attr] = 'GRI_11_07'
    UNION ALL SELECT [Variable]  =  'GRI_11_08'           , [attk] = 'TopLine label', [attr] = 'GRI_11_08'
    UNION ALL SELECT [Variable]  =  'GRI_11_09'           , [attk] = 'TopLine label', [attr] = 'GRI_11_09'
    UNION ALL SELECT [Variable]  =  'GRI_11_10'           , [attk] = 'TopLine label', [attr] = 'GRI_11_10'
    UNION ALL SELECT [Variable]  =  'GRI_11_11'           , [attk] = 'TopLine label', [attr] = 'GRI_11_11'
    UNION ALL SELECT [Variable]  =  'GRI_11_12'           , [attk] = 'TopLine label', [attr] = 'GRI_11_12'
    UNION ALL SELECT [Variable]  =  'GRI_11_13'           , [attk] = 'TopLine label', [attr] = 'GRI_11_13'
    UNION ALL SELECT [Variable]  =  'GRI_11_14'           , [attk] = 'TopLine label', [attr] = 'GRI_11_14'
    UNION ALL SELECT [Variable]  =  'GRI_11_15'           , [attk] = 'TopLine label', [attr] = 'GRI_11_15'
    UNION ALL SELECT [Variable]  =  'GRI_11_16'           , [attk] = 'TopLine label', [attr] = 'GRI_11_16'
    UNION ALL SELECT [Variable]  =  'GRI_11_17'           , [attk] = 'TopLine label', [attr] = 'GRI_11_17'
    UNION ALL SELECT [Variable]  =  'GRI_11_xG1'          , [attk] = 'TopLine label', [attr] = 'GRI_11_xG1'
    UNION ALL SELECT [Variable]  =  'GRI_11_xG2'          , [attk] = 'TopLine label', [attr] = 'GRI_11_xG2'
    UNION ALL SELECT [Variable]  =  'GRI_11_xG3'          , [attk] = 'TopLine label', [attr] = 'GRI_11_xG3'
    UNION ALL SELECT [Variable]  =  'GRI_11_xG4'          , [attk] = 'TopLine label', [attr] = 'GRI_11_xG4'
    UNION ALL SELECT [Variable]  =  'GRI_11_xG5'          , [attk] = 'TopLine label', [attr] = 'GRI_11_xG5'
    UNION ALL SELECT [Variable]  =  'GRI_11_xG6'          , [attk] = 'TopLine label', [attr] = 'GRI_11_xG6'
    UNION ALL SELECT [Variable]  =  'GRI_11_xG7'          , [attk] = 'TopLine label', [attr] = 'GRI_11_xG7'
    UNION ALL SELECT [Variable]  =  'GRI_12'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.12'
    UNION ALL SELECT [Variable]  =  'GRI_13'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.13'
    UNION ALL SELECT [Variable]  =  'GRI_14'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.14'
    UNION ALL SELECT [Variable]  =  'GRI_15'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.15'
    UNION ALL SELECT [Variable]  =  'GRI_16'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.16'
    UNION ALL SELECT [Variable]  =  'GRI_16_ny'           , [attk] = 'TopLine label', [attr] = 'GRI.Q.16'
    UNION ALL SELECT [Variable]  =  'GRI_16_01'           , [attk] = 'TopLine label', [attr] = 'GRI_16_01'
    UNION ALL SELECT [Variable]  =  'GRI_17'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.17'
    UNION ALL SELECT [Variable]  =  'GRI_18'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.18'
    UNION ALL SELECT [Variable]  =  'GRI_19'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.19'
    UNION ALL SELECT [Variable]  =  'GRI_19_filter'       , [attk] = 'TopLine label', [attr] = 'GRI_19_filter'
    UNION ALL SELECT [Variable]  =  'GRI_19_ny'           , [attk] = 'TopLine label', [attr] = 'GRI.Q.19'
    UNION ALL SELECT [Variable]  =  'GRI_19_summ_ny'      , [attk] = 'TopLine label', [attr] = 'GRI.Q.19b'
    UNION ALL SELECT [Variable]  =  'GRI_19_x'            , [attk] = 'TopLine label', [attr] = 'GRI_19_x'
    UNION ALL SELECT [Variable]  =  'GRI_19_b'            , [attk] = 'TopLine label', [attr] = 'GRI_19_b'
    UNION ALL SELECT [Variable]  =  'GRI_19_c'            , [attk] = 'TopLine label', [attr] = 'GRI_19_c'
    UNION ALL SELECT [Variable]  =  'GRI_19_d'            , [attk] = 'TopLine label', [attr] = 'GRI_19_d'
    UNION ALL SELECT [Variable]  =  'GRI_19_e'            , [attk] = 'TopLine label', [attr] = 'GRI_19_e'
    UNION ALL SELECT [Variable]  =  'GRI_19_f'            , [attk] = 'TopLine label', [attr] = 'GRI_19_f'
    UNION ALL SELECT [Variable]  =  'GRI_19_da'           , [attk] = 'TopLine label', [attr] = 'GRI_19_da'
    UNION ALL SELECT [Variable]  =  'GRI_19_db'           , [attk] = 'TopLine label', [attr] = 'GRI_19_db'
    UNION ALL SELECT [Variable]  =  'GRI_20'              , [attk] = 'TopLine label', [attr] = 'GRI.Q.20'
    UNION ALL SELECT [Variable]  =  'GRI_20_04'           , [attk] = 'TopLine label', [attr] = 'GRI.Q.20.4'
    UNION ALL SELECT [Variable]  =  'GRI_20_04_x'         , [attk] = 'TopLine label', [attr] = 'GRI_20_04_x'
    UNION ALL SELECT [Variable]  =  'GRI_20_05'           , [attk] = 'TopLine label', [attr] = 'GRI.Q.20.5'
    UNION ALL SELECT [Variable]  =  'GRI_20_05_x'         , [attk] = 'TopLine label', [attr] = 'GRI_20_05_x'
    UNION ALL SELECT [Variable]  =  'GRI_20_top'          , [attk] = 'TopLine label', [attr] = 'GRI.Q.20'
    UNION ALL SELECT [Variable]  =  'GRI_20_01'           , [attk] = 'TopLine label', [attr] = 'GRI.Q.20.1'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_01a'      , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_01a'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_01b'      , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_01b'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_02'       , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_02'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_03'       , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_03'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_04'       , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_04'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_05'       , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_05'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_06'       , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_06'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_07'       , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_07'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_08'       , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_08'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_09'       , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_09'
    UNION ALL SELECT [Variable]  =  'GRI_20_01x_10'       , [attk] = 'TopLine label', [attr] = 'GRI_20_01x_10'
    UNION ALL SELECT [Variable]  =  'GRI_20_02'           , [attk] = 'TopLine label', [attr] = 'GRI.Q.20.2'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_top'       , [attk] = 'TopLine label', [attr] = 'GRI.Q.20.3'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_a'         , [attk] = 'TopLine label', [attr] = 'GRI.Q.20.3.a'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_b'         , [attk] = 'TopLine label', [attr] = 'GRI.Q.20.3.b'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_c'         , [attk] = 'TopLine label', [attr] = 'GRI.Q.20.3.c'
    UNION ALL SELECT [Variable]  =  'GRI_20_05_x1'        , [attk] = 'TopLine label', [attr] = 'GRI_20_05_x1'
    UNION ALL SELECT [Variable]  =  'SHI_01'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.1'
    UNION ALL SELECT [Variable]  =  'SHI_01_summary_a_ny' , [attk] = 'TopLine label', [attr] = 'SHI.Q.1a'
    UNION ALL SELECT [Variable]  =  'SHI_01_summary_a'    , [attk] = 'TopLine label', [attr] = 'SHI_01_summary_a'
    UNION ALL SELECT [Variable]  =  'SHI_01_summary_b'    , [attk] = 'TopLine label', [attr] = 'SHI.Q.1b'
    UNION ALL SELECT [Variable]  =  'SHI_01_x'            , [attk] = 'TopLine label', [attr] = 'SHI_01_x'
    UNION ALL SELECT [Variable]  =  'SHI_01_a_dummy'      , [attk] = 'TopLine label', [attr] = 'SHI.Q.1a'
    UNION ALL SELECT [Variable]  =  'SHI_01_b_dummy'      , [attk] = 'TopLine label', [attr] = 'SHI.Q.1b'
    UNION ALL SELECT [Variable]  =  'SHI_01_c_dummy'      , [attk] = 'TopLine label', [attr] = 'SHI.Q.1c'
    UNION ALL SELECT [Variable]  =  'SHI_01_d_dummy'      , [attk] = 'TopLine label', [attr] = 'SHI.Q.1d'
    UNION ALL SELECT [Variable]  =  'SHI_01_e_dummy'      , [attk] = 'TopLine label', [attr] = 'SHI.Q.1e'
    UNION ALL SELECT [Variable]  =  'SHI_01_f_dummy'      , [attk] = 'TopLine label', [attr] = 'SHI.Q.1f'
    UNION ALL SELECT [Variable]  =  'SHI_01_a'            , [attk] = 'TopLine label', [attr] = 'SHI.Q.1a'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_01a'        , [attk] = 'TopLine label', [attr] = 'SHI_01_x_01a'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_01b'        , [attk] = 'TopLine label', [attr] = 'SHI_01_x_01b'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_02'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_02'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_03'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_03'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_04'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_04'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_05'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_05'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_06'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_06'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_07'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_07'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_08'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_08'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_09'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_09'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_10'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_10'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_11'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_11'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_12'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_12'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_13'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_13'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_14'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_14'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_15'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_15'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_16'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_16'
    UNION ALL SELECT [Variable]  =  'SHI_01_x_17'         , [attk] = 'TopLine label', [attr] = 'SHI_01_x_17'
    UNION ALL SELECT [Variable]  =  'SHI_01_xG1'          , [attk] = 'TopLine label', [attr] = 'SHI_01_xG1'
    UNION ALL SELECT [Variable]  =  'SHI_01_xG2'          , [attk] = 'TopLine label', [attr] = 'SHI_01_xG2'
    UNION ALL SELECT [Variable]  =  'SHI_01_xG3'          , [attk] = 'TopLine label', [attr] = 'SHI_01_xG3'
    UNION ALL SELECT [Variable]  =  'SHI_01_xG4'          , [attk] = 'TopLine label', [attr] = 'SHI_01_xG4'
    UNION ALL SELECT [Variable]  =  'SHI_01_xG5'          , [attk] = 'TopLine label', [attr] = 'SHI_01_xG5'
    UNION ALL SELECT [Variable]  =  'SHI_01_xG6'          , [attk] = 'TopLine label', [attr] = 'SHI_01_xG6'
    UNION ALL SELECT [Variable]  =  'SHI_01_xG7'          , [attk] = 'TopLine label', [attr] = 'SHI_01_xG7'
    UNION ALL SELECT [Variable]  =  'SHI_01_b'            , [attk] = 'TopLine label', [attr] = 'SHI.Q.1b'
    UNION ALL SELECT [Variable]  =  'SHI_01_c'            , [attk] = 'TopLine label', [attr] = 'SHI.Q.1c'
    UNION ALL SELECT [Variable]  =  'SHI_01_d'            , [attk] = 'TopLine label', [attr] = 'SHI.Q.1d'
    UNION ALL SELECT [Variable]  =  'SHI_01_e'            , [attk] = 'TopLine label', [attr] = 'SHI.Q.1e'
    UNION ALL SELECT [Variable]  =  'SHI_01_f'            , [attk] = 'TopLine label', [attr] = 'SHI.Q.1f'
    UNION ALL SELECT [Variable]  =  'SHI_01_da'           , [attk] = 'TopLine label', [attr] = 'SHI_01_da'
    UNION ALL SELECT [Variable]  =  'SHI_01_db'           , [attk] = 'TopLine label', [attr] = 'SHI_01_db'
    UNION ALL SELECT [Variable]  =  'SHI_02'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.2'
    UNION ALL SELECT [Variable]  =  'SHI_02_01'           , [attk] = 'TopLine label', [attr] = 'SHI_02_01'
    UNION ALL SELECT [Variable]  =  'SHI_03'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.3'
    UNION ALL SELECT [Variable]  =  'SHI_04'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.4'
    UNION ALL SELECT [Variable]  =  'SHI_04_filter'       , [attk] = 'TopLine label', [attr] = 'SHI_04_filter'
    UNION ALL SELECT [Variable]  =  'SHI_04_ny'           , [attk] = 'TopLine label', [attr] = 'SHI.Q.4'
    UNION ALL SELECT [Variable]  =  'SHI_04_x'            , [attk] = 'TopLine label', [attr] = 'SHI_04_x'
    UNION ALL SELECT [Variable]  =  'SHI_04_b'            , [attk] = 'TopLine label', [attr] = 'SHI_04_b'
    UNION ALL SELECT [Variable]  =  'SHI_04_c'            , [attk] = 'TopLine label', [attr] = 'SHI_04_c'
    UNION ALL SELECT [Variable]  =  'SHI_04_d'            , [attk] = 'TopLine label', [attr] = 'SHI_04_d'
    UNION ALL SELECT [Variable]  =  'SHI_04_e'            , [attk] = 'TopLine label', [attr] = 'SHI_04_e'
    UNION ALL SELECT [Variable]  =  'SHI_04_f'            , [attk] = 'TopLine label', [attr] = 'SHI_04_f'
    UNION ALL SELECT [Variable]  =  'SHI_04_da'           , [attk] = 'TopLine label', [attr] = 'SHI_04_da'
    UNION ALL SELECT [Variable]  =  'SHI_04_db'           , [attk] = 'TopLine label', [attr] = 'SHI_04_db'
    UNION ALL SELECT [Variable]  =  'SHI_04_x01'          , [attk] = 'TopLine label', [attr] = 'SHI_04_x01'
    UNION ALL SELECT [Variable]  =  'SHI_05'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.5'
    UNION ALL SELECT [Variable]  =  'SHI_05_filter'       , [attk] = 'TopLine label', [attr] = 'SHI_05_filter'
    UNION ALL SELECT [Variable]  =  'SHI_05_ny'           , [attk] = 'TopLine label', [attr] = 'SHI.Q.5'
    UNION ALL SELECT [Variable]  =  'SHI_05_x'            , [attk] = 'TopLine label', [attr] = 'SHI_05_x'
    UNION ALL SELECT [Variable]  =  'SHI_05_b'            , [attk] = 'TopLine label', [attr] = 'SHI_05_b'
    UNION ALL SELECT [Variable]  =  'SHI_05_c'            , [attk] = 'TopLine label', [attr] = 'SHI_05_c'
    UNION ALL SELECT [Variable]  =  'SHI_05_d'            , [attk] = 'TopLine label', [attr] = 'SHI_05_d'
    UNION ALL SELECT [Variable]  =  'SHI_05_e'            , [attk] = 'TopLine label', [attr] = 'SHI_05_e'
    UNION ALL SELECT [Variable]  =  'SHI_05_f'            , [attk] = 'TopLine label', [attr] = 'SHI_05_f'
    UNION ALL SELECT [Variable]  =  'SHI_05_da'           , [attk] = 'TopLine label', [attr] = 'SHI_05_da'
    UNION ALL SELECT [Variable]  =  'SHI_05_db'           , [attk] = 'TopLine label', [attr] = 'SHI_05_db'
    UNION ALL SELECT [Variable]  =  'SHI_06'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.6'
    UNION ALL SELECT [Variable]  =  'SHI_07'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.7'
    UNION ALL SELECT [Variable]  =  'SHI_07_ny'           , [attk] = 'TopLine label', [attr] = 'SHI.Q.7'
    UNION ALL SELECT [Variable]  =  'SHI_08'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.8'
    UNION ALL SELECT [Variable]  =  'SHI_09'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.9'
    UNION ALL SELECT [Variable]  =  'SHI_10'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.10'
    UNION ALL SELECT [Variable]  =  'SHI_11_for_index'    , [attk] = 'TopLine label', [attr] = 'SHI.Q.11'
    UNION ALL SELECT [Variable]  =  'SHI_11'              , [attk] = 'TopLine label', [attr] = 'SHI_11'
    UNION ALL SELECT [Variable]  =  'SHI_11_x'            , [attk] = 'TopLine label', [attr] = 'SHI_11_x'
    UNION ALL SELECT [Variable]  =  'SHI_12'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.12'
    UNION ALL SELECT [Variable]  =  'SHI_13'              , [attk] = 'TopLine label', [attr] = 'SHI.Q.13'
    UNION ALL SELECT [Variable]  =  'GRX_21_01'           , [attk] = 'TopLine label', [attr] = 'GRX_21_01'
    UNION ALL SELECT [Variable]  =  'GRX_21_02'           , [attk] = 'TopLine label', [attr] = 'GRX_21_02'
    UNION ALL SELECT [Variable]  =  'GRX_21_03'           , [attk] = 'TopLine label', [attr] = 'GRX_21_03'
    UNION ALL SELECT [Variable]  =  'GRX_22_filter'       , [attk] = 'TopLine label', [attr] = 'GRX_22_filter'
    UNION ALL SELECT [Variable]  =  'GRX_22_ny'           , [attk] = 'TopLine label', [attr] = 'Additional Question 1'
    UNION ALL SELECT [Variable]  =  'GRX_22'              , [attk] = 'TopLine label', [attr] = 'GRX_22'
    UNION ALL SELECT [Variable]  =  'GRX_22_01'           , [attk] = 'TopLine label', [attr] = 'GRX_22_01'
    UNION ALL SELECT [Variable]  =  'GRX_22_01_ny'        , [attk] = 'TopLine label', [attr] = 'Additional Question 1a'
    UNION ALL SELECT [Variable]  =  'GRX_22_02'           , [attk] = 'TopLine label', [attr] = 'GRX_22_02'
    UNION ALL SELECT [Variable]  =  'GRX_22_02_ny'        , [attk] = 'TopLine label', [attr] = 'Additional Question 1b'
    UNION ALL SELECT [Variable]  =  'GRX_22_03'           , [attk] = 'TopLine label', [attr] = 'GRX_22_03'
    UNION ALL SELECT [Variable]  =  'GRX_29_01'           , [attk] = 'TopLine label', [attr] = 'GRX_29_01'
    UNION ALL SELECT [Variable]  =  'GRX_22_04_ny'        , [attk] = 'TopLine label', [attr] = 'Additional Question 1c'
    UNION ALL SELECT [Variable]  =  'GRX_22_03_ny'        , [attk] = 'TopLine label', [attr] = 'Additional Question 2'
    UNION ALL SELECT [Variable]  =  'GRX_22_04'           , [attk] = 'TopLine label', [attr] = 'GRX_22_04'
    UNION ALL SELECT [Variable]  =  'XSG_25n27_ny'        , [attk] = 'TopLine label', [attr] = 'Additional Question 3'
    UNION ALL SELECT [Variable]  =  'GRX_23'              , [attk] = 'TopLine label', [attr] = 'GRX_23'
    UNION ALL SELECT [Variable]  =  'GRX_25_ny'           , [attk] = 'TopLine label', [attr] = 'Additional Question 3a'
    UNION ALL SELECT [Variable]  =  'GRX_25_01'           , [attk] = 'TopLine label', [attr] = 'GRX_25_01'
    UNION ALL SELECT [Variable]  =  'GRX_25_02'           , [attk] = 'TopLine label', [attr] = 'GRX_25_02'
    UNION ALL SELECT [Variable]  =  'GRX_25_03'           , [attk] = 'TopLine label', [attr] = 'GRX_25_03'
    UNION ALL SELECT [Variable]  =  'SHX_27_ny'           , [attk] = 'TopLine label', [attr] = 'Additional Question 3b'
    UNION ALL SELECT [Variable]  =  'SHX_27_01'           , [attk] = 'TopLine label', [attr] = 'SHX_27_01'
    UNION ALL SELECT [Variable]  =  'SHX_27_02'           , [attk] = 'TopLine label', [attr] = 'SHX_27_02'
    UNION ALL SELECT [Variable]  =  'SHX_27_03'           , [attk] = 'TopLine label', [attr] = 'SHX_27_03'
    UNION ALL SELECT [Variable]  =  'XSG_242526_ny'       , [attk] = 'TopLine label', [attr] = 'Additional Question 4'
    UNION ALL SELECT [Variable]  =  'GRX_29_02'           , [attk] = 'TopLine label', [attr] = 'GRX_29_02'
    UNION ALL SELECT [Variable]  =  'GRX_24_ny'           , [attk] = 'TopLine label', [attr] = 'Additional Question 4a'
    UNION ALL SELECT [Variable]  =  'GRX_24'              , [attk] = 'TopLine label', [attr] = 'GRX_24'
    UNION ALL SELECT [Variable]  =  'SHX_25_ny'           , [attk] = 'TopLine label', [attr] = 'Additional Question 4b'
    UNION ALL SELECT [Variable]  =  'SHX_25'              , [attk] = 'TopLine label', [attr] = 'SHX_25'
    UNION ALL SELECT [Variable]  =  'SHX_26_ny'           , [attk] = 'TopLine label', [attr] = 'Additional Question 4c'
    UNION ALL SELECT [Variable]  =  'SHX_26'              , [attk] = 'TopLine label', [attr] = 'SHX_26'
    UNION ALL SELECT [Variable]  =  'GRX_26_01'           , [attk] = 'TopLine label', [attr] = 'GRX_26_01'
    UNION ALL SELECT [Variable]  =  'GRX_26_02'           , [attk] = 'TopLine label', [attr] = 'GRX_26_02'
    UNION ALL SELECT [Variable]  =  'GRX_26_03'           , [attk] = 'TopLine label', [attr] = 'GRX_26_03'
    UNION ALL SELECT [Variable]  =  'GRX_26_04'           , [attk] = 'TopLine label', [attr] = 'GRX_26_04'
    UNION ALL SELECT [Variable]  =  'GRX_26_05'           , [attk] = 'TopLine label', [attr] = 'GRX_26_05'
    UNION ALL SELECT [Variable]  =  'GRX_26_06'           , [attk] = 'TopLine label', [attr] = 'GRX_26_06'
    UNION ALL SELECT [Variable]  =  'GRX_26_07'           , [attk] = 'TopLine label', [attr] = 'GRX_26_07'
    UNION ALL SELECT [Variable]  =  'GRX_26_08'           , [attk] = 'TopLine label', [attr] = 'GRX_26_08'
    UNION ALL SELECT [Variable]  =  'GRX_27_01'           , [attk] = 'TopLine label', [attr] = 'GRX_27_01'
    UNION ALL SELECT [Variable]  =  'GRX_27_02'           , [attk] = 'TopLine label', [attr] = 'GRX_27_02'
    UNION ALL SELECT [Variable]  =  'GRX_27_03'           , [attk] = 'TopLine label', [attr] = 'GRX_27_03'
    UNION ALL SELECT [Variable]  =  'GRX_28_01'           , [attk] = 'TopLine label', [attr] = 'GRX_28_01'
    UNION ALL SELECT [Variable]  =  'GRX_28_02'           , [attk] = 'TopLine label', [attr] = 'GRX_28_02'
    UNION ALL SELECT [Variable]  =  'GRX_28_03'           , [attk] = 'TopLine label', [attr] = 'GRX_28_03'
    UNION ALL SELECT [Variable]  =  'GRX_29_03'           , [attk] = 'TopLine label', [attr] = 'GRX_29_03'
    UNION ALL SELECT [Variable]  =  'GRX_29_04'           , [attk] = 'TopLine label', [attr] = 'GRX_29_04'
    UNION ALL SELECT [Variable]  =  'GRX_29_05'           , [attk] = 'TopLine label', [attr] = 'GRX_29_05'
    UNION ALL SELECT [Variable]  =  'SHX_14_01'           , [attk] = 'TopLine label', [attr] = 'SHX_14_01'
    UNION ALL SELECT [Variable]  =  'SHX_14_02'           , [attk] = 'TopLine label', [attr] = 'SHX_14_02'
    UNION ALL SELECT [Variable]  =  'SHX_14_03'           , [attk] = 'TopLine label', [attr] = 'SHX_14_03'
    UNION ALL SELECT [Variable]  =  'SHX_14_04'           , [attk] = 'TopLine label', [attr] = 'SHX_14_04'
    UNION ALL SELECT [Variable]  =  'SHX_15_01'           , [attk] = 'TopLine label', [attr] = 'SHX_15_01'
    UNION ALL SELECT [Variable]  =  'SHX_15_02'           , [attk] = 'TopLine label', [attr] = 'SHX_15_02'
    UNION ALL SELECT [Variable]  =  'SHX_15_03'           , [attk] = 'TopLine label', [attr] = 'SHX_15_03'
    UNION ALL SELECT [Variable]  =  'SHX_15_04'           , [attk] = 'TopLine label', [attr] = 'SHX_15_04'
    UNION ALL SELECT [Variable]  =  'SHX_15_05'           , [attk] = 'TopLine label', [attr] = 'SHX_15_05'
    UNION ALL SELECT [Variable]  =  'SHX_15_06'           , [attk] = 'TopLine label', [attr] = 'SHX_15_06'
    UNION ALL SELECT [Variable]  =  'SHX_15_07'           , [attk] = 'TopLine label', [attr] = 'SHX_15_07'
    UNION ALL SELECT [Variable]  =  'SHX_15_08'           , [attk] = 'TopLine label', [attr] = 'SHX_15_08'
    UNION ALL SELECT [Variable]  =  'SHX_15_09'           , [attk] = 'TopLine label', [attr] = 'SHX_15_09'
    UNION ALL SELECT [Variable]  =  'SHX_15_10'           , [attk] = 'TopLine label', [attr] = 'SHX_15_10'
    UNION ALL SELECT [Variable]  =  'SHX_28_01'           , [attk] = 'TopLine label', [attr] = 'SHX_28_01'
    UNION ALL SELECT [Variable]  =  'SHX_28_02'           , [attk] = 'TopLine label', [attr] = 'SHX_28_02'
    UNION ALL SELECT [Variable]  =  'SHX_28_03'           , [attk] = 'TopLine label', [attr] = 'SHX_28_03'
    UNION ALL SELECT [Variable]  =  'SHX_28_04'           , [attk] = 'TopLine label', [attr] = 'SHX_28_04'
    UNION ALL SELECT [Variable]  =  'SHX_28_05'           , [attk] = 'TopLine label', [attr] = 'SHX_28_05'
    UNION ALL SELECT [Variable]  =  'SHX_28_06'           , [attk] = 'TopLine label', [attr] = 'SHX_28_06'
    UNION ALL SELECT [Variable]  =  'SHX_28_07'           , [attk] = 'TopLine label', [attr] = 'SHX_28_07'
    UNION ALL SELECT [Variable]  =  'SHX_28_08'           , [attk] = 'TopLine label', [attr] = 'SHX_28_08'
    UNION ALL SELECT [Variable]  =  'XSG_01_xG1'          , [attk] = 'TopLine label', [attr] = 'XSG_01_xG1'
    UNION ALL SELECT [Variable]  =  'XSG_01_xG2'          , [attk] = 'TopLine label', [attr] = 'XSG_01_xG2'
    UNION ALL SELECT [Variable]  =  'XSG_01_xG3'          , [attk] = 'TopLine label', [attr] = 'XSG_01_xG3'
    UNION ALL SELECT [Variable]  =  'XSG_01_xG4'          , [attk] = 'TopLine label', [attr] = 'XSG_01_xG4'
    UNION ALL SELECT [Variable]  =  'XSG_01_xG5'          , [attk] = 'TopLine label', [attr] = 'XSG_01_xG5'
    UNION ALL SELECT [Variable]  =  'XSG_01_xG6'          , [attk] = 'TopLine label', [attr] = 'XSG_01_xG6'
    UNION ALL SELECT [Variable]  =  'XSG_01_xG7'          , [attk] = 'TopLine label', [attr] = 'XSG_01_xG7'
    UNION ALL SELECT [Variable]  =  'XSG_24'              , [attk] = 'TopLine label', [attr] = 'XSG_24'
    UNION ALL SELECT [Variable]  =  'XSG_S_01'            , [attk] = 'TopLine label', [attr] = 'XSG_S_01'
    UNION ALL SELECT [Variable]  =  'XSG_S_02'            , [attk] = 'TopLine label', [attr] = 'XSG_S_02'
    UNION ALL SELECT [Variable]  =  'XSG_S_03'            , [attk] = 'TopLine label', [attr] = 'XSG_S_03'
    UNION ALL SELECT [Variable]  =  'XSG_S_04'            , [attk] = 'TopLine label', [attr] = 'XSG_S_04'
    UNION ALL SELECT [Variable]  =  'XSG_S_05'            , [attk] = 'TopLine label', [attr] = 'XSG_S_05'
    UNION ALL SELECT [Variable]  =  'XSG_S_06'            , [attk] = 'TopLine label', [attr] = 'XSG_S_06'
    UNION ALL SELECT [Variable]  =  'XSG_S_07'            , [attk] = 'TopLine label', [attr] = 'XSG_S_07'
    UNION ALL SELECT [Variable]  =  'XSG_S_08'            , [attk] = 'TopLine label', [attr] = 'XSG_S_08'
    UNION ALL SELECT [Variable]  =  'XSG_S_09'            , [attk] = 'TopLine label', [attr] = 'XSG_S_09'
    UNION ALL SELECT [Variable]  =  'XSG_S_10'            , [attk] = 'TopLine label', [attr] = 'XSG_S_10'
    UNION ALL SELECT [Variable]  =  'XSG_S_11'            , [attk] = 'TopLine label', [attr] = 'XSG_S_11'
    UNION ALL SELECT [Variable]  =  'XSG_S_12'            , [attk] = 'TopLine label', [attr] = 'XSG_S_12'
    UNION ALL SELECT [Variable]  =  'XSG_S_13'            , [attk] = 'TopLine label', [attr] = 'XSG_S_13'
    UNION ALL SELECT [Variable]  =  'XSG_S_14'            , [attk] = 'TopLine label', [attr] = 'XSG_S_14'
    UNION ALL SELECT [Variable]  =  'XSG_S_15'            , [attk] = 'TopLine label', [attr] = 'XSG_S_15'
    UNION ALL SELECT [Variable]  =  'XSG_S_16'            , [attk] = 'TopLine label', [attr] = 'XSG_S_16'
    UNION ALL SELECT [Variable]  =  'XSG_S_17'            , [attk] = 'TopLine label', [attr] = 'XSG_S_17'
    UNION ALL SELECT [Variable]  =  'XSG_S_18'            , [attk] = 'TopLine label', [attr] = 'XSG_S_18'
    UNION ALL SELECT [Variable]  =  'XSG_S_19'            , [attk] = 'TopLine label', [attr] = 'XSG_S_19'
    UNION ALL SELECT [Variable]  =  'XSG_S_20'            , [attk] = 'TopLine label', [attr] = 'XSG_S_20'
    UNION ALL SELECT [Variable]  =  'XSG_S_21'            , [attk] = 'TopLine label', [attr] = 'XSG_S_21'
    UNION ALL SELECT [Variable]  =  'XSG_S_22'            , [attk] = 'TopLine label', [attr] = 'XSG_S_22'
    UNION ALL SELECT [Variable]  =  'XSG_S_23'            , [attk] = 'TopLine label', [attr] = 'XSG_S_23'
    UNION ALL SELECT [Variable]  =  'XSG_S_99_filter'     , [attk] = 'TopLine label', [attr] = 'XSG_S_99_filter'
    UNION ALL SELECT [Variable]  =  'XSG_S_99_01'         , [attk] = 'TopLine label', [attr] = 'XSG_S_99_01'
    UNION ALL SELECT [Variable]  =  'XSG_S_99_02'         , [attk] = 'TopLine label', [attr] = 'XSG_S_99_02'
    UNION ALL SELECT [Variable]  =  'XSG_S_99_03'         , [attk] = 'TopLine label', [attr] = 'XSG_S_99_03'
    UNION ALL SELECT [Variable]  =  'XSG_S_99_04'         , [attk] = 'TopLine label', [attr] = 'XSG_S_99_04'
    UNION ALL SELECT [Variable]  =  'XSG_S_99_05'         , [attk] = 'TopLine label', [attr] = 'XSG_S_99_05'
    UNION ALL SELECT [Variable]  =  'XSG_S_99_06'         , [attk] = 'TopLine label', [attr] = 'XSG_S_99_06'
/*------------------------------------------------------------------------------------------------------------------------*/
    UNION ALL SELECT [Variable]  =  'GRI_01'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_02'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_03'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_04'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_05'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_06'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_07'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_08_for_index'     , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_09'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_10'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_11'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_12'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_13'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_14'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_15'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_16_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_17'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_18'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_19_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_19_summ_ny'       , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_01'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_02'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_a'          , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_b'          , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_c'          , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_top'        , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_04'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_05'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_top'           , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRX_22_01_ny'         , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRX_22_02_ny'         , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRX_22_03_ny'         , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRX_22_04_ny'         , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRX_22_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRX_24_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRX_25_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_01_summary_a_ny'  , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_01_summary_b'     , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_02'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_03'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_04_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_05_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_06'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_07_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_08'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_09'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_10'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_11_for_index'     , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_12'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_13'               , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHX_25_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHX_26_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHX_27_ny'            , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'XSG_242526_ny'        , [attk] = 'iTL', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'XSG_25n27_ny'         , [attk] = 'iTL', [attr] = '1'
/*------------------------------------------------------------------------------------------------------------------------*/
    UNION ALL SELECT [Variable]  =  'GRI_01'              , [attk] = 'TLC label', [attr] = 'GRI.01'
    UNION ALL SELECT [Variable]  =  'GRI_02'              , [attk] = 'TLC label', [attr] = 'GRI.02'
    UNION ALL SELECT [Variable]  =  'GRI_03'              , [attk] = 'TLC label', [attr] = 'GRI.03'
    UNION ALL SELECT [Variable]  =  'GRI_04'              , [attk] = 'TLC label', [attr] = 'GRI.04'
    UNION ALL SELECT [Variable]  =  'GRI_05'              , [attk] = 'TLC label', [attr] = 'GRI.05'
    UNION ALL SELECT [Variable]  =  'GRI_06'              , [attk] = 'TLC label', [attr] = 'GRI.06'
    UNION ALL SELECT [Variable]  =  'GRI_07'              , [attk] = 'TLC label', [attr] = 'GRI.07'
    UNION ALL SELECT [Variable]  =  'GRI_08_for_index'    , [attk] = 'TLC label', [attr] = 'GRI.08'
    UNION ALL SELECT [Variable]  =  'GRI_09'              , [attk] = 'TLC label', [attr] = 'GRI.09'
    UNION ALL SELECT [Variable]  =  'GRI_10'              , [attk] = 'TLC label', [attr] = 'GRI.10'
    UNION ALL SELECT [Variable]  =  'GRI_11'              , [attk] = 'TLC label', [attr] = 'GRI.11'
    UNION ALL SELECT [Variable]  =  'GRI_12'              , [attk] = 'TLC label', [attr] = 'GRI.12'
    UNION ALL SELECT [Variable]  =  'GRI_13'              , [attk] = 'TLC label', [attr] = 'GRI.13'
    UNION ALL SELECT [Variable]  =  'GRI_14'              , [attk] = 'TLC label', [attr] = 'GRI.14'
    UNION ALL SELECT [Variable]  =  'GRI_15'              , [attk] = 'TLC label', [attr] = 'GRI.15'
    UNION ALL SELECT [Variable]  =  'GRI_16'              , [attk] = 'TLC label', [attr] = 'GRI.16'
    UNION ALL SELECT [Variable]  =  'GRI_17'              , [attk] = 'TLC label', [attr] = 'GRI.17'
    UNION ALL SELECT [Variable]  =  'GRI_18'              , [attk] = 'TLC label', [attr] = 'GRI.18'
    UNION ALL SELECT [Variable]  =  'GRI_19'              , [attk] = 'TLC label', [attr] = 'GRI.19'
    UNION ALL SELECT [Variable]  =  'GRI_20'              , [attk] = 'TLC label', [attr] = 'GRI.20'
    UNION ALL SELECT [Variable]  =  'GRI_20_01'           , [attk] = 'TLC label', [attr] = 'GRI.20.01'
    UNION ALL SELECT [Variable]  =  'GRI_20_02'           , [attk] = 'TLC label', [attr] = 'GRI.20.02'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_top'       , [attk] = 'TLC label', [attr] = 'GRI.20.03'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_a'         , [attk] = 'TLC label', [attr] = 'GRI.20.03.a'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_b'         , [attk] = 'TLC label', [attr] = 'GRI.20.03.b'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_c'         , [attk] = 'TLC label', [attr] = 'GRI.20.03.c'
    UNION ALL SELECT [Variable]  =  'GRI_20_04'           , [attk] = 'TLC label', [attr] = 'GRI.20.04'
    UNION ALL SELECT [Variable]  =  'GRI_20_05'           , [attk] = 'TLC label', [attr] = 'GRI.20.05'
    UNION ALL SELECT [Variable]  =  'SHI_01'              , [attk] = 'TLC label', [attr] = 'SHI.01'
    UNION ALL SELECT [Variable]  =  'SHI_01_a_dummy'      , [attk] = 'TLC label', [attr] = 'SHI.01.a'
    UNION ALL SELECT [Variable]  =  'SHI_01_b_dummy'      , [attk] = 'TLC label', [attr] = 'SHI.01.b'
    UNION ALL SELECT [Variable]  =  'SHI_01_c_dummy'      , [attk] = 'TLC label', [attr] = 'SHI.01.c'
    UNION ALL SELECT [Variable]  =  'SHI_01_d_dummy'      , [attk] = 'TLC label', [attr] = 'SHI.01.d'
    UNION ALL SELECT [Variable]  =  'SHI_01_e_dummy'      , [attk] = 'TLC label', [attr] = 'SHI.01.e'
    UNION ALL SELECT [Variable]  =  'SHI_01_f_dummy'      , [attk] = 'TLC label', [attr] = 'SHI.01.f'
    UNION ALL SELECT [Variable]  =  'SHI_02'              , [attk] = 'TLC label', [attr] = 'SHI.02'
    UNION ALL SELECT [Variable]  =  'SHI_03'              , [attk] = 'TLC label', [attr] = 'SHI.03'
    UNION ALL SELECT [Variable]  =  'SHI_04'              , [attk] = 'TLC label', [attr] = 'SHI.04'
    UNION ALL SELECT [Variable]  =  'SHI_05'              , [attk] = 'TLC label', [attr] = 'SHI.05'
    UNION ALL SELECT [Variable]  =  'SHI_06'              , [attk] = 'TLC label', [attr] = 'SHI.06'
    UNION ALL SELECT [Variable]  =  'SHI_07'              , [attk] = 'TLC label', [attr] = 'SHI.07'
    UNION ALL SELECT [Variable]  =  'SHI_08'              , [attk] = 'TLC label', [attr] = 'SHI.08'
    UNION ALL SELECT [Variable]  =  'SHI_09'              , [attk] = 'TLC label', [attr] = 'SHI.09'
    UNION ALL SELECT [Variable]  =  'SHI_10'              , [attk] = 'TLC label', [attr] = 'SHI.10'
    UNION ALL SELECT [Variable]  =  'SHI_11_for_index'    , [attk] = 'TLC label', [attr] = 'SHI.11'
    UNION ALL SELECT [Variable]  =  'SHI_12'              , [attk] = 'TLC label', [attr] = 'SHI.12'
    UNION ALL SELECT [Variable]  =  'SHI_13'              , [attk] = 'TLC label', [attr] = 'SHI.13'
/*------------------------------------------------------------------------------------------------------------------------*/
    UNION ALL SELECT [Variable]  =  'GRI_01'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_02'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_03'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_04'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_05'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_06'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_07'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_08_for_index'     , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_09'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_10'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_11'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_12'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_13'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_14'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_15'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_16'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_17'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_18'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_19'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_01'            , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_02'            , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_top'        , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_a'          , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_b'          , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_03_c'          , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_04'            , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'GRI_20_05'            , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_01'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_01_a_dummy'       , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_01_b_dummy'       , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_01_c_dummy'       , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_01_d_dummy'       , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_01_e_dummy'       , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_01_f_dummy'       , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_02'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_03'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_04'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_05'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_06'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_07'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_08'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_09'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_10'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_11_for_index'     , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_12'               , [attk] = 'iTLC', [attr] = '1'
    UNION ALL SELECT [Variable]  =  'SHI_13'               , [attk] = 'iTLC', [attr] = '1'
/*------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------------------------------------------------*/
                                                                ) Old_and_New_Data
/*------------------------------------------------------------------------------------------------------------------------*/
LEFT JOIN
/*------------------------------------------------------------------------------------------------------------------------*/
           [forum].[dbo].[Pew_Question_Std]                       PQStd
/*------------------------------------------------------------------------------------------------------------------------*/
ON
        [Variable]
      = [Question_abbreviation_std]
/*------------------------------------------------------------------------------------------------------------------------*/
WHERE 
        [attr]         IS NOT NULL
    AND [attr]     !=  ''
/*------------------------------------------------------------------------------------------------------------------------*/
    

--/**************************************************************************************************************************/
--/*****                                              BackUp> source Table                                              *****/
--/**************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--/*------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Question_Attribute_' + @CrDt + '_sourcetable]
--                FROM      [forum].[dbo].[Pew_Question_Attribute]'               )
--/*------------------------------------------------------------------------------------------------------------------------*/
--/**************************************************************************************************************************/

