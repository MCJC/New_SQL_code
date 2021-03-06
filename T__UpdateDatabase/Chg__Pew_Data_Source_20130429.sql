/***************************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Data_Source_2013_04_29]
  FROM      [forum].[dbo].[Pew_Data_Source]
/***************************************************************************************************************/


-- Update from Stacy's table:
--   Table in Stacy DB cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
           [forum].[dbo].[Pew_Data_Source].[Data_source_url]
       =                             clone.[Data_source_url]
FROM
          [forum].[dbo].[Pew_Data_Source]   AS mydbt
 JOIN
        [Stacy's].[dbo].[Pew_Data_Source]   AS clone

ON
           mydbt.[Data_source_pk]
       =   clone.[Data_source_pk]

/*********************************************************************************************************/
-- check results
SELECT 
       [Data_source_pk]
      ,[Source_Display_Name]
      ,[Data_source_url]
                                 FROM    [forum].[dbo].[Pew_Data_Source]
SELECT 
       [Data_source_pk]
      ,[Source_Display_Name]
      ,[Data_source_url]
                                 FROM  [Stacy's].[dbo].[Pew_Data_Source]
/*********************************************************************************************************/

