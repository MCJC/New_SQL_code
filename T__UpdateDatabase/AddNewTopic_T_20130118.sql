/****************************************************************************************************************************/
-- temporary table
IF OBJECT_ID('tempdb..#TEMP') IS NOT NULL
DROP TABLE            #TEMP
/****************************************************************************************************************************/
SELECT 
       Topic_pk         = ROW_NUMBER() OVER(                           ORDER BY Topic_sorting, SubTS)
     , SubTopic_Sorting = ROW_NUMBER() OVER(PARTITION BY Topic_sorting ORDER BY Topic_sorting, SubTS)
     , *
INTO #TEMP

FROM
(
SELECT  
         SubTopic_pk   = 80
     ,   Topic         = 'Restrictions on Religion'
     ,   SubTopic      = 'Religious Restrictions Indexes'
     ,   Topic_sorting = 6
     ,   SubTS         = 80
     ,   Display       = 1

UNION

SELECT
         S.[SubTopic_pk]
      ,  Topic               = CASE
                                   WHEN T.[Topic] IS NULL
                                   THEN 'Population Characteristics'
                                   ELSE T.[Topic]
                                   END
      ,  S.[SubTopic]
      ,  Topic_sorting       = CASE
                                   WHEN T.[Topic_sorting] IS NULL
                                   THEN 1
                                   ELSE T.[Topic_sorting]
                                   END
      ,  SubTS               = S.[SubTopic_Sorting]
      ,  Display             = S.[SubTopic_Display]


      
FROM [forum].[dbo].[Pew_Topic] AS T
join
(
 SELECT distinct 
        [Topic_fk]
       ,[SubTopic_fk]
   FROM [forum].[dbo].[Pew_Question_Topic]
                                          ) AS TS
  ON TS.Topic_fk
   =  T.Topic_pk
 right join
 (
  SELECT [SubTopic_pk]
        ,[SubTopic]
        ,[SubTopic_Sorting]
        ,[SubTopic_Display]
    FROM [forum].[dbo].[Pew_SubTopic]
                                          ) AS S
  ON TS.SubTopic_fk
   =  S.SubTopic_pk

--ORDER BY Topic_sorting, S.[SubTopic_Sorting]
) AS TnST
/****************************************************************************************************************************/
-- Replace Topik_fk
/****************************************************************************************************************************/
--UPDATE [forum].[dbo].[Pew_GRFsite_URLs_Topic]
--SET    
--       [forum].[dbo].[Pew_GRFsite_URLs_Topic].Topic_fk = 
--                                                         (SELECT 
--                                                                 #TEMP.Topic_pk
--                                                            FROM
--                                                                 #TEMP
--                                                           WHERE
--                                                                                                  #TEMP.SubTopic_pk
--                                                               = [forum].[dbo].[Pew_GRFsite_URLs_Topic].SubTopic_fk )

--check
--/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT [GRFsite_URLs_Topic_pk]
--      ,[GRFsite_URL]
--      ,[Topic_fk]
--      , SubTopic_fk  = 0
--      ,[Priority_order]
--      ,[Topic]
--      ,[Topic_sorting]
--      ,[SubTopic]
--      ,[SubTopic_Sorting]
--      ,[Display]
--  FROM [forum].[dbo].[Pew_GRFsite_URLs_Topic]
--     , #TEMP
--     where [Topic_fk]    = [Topic_pk]

/****************************************************************************************************************************/
--UPDATE [forum].[dbo].[Pew_Question_Topic]
--SET    
--       [forum].[dbo].[Pew_Question_Topic].Topic_fk = 
--                                                         (SELECT 
--                                                                 #TEMP.Topic_pk
--                                                            FROM
--                                                                 #TEMP
--                                                           WHERE
--                                                                                              #TEMP.SubTopic_pk
--                                                               = [forum].[dbo].[Pew_Question_Topic].SubTopic_fk )


--check
--/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT [Question_topic_pk]
--      ,[Question_fk]
--      ,[Topic_fk]
--      ,[SubTopic_fk]
--      ,[Priority_order]
--      ,[Topic]
--      ,[Topic_sorting]
--      ,[SubTopic]
--      ,[SubTopic_Sorting]
--      ,[Display]
--  FROM [forum].[dbo].[Pew_Question_Topic]
--     , #TEMP
--     where [Topic_fk]    = [Topic_pk]

/****************************************************************************************************************************/




  --IF OBJECT_ID  (N'[juancarlos].[dbo].[Pew_Topic]', N'U') IS NOT NULL
  --DROP   TABLE     [juancarlos].[dbo].[Pew_Topic]
IF OBJECT_ID       (N'[forum].[dbo].[Pew_Topic]', N'U') IS NOT NULL
DROP   TABLE          [forum].[dbo].[Pew_Topic]

SELECT 
       Topic_pk
     , Topic_sorting
     , SubTopic_Sorting
     , Topic
     , SubTopic
     , Display
  --INTO [juancarlos].[dbo].[Pew_Topic]
INTO      [forum].[dbo].[Pew_Topic]
FROM #TEMP
-- change ID field configuration as integer and non-nullable:
  --ALTER TABLE [juancarlos].[dbo].[Pew_Topic]
ALTER TABLE      [forum].[dbo].[Pew_Topic]
ALTER COLUMN Topic_pk INT NOT NULL
-- change ID field configuration as real pk:
  --ALTER TABLE [juancarlos].[dbo].[Pew_Topic]
ALTER TABLE      [forum].[dbo].[Pew_Topic]
ADD   CONSTRAINT Topic_pk PRIMARY KEY(Topic_pk)

/****************************************************************************************************************************/



IF OBJECT_ID       (N'[forum].[dbo].[Pew_SubTopic]', N'U') IS NOT NULL
DROP   TABLE          [forum].[dbo].[Pew_SubTopic]

/****************************************************************************************************************************/
/****************************************************************************************************************************/
/****************************************************************************************************************************/


--/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT [GRFsite_URLs_Topic_pk]
--      ,[GRFsite_URL]
--      ,[Topic_fk]
--      ,[SubTopic_fk]
--      ,[Priority_order]
--      ,[Topic]
--      ,[Topic_sorting]
--      ,[SubTopic]
--      ,[SubTopic_Sorting]
--      ,[SubTopic_Display]
--  FROM [forum].[dbo].[Pew_GRFsite_URLs_Topic]
--     , [forum].[dbo].[Pew_Topic]
--     , [forum].[dbo].[Pew_SubTopic]
--     where [Topic_fk]    = [Topic_pk]
--       and [SubTopic_fk] = [SubTopic_pk]
--/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT [Question_topic_pk]
--      ,[Question_fk]
--      ,[Topic_fk]
--      ,[SubTopic_fk]
--      ,[Priority_order]
--      ,[Topic]
--      ,[Topic_sorting]
--      ,[SubTopic]
--      ,[SubTopic_Sorting]
--      ,[SubTopic_Display]
--  FROM [forum].[dbo].[Pew_Question_Topic]
--     , [forum].[dbo].[Pew_Topic]
--     , [forum].[dbo].[Pew_SubTopic]
--     where [Topic_fk]    = [Topic_pk]
--       and [SubTopic_fk] = [SubTopic_pk]
