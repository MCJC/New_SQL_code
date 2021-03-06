/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
USE [forum]
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + 'b]
                FROM      [forum].[dbo].[Pew_Answer_Std]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET
           [forum].[dbo].[Pew_Answer_Std].[Answer_Wording_std]            = 'DK/Ref. (vol.)'
WHERE
           [forum].[dbo].[Pew_Answer_Std].[Answer_Wording_std]            = 'Don’t Know'
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET
           [forum].[dbo].[Pew_Answer_Std].[Answer_value_std]              = 999
WHERE
           [forum].[dbo].[Pew_Answer_Std].[Answer_Wording_std]            = 'DK/Ref. (vol.)'
  AND      [forum].[dbo].[Pew_Answer_Std].[Answer_value_std]              = 149
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET
           [forum].[dbo].[Pew_Answer_Std].[Answer_value_std]              = 99
WHERE
           [forum].[dbo].[Pew_Answer_Std].[Answer_Wording_std]            = 'DK/Ref. (vol.)'
  AND (    [forum].[dbo].[Pew_Answer_Std].[Answer_value_std]              = 52
        OR [forum].[dbo].[Pew_Answer_Std].[Answer_value_std]              = 16                 )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/


/**************************************************************************************************************************/
/*****                                                    STEP 004                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
-- check results
SELECT * FROM [forum].[dbo].[Pew_Answer_Std]
WHERE
           [forum].[dbo].[Pew_Answer_Std].[AnswerSet_number]  in ( 231, 232, 233 )
  AND      [forum].[dbo].[Pew_Answer_Std].[Answer_Wording_std]            = 'DK/Ref. (vol.)'
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
