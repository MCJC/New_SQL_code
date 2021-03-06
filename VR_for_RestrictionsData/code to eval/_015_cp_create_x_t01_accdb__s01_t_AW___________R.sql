/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the pro-access-tool table [vrx_w_01_proGRSHRadm_01]                                             <<<<<     ***/
/***                                                                                                                                                         ***/
/***                                                      > > >     lookup tables work faster     < < <                                                      ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
---- THIS SCRIPT IS NOT CLEAN
USE [forum_ResAnal]
GO
/***************************************************************************************************************************************************************/
IF OBJECT_ID  (N'[forum_ResAnal].[dbo].[vrx_w_01_proGRSHRadm_01]', N'U') IS NOT NULL
DROP TABLE       [forum_ResAnal].[dbo].[vrx_w_01_proGRSHRadm_01]
/***************************************************************************************************************************************************************/
/*** all combinations + distinct actual combinations of Q&A ****************************************************************************************************/
SELECT * 	INTO [forum_ResAnal].[dbo].[vrx_w_01_proGRSHRadm_01]
FROM
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
(
SELECT

           [QA_lnk]   = [QA_std]
      ,    [AV_std]
      ,    [AW_std]   = CASE
                             WHEN [Answer_Wording_std] IS NOT NULL
                             THEN [Answer_Wording_std]
                             ELSE 'THE VALUE IS NOT A VALID ANSWER'
                         END
FROM

(


SELECT *
  FROM
(
SELECT 
       DISTINCT
       [QA_std]
     , [QA_lnk] = CASE 
                       WHEN              [QA_std] LIKE '%__p' 
                       THEN STUFF(       [QA_std]      ,         
                       (CHARINDEX('__p', [QA_std])), 3, '')
                       ELSE              [QA_std]
                  END
  FROM [forum_ResAnal].[dbo].[vr_06w_LongData_ALL_bkup]
WHERE  [note] LIKE '%this field can be edited'                       )  KL

cross join

(SELECT * FROM
 (       SELECT [AV_std] = '0.00'
   UNION SELECT [AV_std] = '0.20'
   UNION SELECT [AV_std] = '0.25'
   UNION SELECT [AV_std] = '0.33'
   UNION SELECT [AV_std] = '0.40'
   UNION SELECT [AV_std] = '0.50'
   UNION SELECT [AV_std] = '0.60'
   UNION SELECT [AV_std] = '0.67'
   UNION SELECT [AV_std] = '0.75'
   UNION SELECT [AV_std] = '0.80'
   UNION SELECT [AV_std] = '1.00'   )  DE ) JJ
LEFT JOIN


( SELECT 
                           [Question_abbreviation_std]
                         , [Answer_Wording_std]
                         , [Answer_value_std]
    FROM
         [forum].[dbo].[Pew_Q&A_Std]   )   IIJIJ
ON
      [QA_lnk] = [Question_abbreviation_std]
AND   [AV_std] = [Answer_value_std]

) KKKL

/*********************** all combinations + distinct actual combinations of Q&A ***/
)                                                                         ACplusDAC
/**********************************************************************************/
pivot (MAX ([AW_std]) 
       for  [AV_std] in (
                                 [0.00]
                               , [0.20]
                               , [0.25]
                               , [0.33]
                               , [0.40]
                               , [0.50]
                               , [0.60]
                               , [0.67]
                               , [0.75]
                               , [0.80]
                               , [1.00]
                                          ))  AS ValidValues
/**********************************************************************************/
/**********************************************************************************/






-----------------------------------------------------------------------------------------------------------------------------------------------------------------



/**************************************************************************************************** all combinations + distinct actual combinations of Q&A ***/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
GO
/***************************************************************************************************************************************************************/
