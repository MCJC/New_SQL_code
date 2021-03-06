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
/*------------------------------------------------------------------------------------------------------------------------*/
--From: Stacy Rosenberg 
--Sent: Thursday, March 26, 2015 4:01 PM
------Hi Juan Carlos, If possible it would be great if we can update the URL associated with the new report.
------We were using the topics page as a placeholder (and that will still work) for: 
------The Future of World Religions: Population Growth Projections, 2010-2050
------http://www.pewresearch.org/topics/population-projections/
------But even better if we can direct visitors to the actual report URL. It will be:
------http://www.pewforum.org/2015/04/02/religious-projections-2010-2050/
/*------------------------------------------------------------------------------------------------------------------------*/
-- Update by adding & populating two fields
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
           [Data_source_url] = 'http://www.pewforum.org/2015/04/02/religious-projections-2010-2050/'
WHERE
           [Data_source_url] = 'http://www.pewresearch.org/topics/population-projections/'
  AND
           [Source_Display_Name] = 'The Future of World Religions: Population Growth Projections, 2010-2050'
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
WHERE
           [Source_Display_Name] = 'The Future of World Religions: Population Growth Projections, 2010-2050'
/**************************************************************************************************************************/
