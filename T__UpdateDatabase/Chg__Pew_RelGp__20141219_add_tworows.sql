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
                INTO  [_bk_forum].[dbo].[Pew_Religion_Group_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Religion_Group]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
           [forum].[dbo].[Pew_Religion_Group]
    (  [Religion_group_pk]
      ,[Pew_religion]        )
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
       [Religion_group_pk]   =   [k]
                                +  (SELECT MAX([Religion_group_pk]) FROM [Pew_Religion_Group])
      ,[Pew_religion]        =   [R]
FROM
----------------------------------------------------------------------------------------------------------------------------
(
          SELECT [k] = 1, [R] = 'Electronic ministries - in Baptist in the Evangelical Tradition family'
UNION ALL SELECT [k] = 2, [R] = 'Electronic ministries - in Other Evangelical/Fundamentalist family'
) TwoMore
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT * FROM [forum].[dbo].[Pew_Religion_Group]
/**************************************************************************************************************************/
