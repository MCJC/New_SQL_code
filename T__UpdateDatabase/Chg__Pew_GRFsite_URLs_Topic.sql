/********************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_GRFsite_URLs_Topic_2013_01_24]
  FROM     [forum].[dbo].[Pew_GRFsite_URLs_Topic]
/********************************************************************************/
-- rename column
USE forum
GO

sp_RENAME 
           'Pew_GRFsite_URLs_Topic.SubTopic_fk'
         , 'Display'
         , 'COLUMN'

/********************************************************************************/

-- ID field already integer and non-nullable
-- change ID field configuration as real pk:
ALTER TABLE [forum].[dbo].[Pew_GRFsite_URLs_Topic]
ADD   CONSTRAINT  GRFsite_URLs_Topic_pk
      PRIMARY KEY(GRFsite_URLs_Topic_pk)

/********************************************************************************/

TRUNCATE TABLE [forum].[dbo].[Pew_GRFsite_URLs_Topic]

/************************************************************************************************/
-- Load the data into the table, adding to the current values
-- NOTICE:
-- FIRST TEST using a copy of the table to verify there are no errors
-- PKs should be included and correctly defined to do this procedure
-- Valid data, in the followinf statement, starts in row 2 (row 1 are headings)
-- Data are saved as CSV from Excel and should be copyed to FORUMDB C:\ drive 

BULK
INSERT
       [forum].[dbo].[Pew_GRFsite_URLs_Topic]
FROM 
       'C:\data\siteURLs.csv'
WITH
     (
       FIELDTERMINATOR = ','  ,
       ROWTERMINATOR   = '\n' ,
       FIRSTROW        = 2
     )
/************************************************************************************************/
