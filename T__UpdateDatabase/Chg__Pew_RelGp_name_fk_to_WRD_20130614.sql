/****************************************************************************************************************/
-- June 14, 2013
/****************************************************************************************************************/
SELECT *
  INTO   [_bk_forum].[dbo].[Pew_Religion_Group_2013_06_16]
  FROM       [forum].[dbo].[Pew_Religion_Group]
/****************************************************************************************************************/
/* rename a column **********************************************************************************************/
/* from �Wrd_religion_code� to �WRD_religion_code_fk� ***********************************************************/
USE forum
GO
sp_RENAME 'Pew_Religion_Group.Wrd_religion_code', 'WRD_religion_code_fk' , 'COLUMN'
GO
/****************************************************************************************************************/
/* rename column to former name: further problems noticed *******************************************************/
USE forum
GO
sp_RENAME 'Pew_Religion_Group.WRD_religion_code_fk', 'Wrd_religion_code' , 'COLUMN'
GO
/****************************************************************************************************************/
