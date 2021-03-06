-- script as part of major change in structure
-- check all as...
--   FIRST CHECK:
--   + Chg__Pew_Data_Source_20141205_add_fieldsandrows.sql
--   + Chg__Pew_Question_NoStd__20141205_drop_fields__add_rows.sql
--   + Chg__Pew_Question_Std__20141205_add_fieldandsrows.sql
--   + Chg__Pew_Answer_Std__20141205_add_fieldsandrows.sql
--   + Chg__Pew_Answer_NoStd__20141205_add_fieldsandrows.sql
--   THEN CHECK UPDATED:
--   + VIEW_Pew_Question.sql
--   + VIEW_Pew_Q&A.sql
--   + VIEW_Pew_Answer.sql
--   AND FINALLY CHECK:
--   + Chg__Pew_Answer_NoStd__20141205_add_more_rows.sql
/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE                          --  declare variable
          @TofI                    --  variable name
                   varchar(50)     --  data type of the variable
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Data_Source_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Data_Source]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
-- Update by adding & populating two fields
ALTER TABLE
           [forum].[dbo].[Pew_Data_Source]
ADD
                                           [Pew_Data_Collection]     VARCHAR(100) NULL
                                         , [Pew_Data_SubCollection]  VARCHAR(100) NULL
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
                                           [Pew_Data_Collection]    = 'Global Restriction on Religion Study'
                                         , [Pew_Data_SubCollection] = 'Global Restriction on Religion Study'
WHERE
           [forum].[dbo].[Pew_Data_Source].[Data_source_pk] 
                                                        IN ( 1, 2, 3, 24, 25, 26, 27, 28, 29, 30, 31, 47, 49, 51, 57, 58 )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
                                           [Pew_Data_Collection]    = 'Global Religious Futures project'
                                         , [Pew_Data_SubCollection] = 'Global Religion Demography'
WHERE
           [forum].[dbo].[Pew_Data_Source].[Data_source_pk] 
                                                        IN ( 4,  10, 21, 22, 32, 34, 38, 39, 40, 41, 42,
                                                             43, 44, 45, 46, 52, 64, 65, 66, 67, 68, 71 )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
                                           [Pew_Data_Collection]    = 'Pew Research Surveys'
                                         , [Pew_Data_SubCollection] = 'International Surveys'
WHERE
           [forum].[dbo].[Pew_Data_Source].[Data_source_pk] 
                                                        IN ( 5,  6,  7,  8,  9,  11, 12, 13, 14, 15, 16,
                                                             17, 18, 19, 20, 33, 35, 36, 37, 48, 56      )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
                                           [Pew_Data_Collection]    = 'Pew Research Surveys'
                                         , [Pew_Data_SubCollection] = 'US Surveys'
WHERE
           [forum].[dbo].[Pew_Data_Source].[Data_source_pk] 
                                                        IN ( 50, 69 ) 

/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
                                           [Pew_Data_Collection]    = 'Pew Research Global Indexes'
                                         , [Pew_Data_SubCollection] = 'Pew Research Global Indexes'
WHERE
           [forum].[dbo].[Pew_Data_Source].[Data_source_pk] 
                                                        IN ( 59, 60, 61, 62, 63 )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
                                           [Pew_Data_Collection]    = 'External Sources'
                                         , [Pew_Data_SubCollection] = 'United Nations'
WHERE
           [forum].[dbo].[Pew_Data_Source].[Data_source_pk] 
                                                        IN ( 53, 70 )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
                                           [Pew_Data_Collection]    = 'External Sources'
                                         , [Pew_Data_SubCollection] = 'U.S. Department of State'
WHERE
           [forum].[dbo].[Pew_Data_Source].[Data_source_pk] 
                                                        IN ( 54 )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- Update by adding rows for the RLS
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
            [forum].[dbo].[Pew_Data_Source]
                                             (  [Data_source_pk]
                                              , [Data_source_name]
                                              , [Data_source_description]
                                              , [Data_source_url]
                                              , [Source_Display_Name]
                                              , [Pew_Data_Collection]
                                              , [Pew_Data_SubCollection]     )

SELECT  [Data_source_pk]          = (SELECT MAX([Data_source_pk]) + 1
                                       FROM [forum].[dbo].[Pew_Data_Source])

      , [Data_source_name]        = 'Religious Landscape Survey (2007) - Continental US'
      , [Data_source_description] = 'Religious Landscape Survey (2007) - Continental US'
      , [Data_source_url]         = 'http://www.pewforum.org/2008/02/01/u-s-religious-landscape-survey-religious-affiliation/'
      , [Source_Display_Name]     = 'Religious Landscape Survey (2007) - Continental US'
      , [Pew_Data_Collection]     = 'Pew Research Surveys'
      , [Pew_Data_SubCollection]  = 'US Surveys'
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
            [forum].[dbo].[Pew_Data_Source]
                                             (  [Data_source_pk]
                                              , [Data_source_name]
                                              , [Data_source_description]
                                              , [Data_source_url]
                                              , [Source_Display_Name]
                                              , [Pew_Data_Collection]
                                              , [Pew_Data_SubCollection]     )

SELECT  [Data_source_pk]          = (SELECT MAX([Data_source_pk]) + 1
                                       FROM [forum].[dbo].[Pew_Data_Source])

      , [Data_source_name]        = 'Religious Landscape Survey (2007) - Alaska and Hawaii'
      , [Data_source_description] = 'Religious Landscape Survey (2007) - Alaska and Hawaii'
      , [Data_source_url]         = 'http://www.pewforum.org/2008/02/01/u-s-religious-landscape-survey-religious-affiliation/'
      , [Source_Display_Name]     = 'Religious Landscape Survey (2007) - Alaska and Hawaii'
      , [Pew_Data_Collection]     = 'Pew Research Surveys'
      , [Pew_Data_SubCollection]  = 'US Surveys'
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
            [forum].[dbo].[Pew_Data_Source]
                                             (  [Data_source_pk]
                                              , [Data_source_name]
                                              , [Data_source_description]
                                              , [Data_source_url]
                                              , [Source_Display_Name]
                                              , [Pew_Data_Collection]
                                              , [Pew_Data_SubCollection]     )

SELECT  [Data_source_pk]          = (SELECT MAX([Data_source_pk]) + 1
                                       FROM [forum].[dbo].[Pew_Data_Source])

      , [Data_source_name]        = 'Religious Landscape Survey (2014)'
      , [Data_source_description] = 'Religious Landscape Survey (2014)'
      , [Data_source_url]         = NULL
      , [Source_Display_Name]     = 'Religious Landscape Survey (2014)'
      , [Pew_Data_Collection]     = 'Pew Research Surveys'
      , [Pew_Data_SubCollection]  = 'US Surveys'
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT 
       *
         FROM      [forum].[dbo].[Pew_Data_Source]
ORDER BY
         [Data_source_pk]  DESC
/**************************************************************************************************************************/

