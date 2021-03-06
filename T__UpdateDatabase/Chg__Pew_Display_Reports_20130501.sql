/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Display_Reports_2013_05_01]
  FROM     [forum].[dbo].[Pew_Display_Reports]
/*********************************************************************************************************/
-- drop unnecessary links

DELETE FROM
            [forum].[dbo].[Pew_Display_Reports]
WHERE
            [forum].[dbo].[Pew_Display_Reports].[Display_Reports_pk]
            IN
            (
                 40    --  questions on this topic no longer linked to the referred source
               , 64    --  questions on this topic no longer linked to the referred source

               , 6     --  topic still not having final question links to sources
               , 7     --  topic still not having final question links to sources
               , 10    --  topic still not having final question links to sources
               , 11    --  topic still not having final question links to sources
               , 12    --  topic still not having final question links to sources
               , 13    --  topic still not having final question links to sources
               , 13    --  topic still not having final question links to sources
               , 14    --  topic still not having final question links to sources
               , 14    --  topic still not having final question links to sources
               , 15    --  topic still not having final question links to sources
               , 16    --  topic still not having final question links to sources
               , 21    --  topic still not having final question links to sources
               , 22    --  topic still not having final question links to sources
               , 23    --  topic still not having final question links to sources
               , 24    --  topic still not having final question links to sources
               , 25    --  topic still not having final question links to sources
               , 26    --  topic still not having final question links to sources
               , 29    --  topic still not having final question links to sources
               , 29    --  topic still not having final question links to sources
               , 29    --  topic still not having final question links to sources
               , 29    --  topic still not having final question links to sources
               , 30    --  topic still not having final question links to sources
               , 30    --  topic still not having final question links to sources
               , 30    --  topic still not having final question links to sources
               , 30    --  topic still not having final question links to sources
               , 31    --  topic still not having final question links to sources
               , 32    --  topic still not having final question links to sources
               , 33    --  topic still not having final question links to sources
               , 36    --  topic still not having final question links to sources
               , 41    --  topic still not having final question links to sources
               , 41    --  topic still not having final question links to sources
               , 42    --  topic still not having final question links to sources
               , 42    --  topic still not having final question links to sources
               , 43    --  topic still not having final question links to sources
               , 44    --  topic still not having final question links to sources
               , 51    --  topic still not having final question links to sources
               , 52    --  topic still not having final question links to sources
               , 56    --  topic still not having final question links to sources
               , 57    --  topic still not having final question links to sources
               , 58    --  topic still not having final question links to sources
               , 59    --  topic still not having final question links to sources
               , 60    --  topic still not having final question links to sources
               , 61    --  topic still not having final question links to sources
               , 65    --  topic still not having final question links to sources
               , 66    --  topic still not having final question links to sources
               , 67    --  topic still not having final question links to sources
               , 68    --  topic still not having final question links to sources
               , 71    --  topic still not having final question links to sources
               , 72    --  topic still not having final question links to sources
               , 73    --  topic still not having final question links to sources
               , 74    --  topic still not having final question links to sources
               , 75    --  topic still not having final question links to sources
               , 76    --  topic still not having final question links to sources
               , 77    --  topic still not having final question links to sources
               , 80    --  topic still not having final question links to sources
               , 80    --  topic still not having final question links to sources
               , 81    --  topic still not having final question links to sources
               , 81    --  topic still not having final question links to sources
               , 84    --  topic still not having final question links to sources
               , 85    --  topic still not having final question links to sources
            )
/*********************************************************************************************************/
/*********************************************************************************************************/
-- Update link
UPDATE
            [forum].[dbo].[Pew_Display_Reports]
SET
            [forum].[dbo].[Pew_Display_Reports].[Data_source_fk]
       =    56
