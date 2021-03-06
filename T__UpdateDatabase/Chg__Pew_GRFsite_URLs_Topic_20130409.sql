/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_GRFsite_URLs_Topic_2013_04_09]
  FROM     [forum].[dbo].[Pew_GRFsite_URLs_Topic]
/*********************************************************************************************************/
-- Update from Stacy's table:
--   Table in Stacy DB cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_GRFsite_URLs_Topic]
SET
           [forum].[dbo].[Pew_GRFsite_URLs_Topic].[GRFsite_URL]
       =                                    clone.[GRFsite_URL]
     --,
     --      [forum].[dbo].[Pew_GRFsite_URLs_Topic].[]
     --  =                                    clone.[]
FROM
          [forum].[dbo].[Pew_GRFsite_URLs_Topic]   AS mydbt
 JOIN
        [Stacy's].[dbo].[Pew_GRFsite_URLs_Topic]   AS clone

ON
           mydbt.[GRFsite_URLs_Topic_pk]
       =   clone.[GRFsite_URLs_Topic_pk]

/*********************************************************************************************************/
-- check results
SELECT * FROM    [forum].[dbo].[Pew_GRFsite_URLs_Topic]
SELECT * FROM  [Stacy's].[dbo].[Pew_GRFsite_URLs_Topic]
/*********************************************************************************************************/

