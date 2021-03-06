/**************************************************************************************************************************************************/
/***                                                                                                                                            ***/
/***     >>>>>   This is the script used to create the tables:                                                                        <<<<<     ***/
/***                                                           [GRSHRYYYY].[dbo].[Countries]                                                    ***/
/***                                                           [GRSHRYYYY].[dbo].[All_Questions]                                                ***/
/***                                                           [GRSHRYYYY].[dbo].[All_Answers]                                                  ***/
/***                                                           [GRSHRYYYY].[dbo].[Values]                                                       ***/
/***                                                           [GRSHRYYYY].[dbo].[WT_VNs] WideT: Var Names&Values                               ***/
/***                                                           [GRSHRYYYY].[dbo].[CQ]     Curr Questions to be CODED                            ***/
/***             (working tables for being used by the Access coding tool)                                                                      ***/
/***                                                                                                                                            ***/
/**************************************************************************************************************************************************/
/*                                                                                                                                                */
/*  REFERENCE to 2015 appears JUST ONCE in the script                                                                                             */
/*                                                                                                                                                */
/**************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==> creating tables [Countries], [All_Questions], [All_Answers], [Values], [WT_VNs] & [CQ]   --- '
/**************************************************************************************************************************************************/
USE              [GRSHR2015]
GO
/**************************************************************************************************************************************************/

/**************************************************************************************************************************/
/***                                                          *************************************************************/
/***     [Countries]                                          *************************************************************/
/***                                                          *************************************************************/
/**************************************************************************************************************************/
IF (SELECT COUNT([TABLE_NAME]) FROM [INFORMATION_SCHEMA].[TABLES]
     WHERE       [TABLE_NAME] = 'Countries'                          ) = 1
DROP              TABLE         [Countries]
/**************************************************************************************************************************/
SELECT 
----------------------------------------------------------------------------------------------------------------------------
        DISTINCT
        [Nation_fk]
      , [Region5]
      , [Region6]
      , [Ctry_EditorialName]
----------------------------------------------------------------------------------------------------------------------------
INTO
          [Countries]
----------------------------------------------------------------------------------------------------------------------------
  FROM  [AllLongData] 
----------------------------------------------------------------------------------------------------------------------------
ORDER BY [Nation_fk]
--ORDER BY [Ctry_EditorialName]
/**************************************************************************************************************************/





/**************************************************************************************************************************/
/***                                                          *************************************************************/
/***     [All_Questions]                                      *************************************************************/
/***                                                          *************************************************************/
/**************************************************************************************************************************/
IF (SELECT COUNT([TABLE_NAME]) FROM [INFORMATION_SCHEMA].[TABLES]
     WHERE       [TABLE_NAME] = 'All_Questions'                          ) = 1
DROP              TABLE         [All_Questions]
/**************************************************************************************************************************/
SELECT 
----------------------------------------------------------------------------------------------------------------------------
          [Q_Number]
          =  ROW_NUMBER()
             OVER(ORDER BY [QA_std] )
----------------------------------------------------------------------------------------------------------------------------
        , [QS_fk]   AS [Question_Std_fk]
        , [QA_std]  AS [Question_abbreviation_std]
        , [QW_std]  AS [Question_wording_std]
----------------------------------------------------------------------------------------------------------------------------
        , [QClass]  =  CASE
                       WHEN 
                                            [QA_std] LIKE 'GRI_19_[b-f]'
                                OR          [QA_std] LIKE 'SHI_01_[b-f]'
                                OR          [QA_std] LIKE 'SHI_04_[b-f]'
                                OR          [QA_std] LIKE 'SHI_05_[c-f]'
                                OR          [QA_std] LIKE 'SHI_09_n'
                                OR          [QA_std] LIKE 'SHI_10_n'
                                OR          [QA_std] LIKE 'SHI_11_a_n'
                                OR          [QA_std] LIKE 'SHI_11_b_n'
                                                                                 THEN 'COUNT'
                       WHEN 
                                            [QA_std] LIKE 'GRI_19_x'
                                OR          [QA_std] LIKE 'SHI_01_x'
                                OR          [QA_std] LIKE 'SHI_04_x'
                                OR          [QA_std] LIKE 'SHI_05_x'
                                OR          [QA_std] LIKE 'SHI_01_summary_b'
                                                                                 THEN 'PERSI'
                       WHEN 
                                            [QA_std] LIKE '%_yBe'            
                                                                                 THEN 'preyr'
                                                                                 ELSE 'CODED'
                           END 
        , [QDescr]  =  CASE
                       WHEN                 [QA_std] LIKE 'GRX_35%'              THEN 'N'
                       WHEN 
                              (         LEN([QA_std]) = 6
                                OR          [QA_std] LIKE 'GRI_01_x'
                                OR          [QA_std] LIKE 'GRI_0[1-2]_yBe'
                                OR          [QA_std] LIKE 'GRI_16_01'
                                OR          [QA_std] LIKE 'GRI_19_[b-f]'
                                OR (        [QA_std] LIKE 'GRI_20%' 
                                    AND LEN([QA_std])  <   12             )
                                --  AND     [QA_std]  !=  'GRI_20_05_x'   )          /* sharia will have description  */
                                OR          [QA_std] LIKE 'GRX_22_0[1-4]' 
                                OR          [QA_std] LIKE 'GRX_29_0[2-5]' 
                                OR          [QA_std] LIKE 'SHI_01_[a-f]'
                                OR          [QA_std] LIKE 'SHI_04_[b-f]'
                                OR          [QA_std] LIKE 'SHI_04_x01'
                                OR          [QA_std] LIKE 'SHI_05_[c-f]'
                                OR          [QA_std] LIKE 'SHI_11_[a-b]' 
                                OR          [QA_std] LIKE 'XSG_S_99_0[1-6]'   )
                             AND            [QA_std] NOT IN (  'GRI_19'
                                                             , 'SHI_05'       )
                                                                                 THEN 'Y'
                                                                                 ELSE 'N'
                           END 
        , [QTools]  =  CASE
                       WHEN                 [QA_std] LIKE '%_filter'             THEN 'filter'
                       WHEN                 [QA_std] LIKE '%_yBe'                THEN 'prevyr'
                                                                                 ELSE ''
                           END 
        , [QTable]  =  CASE
                       WHEN                 [QA_std] LIKE 'GR%'                  THEN 'GR'
                       WHEN                 [QA_std] LIKE 'SH%'                  THEN 'SH'
                       WHEN                 [QA_std] LIKE 'XS%'                  THEN 'xs'
                           END 
