/**************************************************************************************************************************/
USE       [forum]
GO
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
                INTO  [_bk_forum].[dbo].[Pew_Religion_Group_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Religion_Group]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/


/**************************************************************************************************************************/
-- On August 29 Stacy requested change
--     of    Folk Religionists   to   Folk Religions
--     in Pew_RelL02_Display & Pew_RelL02_5_Display
/*------------------------------------------------------------------------------------------------------------------------*/
-- (34 rows)
UPDATE [Pew_Religion_Group]
   SET [Pew_RelL02_Display]   = 'Folk Religions'
     , [Pew_RelL02_5_Display] = 'Folk Religions'
-- select * from [Pew_Religion_Group]
 WHERE [Pew_RelL02_Display]   = 'Folk Religionists'
    OR [Pew_RelL02_5_Display] = 'Folk Religionists'
GO
/*------------------------------------------------------------------------------------------------------------------------*/
-- (1 row)
UPDATE [Pew_Religion_Group]
   SET [Pew_RelL02_Display]   = 'Other Religions and Folk Religions'
     , [Pew_RelL02_5_Display] = 'Other Religions and Folk Religions'
-- select * from [Pew_Religion_Group]
 WHERE [Pew_RelL02_Display]   = 'Other Religions and Folk Religionists'
    OR [Pew_RelL02_5_Display] = 'Other Religions and Folk Religionists'
GO
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
