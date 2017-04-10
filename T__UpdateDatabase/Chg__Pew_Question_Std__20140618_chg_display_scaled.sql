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
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + 'b]
                FROM      [forum].[dbo].[Pew_Question_Std]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
UPDATE
           [forum].[dbo].[Pew_Question_Std]
SET
           [forum].[dbo].[Pew_Question_Std].[Display]                    =   0
/*------------------------------------------------------------------------------------------------------------------------*/
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]           IN ( 791, 792 )
     AND      
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std] IN ('GRI_scaled', 'SHI_scaled' )
/**************************************************************************************************************************/
-- check results
SELECT *
FROM
           [forum].[dbo].[Pew_Question_Std]
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std] IN ('GRI_scaled', 'SHI_scaled' )
/**************************************************************************************************************************/
