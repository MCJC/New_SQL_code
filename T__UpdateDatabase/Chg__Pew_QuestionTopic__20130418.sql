/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_Topic_2013_04_18]
  FROM     [forum].[dbo].[Pew_Question_Topic]
/*********************************************************************************************************/
/*
--	QTk QSk PO	QAbb_std	Question_short_wording_std
--	321	303	1	SVYc_0027	How concerned are you about extremist religious groups in the country?
--	285	279	2	SVYc_0003	Are you mostly concerned about Muslim or Christian extremist groups?
--	390	356	3	SVYu_0002	Are suicide bombing and other forms of violence against civilian targets justified in order to defend Islam from its enemies?
--	540	454	4	???	???
--	594	493	4	???	???
--	358	330	1	SVYc_0054	Do you favor or oppose making the Bible / sharia the law of the land?
--	603	499	2	SVYu_0185	Should sharia law be open to multiple interpretations or is there only one, true understanding of sharia?
--	602	498	3	SVYu_0184	Should sharia law be applied only to Muslims or both Muslims and non-Muslims in the country?
--	???	294	4	SVYc_0018	Do you favor or oppose the death penalty for people who leave Islam?
--	300	291	5	SVYc_0015	Do you favor or oppose punishments like whippings and cutting off of hands for crimes like theft and robbery?
--	301	292	6	SVYc_0016	Do you favor or oppose giving religious leaders and religious judges the power to decide family and property disputes?
--	305	293	7	SVYc_0017	Do you favor or oppose stoning people who commit adultery?
--	600	496	8	SVYu_0181	Should both Christians and non-Christians in the country be subject to Biblical law, or should Biblical law be applied only to Christians?
--	498	440	8	???	???
--	499	441	8	???	???
--	589	489	8	???	???
*/

UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 1 WHERE Question_topic_pk = 321
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 2 WHERE Question_topic_pk = 285
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 3 WHERE Question_topic_pk = 390
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 4 WHERE Question_topic_pk = 540
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 4 WHERE Question_topic_pk = 594

UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 1 WHERE Question_topic_pk = 358
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 2 WHERE Question_topic_pk = 603
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 3 WHERE Question_topic_pk = 602
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 5 WHERE Question_topic_pk = 300
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 301
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 7 WHERE Question_topic_pk = 305
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 8 WHERE Question_topic_pk = 600
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 8 WHERE Question_topic_pk = 498
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 8 WHERE Question_topic_pk = 499
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 8 WHERE Question_topic_pk = 589

/*********************************************************************************************************************************/
SELECT *
FROM
           [forum].[dbo].[Pew_Question_Topic]
WHERE
                             [Question_topic_pk] IN
                                                  (   
                                                     321
                                                   , 285
                                                   , 390
                                                   , 540
                                                   , 594

                                                   , 358
                                                   , 603
                                                   , 602
                                                   , 300
                                                   , 301
                                                   , 305
                                                   , 600
                                                   , 498
                                                   , 499
                                                   , 589
                                                          )
/*********************************************************************************************************************************/
