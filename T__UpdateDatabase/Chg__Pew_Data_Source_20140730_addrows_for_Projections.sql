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
-- Update by adding new source
INSERT INTO
            [forum].[dbo].[Pew_Data_Source]
                                             (  [Data_source_pk]
                                              , [Data_source_name]
                                              , [Data_source_description]
                                              , [Data_source_url]
                                              , [Source_Display_Name]     )
SELECT  [Data_source_pk]          = (SELECT MAX([Data_source_pk]) + 1
                                       FROM [forum].[dbo].[Pew_Data_Source])
      , [Data_source_name]        = 'Projected Population Growth of World Religions, 2010-2050'
      , [Data_source_description] = 'Religious group population projections'
      , [Data_source_url]         = 'http://www.pewresearch.org/topics/population-projections/'
      , [Source_Display_Name]     = 'Projected Population Growth of World Religions, 2010-2050'
/*********************************************************************************************************/
-- check results
SELECT 
       *
         FROM      [forum].[dbo].[Pew_Data_Source]
ORDER BY
         [Data_source_pk]  DESC
/*********************************************************************************************************/

