/**************************************************************************************************************************************************/
IF OBJECT_ID  (N'[forum].[dbo].[Pew_Footnote]', N'U') IS NOT NULL
DROP   TABLE     [forum].[dbo].[Pew_Footnote]
/**************************************************************************************************************************************************/

-- create
CREATE TABLE
                 [forum].[dbo].[Pew_Footnote]
           (
              Note_pk               INT            NOT NULL PRIMARY KEY
             ,
              Footnote_Display      NVARCHAR(1500)
             ,
              About_the_Data_link   NVARCHAR(150)
            )

/**************************************************************************************************************************************************/

-- Load the data into the table, adding to the current values
-- NOTICE:
-- FIRST TEST using a copy of the table to verify there are no errors
-- PKs should be included and correctly defined to do this procedure
-- Valid data, in the followinf statement, starts in row 2 (row 1 are headings)
-- Data are saved as CSV from Excel and should be copyed to FORUMDB C:\ drive 

BULK
INSERT
                 [forum].[dbo].[Pew_Footnote]
FROM 
       'C:\data\footnote.txt'
WITH
     (
       FIELDTERMINATOR = '\t'  ,
       ROWTERMINATOR   = '\n' ,
       FIRSTROW        = 2
     )

/**************************************************************************************************************************************************/





BULK INSERT CSVTest
FROM ‘c:\Test.txt’
WITH
(
FIELDTERMINATOR = ‘\t’,
ROWTERMINATOR = ‘\n’
)
GO



/***************************************************************************************************************/
SELECT *
  INTO     [_bk_forum].[dbo].[Pew_Data_Source_2013_01_24]
  FROM         [forum].[dbo].[Pew_Lists]
/***************************************************************************************************************/

-- add column
ALTER TABLE  [forum].[dbo].[Pew_Data_Source]
ADD          Source_Display_Name varchar(100)

/***************************************************************************************************************/

--SELECT *
--  INTO     [forum].[dbo].[Pew_Data_Source_BIS]
--  FROM     [forum].[dbo].[Pew_Data_Source]

TRUNCATE
   TABLE    [forum].[dbo].[Pew_Data_Source]

/***************************************************************************************************************/

-- Load the data into the table, adding to the current values
-- NOTICE:
-- FIRST TEST using a copy of the table to verify there are no errors
-- PKs should be included and correctly defined to do this procedure
-- Valid data, in the followinf statement, starts in row 2 (row 1 are headings)
-- Data are saved as CSV from Excel and should be copyed to FORUMDB C:\ drive 

BULK
INSERT
             [forum].[dbo].[Pew_Data_Source]
FROM 
       'C:\data\DataSource.csv'
WITH
     (
       FIELDTERMINATOR = ','  ,
       ROWTERMINATOR   = '\n' ,
       FIRSTROW        = 2
     )
/***************************************************************************************************************/

-- commas were removed from csv document...

UPDATE
             [forum].[dbo].[Pew_Data_Source]
SET   
      Data_source_description = 'Governmental Favoritism, Funding or Deference to Religious Authorities'
WHERE 
      Data_source_description = 'Governmental Favoritism|| Funding or Deference to Religious Authorities'
AND
      Data_source_pk          = 25


UPDATE
             [forum].[dbo].[Pew_Data_Source]
SET   
      Data_source_description = 'Governmental Restrictions on Religious Practice, Expression or Affiliation'
WHERE 
      Data_source_description = 'Governmental Restrictions on Religious Practice|| Expression or Affiliation'
AND
      Data_source_pk          = 26

/***************************************************************************************************************/

-- initially deleted table and had to recreate pk:

-- change ID field configuration as integer and non-nullable:
ALTER TABLE
             [forum].[dbo].[Pew_Data_Source]
ALTER COLUMN
             Data_source_pk INT NOT NULL

-- change ID field configuration as real pk:
ALTER TABLE
             [forum].[dbo].[Pew_Data_Source]
ADD
CONSTRAINT  Data_source_pk
PRIMARY KEY(Data_source_pk)

/***************************************************************************************************************/









                                                        -- * coding error: unstandardized wording


/****************************************************************************************************************/





Governmental Favoritism|| Funding or Deference to Religious Authorities
Governmental Restrictions on Religious Practice|| Expression or Affiliation



INSERT SalesStaff3
  (StaffID, FullName)
SELECT TOP 5
  BusinessEntityID,
  FirstName + ' ' + LastName AS FullName
FROM Sales.vSalesPerson
ORDER BY BusinessEntityID;


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

/************************************************************************************************/

TRUNCATE
   TABLE    [forum].[dbo].[Pew_Data_Source]

/********************************************************************************/

TRUNCATE TABLE Pew_GRFsite_URLs_Topic

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
