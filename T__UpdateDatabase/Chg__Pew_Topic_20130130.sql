/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Topic_2013_01_30]
  FROM     [forum].[dbo].[Pew_Topic]
/*********************************************************************************************************/
-- copy from Stacy's
SELECT *
  INTO     [forum].[dbo].[Pew_Topi2]
  FROM   [Stacy's].[dbo].[Pew_Topic]
/*********************************************************************************************************/
-- update from Stacy's copy

UPDATE
       [forum].[dbo].[Pew_Topic]
SET
         [forum].[dbo].[Pew_Topic].[SubTopic_Sorting] 
       = [forum].[dbo].[Pew_Topi2].[SubTopic_Sorting]
     ,
         [forum].[dbo].[Pew_Topic].[Display]
       = [forum].[dbo].[Pew_Topi2].[Display]
FROM
       [forum].[dbo].[Pew_Topic]
 JOIN
       [forum].[dbo].[Pew_Topi2]
ON
         [forum].[dbo].[Pew_Topic].[Topic_pk]
       = [forum].[dbo].[Pew_Topi2].[Topic_pk]
/*********************************************************************************************************/
IF OBJECT_ID  (N'[forum].[dbo].[Pew_Topi2]', N'U') IS NOT NULL
DROP   TABLE     [forum].[dbo].[Pew_Topi2]
/*********************************************************************************************************/
-- check results
SELECT *
  FROM [forum].[dbo].[Pew_Topic]
SELECT *
  FROM [Stacy's].[dbo].[Pew_Topic]
/*********************************************************************************************************/
