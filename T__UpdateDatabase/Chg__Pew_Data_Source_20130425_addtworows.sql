/***************************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Data_Source_2013_04_25]
  FROM      [forum].[dbo].[Pew_Data_Source]
/***************************************************************************************************************/
-- Update by adding rows
-- (pending to reclasify all other questions)

INSERT INTO
            [forum].[dbo].[Pew_Data_Source]
                                             (  [Data_source_pk]
                                              , [Data_source_name]
                                              , [Data_source_description]
                                              , [Data_source_url]
                                              , [Source_Display_Name]     )
SELECT
         55
       , 'Global Survey of Islam'
       , 'Report 1: The World''s Muslims: Unity and Diversity'
       , 'http://www.pewforum.org/Muslim/the-worlds-muslims-unity-and-diversity.aspx'
       , 'The World''s Muslims: Unity and Diversity'
UNION ALL
SELECT
         56
       , 'Global Survey of Islam'
       , 'Report 2: The World''s Muslims: Religion, Politics & Society'
       , 'http://www.pewforum.org/Muslim/the-worlds-muslims-religion-politics-society.aspx'
       , 'The World''s Muslims: Religion, Politics & Society'

/*********************************************************************************************************/
-- check results
SELECT 
       *
         FROM      [forum].[dbo].[Pew_Data_Source]
SELECT 
       * 
         FROM  [_bk_forum].[dbo].[Pew_Data_Source_2013_04_25]
/*********************************************************************************************************/

