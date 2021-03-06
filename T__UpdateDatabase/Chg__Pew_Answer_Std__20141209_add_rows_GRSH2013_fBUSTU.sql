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
                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Answer_Std]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
           [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
----------------------------------------------------------------------------------------------------------------------------
       [Answer_Std_pk]         =  [k]
                                + (  SELECT  MAX([Answer_Std_pk])  
                                       FROM      [Pew_Answer_Std]
                                      WHERE      [Answer_Std_pk]  < 999990 )
      ,[AnswerSet_number]      =  [s]
                                + ( SELECT  MAX([AnswerSet_number])  
                                       FROM      [Pew_Answer_Std]
                                      WHERE      [AnswerSet_number]  < 999990 )
----------------------------------------------------------------------------------------------------------------------------
      ,[Answer_value_std]
      ,[Answer_Wording_std]
      ,[Full_set_of_Answers]
      ,[NA_by_set_of_Answers]
----------------------------------------------------------------------------------------------------------------------------
  FROM [_bk_forum].[dbo].[Pew_Answer_Std_20141209_BUSTU]
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT * FROM [forum].[dbo].[Pew_Answer_Std]
/**************************************************************************************************************************/
