/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Footnote_2013_04_04]
  FROM     [forum].[dbo].[Pew_Footnote]
/*********************************************************************************************************/
-- Update from Stacy's table:
--   Table in Stacy DB cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_Footnote]
SET
           [forum].[dbo].[Pew_Footnote].[Footnote_Display]
       =                          clone.[Footnote_Display]
     --,
     --      [forum].[dbo].[Pew_Footnote].[About_the_Data_link]
     --  =                          clone.[About_the_Data_link]
FROM
          [forum].[dbo].[Pew_Footnote]   AS mydbt
 JOIN
        [Stacy's].[dbo].[Pew_Footnote]   AS clone

ON
           mydbt.[Note_pk]
       =   clone.[Note_pk]

/*********************************************************************************************************/
-- check results
SELECT * FROM    [forum].[dbo].[Pew_Footnote]
SELECT * FROM  [Stacy's].[dbo].[Pew_Footnote]
/*********************************************************************************************************/

