/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Topic_2013_02_19]
  FROM     [forum].[dbo].[Pew_Topic]
/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_Topic_2013_02_19]
  FROM     [forum].[dbo].[Pew_Question_Topic]
/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_Std_2013_02_19]
  FROM     [forum].[dbo].[Pew_Question_Std]
/*********************************************************************************************************/


-- RECOVER AFTER ERROR
/*********************************************************************************************************/
TRUNCATE TABLE
         [forum].[dbo].[Pew_Topic]
INSERT
INTO     [forum].[dbo].[Pew_Topic]
SELECT
*
FROM [_bk_forum].[dbo].[Pew_Topic_2013_02_19]
/*********************************************************************************************************/
TRUNCATE TABLE
         [forum].[dbo].[Pew_Question_Topic]
INSERT
INTO     [forum].[dbo].[Pew_Question_Topic]
SELECT
*
FROM [_bk_forum].[dbo].[Pew_Question_Topic_2013_02_19]
/*********************************************************************************************************/
TRUNCATE TABLE
         [forum].[dbo].[Pew_Question_Std]
INSERT
INTO     [forum].[dbo].[Pew_Question_Std]
SELECT *
FROM [_bk_forum].[dbo].[Pew_Question_Std_2013_02_19]
/*********************************************************************************************************/



-- New changes:
/*********************************************************************************************************/
-- 1)	Rows 430/431
--      These questions are really similar, if we cannot make them the same question,
--      I think we need to hide one from showing.
--      Can the survey folks confirm this is ok and select which one they’d rather show?

--     PENDING

/*********************************************************************************************************/
-- From Excel sheet: Column A, deleleted cells mean deleting records in Pew_Question_Topic table
-- Change # 01: delete rows from Pew_Question_Topic
--              when the question is no longer related to the topic:
DELETE
FROM  [forum].[dbo].[Pew_Question_Topic]
WHERE
      [forum].[dbo].[Pew_Question_Topic].[Question_Topic_pk]
                                                          IN (
                                                               6,
                                                               8,
                                                               10,
                                                               12,
                                                               14,
                                                               16,
                                                               18,
                                                               20,
                                                               22,
                                                               72,
                                                               77,
                                                               79,
                                                               81,
                                                               83,
                                                               85,
                                                               107,
                                                               109,
                                                               111,
                                                               113,
                                                               115,
                                                               117,
                                                               119,
                                                               121,
                                                               123,
                                                               124,
                                                               126,
                                                               127,
                                                               129,
                                                               131,
                                                               133,
                                                               135,
                                                               137,
                                                               139,
                                                               141,
                                                               143,
                                                               145,
                                                               147,
                                                               149,
                                                               151,
                                                               153,
                                                               155,
                                                               157,
                                                               159,
                                                               161,
                                                               163,
                                                               165,
                                                               167,
                                                               168,
                                                               170,
                                                               171,
                                                               173,
                                                               175,
                                                               177,
                                                               179,
                                                               181,
                                                               183,
                                                               185,
                                                               187,
                                                               189,
                                                               191,
                                                               193,
                                                               195,
                                                               197,
                                                               199,
                                                               201,
                                                               203,
                                                               205,
                                                               206,
                                                               208,
                                                               210,
                                                               212,
                                                               214,
                                                               215,
                                                               216,
                                                               218,
                                                               219,
                                                               221,
                                                               222,
                                                               224,
                                                               225,
                                                               227,
                                                               228,
                                                               230,
                                                               232,
                                                               233,
                                                               235,
                                                               236,
                                                               238,
                                                               239,
                                                               241,
                                                               242,
                                                               244,
                                                               246,
                                                               248,
                                                               250,
                                                               252,
                                                               254,
                                                               256,
                                                               258,
                                                               260,
                                                               262,
                                                               264,
                                                               265,
                                                               266,
                                                               268,
                                                               269,
                                                               270,
                                                               272,
                                                               274,
                                                               314,
                                                               315,
                                                               323,
                                                               367,
                                                               370,
                                                               395,
                                                               400,
                                                               403,
                                                               439,
                                                               467,
                                                               483,
                                                               487,
                                                               489,
                                                               559,
                                                               561,
                                                               571,
                                                               639,
                                                               642,
                                                               643,
                                                               646,
                                                               650
                                                             )
