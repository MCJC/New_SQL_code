/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Question_Topic_2013_04_19]
  FROM     [forum].[dbo].[Pew_Question_Topic]
/*********************************************************************************************************/
/*
--	QTk QSk PO	QAbb_std	Question_short_wording_std
--	345	320	1	SVYc_0044	Is it necessary to believe in God to be moral and have good values?
--	339	316	2	SVYc_0040	Is divorce morally wrong, morally acceptable, or not a moral issue?
--	343	319	3	SVYc_0043	Is homosexual behavior morally wrong, morally acceptable, or not a moral issue?
--	585	485	4	SVYu_0168	Is it morally acceptable for married couples to choose to limit the number of children they have?
--	317	300	5	SVYc_0024	Have Western music, movies, and television hurt morality in the country?
--	334	313	6	???	???
--	340	317	6	???	???
--	341	318	6	???	???
--	347	321	6	???	???
--	348	322	6	???	???
--	350	323	6	???	???
--	351	324	6	???	???
--	394	359	6	???	???
--	492	435	6	???	???
--	574	475	6	???	???
--	579	480	6	???	???
*/

UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 1 WHERE Question_topic_pk = 345
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 2 WHERE Question_topic_pk = 339
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 3 WHERE Question_topic_pk = 343
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 4 WHERE Question_topic_pk = 585
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 5 WHERE Question_topic_pk = 317
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 334
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 340
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 341
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 347
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 348
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 350
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 351
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 394
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 492
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 574
UPDATE [forum].[dbo].[Pew_Question_Topic] SET Priority_order = 6 WHERE Question_topic_pk = 579

/*********************************************************************************************************************************/
SELECT *
FROM
           [forum].[dbo].[Pew_Question_Topic]
WHERE
           Topic_fk = 52
OR
           Question_topic_pk IN
                                (   
                                    345
                                  , 339
                                  , 343
                                  , 585
                                  , 317
                                  , 334
                                  , 340
                                  , 341
                                  , 347
                                  , 348
                                  , 350
                                  , 351
                                  , 394
                                  , 492
                                  , 574
                                  , 579
                                        )
/*********************************************************************************************************************************/
