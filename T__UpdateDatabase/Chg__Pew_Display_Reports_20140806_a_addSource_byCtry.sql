/**************************************************************************************************************************/
USE       [forum]
GO
/**************************************************************************************************************************/
-- recover BackUp
/*------------------------------------------------------------------------------------------------------------------------*/
TRUNCATE
TABLE       [forum].[dbo].[Pew_Display_Reports]
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
            [forum].[dbo].[Pew_Display_Reports]
SELECT
       *
  FROM
        [_bk_forum].[dbo].[Pew_Display_Reports_20140804]
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE                          --  declare variable
          @TofI                    --  variable name
                   varchar(50)     --  data type of the variable
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
-- actually saved with extra 'b' at the end in 6Aug2014
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Display_Reports_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Display_Reports]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
-- Recode sorting number to NULL of all references to The Global Religious Landscape (Data_source_fk = 34)
UPDATE
            [forum].[dbo].[Pew_Display_Reports]
SET
            [forum].[dbo].[Pew_Display_Reports].[Report_SortingNumber]
       =    NULL
--select * from [forum].[dbo].[Pew_Display_Reports]
WHERE
            [forum].[dbo].[Pew_Display_Reports].[Data_source_fk]
       =    34
AND
            [forum].[dbo].[Pew_Display_Reports].[GRF_Level]
       =    'reports'
GO
/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- Update former reports' sorting order from a joined query ...
UPDATE
            [forum].[dbo].[Pew_Display_Reports]
SET
            [forum].[dbo].[Pew_Display_Reports].[Report_SortingNumber]
       =                              MyUpdated.[Report_SortingNumber_NEW]
--select *
FROM
            [forum].[dbo].[Pew_Display_Reports]                                   AS MyCurrent
INNER JOIN
(
--------------------------------------------------------------------------------
SELECT                                                                        --
--------------------------------------------------------------------------------
          [Report_SortingNumber_NEW]                                          --
          =  ROW_NUMBER()                                                     --
             OVER(PARTITION BY [List_fk]                                      --
                             , [item_fk]                                      --
                      ORDER BY [Nation_fk]                                    --
                             , [Religion_fk]                                  --
--                           , [Topic_fk]                                     --
                             , [Report_SortingNumber]   )                     --
           + 1                                                                --
--------------------------------------------------------------------------------
      ,[Report_SortingNumber]                                                 --
      ,[Display_Reports_pk]                                                   --
      --,[List_fk]                                                            --
      --,[item_fk]                                                            --
--------------------------------------------------------------------------------
  FROM [forum].[dbo].[Pew_Display_Reports]                                    --
--------------------------------------------------------------------------------
WHERE                                                                         --
            [forum].[dbo].[Pew_Display_Reports].[GRF_Level]                   --
       =    'reports'                                                         --
AND                                                                           --
            [forum].[dbo].[Pew_Display_Reports].[Report_SortingNumber]        --
            IS NOT NULL                                                       --
AND  (                                                                        --
            [forum].[dbo].[Pew_Display_Reports].[Nation_fk]                   --
            IS NOT NULL                                                       --
       OR                                                                     --
            [forum].[dbo].[Pew_Display_Reports].[Religion_fk]                 --
            IS NOT NULL                                                       --
       -- no need of selecting topic because there is no other report         --
       -- to be selected by topic in subtopics of Population Characteristics  --
     )                                                                        --
--------------------------------------------------------------------------------
                                                                                ) AS MyUpdated
ON
           MyCurrent.[Display_Reports_pk]
       =   MyUpdated.[Display_Reports_pk]
/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- Add new report data...
INSERT INTO
            [forum].[dbo].[Pew_Display_Reports]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
/*------------------------------------------------------------------------------------------------------------------------*/
       [Display_Reports_pk]                                                   --
          =   ROW_NUMBER()                                                    --
              OVER(ORDER BY [Nation_fk])                                      --
           + (SELECT MAX([Display_Reports_pk])                                --
              FROM [forum].[dbo].[Pew_Display_Reports])                       --
     , *                                                                      --
--------------------------------------------------------------------------------
FROM
/*------------------------------------------------------------------------------------------------------------------------*/
( SELECT                                                                        --
       DISTINCT
       [List_fk]
      ,[item_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Topic_fk]
      ,[Question_fk]
      ,[Data_source_fk]                    = (SELECT [Data_source_pk]
                                                FROM [forum]..[Pew_Data_Source]
                                               WHERE [Data_source_name]
                                                LIKE 'Projected Population Growth of World Religions, 2010-2050')
      ,[Report_SortingNumber]              = 1
      ,[GRF_Level]
  FROM [forum].[dbo].[Pew_Display_Reports]
WHERE       [forum].[dbo].[Pew_Display_Reports].[GRF_Level]   =    'reports'
AND  (                                                                        --
            [forum].[dbo].[Pew_Display_Reports].[Nation_fk]                   --
            IS NOT NULL                                                       --
       OR                                                                     --
            [forum].[dbo].[Pew_Display_Reports].[Religion_fk]                 --
            IS NOT NULL                                                       --
       OR                                                                     --
            [forum].[dbo].[Pew_Display_Reports].[Topic_fk]                    --
            IN ( 14, 15, 24 )                                                 --
     )                                                                        --
                                                                                                                 ) NewData
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
/**************************************************************************************************************************/


/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- Recode sorting number to NULL in a row corresponding to an old topic that has been already deleted
UPDATE
            [forum].[dbo].[Pew_Display_Reports]
SET
            [forum].[dbo].[Pew_Display_Reports].[Report_SortingNumber]
       =    NULL
--select * from [forum].[dbo].[Pew_Display_Reports]
WHERE
            [forum].[dbo].[Pew_Display_Reports].[List_fk]
       =    4
AND
            [forum].[dbo].[Pew_Display_Reports].[item_fk]
       =    60
GO
/**************************************************************************************************************************/
/**************************************************************************************************************************/
