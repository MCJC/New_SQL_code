-- These changes were undone and data were restored!!!
/**************************************************************************************************************************/
USE       [forum]
GO
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
                INTO  [_bk_forum].[dbo].[Pew_Display_Reports_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Display_Reports]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
-- store MAX pk, sop we will not get it lost if the row is deleted
IF OBJECT_ID('tempdb..#MyMAXpk')  IS NOT NULL
DROP TABLE            #MyMAXpk                 -- drop temporary table if existent
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                [XDisplay_Reports_pk]
                 = MAX([Display_Reports_pk])
  INTO                #MyMAXpk
  FROM                [forum].[dbo].[Pew_Display_Reports]
GO
/**************************************************************************************************************************/
-- Drop references to The Global Religious Landscape (Data_source_fk = 34)
DELETE FROM
            [forum].[dbo].[Pew_Display_Reports]
WHERE
            [forum].[dbo].[Pew_Display_Reports].[Data_source_fk]
       =    34
AND
            [forum].[dbo].[Pew_Display_Reports].[GRF_Level]
       =    'reports'
AND
            [forum].[dbo].[Pew_Display_Reports].[Nation_fk]
            IS NOT NULL
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
             OVER(PARTITION BY [Nation_fk]                                    --
                      ORDER BY [Nation_fk]                                    --
                             , [Report_SortingNumber]   )                     --
           + 1                                                                --
--------------------------------------------------------------------------------
      ,[Report_SortingNumber]                                                 --
      ,[Display_Reports_pk]                                                   --
      --,[List_fk]                                                            --
      --,[item_fk]                                                            --
      --,[Nation_fk]                                                          --
      --,[Data_source_fk]                                                     --
      --,[GRF_Level]                                                          --
--------------------------------------------------------------------------------
  FROM [forum].[dbo].[Pew_Display_Reports]                                    --
--------------------------------------------------------------------------------
WHERE                                                                         --
            [forum].[dbo].[Pew_Display_Reports].[GRF_Level]                   --
       =    'reports'                                                         --
AND                                                                           --
            [forum].[dbo].[Pew_Display_Reports].[Nation_fk]                   --
            IS NOT NULL                                                       --
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
           + (SELECT MAX([XDisplay_Reports_pk]) FROM [#MyMAXpk])              --
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
AND         [forum].[dbo].[Pew_Display_Reports].[Nation_fk]   IS NOT NULL                                        ) NewData
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
/**************************************************************************************************************************/
/**************************************************************************************************************************/
/**************************************************************************************************************************/


/**************************************************************************************************************************/
-- drop row corresponding to an old topic that has been already deleted
DELETE FROM
            [forum].[dbo].[Pew_Display_Reports]
WHERE
            [forum].[dbo].[Pew_Display_Reports].[List_fk]
       =    4
AND
            [forum].[dbo].[Pew_Display_Reports].[item_fk]
       =    60
GO
/**************************************************************************************************************************/

-- Data will be restored