----------------------------------------------------------------------------------------------------------------------------
        , [Q_CCV1]  =  CASE                 /* this is a hard coded value: number of coded conditions of validity */
                       WHEN                 [QA_std] LIKE '%'                    THEN 'A'
                           END 
        , [Q_CCV2]  =  CASE                 /* this is a hard coded value: number of coded conditions of validity */
                       WHEN                 [QA_std] LIKE '%'                    THEN 'A'
                           END 
        , [Q_CCV3]  =  CASE                 /* this is a hard coded value: number of coded conditions of validity */
                       WHEN                 [QA_std] LIKE '%'                    THEN 'A'
                           END 
        , [Q_CCV4]  =  CASE                 /* this is a hard coded value: number of coded conditions of validity */
                       WHEN                 [QA_std] LIKE '%'                    THEN 'A'
                           END 
        , [Q_CCV5]  =  CASE                 /* this is a hard coded value: number of coded conditions of validity */
                       WHEN                 [QA_std] LIKE '%'                    THEN 'A'
                           END 
----------------------------------------------------------------------------------------------------------------------------
INTO
          [All_Questions]
----------------------------------------------------------------------------------------------------------------------------
  FROM
----------------------------------------------------------------------------------------------------------------------------
( SELECT 
          DISTINCT
          [QS_fk]
        , [QA_std]
        , [QW_std]
                                                   FROM  [AllLongData]   )  ALLQS
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
/*** select * from all_questions ******************************************************************************************/





------------------note JC: check for duplication of:
----------------------------GRX_29_01	Were initiatives or actions reported that aimed to reduce religious restrictions or hostilities in the country?
----------------------------GRX_29_02	Were interfaith dialogues reported that aimed to reduce religious restrictions or hostilities in the country?
----------------------------GRX_29_03	Were antidiscrimination policies of actions reported that aimed to reduce religious restrictions or hostilities in the country?
----------------------------GRX_29_04	Were educational and training initiatives reported that aimed to reduce religious restrictions or hostilities in the country?
----------------------------GRX_29_05	Were land and property initiatives reported that aimed to reduce religious restrictions or hostilities in the country?
----and
------GRX_34_02_a
------GRX_34_02_a
------GRX_34_02_b
------GRX_34_02_b
------GRX_34_02_c
------GRX_34_02_c
------GRX_34_02_d
------GRX_34_02_d
------GRX_34_02_e
------GRX_34_02_e
------GRX_34_02_f
------GRX_34_02_f
------GRX_34_02_g
------GRX_34_02_g

/**************************************************************************************************************************/
/***                                                          *************************************************************/
/***     [All_Answers]                                        *************************************************************/
/***                                                          *************************************************************/
/**************************************************************************************************************************/
IF (SELECT COUNT([TABLE_NAME]) FROM [INFORMATION_SCHEMA].[TABLES]
     WHERE       [TABLE_NAME] = 'All_Answers'                     ) = 1
DROP              TABLE         [All_Answers]

SELECT 
        [A_row]     =  ROW_NUMBER()
                       OVER(ORDER BY  [QA_std]
                                    , [AV_std] )
      , [Question_abbreviation_std] = [QA_std]
      , [Answer_value]              = [AV_std]
      , [Answer_wording_std]        = [AW_std]

INTO
          [All_Answers]
