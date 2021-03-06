/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE @TofI    varchar(50)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Data_Source_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Data_Source]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
-- Update
-- from Stacy's: prefer to display data as for Population by Country, Age and Sex
-- for the recently created source for projections: Religious Distribution by Country, Age and Sex
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
           [forum].[dbo].[Pew_Data_Source].[Data_source_url]
       =                          ( SELECT [Data_source_url]
                                      FROM [forum]..[Pew_Data_Source]
                                     WHERE [Data_source_name]
                                         = 'Population by Country, Age and Sex' )
     ,     [forum].[dbo].[Pew_Data_Source].[Source_Display_Name]
       =                          ( SELECT [Source_Display_Name]
                                      FROM [forum]..[Pew_Data_Source]
                                     WHERE [Data_source_name]
                                         = 'Population by Country, Age and Sex' )

WHERE      [Data_source_name]
      =    'Religious Distribution by Country, Age and Sex'
/**************************************************************************************************************************/
-- check results
SELECT * FROM  [forum].[dbo].[Pew_Data_Source]
WHERE
      [Data_source_name]
                          IN (  'Population by Country, Age and Sex'
                              , 'Religious Distribution by Country, Age and Sex' )
/**************************************************************************************************************************/
