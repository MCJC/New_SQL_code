/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Data_Source_2013_02_04]
  FROM     [forum].[dbo].[Pew_Data_Source]
/*********************************************************************************************************/
-- Update from Stacy's table:
--   Table in Stacy DB cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
           [forum].[dbo].[Pew_Data_Source].[Source_Display_Name]
       =                             clone.[Source_Display_Name]
     --,
     --      [forum].[dbo].[Pew_Footnote].[About_the_Data_link]
     --  =                          clone.[About_the_Data_link]
FROM
          [forum].[dbo].[Pew_Data_Source]   AS mydbt
 JOIN
        [Stacy's].[dbo].[Pew_Data_Source]   AS clone

ON
           mydbt.[Data_source_pk]
       =   clone.[Data_source_pk]

/*********************************************************************************************************/
-- check results
SELECT * FROM    [forum].[dbo].[Pew_Data_Source]
SELECT * FROM  [Stacy's].[dbo].[Pew_Data_Source]
/*********************************************************************************************************/

