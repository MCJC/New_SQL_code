/********************************************************************************************/
USE forum ;
GO
/********************************************************************************************/
IF OBJECT_ID ('Pew_Question_Displayable', 'V') IS NOT NULL
  DROP VIEW    Pew_Question_Displayable;
GO
/********************************************************************************************/
CREATE VIEW    Pew_Question_Displayable
AS
/*** ALL Qs *********************************************************************************/
SELECT
       *
from
(
/********************************************************************************************/
-- Notice that:
-- the statement " distinct Question_abbreviation_std, Question_Year '
-- gives all cases, because such combined fields are a unique ID
/*** Restrictions Questions *****************************************************************/
SELECT   Question_abbreviation_std
       , Question_short_wording_std
       , Question_Year
FROM
(
       SELECT Question_Year = 2007
 UNION SELECT Question_Year = 2008
 UNION SELECT Question_Year = 2009
 UNION SELECT Question_Year = 2010
 UNION SELECT Question_Year = 2011
) AS YR
CROSS JOIN
(
SELECT
          Question_abbreviation_std
        , Question_short_wording_std
  FROM [forum].[dbo].[Pew_Question_std]
WHERE  Question_abbreviation_std IN
(
  'GRI'
, 'GRI_01'
, 'GRI_02'
, 'GRI_03'
, 'GRI_04'
, 'GRI_05'
, 'GRI_06'
, 'GRI_07'
, 'GRI_08'
, 'GRI_09'
, 'GRI_10'
, 'GRI_11'
, 'GRI_12'
, 'GRI_13'
, 'GRI_14'
, 'GRI_15'
, 'GRI_16'
, 'GRI_17'
, 'GRI_18'
, 'GRI_19'
--, 'GRI_19_b'
--, 'GRI_19_c'
--, 'GRI_19_d'
--, 'GRI_19_e'
--, 'GRI_19_f'
, 'GRI_20_SUMMARY'
, 'GRI_20_01'
, 'GRI_20_02'
, 'GRI_20_03_SUMMARY'
, 'GRI_20_03_a'
, 'GRI_20_03_b'
, 'GRI_20_03_c'
, 'GRI_20_04'
, 'GRI_20_05'
, 'SHI'
, 'SHI_01_summary_a'
, 'SHI_01_summary_b'
, 'SHI_02'
, 'SHI_03'
, 'SHI_04'
, 'SHI_05'
, 'SHI_06'
, 'SHI_07'
, 'SHI_08'
, 'SHI_09'
, 'SHI_10'
, 'SHI_11'
, 'SHI_12'
, 'SHI_13'
, 'GFI'
)
) AS VARS
/***************************************************************** Restrictions Questions ***/
UNION
/*** Survey Questions ***********************************************************************/
SELECT DISTINCT
         Question_abbreviation_std
       , Question_short_wording_std
       , Question_Year
  FROM [forum].[dbo].[Pew_Question]
 WHERE  Question_abbreviation_std     LIKE 'SVY%'
   AND  Question_abbreviation_std       != 'SVYc_0073'
   AND  Question_abbreviation     NOT LIKE 'CSP%'
/*********************************************************************** Survey Questions ***/
)
AS Qs_to_D
/********************************************************************************* ALL Qs ***/
-- Other Filters

