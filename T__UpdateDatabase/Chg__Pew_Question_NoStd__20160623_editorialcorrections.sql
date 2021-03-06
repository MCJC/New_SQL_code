----------------------------------------------------------------------------------------------------------------------------
USE              [forum]
GO
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
/*****                                           BackUp  current Table(s)                                             *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- 
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Question_wording] =
--          select                            [Question_wording] =
                                    REPLACE ( [Question_wording], 'Where there instances when the nationa'
                                                                , 'Were there instances when the nationa'   )
--            from         [Pew_Question_NoStd]
/*------------------------------------------------------------------------------------------------------------------------*/
WHERE
/*------------------------------------------------------------------------------------------------------------------------*/
                     [Question_pk] IN (
										1018,
										1346,
										1647
                                      )
       AND           [Question_wording]   LIKE 'Where there instances %'
/**************************************************************************************************************************/
