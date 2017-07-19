/**********************************************************************************************************************************************************/
/*****                                              BackUp current Tables                                                                             *****/
/**********************************************************************************************************************************************************/
  USE [forum]
GO
/**********************************************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                  INTO  [_bk_forum].[dbo].[Pew_Answer_NoStd_' + @CrDt + ']
--                  FROM      [forum].[dbo].[Pew_Answer_NoStd]'               )
/**********************************************************************************************************************************************************/



/**********************************************************************************************************************************************************/
--- 18 records to replace text ONLY
WITH
     RTO AS  ---- REPLACE TEXT ONLY
(
          SELECT C = 2013, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Fiji', G =  '22. FREEDOM OF RELIGION, CONSCIENCE AND BELIEf 1. Every person has the right to freedom of religion, conscience and belief.'
)
/**********************************************************************************************************************************************************/
-- Update from CTE table:
--   LINKED tables cannot be directly used if >1 table would have the same exposed name
--   Then we use correlation names to distinguish them.
-- -- UPDATE    [forum].[dbo].[Pew_Answer_NoStd]
-- -- SET       [forum].[dbo].[Pew_Answer_NoStd].[Answer_Wording]  =  [RTO].[G]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
--------select   ANS.Answer_pk   ,ANS.Answer_value_NoStd   ,ANS.Answer_Wording   ,ANS.Answer_Std_fk   ,ANS.Question_fk
--------                         ,RTO.E                    ,RTO.G
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
FROM
          [forum].[dbo].[Pew_Answer_NoStd]                               ANS
INNER
JOIN
          [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]         EXT
   ON 
       [Answer_fk]
      =[Answer_pk]
INNER
JOIN
       [RTO]
   ON 
       [C]
      =[Question_Year]
  AND
       [D]
      =[QA_std]
       [B]
      =[Ctry_EditorialName]
/**********************************************************************************************************************************************************/
/**********************************************************************************************************************************************************/



/**********************************************************************************************************************************************************/
--- 46 records to update
WITH
     VTS AS  ---- REPLACE VALUE & TEXT, as well as link to StdAnswer
(
          SELECT C = 2013, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Mexico', G =  'ARTICLE 24 - Every person has the right to have freedom of ethical convictions, of conscience and of religion, and to have or to adopt, as the case may be, the one of her preference. Such freedom includes the right to participate, individually or collectively, in both public and private ceremonies, worship or religious acts of the respective cult, as long as they are not a felony or a misdemeanor punished by law. No person is allowed to use these public acts of religious expression with political ends, for campaigning or as means of political propaganda.'
)
/**********************************************************************************************************************************************************/
-- Update from CTE table:
--   LINKED tables cannot be directly used if >1 table would have the same exposed name
--   Then we use correlation names to distinguish them.
-- --  UPDATE    [forum].[dbo].[Pew_Answer_NoStd]
-- --  SET       [forum].[dbo].[Pew_Answer_NoStd].[Answer_value_NoStd]   =  [VTS].[F]
-- --          , [forum].[dbo].[Pew_Answer_NoStd].[Answer_Wording]       =  [VTS].[G]
-- --          , [forum].[dbo].[Pew_Answer_NoStd].[Answer_Std_fk]        =  [PAS].[Answer_Std_pk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
--------select   ANS.Answer_pk            ,ANS.Answer_value_NoStd   ,ANS.Answer_Wording   ,ANS.Answer_Std_fk   ,ANS.Question_fk
--------                         ,VTS.E   ,VTS.F                    ,VTS.G                ,PAS.Answer_Std_pk
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
--select *

FROM
          [forum].[dbo].[Pew_Answer_NoStd]                               ANS
INNER
JOIN
          [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]         EXT
   ON 
       EXT.[Answer_fk]
      =ANS.[Answer_pk]
INNER
JOIN
       [VTS]
   ON 
       VTS.[C]
      =EXT.[Question_Year]
  AND
       VTS.[D]
      =EXT.[QA_std]
       VTS.[B]
      =EXT.[Ctry_EditorialName]
INNER
JOIN
       [FORUM].[dbo].[Pew_Answer]                                        TPA
   ON 
       EXT.[Answer_fk]
      =TPA.[Answer_pk]

INNER
JOIN
       [FORUM].[dbo].[Pew_Answer_Std]                                    PAS
   ON 
       TPA.[AnswerSet_num]
      =PAS.[AnswerSet_number]
  AND
       VTS.[F]
      =PAS.[Answer_value_std]
/**********************************************************************************************************************************************************/
/**********************************************************************************************************************************************************/





/*
/**********************************************************************************************************************************************************/
--- TEST 1: identify where errors are located
SELECT *
  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]
INNER
JOIN
       [FORUM].[dbo].[Pew_Answer]                               T
   ON 
       [Answer_fk]
      =[Answer_pk]
INNER
JOIN
       [FORUM].[dbo].[Pew_Answer_Std]                           S
   ON 
       [AnswerSet_num]
      =[AnswerSet_number]
  AND
       T.[Answer_value_std]
      =S.[Answer_value_std]

       WHERE
            (     ( Question_Year=  2014  AND  QA_std =  'GRI_11'  AND   Ctry_EditorialName =  'Equatorial Guinea'          )  )
     AND
                    [entity] =  'Stored by Country'

/**********************************************************************************************************************************************************/
--- TEST 2: check error rows are nott linked to other Ctry+Var+Yr
SELECT *
  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]
INNER
JOIN
       [FORUM].[dbo].[Pew_Answer]                               T
   ON 
       [Answer_fk]
      =[Answer_pk]
INNER
JOIN
       [FORUM].[dbo].[Pew_Answer_Std]                           S
   ON 
       [AnswerSet_num]
      =[AnswerSet_number]
  AND
       T.[Answer_value_std]
      =S.[Answer_value_std]

       WHERE
                    [entity] =  'Stored by Country'
     AND
                    [Answer_pk]
IN (
33077)
/**********************************************************************************************************************************************************/
*/