FROM
(
          SELECT 
                 DISTINCT
                 [QA_std]
               , [AV_std] = CASE
                                 WHEN [QA_std] LIKE 'GRI_19_[b-f&x]'
                                   OR [QA_std] LIKE 'SHI_01_[b-f&x]'
                                   OR [QA_std] LIKE 'SHI_04_[b-f&x]'
                                   OR [QA_std] LIKE 'SHI_05_[c-f&x]'
                                   OR [QA_std] LIKE 'SHI_09_n'
                                   OR [QA_std] LIKE 'SHI_10_n'
                                   OR [QA_std] LIKE 'SHI_11_[a-b]_n'
                                   THEN NULL
                                   ELSE [Answer_value]
                             END
               , [AW_std] = CASE
                                 WHEN [QA_std] LIKE 'GRI_19_[b-f&x]'
                                   OR [QA_std] LIKE 'SHI_01_[b-f&x]'
                                   OR [QA_std] LIKE 'SHI_04_[b-f&x]'
                                   OR [QA_std] LIKE 'SHI_05_[c-f&x]'
                                   OR [QA_std] LIKE 'SHI_09_n'
                                   OR [QA_std] LIKE 'SHI_10_n'
                                   OR [QA_std] LIKE 'SHI_11_[a-b]_n'
                                   THEN '0 to N incidents'
                                   ELSE [Answer_wording_std]
                             END
            FROM [AllLongData]
           WHERE [Answer_value] IS NOT NULL
           AND NOT (      [QA_std]          LIKE 'GRI_11_%'
                      AND [Answer_value]       = 0.50
                      AND [Answer_wording_std] = 'Yes, there was limited intimidation' )
           AND NOT (      [QA_std]          LIKE 'SHI_01_x_%'
                      AND [Answer_value]       = 0.50
                      AND [Answer_wording_std] = 'Yes, in limited ways'                )
     --    AND     (      [QA_std]          LIKE 'SHI_11%'                             )

UNION ALL SELECT 
  [QA_std] = [q]
, [AV_std] = [v]
, [AW_std] = [w] 
FROM
(
-- recoded questions * (to remember code):
          SELECT 
--[q] = 'SHI_11_a'       , [v] = 0.00, [w] = 'No'
--UNION ALL SELECT 
--[q] = 'SHI_11_a'       , [v] = 1.00, [w] = 'Yes'
--UNION ALL SELECT 
--[q] = 'SHI_11_b'       , [v] = 0.00, [w] = 'No'
--UNION ALL SELECT 
--[q] = 'SHI_11_b'       , [v] = 1.00, [w] = 'Yes'
---- filter questions:
--UNION ALL SELECT 
[q] = 'GRI_01_filter'  , [v] = 0.00, [w] = 'No'
UNION ALL SELECT 
[q] = 'GRI_01_filter'  , [v] = 1.00, [w] = 'Yes'
UNION ALL SELECT 
[q] = 'GRI_02_filter'  , [v] = 0.00, [w] = 'No'
UNION ALL SELECT 
[q] = 'GRI_02_filter'  , [v] = 1.00, [w] = 'Yes'
UNION ALL SELECT 
[q] = 'GRI_19_filter'  , [v] = 0.00, [w] = 'No'
UNION ALL SELECT 
[q] = 'GRI_19_filter'  , [v] = 1.00, [w] = 'Yes'
UNION ALL SELECT 
[q] = 'SHI_04_filter'  , [v] = 0.00, [w] = 'No'
UNION ALL SELECT 
[q] = 'SHI_04_filter'  , [v] = 0.25, [w] = 'Yes, but their activity was limited to recruit'
                                                                         + 'ment and fundraising'
UNION ALL SELECT 
[q] = 'SHI_04_filter'  , [v] = 0.50, [w] = 'or higher - Yes, and their activities included'
                                                                         + ' violence'
UNION ALL SELECT 
[q] = 'SHI_05_filter'  , [v] = 0.00, [w] = 'No'
UNION ALL SELECT 
[q] = 'SHI_05_filter'  , [v] = 1.00, [w] = 'Yes'
UNION ALL SELECT 
[q] = 'XSG_S_99_filter', [v] = 0.00, [w] = 'No supplemental sources'
UNION ALL SELECT 
[q] = 'XSG_S_99_filter', [v] = 1.00, [w] = 'Supplemental source'
UNION ALL SELECT 
[q] = 'XSG_S_99_filter', [v] = 2.00, [w] = 'Supplemental sources'
UNION ALL SELECT 
[q] = 'XSG_S_99_filter', [v] = 3.00, [w] = 'Supplemental sources'
UNION ALL SELECT 
[q] = 'XSG_S_99_filter', [v] = 4.00, [w] = 'Supplemental sources'
UNION ALL SELECT 
[q] = 'XSG_S_99_filter', [v] = 5.00, [w] = 'Supplemental sources'
UNION ALL SELECT 
[q] = 'XSG_S_99_filter', [v] = 6.00, [w] = 'Supplemental sources'
-- UNSELECTED ANSWERS - main questions:
UNION ALL SELECT 
[q] = 'GRX_22_03'      , [v] = 0.33, [w] = 'No, but such a policy is being considered'
UNION ALL SELECT 
[q] = 'XSG_S_02'       , [v] = 0.50, [w] = 'Country included in the source, but no new inf'
                                                                         + 'ormation obtained'
UNION ALL SELECT 
[q] = 'XSG_S_99_04'    , [v] = 0.50, [w] = 'Country included in the source, but no new inf'
                                                                         + 'ormation obtained'
UNION ALL SELECT 
[q] = 'XSG_S_99_05'    , [v] = 0.50, [w] = 'Country included in the source, but no new inf'
                                                                         + 'ormation obtained'
UNION ALL SELECT 
[q] = 'XSG_S_99_06'    , [v] = 0.50, [w] = 'Country included in the source, but no new inf'
                                         + 'ormation obtained'
-- questions added this year:
UNION ALL SELECT * FROM 
(
          SELECT
[q] = 'GRX_34_01'
UNION ALL SELECT 
[q] = 'GRX_34_02_a'
UNION ALL SELECT 
[q] = 'GRX_34_02_b'
UNION ALL SELECT 
[q] = 'GRX_34_02_c'
UNION ALL SELECT 
[q] = 'GRX_34_02_d'
UNION ALL SELECT 
[q] = 'GRX_34_02_e'
UNION ALL SELECT 
[q] = 'GRX_34_02_f'
UNION ALL SELECT 
[q] = 'GRX_34_02_g'
UNION ALL SELECT 
[q] = 'GRX_34_03'
UNION ALL SELECT 
[q] = 'GRX_35_01'
UNION ALL SELECT 
[q] = 'GRX_35_02'
                  ) Q
CROSS JOIN
(
           SELECT        [v] = 0.00, [w] = 'No'
 UNION ALL SELECT        [v] = 1.00, [w] = 'Yes'  ) VW
) ADDEDQs
                                                                                     ) QA_AV_QW
/**************************************************************************************************************************/





/**************************************************************************************************************************/
/***                                                          *************************************************************/
/***     [Values]                                             *************************************************************/
/***                                                          *************************************************************/
IF (SELECT COUNT([TABLE_NAME]) FROM [INFORMATION_SCHEMA].[TABLES]
     WHERE       [TABLE_NAME] = 'Values'                          ) = 1
DROP              TABLE         [Values]
/**************************************************************************************************************************/
/**************************************************************************************************************************/
SELECT 
----------------------------------------------------------------------------------------------------------------------------
         DISTINCT
        [V_row]     =  ROW_NUMBER()
                       OVER(ORDER BY  [A_row] )
----------------------------------------------------------------------------------------------------------------------------
      , [VarName] = [Question_abbreviation_std]
      , [Answer]  = STR((
                    CAST([Answer_value] as decimal (4,2))) , 4,2 ) + '   - ' + [Answer_wording_std]
----------------------------------------------------------------------------------------------------------------------------
  INTO
          [Values]
----------------------------------------------------------------------------------------------------------------------------
  FROM 
----------------------------------------------------------------------------------------------------------------------------
         [All_Answers]
----------------------------------------------------------------------------------------------------------------------------
WHERE    [Question_abbreviation_std] IN ( SELECT [Question_abbreviation_std]
                                            FROM [All_Questions]
                                           WHERE [QClass] = 'CODED'           )
/**************************************************************************************************************************/






/**************************************************************************************************************************************************/
/***                                                          *************************************************************************************/
/***     [WT_VNs] : Wide Table Variable Names & values        *************************************************************************************/
/***                                                          *************************************************************************************/
/**************************************************************************************************************************************************/
IF (SELECT COUNT([TABLE_NAME]) FROM [INFORMATION_SCHEMA].[TABLES]
     WHERE       [TABLE_NAME] = 'WT_VNs'                            ) = 1
DROP              TABLE         [WT_VNs]
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
SELECT 
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
          [WQ_Number]
          =  ROW_NUMBER()
             OVER(ORDER BY [QTOrdr] )
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
      ,   *
/**************************************************************************************************************************************************/
INTO
          [WT_VNs]
