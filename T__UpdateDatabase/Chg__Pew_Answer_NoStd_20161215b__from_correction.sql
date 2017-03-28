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
          SELECT C = 2013, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Fiji', G =  '22. FREEDOM OF RELIGION, CONSCIENCE AND BELIEf 1. Every person has the right to freedom of religion, conscience and belief.'UNION ALL SELECT C = 2014, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Fiji', G =  '22. FREEDOM OF RELIGION, CONSCIENCE AND BELIEf 1. Every person has the right to freedom of religion, conscience and belief.'UNION ALL SELECT C = 2011, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Jamaica', G =  'Article 17. Every person shall have the right to freedom of religion including the freedom to change his religion and the right, either alone or in community with others and both in public and in private, to manifest and propagate his religion in worship, teaching, practice and observance. (CP 2011)'UNION ALL SELECT C = 2012, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Jamaica', G =  'Article 17. Every person shall have the right to freedom of religion including the freedom to change his religion and the right, either alone or in community with others and both in public and in private, to manifest and propagate his religion in worship, teaching, practice and observance. (CP 2011)'UNION ALL SELECT C = 2013, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Jamaica', G =  'Article 17. Every person shall have the right to freedom of religion including the freedom to change his religion and the right, either alone or in community with others and both in public and in private, to manifest and propagate his religion in worship, teaching, practice and observance. (CP 2011)'UNION ALL SELECT C = 2014, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Jamaica', G =  'Article 17. Every person shall have the right to freedom of religion including the freedom to change his religion and the right, either alone or in community with others and both in public and in private, to manifest and propagate his religion in worship, teaching, practice and observance. (CP 2011)'UNION ALL SELECT C = 2011, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Kenya', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2012, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Kenya', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2013, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Kenya', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2014, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Kenya', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2007, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2008, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2009, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2010, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2011, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2012, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2013, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2014, D=  'GRI_01',      E = 0,     F = '0 [UPDATE TEXT ONLY]',  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'
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
      =[QA_std]  AND
       [B]
      =[Ctry_EditorialName]
/**********************************************************************************************************************************************************/
/**********************************************************************************************************************************************************/



/**********************************************************************************************************************************************************/
--- 46 records to update
WITH
     VTS AS  ---- REPLACE VALUE & TEXT, as well as link to StdAnswer
