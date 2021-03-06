-- New row pk=55 in Pew_Data_Source table was not necessary
-- However, rows pk=33 & pk=55 should be normalized to match the same format

/***************************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Data_Source_2013_04_29b]
  FROM      [forum].[dbo].[Pew_Data_Source]
/***************************************************************************************************************/


-- Update from Stacy's table:
--   Table in Stacy DB cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
           [forum].[dbo].[Pew_Data_Source].[Data_source_name]
       =                             clone.[Data_source_name]
,
           [forum].[dbo].[Pew_Data_Source].[Data_source_description]
       =                             clone.[Data_source_description]
--select *
FROM
          [forum].[dbo].[Pew_Data_Source]   AS mydbt
 JOIN
        [Stacy's].[dbo].[Pew_Data_Source]   AS clone

ON
           mydbt.[Data_source_pk]
       =   clone.[Data_source_pk]
WHERE 
           mydbt.[Data_source_pk]
       IN  ( 33, 56 )

/*********************************************************************************************************/
DELETE FROM
           [forum].[dbo].[Pew_Data_Source]
WHERE
           [forum].[dbo].[Pew_Data_Source].[Data_source_pk]
       =   55
/*********************************************************************************************************/
/*********************************************************************************************************/
-- check results
SELECT 
       *
                                 FROM    [forum].[dbo].[Pew_Data_Source]
SELECT 
       *
                                 FROM  [Stacy's].[dbo].[Pew_Data_Source]
/*********************************************************************************************************/
DROP   TABLE
       [Stacy's].[dbo].[Pew_Data_Source]
SELECT 
       *
INTO   [Stacy's].[dbo].[Pew_Data_Source]
FROM     [forum].[dbo].[Pew_Data_Source]
/*********************************************************************************************************/

