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
--- TEST 1: identify 04/18 records asked to have ONLY text replaced 
---         but corresponding years/vars are not coded with text
SELECT *
  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]
       WHERE
            (     ( Question_Year=  2007  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )
             OR   ( Question_Year=  2008  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )
             OR   ( Question_Year=  2009  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )
             OR   ( Question_Year=  2010  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )   )
         AND       [Answer_fk]  IN ( 2707, 2998, 3219, 3665 )
/**********************************************************************************************************************************************************/
--- TEST 2: identify 04/46 records asked to have text, value, and link to StdAnswer replaced
---         but corresponding years/vars are not coded with text
SELECT *
  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]
       WHERE
            (     ( Question_Year=  2007  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )
             OR   ( Question_Year=  2008  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )
             OR   ( Question_Year=  2009  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )
             OR   ( Question_Year=  2010  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )   )
         AND       [Answer_fk]  IN (
									2793,
									3084,
									3305,
									3778
                                           )
/*  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  */
SELECT
       distinct
                 Answer_value
              ,  answer_wording
              ,  answer_wording_std
  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]
       WHERE
                    Question_Year in ( 2007, 2008, 2009, 2010 )  
               AND  QA_std         =  'GRI_02'
/**********************************************************************************************************************************************************/
--- TEST 3: identify 04/46 records asked to have text, value, and link to StdAnswer replaced
---         but specific wording was not coded for the corresponding country,
---         although it was for other countries in the same years/vars
SELECT *
  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]
       WHERE
            (     ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )
             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )
             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )
             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )   )
         AND       [Answer_fk]  IN (
									7235,
									19759,
									27312,
									32417
                                           )
/*  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  */
SELECT
                 Answer_value
              ,  answer_wording_std
              ,  Question_Year
              ,  answer_wording
  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]
       WHERE
                    Question_Year in ( 2011, 2012, 2013, 2014 )  
               AND  QA_std         =  'GRI_02'
               AND  Answer_value   =   '0.67'
ORDER BY 
                 answer_wording
              ,  Question_Year
/**********************************************************************************************************************************************************/
--- TEST 4: identify 01/01 MORE record to BE updatedted
---         non-zero no-std answer should be added
SELECT *
  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]
       WHERE
            (     ( Question_Year=  2014  AND  QA_std =  'GRI_11'  AND   Ctry_EditorialName=  'Equatorial Guinea'             )   )
/*  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  */
SELECT
--distinct
                 Answer_value
              ,  answer_wording_std
              ,  answer_wording
  FROM [forum_ResAnal].[dbo].[vr___06_cDB_LongData_ALL_byCYQ]
       WHERE
                    Question_Year in ( 2014 )  
               AND  QA_std         =  'GRI_11'
               AND  Answer_value   =   '0.00'
ORDER BY 
                 answer_wording
/**********************************************************************************************************************************************************/
/**********************************************************************************************************************************************************/













--------select *
FROM
          [forum].[dbo].[Pew_Answer_NoStd]                               PANS
FULL
JOIN
----   SELECT * FROM
      [_bk_forum].[dbo].[Pew_Answer_NoStd_20161213]                      BKUP
   ON 
       PANS.[Answer_pk]
      =BKUP.[Answer_pk]
WHERE
--       PANS.[Question_fk]
--     !=BKUP.[Question_fk]
--       OR
       PANS.[Answer_Wording]
     !=BKUP.[Answer_Wording]
  AND
       PANS.[Answer_value_NoStd]
      =BKUP.[Answer_value_NoStd]
  AND
       PANS.[Answer_Std_fk]
      =BKUP.[Answer_Std_fk]
  AND
       PANS.[Answer_pk] IN ( 2707, 2998, 3219, 3665 )
--/**********************************************************************************************************************************************************/
----- TEST: check 04/18 answers linked MORE THAN ONCE to Ctry+Var+Yr
--SELECT * FROM  [GRSHRcode].[dbo].[tr___01_]
--   INNER JOIN      [FORUM].[dbo].[Pew_Answer]                               T
--      ON 
--                  [Answer_fk]
--                 =[Answer_pk]
--WHERE
--[Answer_pk]
--IN (
--2707,
--2998,
--3219,
--3665
--)
--order by [Answer_pk]
--/**********************************************************************************************************************************************************/
--/**********************************************************************************************************************************************************/
----- TEST: check 14/18 answers linked ONLY ONCE to Ctry+Var+Yr
--SELECT * FROM  [GRSHRcode].[dbo].[tr___01_]
--   INNER JOIN      [FORUM].[dbo].[Pew_Answer]                               T
--      ON 
--                  [Answer_fk]
--                 =[Answer_pk]
--WHERE
--[Answer_pk]
--IN (
--7049,
--7053,
--7181,
--19410,
--19414,
--19504,
--26961,
--26965,
--27015,
--27055,
--32058,
--32062,
--32112,
--32151
--)
--/**********************************************************************************************************************************************************/


