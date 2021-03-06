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
                INTO  [_bk_forum].[dbo].[Pew_Nation_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Nation]'               )
/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- From: Tracy Miller 
--Sent: Wednesday, April 02, 2014 9:56 AM
--Hi GRF team,
--   Mike pointed out that Guinea-Bissau (hyphenated) is correct and what we should be using. AP has it hyphenated in its
--   Guinea-Bissau entry (though in its African Union entry, it has it with a space, which must be where our original 
--   decision to use the space came from). Anyway, we think it’s worthwhile to start using the hyphen from now on.
/**************************************************************************************************************************/
UPDATE
           [forum].[dbo].[Pew_Nation]
SET
           [forum].[dbo].[Pew_Nation].[Ctry_EditorialName] = 'Guinea-Bissau'
WHERE
           [forum].[dbo].[Pew_Nation].[Ctry_EditorialName] = 'Guinea Bissau'
/*********************************************************************************************************/
-- check results
SELECT 
       *
FROM       [forum].[dbo].[Pew_Nation]
WHERE
           [forum].[dbo].[Pew_Nation].[Ctry_EditorialName] LIKE 'Guinea%'
/*********************************************************************************************************/
