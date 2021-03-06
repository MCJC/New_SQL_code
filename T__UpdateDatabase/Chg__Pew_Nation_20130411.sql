/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Nation_2013_04_04]
  FROM     [forum].[dbo].[Pew_Nation]
/*********************************************************************************************************/
-- Update from Stacy's table:

-- Change the datatype to support 120 characters -------and make NOT NULL
ALTER TABLE
           [forum].[dbo].[Pew_Nation]
ALTER COLUMN
                                      [CtryCapital]
                                                    VARCHAR(120)
--   Table in Stacy DB cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_Nation]
SET
           [forum].[dbo].[Pew_Nation].[CtryCapital]
       =                        clone.[CtryCapital]
FROM
           [forum].[dbo].[Pew_Nation]   AS mydbt
 JOIN
         [Stacy's].[dbo].[Pew_Nation]   AS clone

ON
           mydbt.[Nation_pk]
       =   clone.[Nation_pk]

/*********************************************************************************************************/
-- check results
SELECT [Nation_pk] ,[CtryCapital] ,[Ctry_EditorialName] FROM    [forum].[dbo].[Pew_Nation]
SELECT [Nation_pk] ,[CtryCapital] ,[Ctry_EditorialName] FROM  [Stacy's].[dbo].[Pew_Nation]
/*********************************************************************************************************/