WHERE
            [forum].[dbo].[Pew_Display_Reports].[Display_Reports_pk]
            IN
            (
                 34    --  topic should be linked to other source, consistent to questions on this topic
               , 37    --  topic should be linked to other source, consistent to questions on this topic
               , 39    --  topic should be linked to other source, consistent to questions on this topic
               , 45    --  topic should be linked to other source, consistent to questions on this topic
               , 47    --  topic should be linked to other source, consistent to questions on this topic
               , 49    --  topic should be linked to other source, consistent to questions on this topic
               , 53    --  topic should be linked to other source, consistent to questions on this topic
               , 54    --  topic should be linked to other source, consistent to questions on this topic
               , 63    --  topic should be linked to other source, consistent to questions on this topic
               , 69    --  topic should be linked to other source, consistent to questions on this topic
               , 78    --  topic should be linked to other source, consistent to questions on this topic
               , 82    --  topic should be linked to other source, consistent to questions on this topic
            )
/*********************************************************************************************************/
-- Update sorting order
UPDATE
            [forum].[dbo].[Pew_Display_Reports]
SET
                [forum].[dbo].[Pew_Display_Reports].[Report_SortingNumber]
       =    1 + [forum].[dbo].[Pew_Display_Reports].[Report_SortingNumber]
WHERE
            [forum].[dbo].[Pew_Display_Reports].[Display_Reports_pk]
            IN
            (
                 8    --  sorting order of link should change
               , 9    --  sorting order of link should change
            )
/*********************************************************************************************************/
/*********************************************************************************************************/
-- Update by adding rows
INSERT INTO
            [forum].[dbo].[Pew_Display_Reports]
                                             (  
                                                [Display_Reports_pk]
                                              , [List_fk]
                                              , [item_fk]
                                              , [Data_source_fk]
                                              , [Report_SortingNumber]
                                                                          )
SELECT
         565
       , 4
       , 31
       , 56
       , 1
/*********************************************************************************************************/
/*********************************************************************************************************/
-- check results


SELECT 
        Display_Reports_pk
      , List_fk
      , ItemTopic__fk = item_fk
      , TABLE_Data_source_fk = TL.Data_source_fk
      , QUEST_Data_source_fk = QL.Data_source_fk
      , Display
      , TABLE_Source_Display_Name = TL.Source_Display_Name
      , QUEST_Source_Display_Name = QL.Source_Display_Name
      , List
      , Topic
      , SubTopic
      , Report_SortingNumber
      , Question_abbreviation_std
      , Question_abbreviation
      , Question_short_wording_std
--select *
  FROM
(
SELECT [Display_Reports_pk]
      ,[List_fk]
      ,[List]
      ,[item_fk]
      ,[Topic]
      ,[SubTopic]
      ,[Display]
      ,[Data_source_fk]
      ,[Report_SortingNumber]
      ,[Source_Display_Name]
      --,[Data_source_url]
  FROM [forum].[dbo].[Pew_Display_Reports]  d
     , [forum].[dbo].[Pew_Lists]            l
     , [forum].[dbo].[Pew_Topic]            t
     , [forum].[dbo].[Pew_Data_Source]      s
WHERE 
        d.List_fk
      = l.List_pk
and

        l.List
      = 'Pew_Topic'
AND
      d.[item_fk]
    = t.[Topic_pk]      
AND
      d.[Data_source_fk]
    = s.[Data_source_pk]
                                                                 )  AS TL   --  TOPIC LINK
full
JOIN
(
SELECT 
       DISTINCT
       S.Source_Display_Name
      ,T.[Question_abbreviation_std]
      ,T.[Question_abbreviation]
      ,T.[Question_short_wording_std]
      ,T.[Data_source_fk]
      ,L.[Topic_fk]
  FROM [forum].[dbo].[Pew_Survey_Tables_Displayable]     T
     , [forum].[dbo].[Pew_Question_Std]                  Q
     , [forum].[dbo].[Pew_Question_Topic]                L
     , [forum].[dbo].[Pew_Data_Source]                   S
Where    T.Question_abbreviation_std
       = Q.Question_abbreviation_std    
and      Q.Question_Std_pk
       = L.Question_Std_fk
and      T.Data_source_fk
       = S.Data_source_pk
                                                                 )  AS QL   --  QUESTION LINK
ON
      TL.Item_fk
    = QL.Topic_fk
ORDER BY 
             item_fk
        ,    Report_SortingNumber
        , TL.Data_source_fk
        , QL.Data_source_fk


/*********************************************************************************************************/

