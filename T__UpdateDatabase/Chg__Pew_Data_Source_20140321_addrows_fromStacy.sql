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
SELECT    [Data_source_pk] = [Data_source_pk] + 4
      , S.[Data_source_name]
      , S.[Data_source_description]
      , S.[Data_source_url]
      , S.[Source_Display_Name]
  FROM [Stacy].[dbo].[Pew_Data_Source_editable]    S
WHERE 
        S.[Data_source_pk] > 64
/*********************************************************************************************************/
-- check results
SELECT 
       *
         FROM      [forum].[dbo].[Pew_Data_Source]
ORDER BY
         [Data_source_pk]  DESC
/*********************************************************************************************************/