/**********************************************************************************************************************************************************/
--- 46 records where I replaced text, value, and link to StdAnswer
)
/**********************************************************************************************************************************************************/
-- Update from CTE table:
--   LINKED tables cannot be directly used if >1 table would have the same exposed name
--   Then we use correlation names to distinguish them.
--    UPDATE    [forum].[dbo].[Pew_Answer_NoStd]
--    SET       [forum].[dbo].[Pew_Answer_NoStd].[Answer_value_NoStd]   =  [BKUP].[Answer_value_NoStd]
--            , [forum].[dbo].[Pew_Answer_NoStd].[Answer_Wording]       =  [BKUP].[Answer_Wording]
--            , [forum].[dbo].[Pew_Answer_NoStd].[Answer_Std_fk]        =  [BKUP].[Answer_Std_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
--------select *
FROM
          [forum].[dbo].[Pew_Answer_NoStd]                               PANS
FULL
JOIN
----   SELECT * FROM
      [_bk_forum].[dbo].[Pew_Answer_NoStd_20161213]                      BKUP
   ON 
       PANS.[Answer_pk]
      =BKUP.[Answer_pk]
WHERE
--       PANS.[Question_fk]
--     !=BKUP.[Question_fk]
--       OR
       PANS.[Answer_Wording]
     !=BKUP.[Answer_Wording]
  AND
       PANS.[Answer_value_NoStd]
     !=BKUP.[Answer_value_NoStd]
  AND
       PANS.[Answer_Std_fk]
     !=BKUP.[Answer_Std_fk]
  AND
       BKUP.[Answer_Wording]     LIKE 'Yes, %'
--     BKUP.[Answer_Wording] NOT LIKE 'Yes, %'

-- order 
--    by PANS.[Answer_pk]
--/**********************************************************************************************************************************************************/
----- TEST: check 08/46 answers linked ONCE to Ctry+Var+Yr
--SELECT * FROM      [FORUM].[dbo].[Pew_Answer]                               T
--   INNER JOIN  [GRSHRcode].[dbo].[tr___01_]
--      ON 
--                  [Answer_fk]
--                 =[Answer_pk]
--WHERE
--[Answer_pk]
--IN (
--2793,
--3084,
--3305,
--3778,
--7235,
--19759,
--27312,
--32417
--)
--order by [Answer_pk]
--/**********************************************************************************************************************************************************/
--/**********************************************************************************************************************************************************/
----- TEST: check 38/46 answers linked ONLY ONCE to Ctry+Var+Yr
--SELECT * FROM      [FORUM].[dbo].[Pew_Answer]                               T
--   INNER JOIN  [GRSHRcode].[dbo].[tr___01_]
--      ON 
--                  [Answer_fk]
--                 =[Answer_pk]
--WHERE
--[Answer_pk]
--IN (
--7097,
--7102,
--7111,
--7256,
--7274,
--7344,
--7360,
--7399,
--19449,
--19551,
--19553,
--19596,
--19635,
--19643,
--19662,
--19678,
--27000,
--27094,
--27102,
--27104,
--27149,
--27187,
--27195,
--27196,
--27214,
--27230,
--27248,
--32097,
--32189,
--32197,
--32199,
--32255,
--32293,
--32301,
--32302,
--32321,
--32337,
--32355
--)
--order by [Answer_pk]
--/**********************************************************************************************************************************************************/








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
                    [Answer_pk]
IN (
7049,
7053,
7097,
7102,
19410,
19414,
19551,
19553,
26961,
26965,
27015,
27094,
27102,
27104,
32058,
32062,
32112,
32189,
32197,
32199,
7111,
19449,
27000,
32097,
7256,
7274,
7344,
19635,
19662,
19678,
27187,
27214,
27230,
32293,
32321,
32337,
7235,
19759,
27248,
27312,
32355,
32417,
7360,
19596,
27149,
27195,
32255,
32301
)
/**********************************************************************************************************************************************************/
order by 
[Answer_pk]




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
                    [Answer_pk]
IN (
32417,
32355,
32337,
32321,
32302,
32301,
32293,
32255,
32199,
32197,
32189,
32151,
32112,
32097,
32062,
32058,
27312,
27248,
27230,
27214,
27196,
27195,
27187,
27149,
27104,
27102,
27094,
27055,
27015,
27000,
26965,
26961,
19759,
19678,
19662,
19643,
19635,
19596,
19553,
19551,
19504,
19449,
19414,
19410,
7399,
7360,
7344,
7274,
7256,
7235,
7181,
7111,
7102,
7097,
7053,
7049,
3778,
3665,
3305,
3219,
3084,
2998,
2793,
2707
)
/**********************************************************************************************************************************************************/
*/