/**************************************************************************************************************************************************/
FROM
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
(
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT 
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
       [WQA_std]
      ,[Q_Number]
      ,[Question_Std_fk]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Answers]
      ,[Ans_as_CODE]
      ,[QClass]
      ,[QDescr]
      ,[QTools]
      ,[QTable]
      ,[Q_CCV1]
      ,[Q_CCV2]
      ,[Q_CCV3]
      ,[Q_CCV4]
      ,[Q_CCV5]
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
      ,[QTOrdr] = CASE                 /* this is a hard coded QA/QC step to validate variables currently in the form */
                  WHEN [WQA_Std] = 'GRI_01'              THEN '01|02|02v'
                  WHEN [WQA_Std] = 'GRI_01_DES'          THEN '01|02|03v'
                  WHEN [WQA_Std] = 'GRI_01_filter'       THEN '01|02|01v'
                  WHEN [WQA_Std] = 'GRI_01_x'            THEN '01|01|01v'
                  WHEN [WQA_Std] = 'GRI_01_x_DES'        THEN '01|01|02v'
                  WHEN [WQA_Std] = 'GRI_01_yBe'          THEN '01|02|02x'
                  WHEN [WQA_Std] = 'GRI_01_yBe_DES'      THEN '01|02|03x'
                  WHEN [WQA_Std] = 'GRI_02'              THEN '01|03|02v'
                  WHEN [WQA_Std] = 'GRI_02_DES'          THEN '01|03|03v'
                  WHEN [WQA_Std] = 'GRI_02_filter'       THEN '01|03|01v'
                  WHEN [WQA_Std] = 'GRI_02_yBe'          THEN '01|03|02x'
                  WHEN [WQA_Std] = 'GRI_02_yBe_DES'      THEN '01|03|03x'
                  WHEN [WQA_Std] = 'GRI_03'              THEN '01|04|01v'
                  WHEN [WQA_Std] = 'GRI_03_DES'          THEN '01|04|02v'
                  WHEN [WQA_Std] = 'GRI_04'              THEN '01|16|01v'
                  WHEN [WQA_Std] = 'GRI_04_DES'          THEN '01|16|02v'
                  WHEN [WQA_Std] = 'GRI_05'              THEN '01|11|01v'
                  WHEN [WQA_Std] = 'GRI_05_DES'          THEN '01|11|02v'
                  WHEN [WQA_Std] = 'GRI_06'              THEN '01|12|01v'
                  WHEN [WQA_Std] = 'GRI_06_DES'          THEN '01|12|02v'
                  WHEN [WQA_Std] = 'GRI_07'              THEN '01|15|01v'
                  WHEN [WQA_Std] = 'GRI_07_DES'          THEN '01|15|02v'
                  WHEN [WQA_Std] = 'GRI_08'              THEN '01|13|01v'
                  WHEN [WQA_Std] = 'GRI_08_a'            THEN '01|13|02v'   /* added */
                  WHEN [WQA_Std] = 'GRI_08_DES'          THEN '01|13|03v'
                  WHEN [WQA_Std] = 'GRI_09'              THEN '01|14|01v'
                  WHEN [WQA_Std] = 'GRI_09_DES'          THEN '01|14|02v'
                  WHEN [WQA_Std] = 'GRI_10'              THEN '01|10|01v'
                  WHEN [WQA_Std] = 'GRI_10_01'           THEN '01|10|03v'
                  WHEN [WQA_Std] = 'GRI_10_02'           THEN '01|10|04v'
                  WHEN [WQA_Std] = 'GRI_10_03'           THEN '01|10|05v'
                  WHEN [WQA_Std] = 'GRI_10_DES'          THEN '01|10|02v'
                  WHEN [WQA_Std] = 'GRI_11'              THEN '01|21|01v'
                  WHEN [WQA_Std] = 'GRI_11_01a'          THEN '01|21|03v'
                  WHEN [WQA_Std] = 'GRI_11_01b'          THEN '01|21|04v'
                  WHEN [WQA_Std] = 'GRI_11_02'           THEN '01|21|05v'
                  WHEN [WQA_Std] = 'GRI_11_03'           THEN '01|21|06v'
                  WHEN [WQA_Std] = 'GRI_11_04'           THEN '01|21|07v'
                  WHEN [WQA_Std] = 'GRI_11_05'           THEN '01|21|08v'
                  WHEN [WQA_Std] = 'GRI_11_06'           THEN '01|21|09v'
                  WHEN [WQA_Std] = 'GRI_11_07'           THEN '01|21|10v'
                  WHEN [WQA_Std] = 'GRI_11_08'           THEN '01|21|11v'
                  WHEN [WQA_Std] = 'GRI_11_09'           THEN '01|21|12v'
                  WHEN [WQA_Std] = 'GRI_11_10'           THEN '01|21|13v'
                  WHEN [WQA_Std] = 'GRI_11_11'           THEN '01|21|14v'
                  WHEN [WQA_Std] = 'GRI_11_12'           THEN '01|21|15v'
                  WHEN [WQA_Std] = 'GRI_11_13'           THEN '01|21|16v'
                  WHEN [WQA_Std] = 'GRI_11_15'           THEN '01|21|17v'
                  WHEN [WQA_Std] = 'GRI_11_16'           THEN '01|21|18v'
                  WHEN [WQA_Std] = 'GRI_11_17'           THEN '01|21|19v'
                  WHEN [WQA_Std] = 'GRI_11_DES'          THEN '01|21|02v'
                  WHEN [WQA_Std] = 'GRI_12'              THEN '01|23|01v'
                  WHEN [WQA_Std] = 'GRI_12_DES'          THEN '01|23|02v'
                  WHEN [WQA_Std] = 'GRI_13'              THEN '01|24|01v'
                  WHEN [WQA_Std] = 'GRI_13_DES'          THEN '01|24|02v'
                  WHEN [WQA_Std] = 'GRI_14'              THEN '01|25|01v'
                  WHEN [WQA_Std] = 'GRI_14_DES'          THEN '01|25|02v'
                  WHEN [WQA_Std] = 'GRI_15'              THEN '01|20|01v'
                  WHEN [WQA_Std] = 'GRI_15_DES'          THEN '01|20|02v'
                  WHEN [WQA_Std] = 'GRI_16'              THEN '01|19|01v'
                  WHEN [WQA_Std] = 'GRI_16_01'           THEN '01|19|04v'
                  WHEN [WQA_Std] = 'GRI_16_01_DES'       THEN '01|19|02v'
                  WHEN [WQA_Std] = 'GRI_16_DES'          THEN '01|19|03v'
                  WHEN [WQA_Std] = 'GRI_17'              THEN '01|22|01v'
                  WHEN [WQA_Std] = 'GRI_17_DES'          THEN '01|22|02v'
                  WHEN [WQA_Std] = 'GRI_18'              THEN '01|17|01v'
                  WHEN [WQA_Std] = 'GRI_18_DES'          THEN '01|17|02v'
                  WHEN [WQA_Std] = 'GRI_19'              THEN '01|37|06v'
                  WHEN [WQA_Std] = 'GRI_19_b'            THEN '01|36|02v'
                  WHEN [WQA_Std] = 'GRI_19_b_DES'        THEN '01|36|03v'
                  WHEN [WQA_Std] = 'GRI_19_c'            THEN '01|36|04v'
                  WHEN [WQA_Std] = 'GRI_19_c_DES'        THEN '01|36|05v'
                  WHEN [WQA_Std] = 'GRI_19_d'            THEN '01|36|06v'
                  WHEN [WQA_Std] = 'GRI_19_d_DES'        THEN '01|36|07v'
                  WHEN [WQA_Std] = 'GRI_19_e'            THEN '01|37|01v'
                  WHEN [WQA_Std] = 'GRI_19_e_DES'        THEN '01|37|02v'
                  WHEN [WQA_Std] = 'GRI_19_f'            THEN '01|37|03v'
                  WHEN [WQA_Std] = 'GRI_19_f_DES'        THEN '01|37|04v'
                  WHEN [WQA_Std] = 'GRI_19_filter'       THEN '01|36|01v'
                  WHEN [WQA_Std] = 'GRI_19_x'            THEN '01|37|05v'
                  WHEN [WQA_Std] = 'GRI_20_01'           THEN '01|05|01v'
                  WHEN [WQA_Std] = 'GRI_20_01_DES'       THEN '01|05|02v'
                  WHEN [WQA_Std] = 'GRI_20_01x_01a'      THEN '01|05|03v'
                  WHEN [WQA_Std] = 'GRI_20_01x_01b'      THEN '01|05|04v'
                  WHEN [WQA_Std] = 'GRI_20_01x_02'       THEN '01|05|05v'
                  WHEN [WQA_Std] = 'GRI_20_01x_03'       THEN '01|05|06v'
                  WHEN [WQA_Std] = 'GRI_20_01x_04'       THEN '01|05|07v'
                  WHEN [WQA_Std] = 'GRI_20_01x_05'       THEN '01|05|08v'
                  WHEN [WQA_Std] = 'GRI_20_01x_06'       THEN '01|05|09v'
                  WHEN [WQA_Std] = 'GRI_20_01x_07'       THEN '01|05|10v'
                  WHEN [WQA_Std] = 'GRI_20_01x_08'       THEN '01|05|11v'
                  WHEN [WQA_Std] = 'GRI_20_01x_09'       THEN '01|05|12v'
                  WHEN [WQA_Std] = 'GRI_20_01x_10'       THEN '01|05|13v'
                  WHEN [WQA_Std] = 'GRI_20_02'           THEN '01|06|01v'
                  WHEN [WQA_Std] = 'GRI_20_02_DES'       THEN '01|06|02v'
                  WHEN [WQA_Std] = 'GRI_20_03_a'         THEN '01|07|01v'
                  WHEN [WQA_Std] = 'GRI_20_03_a_DES'     THEN '01|07|02v'
                  WHEN [WQA_Std] = 'GRI_20_03_b'         THEN '01|07|03v'
                  WHEN [WQA_Std] = 'GRI_20_03_b_DES'     THEN '01|07|04v'
                  WHEN [WQA_Std] = 'GRI_20_03_c'         THEN '01|07|05v'
                  WHEN [WQA_Std] = 'GRI_20_03_c_DES'     THEN '01|07|06v'
                  WHEN [WQA_Std] = 'GRI_20_04'           THEN '01|08|03v'
                  WHEN [WQA_Std] = 'GRI_20_04_DES'       THEN '01|08|04v'
                  WHEN [WQA_Std] = 'GRI_20_04_x'         THEN '01|08|01v'
                  WHEN [WQA_Std] = 'GRI_20_04_x_DES'     THEN '01|08|02v'
                  WHEN [WQA_Std] = 'GRI_20_05'           THEN '01|09|01v'
                  WHEN [WQA_Std] = 'GRI_20_05_DES'       THEN '01|09|02v'
                  WHEN [WQA_Std] = 'GRI_20_05_x'         THEN '01|09|03v'
                  WHEN [WQA_Std] = 'GRI_20_05_x_DES'     THEN '01|09|04v'
                  WHEN [WQA_Std] = 'GRX_22_01'           THEN '01|26|01v'
                  WHEN [WQA_Std] = 'GRX_22_01_DES'       THEN '01|26|02v'
                  WHEN [WQA_Std] = 'GRX_22_02'           THEN '01|27|01v'
                  WHEN [WQA_Std] = 'GRX_22_02_DES'       THEN '01|27|02v'
                  WHEN [WQA_Std] = 'GRX_22_03'           THEN '01|28|01v'
                  WHEN [WQA_Std] = 'GRX_22_03_DES'       THEN '01|28|02v'
                  WHEN [WQA_Std] = 'GRX_22_04'           THEN '01|29|01v'
                  WHEN [WQA_Std] = 'GRX_22_04_DES'       THEN '01|29|02v'
                  WHEN [WQA_Std] = 'GRX_29_01'           THEN '01|30|01v'
                  WHEN [WQA_Std] = 'GRX_29_02'           THEN '01|30|02v'
                  WHEN [WQA_Std] = 'GRX_29_02_DES'       THEN '01|30|03v'
                  WHEN [WQA_Std] = 'GRX_29_03'           THEN '01|30|04v'
                  WHEN [WQA_Std] = 'GRX_29_03_DES'       THEN '01|30|05v'
                  WHEN [WQA_Std] = 'GRX_29_04'           THEN '01|31|01v'
                  WHEN [WQA_Std] = 'GRX_29_04_DES'       THEN '01|31|02v'
                  WHEN [WQA_Std] = 'GRX_29_05'           THEN '01|31|03v'
                  WHEN [WQA_Std] = 'GRX_29_05_DES'       THEN '01|31|04v'
                  WHEN [WQA_Std] = 'GRX_30'              THEN '01|32|01v'
                  WHEN [WQA_Std] = 'GRX_30_DES'          THEN '01|32|02v'
                  WHEN [WQA_Std] = 'GRX_31'              THEN '01|33|01v'
                  WHEN [WQA_Std] = 'GRX_31_DES'          THEN '01|33|02v'
                  WHEN [WQA_Std] = 'GRX_32'              THEN '01|33|03v'
                  WHEN [WQA_Std] = 'GRX_32_DES'          THEN '01|33|04v'
                  WHEN [WQA_Std] = 'GRX_34_01'           THEN '01|34|01v'   /* added */
                  WHEN [WQA_Std] = 'GRX_34_02'           THEN '01|34|02v'
                  WHEN [WQA_Std] = 'GRX_34_02_a'         THEN '01|34|03v'
                  WHEN [WQA_Std] = 'GRX_34_02_b'         THEN '01|34|04v'
                  WHEN [WQA_Std] = 'GRX_34_02_c'         THEN '01|34|05v'
                  WHEN [WQA_Std] = 'GRX_34_02_d'         THEN '01|34|06v'
                  WHEN [WQA_Std] = 'GRX_34_02_e'         THEN '01|34|07v'
                  WHEN [WQA_Std] = 'GRX_34_02_f'         THEN '01|34|08v'
                  WHEN [WQA_Std] = 'GRX_34_02_g'         THEN '01|34|09v'
                  WHEN [WQA_Std] = 'GRX_34_03'           THEN '01|34|10v'
                  WHEN [WQA_Std] = 'GRX_35_01'           THEN '01|35|01v'
                  WHEN [WQA_Std] = 'GRX_35_02'           THEN '01|35|02v'
                  WHEN [WQA_Std] = 'SHI_01_a'            THEN '02|01|01v'
                  WHEN [WQA_Std] = 'SHI_01_a_DES'        THEN '02|01|02v'
                  WHEN [WQA_Std] = 'SHI_01_b'            THEN '02|02|01v'
                  WHEN [WQA_Std] = 'SHI_01_b_DES'        THEN '02|02|02v'
                  WHEN [WQA_Std] = 'SHI_01_c'            THEN '02|02|03v'
                  WHEN [WQA_Std] = 'SHI_01_c_DES'        THEN '02|02|04v'
                  WHEN [WQA_Std] = 'SHI_01_d'            THEN '02|02|05v'
                  WHEN [WQA_Std] = 'SHI_01_d_DES'        THEN '02|02|06v'
                  WHEN [WQA_Std] = 'SHI_01_e'            THEN '02|03|01v'
                  WHEN [WQA_Std] = 'SHI_01_e_DES'        THEN '02|03|02v'
                  WHEN [WQA_Std] = 'SHI_01_f'            THEN '02|03|03v'
                  WHEN [WQA_Std] = 'SHI_01_f_DES'        THEN '02|03|04v'
                  WHEN [WQA_Std] = 'SHI_01_summary_b'    THEN '02|03|06v'
                  WHEN [WQA_Std] = 'SHI_01_x'            THEN '02|03|05v'
                  WHEN [WQA_Std] = 'SHI_01_x_01a'        THEN '02|01|03v'
                  WHEN [WQA_Std] = 'SHI_01_x_01b'        THEN '02|01|04v'
                  WHEN [WQA_Std] = 'SHI_01_x_02'         THEN '02|01|05v'
                  WHEN [WQA_Std] = 'SHI_01_x_03'         THEN '02|01|06v'
                  WHEN [WQA_Std] = 'SHI_01_x_04'         THEN '02|01|07v'
                  WHEN [WQA_Std] = 'SHI_01_x_05'         THEN '02|01|08v'
                  WHEN [WQA_Std] = 'SHI_01_x_06'         THEN '02|01|09v'
                  WHEN [WQA_Std] = 'SHI_01_x_07'         THEN '02|01|10v'
                  WHEN [WQA_Std] = 'SHI_01_x_08'         THEN '02|01|11v'
                  WHEN [WQA_Std] = 'SHI_01_x_09'         THEN '02|01|12v'
                  WHEN [WQA_Std] = 'SHI_01_x_10'         THEN '02|01|13v'
                  WHEN [WQA_Std] = 'SHI_01_x_11'         THEN '02|01|14v'
                  WHEN [WQA_Std] = 'SHI_01_x_12'         THEN '02|01|15v'
                  WHEN [WQA_Std] = 'SHI_01_x_13'         THEN '02|01|16v'
                  WHEN [WQA_Std] = 'SHI_01_x_15'         THEN '02|01|17v'
                  WHEN [WQA_Std] = 'SHI_01_x_16'         THEN '02|01|18v'
                  WHEN [WQA_Std] = 'SHI_01_x_17'         THEN '02|01|19v'
                  WHEN [WQA_Std] = 'SHI_02'              THEN '02|04|01v'
                  WHEN [WQA_Std] = 'SHI_02_01'           THEN '02|04|03v'
                  WHEN [WQA_Std] = 'SHI_02_DES'          THEN '02|04|02v'
                  WHEN [WQA_Std] = 'SHI_03'              THEN '02|05|01v'
                  WHEN [WQA_Std] = 'SHI_03_DES'          THEN '02|05|02v'
                  WHEN [WQA_Std] = 'SHI_04'              THEN '02|08|06v'
                  WHEN [WQA_Std] = 'SHI_04_b'            THEN '02|07|01v'
                  WHEN [WQA_Std] = 'SHI_04_b_DES'        THEN '02|07|02v'
                  WHEN [WQA_Std] = 'SHI_04_c'            THEN '02|07|03v'
                  WHEN [WQA_Std] = 'SHI_04_c_DES'        THEN '02|07|04v'
                  WHEN [WQA_Std] = 'SHI_04_d'            THEN '02|07|05v'
                  WHEN [WQA_Std] = 'SHI_04_d_DES'        THEN '02|06|02v'
                  WHEN [WQA_Std] = 'SHI_04_DES'          THEN '02|07|06v'
                  WHEN [WQA_Std] = 'SHI_04_e'            THEN '02|08|01v'
                  WHEN [WQA_Std] = 'SHI_04_e_DES'        THEN '02|08|02v'
                  WHEN [WQA_Std] = 'SHI_04_f'            THEN '02|08|03v'
                  WHEN [WQA_Std] = 'SHI_04_f_DES'        THEN '02|08|04v'
                  WHEN [WQA_Std] = 'SHI_04_filter'       THEN '02|06|01v'
                  WHEN [WQA_Std] = 'SHI_04_x'            THEN '02|08|05v'
                  WHEN [WQA_Std] = 'SHI_04_x01'          THEN '02|06|04v'
                  WHEN [WQA_Std] = 'SHI_04_x01_DES'      THEN '02|06|03v'
                  WHEN [WQA_Std] = 'SHI_05'              THEN '02|10|06v'
                  WHEN [WQA_Std] = 'SHI_05_c'            THEN '02|09|02v'
                  WHEN [WQA_Std] = 'SHI_05_c_DES'        THEN '02|09|03v'
                  WHEN [WQA_Std] = 'SHI_05_d'            THEN '02|09|04v'
                  WHEN [WQA_Std] = 'SHI_05_d_DES'        THEN '02|09|05v'
                  WHEN [WQA_Std] = 'SHI_05_e'            THEN '02|10|01v'
                  WHEN [WQA_Std] = 'SHI_05_e_DES'        THEN '02|10|02v'
                  WHEN [WQA_Std] = 'SHI_05_f'            THEN '02|10|03v'
                  WHEN [WQA_Std] = 'SHI_05_f_DES'        THEN '02|10|04v'
                  WHEN [WQA_Std] = 'SHI_05_filter'       THEN '02|09|01v'
                  WHEN [WQA_Std] = 'SHI_05_x'            THEN '02|10|05v'
                  WHEN [WQA_Std] = 'SHI_06'              THEN '02|11|01v'
                  WHEN [WQA_Std] = 'SHI_06_DES'          THEN '02|11|02v'
                  WHEN [WQA_Std] = 'SHI_07'              THEN '02|15|01v'
                  WHEN [WQA_Std] = 'SHI_07_DES'          THEN '02|15|02v'
                  WHEN [WQA_Std] = 'SHI_08'              THEN '02|14|01v'
                  WHEN [WQA_Std] = 'SHI_08_DES'          THEN '02|14|02v'
                  WHEN [WQA_Std] = 'SHI_09'              THEN '02|18|01v'
                  WHEN [WQA_Std] = 'SHI_09_DES'          THEN '02|18|02v'
                  WHEN [WQA_Std] = 'SHI_09_n'            THEN '02|18|03v'
                  WHEN [WQA_Std] = 'SHI_10'              THEN '02|19|01v'
                  WHEN [WQA_Std] = 'SHI_10_DES'          THEN '02|19|02v'
                  WHEN [WQA_Std] = 'SHI_10_n'            THEN '02|19|03v'
                  WHEN [WQA_Std] = 'SHI_11_b'            THEN '02|16|01v'   /* added */
                  WHEN [WQA_Std] = 'SHI_11_b_DES'        THEN '02|16|02v'
                  WHEN [WQA_Std] = 'SHI_11_b_n'          THEN '02|16|03v'
                  WHEN [WQA_Std] = 'SHI_11_a'            THEN '02|17|01v'   /* added */
                  WHEN [WQA_Std] = 'SHI_11_a_DES'        THEN '02|17|02v'
                  WHEN [WQA_Std] = 'SHI_11_a_n'          THEN '02|17|03v'
                  WHEN [WQA_Std] = 'SHI_12'              THEN '02|13|01v'
                  WHEN [WQA_Std] = 'SHI_12_DES'          THEN '02|13|02v'
                  WHEN [WQA_Std] = 'SHI_13'              THEN '02|12|01v'
                  WHEN [WQA_Std] = 'SHI_13_DES'          THEN '02|12|02v'
                  WHEN [WQA_Std] = 'XSG_S_01'            THEN '03|01|01v'
                  WHEN [WQA_Std] = 'XSG_S_02'            THEN '03|01|02v'
                  WHEN [WQA_Std] = 'XSG_S_03'            THEN '03|01|03v'
                  WHEN [WQA_Std] = 'XSG_S_04'            THEN '03|01|04v'
                  WHEN [WQA_Std] = 'XSG_S_05'            THEN '03|01|05v'
                  WHEN [WQA_Std] = 'XSG_S_06'            THEN '03|01|06v'
                  WHEN [WQA_Std] = 'XSG_S_07'            THEN '03|01|07v'
                  WHEN [WQA_Std] = 'XSG_S_08'            THEN '03|01|08v'
                  WHEN [WQA_Std] = 'XSG_S_09'            THEN '03|01|09v'
                  WHEN [WQA_Std] = 'XSG_S_10'            THEN '03|01|10v'
                  WHEN [WQA_Std] = 'XSG_S_11'            THEN '03|01|11v'
                  WHEN [WQA_Std] = 'XSG_S_12'            THEN '03|01|12v'
                  WHEN [WQA_Std] = 'XSG_S_13'            THEN '03|02|01v'
                  WHEN [WQA_Std] = 'XSG_S_14'            THEN '03|02|02v'
                  WHEN [WQA_Std] = 'XSG_S_15'            THEN '03|02|03v'
                  WHEN [WQA_Std] = 'XSG_S_16'            THEN '03|02|04v'
                  WHEN [WQA_Std] = 'XSG_S_17'            THEN '03|02|05v'
                  WHEN [WQA_Std] = 'XSG_S_18'            THEN '03|02|06v'
                  WHEN [WQA_Std] = 'XSG_S_19'            THEN '03|02|07v'
                  WHEN [WQA_Std] = 'XSG_S_20'            THEN '03|02|08v'
                  WHEN [WQA_Std] = 'XSG_S_21'            THEN '03|02|09v'
                  WHEN [WQA_Std] = 'XSG_S_22'            THEN '03|02|10v'
                  WHEN [WQA_Std] = 'XSG_S_23'            THEN '03|02|11v'
                  WHEN [WQA_Std] = 'XSG_S_99_01'         THEN '03|03|02v'
                  WHEN [WQA_Std] = 'XSG_S_99_01_DES'     THEN '03|03|01v'
                  WHEN [WQA_Std] = 'XSG_S_99_02'         THEN '03|03|04v'
                  WHEN [WQA_Std] = 'XSG_S_99_02_DES'     THEN '03|03|03v'
                  WHEN [WQA_Std] = 'XSG_S_99_03'         THEN '03|03|06v'
                  WHEN [WQA_Std] = 'XSG_S_99_03_DES'     THEN '03|03|05v'
                  WHEN [WQA_Std] = 'XSG_S_99_04'         THEN '03|03|08v'
                  WHEN [WQA_Std] = 'XSG_S_99_04_DES'     THEN '03|03|07v'
                  WHEN [WQA_Std] = 'XSG_S_99_05'         THEN '03|03|10v'
                  WHEN [WQA_Std] = 'XSG_S_99_05_DES'     THEN '03|03|09v'
                  WHEN [WQA_Std] = 'XSG_S_99_06'         THEN '03|03|12v'
                  WHEN [WQA_Std] = 'XSG_S_99_06_DES'     THEN '03|03|11v'
                  WHEN [WQA_Std] = 'XSG_S_99_filter'     THEN '03|02|12v'
                                                         ELSE 'VEXCLUDED'
                  END
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
FROM
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
(
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
            SELECT   
                     [WQA_Std] = [Question_abbreviation_std]
                   , [Q_Number]
                   , [Question_Std_fk]
                   , [Question_abbreviation_std]
                   , [Question_wording_std]
                   , [Answers]                   = CASE
                                                   WHEN         [Ans_as_CODE] IS NOT NULL
                                                   THEN REPLACE([Ans_as_CODE],CHAR(39)+CHAR(39),CHAR(39))
                                                   WHEN         [QClass] IN ( 'COUNT', 'PERSI' )
                                                   THEN 'any possitive integer from 0 to N'
                                                   WHEN         [QClass] IN ( 'preyr' )
                                                   THEN ''
                                                    END
                   , [Ans_as_CODE]
                   , [QClass]
                   , [QDescr]
                   , [QTools]
                   , [QTable]
                   , [Q_CCV1]
                   , [Q_CCV2]
                   , [Q_CCV3]
                   , [Q_CCV4]
                   , [Q_CCV5]
              FROM   [All_Questions]
    LEFT OUTER JOIN
/**************************************************************************************************************************************************/
                    (
/**************************************************************************************************************************************************/
SELECT                                                    /*** >>>    begin main select statement of Q&A                                        ***/
              [QAS]           =  Q.[VarName]              /***        include variable name (once since comes from the selection of questions   ***/
/*================================================================================================================================================*/
          ,   [Ans_as_CODE]   =                           /***        include set of answers (nested in XML string cell) by distinct question   ***/
            STUFF((                                       /*** >>     begin stuffing function & parenthesis for query XML cell to be stuffed    ***/
                    SELECT ', ''' +                       /*** >      select answers, adding string (, ') before each answer                    ***/
                    REPLACE                               /***        replace substring to avoid code to produce error:                         ***/
                    ([Answer],CHAR(39),CHAR(39)+CHAR(39)) /***        each quotation mark should be two quotation marks (one after the other)   ***/
                                                   + '''' /*** >      and adding string (') after each answer                                   ***/
                        AS [text()]                       /***        specification that answers will be selected as text                       ***/
                      FROM [Values]                  A    /***        table to select answers (one distinct by row) and alias of the table      ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
                            WHERE   A.[VarName]           /***        merging statement of the selection of answers                             ***/
                                  = Q.[VarName]           /***        corresponding to the selection of questions                               ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
                     FOR XML PATH('')                     /*** <      end of selection of answers, nesting all cells into an XML string cell    ***/
                                      ), 1, 1, '' )       /*** <<     end stuffing from position 1, change 1 character (the 1st comma) into ''  ***/
/*================================================================================================================================================*/
FROM                                                      /***        statement refered to the main source (of unique questions)                ***/
         (          SELECT  DISTINCT   [VarName]          /*** >>     select distinct questions                                                 ***/
                                 FROM  [Values]   )  Q    /*** <<     from the table including questions and alias / end selection of Q&A       ***/
/**************************************************************************************************************************************************/
                    ) QA
/**************************************************************************************************************************************************/
                 ON    [Question_abbreviation_std]
                     = [QAS]
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
  UNION ALL SELECT   [WQA_Std]                   = [Question_abbreviation_std] + '_DES'
                   , [Q_Number]
                   , [Question_Std_fk]
                   , [Question_abbreviation_std]
                   , [Question_wording_std]
                   , [Answers]                   = 'text description when scaled value is not zero'
                   , [Ans_as_CODE]               = NULL
                   , [QClass]                    = 'DESCR'
                   , [QDescr]
                   , [QTools]
                   , [QTable]
                   , [Q_CCV1]                    = NULL
                   , [Q_CCV2]                    = NULL
                   , [Q_CCV3]                    = NULL
                   , [Q_CCV4]                    = NULL
                   , [Q_CCV5]                    = NULL
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
              FROM   [All_Questions]
             WHERE   [QDescr] = 'Y'
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
) WTQ
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
) WTQ_and_O
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/






/**************************************************************************************************************************/
/***                                                          *************************************************************/
/***     [CQ]: Current Questions to be CODED                  *************************************************************/
/***                                                          *************************************************************/
/**************************************************************************************************************************/
IF (SELECT COUNT([TABLE_NAME]) FROM [INFORMATION_SCHEMA].[TABLES]
     WHERE       [TABLE_NAME] = 'CQ'                             ) = 1
DROP              TABLE         [CQ]
/**************************************************************************************************************************/
SELECT 
----------------------------------------------------------------------------------------------------------------------------
          [CQY_n]
          =  ROW_NUMBER()
             OVER(ORDER BY [Nation_fk], [QTOrdr] )
----------------------------------------------------------------------------------------------------------------------------
      , [Nation_fk]
      , [Region5]
      , [Region6]
      , [Ctry_EditorialName]
      , [Question_Year]        =  'Year_' + CAST((SELECT MAX([Question_Year]) FROM [AllLongData]) AS NVARCHAR)

      , [QS_fk]
	  , [QA_std]
	  , [QW_std]
      , [QTOrdr]

----------------------------------------------------------------------------------------------------------------------------
INTO
          [CQ]
----------------------------------------------------------------------------------------------------------------------------

FROM      [Countries]
CROSS JOIN
( SELECT 
         [QA_std]  =  [WQA_std]
        ,[QS_fk]   =  [Question_Std_fk]
        ,[QW_std]  =  [Question_wording_std]
    --  ,[QClass]
    --  ,[QTools]
        ,[QTOrdr]
    FROM [WT_VNs]
   WHERE [QClass] != 'DESCR'
     AND [QTools]  = ''                                                ) MYV
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
GO
