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
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET
           [Question_wording_std]        = REPLACE([Question_wording_std]       , '(N/Y optns)', '(N/Y options)')
        ,  [Question_short_wording_std]  = REPLACE( [Question_short_wording_std], '(N/Y optns)', '(N/Y options)')
--SELECT * FROM [forum].[dbo].[Pew_Question_Std]
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_Std_pk]            = 922
       AND
           [forum].[dbo].[Pew_Question_Std].[Question_abbreviation_std]  = 'GRI_19_ny'
       AND
           [forum].[dbo].[Pew_Question_Std].[Question_wording_std]       = [Question_short_wording_std]
       AND
           [forum].[dbo].[Pew_Question_Std].[Question_short_wording_std]
		 = 'Did any level of government use force toward religious groups that resulted in individuals being killed,'
		 + ' physically abused, imprisoned, detained or displaced from their homes, or having their personal or reli'
		 + 'gious properties damaged or destroyed? (N/Y optns)'
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT * FROM [forum].[dbo].[Pew_Question_Std]
--SELECT * FROM [forum].[dbo].[Pew_Question_Std]
WHERE
           [forum].[dbo].[Pew_Question_Std].[Question_short_wording_std]
      LIKE 'Did any level of government use force toward religious groups that resulted in % (N/Y optns)'
/**************************************************************************************************************************/
