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
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Std]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
-- Notice that:
--      - GRX_22_ny is NOT a dummey (Y/N) question
--        Therefore a batter nam could be
--        GRX_22_aggreg
--   (this eill imply changes for GRSH toplines scripts)
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std]  = 'GRX_22_aggreg'
--SELECT * FROM [forum].[dbo].[Pew_Question_Std]
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]            = 932
       AND
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std]  = 'GRX_22_ny'
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT * FROM [forum].[dbo].[Pew_Question_Std]
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std]  LIKE  'GRX_22%'
SELECT * FROM [forum].[dbo].[Pew_Q&A_Std]
WHERE
           [Question_abbreviation_std]     = 'GRX_22_aggreg'
       OR
           [Question_abbreviation_std]     = 'GRX_22_ny'
/**************************************************************************************************************************/
