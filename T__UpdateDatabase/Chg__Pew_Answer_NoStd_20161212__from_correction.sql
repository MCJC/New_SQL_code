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
            (     ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mexico'              )
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
                    [link_fk]
IN (
15302,
15316,
28057,
28071,
36769,
36783,
45708,
45724,
59562,
59607,
59608,
59619,
60089,
60102,
60119,
60123,
60264,
61560,
61561,
63827,
90226,
93462,
96109,
104679,
106146,
106148,
107324,
107326,
116718,
116720,
137191,
137193,
144450,
146110,
147469,
148677,
148679,
151856,
152611,
152613,
153215,
153217,
156996,
156998,
158053,
158055,
168481,
168483,
173132,
174317,
175288,
176150,
176152,
178418,
178957,
178959,
179390,
179392,
182088,
182090,
182839,
182841,
190282,
190284
)
/**********************************************************************************************************************************************************/
*/