/*********************************************************************************************************/
/*********************************************************************************************************/
-- From Excel sheet: added rows mean adding records in Pew_Question_Topic table
-- Change # 02: add rows to Pew_Question_Topic (link between questions and topics)
--              when the question should be related to the topic
--              both from editorial and from Stacy's suggestions (for indexes)
INSERT INTO
            [forum].[dbo].[Pew_Question_Topic]
            
                 ( [Question_topic_pk] , [Question_Std_fk] , [Topic_fk] , [Priority_order] )
          SELECT    653                ,  529              ,  76        ,  1               -- GRI
UNION ALL SELECT    654                ,  530              ,  76        ,  1               -- SHI
UNION ALL SELECT    655                ,  531              ,  76        ,  1               -- GFI
UNION ALL SELECT    656                ,  499              ,  61        ,  1               -- Int of Faith
UNION ALL SELECT    657                ,  507              ,  42        ,  1               -- O Be & Pract
UNION ALL SELECT    658                ,  508              ,  42        ,  1               -- O Be & Pract
UNION ALL SELECT    659                ,  509              ,  42        ,  1               -- O Be & Pract
/*********************************************************************************************************/
/*********************************************************************************************************/
-- From Note 5 and listing in Column A: 'Interfaith Tolerance' shuld not be a sub-topic any more
-- Change # 03: topics that should be deleted from the Pew_Topic table
-- also check they do not exist in the Pew_Question_Topic table
DELETE FROM [forum].[dbo].[Pew_Topic]
WHERE
            [forum].[dbo].[Pew_Topic].[Topic_pk] = 60
AND
            [forum].[dbo].[Pew_Topic].[SubTopic] = 'Interfaith Tolerance'



select *  FROM [forum].[dbo].[Pew_Topic]
WHERE
               [forum].[dbo].[Pew_Topic].[Topic_pk] = 60
/*********************************************************************************************************/
/*********************************************************************************************************/
-- From Excel sheet Columns A & H/I: Topic_fk should be updated
-- Change # 04: Topic_fk's that should be updated in the Pew_Question_Std table
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 32 WHERE Question_Topic_pk = 430
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 30 WHERE Question_Topic_pk = 433
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 61 WHERE Question_Topic_pk = 396
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 42 WHERE Question_Topic_pk = 322
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 42 WHERE Question_Topic_pk = 365
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 42 WHERE Question_Topic_pk = 368
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 64 WHERE Question_Topic_pk = 627
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 64 WHERE Question_Topic_pk = 629
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 64 WHERE Question_Topic_pk = 631
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Topic_fk = 64 WHERE Question_Topic_pk = 393

select *  FROM [forum].[dbo].[Pew_Question_Topic]
WHERE
               [forum].[dbo].[Pew_Question_Topic].[Topic_fk] = 60
/*********************************************************************************************************/
/*********************************************************************************************************/
-- From Excel sheet Columns B & J: standarad question wording should be updated
-- Change # 05: standard question wordings that should be updated in the Pew_Question_Std table

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_wording_std      = 'Have provisions of sharia law been adopted in the country?'
WHERE Question_Std_pk           = 103

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_wording_std      = 'Have provisions of sharia law been adopted in the province?'
WHERE Question_Std_pk           = 104

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_wording_std      = 'Do you have objects in your home to ward off the evil eye?'
WHERE Question_Std_pk           = 417

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_wording_std      = 'And do you have traditional African sacred objects in your home - such'
                                + ' as shrines to ancestors, feathers, skins, skulls, skeletons, powder, '
                                + 'carved figures or branches, spears, cutlasses, or animal horns?'
WHERE Question_Std_pk           = 418
/*********************************************************************************************************/
/*********************************************************************************************************/
-- From Excel sheet Columns B & K: short standarad question wording should be updated
-- Change # 06: standard question short wordings that should be updated in the Pew_Question_Std table

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Have provisions of sharia law been adopted in the country?'
WHERE Question_Std_pk            = 103

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Have provisions of sharia law been adopted in the province?'
WHERE Question_Std_pk            = 104

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'To what extent are corrupt political leaders a problem in the country?'
WHERE Question_Std_pk            = 277

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Agree or disagree? People like me don''t have any say about what'
                                 + ' the government does.'
WHERE Question_Std_pk            = 282

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Do you believe in one God, Allah, and his prophet Muhammad?'
WHERE Question_Std_pk            = 287

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'How free are people of faiths different from yours to practice their '
                                 + 'religion in the country? Is this a good or bad thing?'
WHERE Question_Std_pk            = 338

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'To what extent is conflict between ethnic/tribal/nationality groups a '
                                 + 'problem in the country?'
WHERE Question_Std_pk            = 341

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Do you believe in God? Do you believe God is an impersonal force or a b'
                                 + 'eing with whom people can have a relationship?'
