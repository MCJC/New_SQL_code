/****************************************************************************************************************/
-- March 05, 2013
/****************************************************************************************************************/
SELECT *
  INTO   [_bk_forum].[dbo].[Pew_Religion_Group_2013_03_05]
  FROM       [forum].[dbo].[Pew_Religion_Group]
/****************************************************************************************************************/
-- add column
ALTER TABLE  [forum].[dbo].[Pew_Religion_Group]
ADD                         Pew_RelL02_Display  varchar(50)
/****************************************************************************************************************/
UPDATE       [forum].[dbo].[Pew_Religion_Group]

SET   Pew_RelL02_Display
    = Pew_religion_lev02
/****************************************************************************************************************/




UPDATE       [forum].[dbo].[Pew_Religion_Group]

SET   Pew_RelL02_Display = ''
WHERE Pew_RelL02_Display = ''


/****************************************************************************************************************/