(
          SELECT C = 2013, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Mexico', G =  'ARTICLE 24 - Every person has the right to have freedom of ethical convictions, of conscience and of religion, and to have or to adopt, as the case may be, the one of her preference. Such freedom includes the right to participate, individually or collectively, in both public and private ceremonies, worship or religious acts of the respective cult, as long as they are not a felony or a misdemeanor punished by law. No person is allowed to use these public acts of religious expression with political ends, for campaigning or as means of political propaganda.'UNION ALL SELECT C = 2014, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Mexico', G =  'ARTICLE 24 - Every person has the right to have freedom of ethical convictions, of conscience and of religion, and to have or to adopt, as the case may be, the one of her preference. Such freedom includes the right to participate, individually or collectively, in both public and private ceremonies, worship or religious acts of the respective cult, as long as they are not a felony or a misdemeanor punished by law. No person is allowed to use these public acts of religious expression with political ends, for campaigning or as means of political propaganda.'UNION ALL SELECT C = 2013, D=  'GRI_02',      E = 0.67,     F = 0.33,  B =  'Mexico', G =  'No person is allowed to use these public acts of religious expression with political ends, for campaigning or as means of political propaganda. (CP 2016)'UNION ALL SELECT C = 2014, D=  'GRI_02',      E = 0.67,     F = 0.33,  B =  'Mexico', G =  'No person is allowed to use these public acts of religious expression with political ends, for campaigning or as means of political propaganda. (CP 2016)'UNION ALL SELECT C = 2011, D=  'GRI_01',      E = 0,     F = 0.5,  B =  'Costa Rica', G =  'ARTICLE 75 - The Roman, Catholic, Apostolic Religion is that of the State, which contributes to its maintenance, without preventing the free exercise in the Republic of other beliefs that do not oppose themselves to the universal morality or good customs.'UNION ALL SELECT C = 2012, D=  'GRI_01',      E = 0,     F = 0.5,  B =  'Costa Rica', G =  'ARTICLE 75 - The Roman, Catholic, Apostolic Religion is that of the State, which contributes to its maintenance, without preventing the free exercise in the Republic of other beliefs that do not oppose themselves to the universal morality or good customs.'UNION ALL SELECT C = 2013, D=  'GRI_01',      E = 0,     F = 0.5,  B =  'Costa Rica', G =  'ARTICLE 75 - The Roman, Catholic, Apostolic Religion is that of the State, which contributes to its maintenance, without preventing the free exercise in the Republic of other beliefs that do not oppose themselves to the universal morality or good customs.'UNION ALL SELECT C = 2014, D=  'GRI_01',      E = 0,     F = 0.5,  B =  'Costa Rica', G =  'ARTICLE 75 - The Roman, Catholic, Apostolic Religion is that of the State, which contributes to its maintenance, without preventing the free exercise in the Republic of other beliefs that do not oppose themselves to the universal morality or good customs.'UNION ALL SELECT C = 2013, D=  'GRI_02',      E = 0.33,     F = 0.67,  B =  'Fiji', G =  'Article 22. 7. To the extent that it is necessary, the rights and freedoms set out in this section may be made subject to such limitations prescribed by law- a.to protect- i.the rights and freedoms of other persons; or ii.public safety, public order, public morality or public health; or b.to prevent public nuisance. (CP 2016)'UNION ALL SELECT C = 2014, D=  'GRI_02',      E = 0.33,     F = 0.67,  B =  'Fiji', G =  'Article 22. 7. To the extent that it is necessary, the rights and freedoms set out in this section may be made subject to such limitations prescribed by law- a.to protect- i.the rights and freedoms of other persons; or ii.public safety, public order, public morality or public health; or b.to prevent public nuisance. (CP 2016)'UNION ALL SELECT C = 2011, D=  'GRI_02',      E = 0,     F = 0.67,  B =  'Iran', G =  'According to Constitution Articles 12 and 13, "" The official religion of Iran is Islam and the Twelver Ja''farî school [in usul al-Dîn and fiqh], and this principle will remain eternally immutable. Other Islamic schools, including the Hanafî, Shafi''î, Malikî, Hanbalî, and Zaydî, are to be accorded full respect, and their followers are free to act in accordance with their own jurisprudence in performing their religious rites. These schools enjoy official status in matters pertaining to religious education, affairs of personal status (marriage, divorce, inheritance, and wills) and related litigation in courts of law. In regions of the country where Muslims following any one of these schools of fiqh constitute the majority, local regulations, within the bounds of the jurisdiction of local councils, are to be in accordance with the respective school of fiqh, without infringing upon the rights of the followers of other schools. [...] Zoroastrian, Jewish, and Christian Iranians are the only recognized religious minorities, who, within the limits of the law, are free to perform their religious rites and ceremonies, and to act according to their own canon in matters of personal affairs and religious education. (CP 2016) | The constitution and other laws and policies severely restrict freedom of religion. The constitution declares the “official religion is Islam and the doctrine followed is that of Ja’afari Shiism.” The constitution states all laws and regulations must be based on undefined “Islamic criteria” and official interpretation of sharia (Islamic law). The constitution provides Sunni Muslims a degree of religious freedom, and states that, “within the limits of the law,” Zoroastrians, Jews, and Christians are the only recognized religious minorities with protected ability to worship freely and to form religious societies, as long as they do not proselytize. (IRF 2015)'UNION ALL SELECT C = 2012, D=  'GRI_02',      E = 0,     F = 0.67,  B =  'Iran', G =  'According to Constitution Articles 12 and 13, "" The official religion of Iran is Islam and the Twelver Ja''farî school [in usul al-Dîn and fiqh], and this principle will remain eternally immutable. Other Islamic schools, including the Hanafî, Shafi''î, Malikî, Hanbalî, and Zaydî, are to be accorded full respect, and their followers are free to act in accordance with their own jurisprudence in performing their religious rites. These schools enjoy official status in matters pertaining to religious education, affairs of personal status (marriage, divorce, inheritance, and wills) and related litigation in courts of law. In regions of the country where Muslims following any one of these schools of fiqh constitute the majority, local regulations, within the bounds of the jurisdiction of local councils, are to be in accordance with the respective school of fiqh, without infringing upon the rights of the followers of other schools. [...] Zoroastrian, Jewish, and Christian Iranians are the only recognized religious minorities, who, within the limits of the law, are free to perform their religious rites and ceremonies, and to act according to their own canon in matters of personal affairs and religious education. (CP 2016) | The constitution and other laws and policies severely restrict freedom of religion. The constitution declares the “official religion is Islam and the doctrine followed is that of Ja’afari Shiism.” The constitution states all laws and regulations must be based on undefined “Islamic criteria” and official interpretation of sharia (Islamic law). The constitution provides Sunni Muslims a degree of religious freedom, and states that, “within the limits of the law,” Zoroastrians, Jews, and Christians are the only recognized religious minorities with protected ability to worship freely and to form religious societies, as long as they do not proselytize. (IRF 2015)'UNION ALL SELECT C = 2013, D=  'GRI_02',      E = 0,     F = 0.67,  B =  'Iran', G =  'According to Constitution Articles 12 and 13, "" The official religion of Iran is Islam and the Twelver Ja''farî school [in usul al-Dîn and fiqh], and this principle will remain eternally immutable. Other Islamic schools, including the Hanafî, Shafi''î, Malikî, Hanbalî, and Zaydî, are to be accorded full respect, and their followers are free to act in accordance with their own jurisprudence in performing their religious rites. These schools enjoy official status in matters pertaining to religious education, affairs of personal status (marriage, divorce, inheritance, and wills) and related litigation in courts of law. In regions of the country where Muslims following any one of these schools of fiqh constitute the majority, local regulations, within the bounds of the jurisdiction of local councils, are to be in accordance with the respective school of fiqh, without infringing upon the rights of the followers of other schools. [...] Zoroastrian, Jewish, and Christian Iranians are the only recognized religious minorities, who, within the limits of the law, are free to perform their religious rites and ceremonies, and to act according to their own canon in matters of personal affairs and religious education. (CP 2016) | The constitution and other laws and policies severely restrict freedom of religion. The constitution declares the “official religion is Islam and the doctrine followed is that of Ja’afari Shiism.” The constitution states all laws and regulations must be based on undefined “Islamic criteria” and official interpretation of sharia (Islamic law). The constitution provides Sunni Muslims a degree of religious freedom, and states that, “within the limits of the law,” Zoroastrians, Jews, and Christians are the only recognized religious minorities with protected ability to worship freely and to form religious societies, as long as they do not proselytize. (IRF 2015)'UNION ALL SELECT C = 2014, D=  'GRI_02',      E = 0,     F = 0.67,  B =  'Iran', G =  'According to Constitution Articles 12 and 13, "" The official religion of Iran is Islam and the Twelver Ja''farî school [in usul al-Dîn and fiqh], and this principle will remain eternally immutable. Other Islamic schools, including the Hanafî, Shafi''î, Malikî, Hanbalî, and Zaydî, are to be accorded full respect, and their followers are free to act in accordance with their own jurisprudence in performing their religious rites. These schools enjoy official status in matters pertaining to religious education, affairs of personal status (marriage, divorce, inheritance, and wills) and related litigation in courts of law. In regions of the country where Muslims following any one of these schools of fiqh constitute the majority, local regulations, within the bounds of the jurisdiction of local councils, are to be in accordance with the respective school of fiqh, without infringing upon the rights of the followers of other schools. [...] Zoroastrian, Jewish, and Christian Iranians are the only recognized religious minorities, who, within the limits of the law, are free to perform their religious rites and ceremonies, and to act according to their own canon in matters of personal affairs and religious education. (CP 2016) | The constitution and other laws and policies severely restrict freedom of religion. The constitution declares the “official religion is Islam and the doctrine followed is that of Ja’afari Shiism.” The constitution states all laws and regulations must be based on undefined “Islamic criteria” and official interpretation of sharia (Islamic law). The constitution provides Sunni Muslims a degree of religious freedom, and states that, “within the limits of the law,” Zoroastrians, Jews, and Christians are the only recognized religious minorities with protected ability to worship freely and to form religious societies, as long as they do not proselytize. (IRF 2015)'UNION ALL SELECT C = 2011, D=  'GRI_02',      E = 0.67,     F = 0,  B =  'Jamaica', G =  'Article 17. Every person shall have the right to freedom of religion including the freedom to change his religion and the right, either alone or in community with others and both in public and in private, to manifest and propagate his religion in worship, teaching, practice and observance. (CP 2011)'UNION ALL SELECT C = 2012, D=  'GRI_02',      E = 0.67,     F = 0,  B =  'Jamaica', G =  'Article 17. Every person shall have the right to freedom of religion including the freedom to change his religion and the right, either alone or in community with others and both in public and in private, to manifest and propagate his religion in worship, teaching, practice and observance. (CP 2011)'UNION ALL SELECT C = 2013, D=  'GRI_02',      E = 0.67,     F = 0,  B =  'Jamaica', G =  'Article 17. Every person shall have the right to freedom of religion including the freedom to change his religion and the right, either alone or in community with others and both in public and in private, to manifest and propagate his religion in worship, teaching, practice and observance. (CP 2011)'UNION ALL SELECT C = 2014, D=  'GRI_02',      E = 0.67,     F = 0,  B =  'Jamaica', G =  'Article 17. Every person shall have the right to freedom of religion including the freedom to change his religion and the right, either alone or in community with others and both in public and in private, to manifest and propagate his religion in worship, teaching, practice and observance. (CP 2011)'UNION ALL SELECT C = 2011, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Dominican Republic', G =  'Article 45  The State guarantees the freedom of conscience and religion, subject to the public order and respect to good customs. (CP 2015)'UNION ALL SELECT C = 2012, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Dominican Republic', G =  'Article 45  The State guarantees the freedom of conscience and religion, subject to the public order and respect to good customs. (CP 2015)'UNION ALL SELECT C = 2013, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Dominican Republic', G =  'Article 45  The State guarantees the freedom of conscience and religion, subject to the public order and respect to good customs. (CP 2015)'UNION ALL SELECT C = 2014, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Dominican Republic', G =  'Article 45  The State guarantees the freedom of conscience and religion, subject to the public order and respect to good customs. (CP 2015)'UNION ALL SELECT C = 2011, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Uruguay', G =  'Article 5  All religious sects are free in Uruguay. The State supports no religion whatever. (CP 2004) 'UNION ALL SELECT C = 2012, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Uruguay', G =  'Article 5  All religious sects are free in Uruguay. The State supports no religion whatever. (CP 2004) 'UNION ALL SELECT C = 2013, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Uruguay', G =  'Article 5  All religious sects are free in Uruguay. The State supports no religion whatever. (CP 2004) 'UNION ALL SELECT C = 2014, D=  'GRI_01',      E = 0.5,     F = 0,  B =  'Uruguay', G =  'Article 5  All religious sects are free in Uruguay. The State supports no religion whatever. (CP 2004) 'UNION ALL SELECT C = 2011, D=  'GRI_02',      E = 0.67,     F = 0.33,  B =  'Uruguay', G =  'ARTICLE 10  Private actions of persons which do not in any way affect the public order or prejudice others shall be outside the jurisdiction of the magistrates. (CP 2016)'UNION ALL SELECT C = 2012, D=  'GRI_02',      E = 0.67,     F = 0.33,  B =  'Uruguay', G =  'ARTICLE 10  Private actions of persons which do not in any way affect the public order or prejudice others shall be outside the jurisdiction of the magistrates. (CP 2016)'UNION ALL SELECT C = 2013, D=  'GRI_02',      E = 0.67,     F = 0.33,  B =  'Uruguay', G =  'ARTICLE 10  Private actions of persons which do not in any way affect the public order or prejudice others shall be outside the jurisdiction of the magistrates. (CP 2016)'UNION ALL SELECT C = 2014, D=  'GRI_02',      E = 0.67,     F = 0.33,  B =  'Uruguay', G =  'ARTICLE 10  Private actions of persons which do not in any way affect the public order or prejudice others shall be outside the jurisdiction of the magistrates. (CP 2016)'UNION ALL SELECT C = 2011, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Cameroon', G =  '15.freedom of religion and worship shall be guaranteed;'UNION ALL SELECT C = 2012, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Cameroon', G =  '15.freedom of religion and worship shall be guaranteed;'UNION ALL SELECT C = 2013, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Cameroon', G =  '15.freedom of religion and worship shall be guaranteed;'UNION ALL SELECT C = 2014, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Cameroon', G =  '15.freedom of religion and worship shall be guaranteed;'UNION ALL SELECT C = 2011, D=  'GRI_02',      E = 0.67,     F = 0,  B =  'Kenya', G =  '32. FREEDOM OF CONSCIENCE, RELIGION, BELIEF AND OPINION 1. Every person has the right to freedom of conscience, religion, thought, belief and opinion. 2. Every person has the right, either individually or in community with others, in public or in private, to manifest any religion or belief through worship, practice, teaching or observance, including observance of a day of worship. 3. A person may not be denied access to any institution, employment or facility, or the enjoyment of any right, because of the person''s belief or religion. 4. A person shall not be compelled to act, or engage in any act, that is contrary to the person''s belief or religion. (CP 2010)'UNION ALL SELECT C = 2012, D=  'GRI_02',      E = 0.67,     F = 0,  B =  'Kenya', G =  '32. FREEDOM OF CONSCIENCE, RELIGION, BELIEF AND OPINION 1. Every person has the right to freedom of conscience, religion, thought, belief and opinion. 2. Every person has the right, either individually or in community with others, in public or in private, to manifest any religion or belief through worship, practice, teaching or observance, including observance of a day of worship. 3. A person may not be denied access to any institution, employment or facility, or the enjoyment of any right, because of the person''s belief or religion. 4. A person shall not be compelled to act, or engage in any act, that is contrary to the person''s belief or religion. (CP 2010)'UNION ALL SELECT C = 2013, D=  'GRI_02',      E = 0.67,     F = 0,  B =  'Kenya', G =  '32. FREEDOM OF CONSCIENCE, RELIGION, BELIEF AND OPINION 1. Every person has the right to freedom of conscience, religion, thought, belief and opinion. 2. Every person has the right, either individually or in community with others, in public or in private, to manifest any religion or belief through worship, practice, teaching or observance, including observance of a day of worship. 3. A person may not be denied access to any institution, employment or facility, or the enjoyment of any right, because of the person''s belief or religion. 4. A person shall not be compelled to act, or engage in any act, that is contrary to the person''s belief or religion. (CP 2010)'UNION ALL SELECT C = 2014, D=  'GRI_02',      E = 0.67,     F = 0,  B =  'Kenya', G =  '32. FREEDOM OF CONSCIENCE, RELIGION, BELIEF AND OPINION 1. Every person has the right to freedom of conscience, religion, thought, belief and opinion. 2. Every person has the right, either individually or in community with others, in public or in private, to manifest any religion or belief through worship, practice, teaching or observance, including observance of a day of worship. 3. A person may not be denied access to any institution, employment or facility, or the enjoyment of any right, because of the person''s belief or religion. 4. A person shall not be compelled to act, or engage in any act, that is contrary to the person''s belief or religion. (CP 2010)'UNION ALL SELECT C = 2007, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2008, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2009, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2010, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2011, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2012, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2013, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'UNION ALL SELECT C = 2014, D=  'GRI_02',      E = 0.33,     F = 0,  B =  'Mozambique', G =  'ARTICLE 54. FREEDOM OF CONSCIENCE, RELIGION AND WORSHIP 1. All citizens shall have the freedom to practice or not to practice a religion. 2. Nobody shall be discriminated against, persecuted, prejudiced, deprived of his or her rights, or benefit from or be exempt from duties, on the grounds of his faith or religious persuasion or practice. 3. Religious denominations shall have the right to pursue their religious aims freely and to own and acquire assets for realising their objectives. 4. The protection of places of worship shall be ensured. 5. The right to conscientious objection shall be guaranteed in terms of the law.'
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
      =EXT.[QA_std]  AND
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
            (     ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mexico'              )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mexico'              )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mexico'              )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mexico'              )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Costa Rica'          )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Costa Rica'          )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Costa Rica'          )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Costa Rica'          )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Fiji'                )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Fiji'                )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Fiji'                )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Fiji'                )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Iran'                )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Iran'                )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Iran'                )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Iran'                )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Dominican Republic'  )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Dominican Republic'  )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Dominican Republic'  )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Dominican Republic'  )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Cameroon'            )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Cameroon'            )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Cameroon'            )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Cameroon'            )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Kenya'               ))
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
            (     ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mexico'              )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mexico'              )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mexico'              )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mexico'              )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Costa Rica'          )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Costa Rica'          )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Costa Rica'          )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Costa Rica'          )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Fiji'                )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Fiji'                )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Fiji'                )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Fiji'                )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Iran'                )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Iran'                )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Iran'                )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Iran'                )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Jamaica'             )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Dominican Republic'  )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Dominican Republic'  )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Dominican Republic'  )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Dominican Republic'  )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Uruguay'             )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Cameroon'            )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Cameroon'            )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Cameroon'            )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Cameroon'            )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Kenya'               )             OR   ( Question_Year=  2007  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2008  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2009  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2010  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_02'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2007  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2008  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2009  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2010  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2011  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2012  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2013  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )             OR   ( Question_Year=  2014  AND  QA_std =  'GRI_01'  AND   Ctry_EditorialName=  'Mozambique'          )  )
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