WHERE Question_Std_pk            = 385

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Do you have objects in your home to ward off the evil eye?'
WHERE Question_Std_pk            = 417

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Do you have traditional African sacred objects, such as shrines to ance'
                                 + 'stors, in your home?'
WHERE Question_Std_pk            = 418

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Do you trust people who have different religious values than your own?'
WHERE Question_Std_pk            = 427

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Have Bollywood movies and music hurt morality in the country?'
WHERE Question_Std_pk            = 435

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'How much influence do Christian preachers and missionaries from outside'
                                 + ' the country have in the country?'
WHERE Question_Std_pk            = 461

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Agree or disagree? AIDS is God’s punishment for immoral sexual behavior.'
WHERE Question_Std_pk            = 480

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Is sharia law the revealed word of God?'
WHERE Question_Std_pk            = 489

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Agree or disagree? A wife must always obey her husband.'
WHERE Question_Std_pk            = 494

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Agree or disagree? The government should be responsible for taking care'
                                 + ' of very poor people.'
WHERE Question_Std_pk            = 500

UPDATE     [forum].[dbo].[Pew_Question_Std]
SET   Question_short_wording_std = 'Agree or disagree? When jobs are scarce, men have more right to a job t'
                                 + 'han women.'
WHERE Question_Std_pk            = 504
/*********************************************************************************************************/
/*********************************************************************************************************/
-- From Excel sheet Column G: priority order to display should be updated
-- Change # 07: priority order that should be updated in the Pew_Question_Topic table

UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 37 WHERE Question_Topic_pk = 288
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 32 WHERE Question_Topic_pk = 326
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 31 WHERE Question_Topic_pk = 355
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 33 WHERE Question_Topic_pk = 372
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order =  1 WHERE Question_Topic_pk = 388
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 36 WHERE Question_Topic_pk = 406
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 17 WHERE Question_Topic_pk = 407
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 16 WHERE Question_Topic_pk = 408
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 13 WHERE Question_Topic_pk = 409
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 12 WHERE Question_Topic_pk = 410
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order =  7 WHERE Question_Topic_pk = 411
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order =  6 WHERE Question_Topic_pk = 412
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 15 WHERE Question_Topic_pk = 413
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 14 WHERE Question_Topic_pk = 414
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 21 WHERE Question_Topic_pk = 415
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 20 WHERE Question_Topic_pk = 416
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 11 WHERE Question_Topic_pk = 417
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 10 WHERE Question_Topic_pk = 418
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 19 WHERE Question_Topic_pk = 419
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 18 WHERE Question_Topic_pk = 420
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order =  9 WHERE Question_Topic_pk = 421
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order =  8 WHERE Question_Topic_pk = 422
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 22 WHERE Question_Topic_pk = 480
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 29 WHERE Question_Topic_pk = 502
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 23 WHERE Question_Topic_pk = 506
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 26 WHERE Question_Topic_pk = 510
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 30 WHERE Question_Topic_pk = 514
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 24 WHERE Question_Topic_pk = 518
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 27 WHERE Question_Topic_pk = 522
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 25 WHERE Question_Topic_pk = 526
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 28 WHERE Question_Topic_pk = 530
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 34 WHERE Question_Topic_pk = 534
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 35 WHERE Question_Topic_pk = 539
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order =  2 WHERE Question_Topic_pk = 580
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order =  3 WHERE Question_Topic_pk = 581
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order =  4 WHERE Question_Topic_pk = 587
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order =  5 WHERE Question_Topic_pk = 588
/*********************************************************************************************************/
/*********************************************************************************************************/


/*********************************************************************************************************/
/*********************************************************************************************************/

-- Check

SELECT 

       [Topic_fk]
      ,[Question_Std_fk]
      ,[Topic_sorting]
      ,[SubTopic_Sorting]
      ,[Display]
      ,[Question_abbreviation_std]
      ,[Priority_order]
      ,[Topic]
      ,[SubTopic]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
      ,[Question_topic_pk]

  FROM [forum].[dbo].[Pew_Question_Topic]  L
     , [forum].[dbo].[Pew_Topic]           T
   , [forum].[dbo].[Pew_Question_Std]      Q

WHERE 
       T.Topic_pk       = L.Topic_fk
  AND  Q.Question_Std_pk = L.Question_Std_fk

ORDER BY
         [Topic_fk]
       , [Question_Std_fk]
--		   [Topic_sorting]
--		  ,[SubTopic_Sorting]
--		  ,[Question_abbreviation_std]
