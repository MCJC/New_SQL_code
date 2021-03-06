/***************************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Data_Source_2013_06_20]
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
--select *
FROM
          [forum].[dbo].[Pew_Data_Source]   AS mydbt
 JOIN
          [Stacy].[dbo].[Pew_Data_Source]   AS clone

ON
           mydbt.[Data_source_pk]
       =   clone.[Data_source_pk]
/*********************************************************************************************************/
-- check results
SELECT 
       *
                                 FROM  [forum].[dbo].[Pew_Data_Source]
SELECT 
       *
                                 FROM  [Stacy].[dbo].[Pew_Data_Source]
/*********************************************************************************************************/

