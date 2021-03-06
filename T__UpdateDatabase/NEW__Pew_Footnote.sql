-- note: texts were manually modified after doing all this

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
