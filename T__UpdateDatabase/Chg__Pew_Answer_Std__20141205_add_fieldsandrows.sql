-- script as part of major change in structure
-- check all as...
--   FIRST CHECK:
--   + Chg__Pew_Data_Source_20141205_add_fieldsandrows.sql
--   + Chg__Pew_Question_NoStd__20141205_drop_fields__add_rows.sql
--   + Chg__Pew_Question_Std__20141205_add_fieldandsrows.sql
--   + Chg__Pew_Answer_Std__20141205_add_fieldsandrows.sql
--   + Chg__Pew_Answer_NoStd__20141205_add_fieldsandrows.sql
--   THEN CHECK UPDATED:
--   + VIEW_Pew_Question.sql
--   + VIEW_Pew_Q&A.sql
--   + VIEW_Pew_Answer.sql
--   AND FINALLY CHECK:
--   + Chg__Pew_Answer_NoStd__20141205_add_more_rows.sql
/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/*****                                          BackUp updated >source Table                                          *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Answer_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Answer]'               )
/*------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID           (N'[forum].[dbo].[Pew_Answer]', N'U') IS NOT NULL
DROP TABLE                [forum].[dbo].[Pew_Answer]
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + '_sourcetable]
                FROM      [xRLS2].[dbo].[Pew_Answer_Std]'               )
/*------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID           (N'[forum].[dbo].[Pew_Answer]', N'U') IS NOT NULL
DROP TABLE                [forum].[dbo].[Pew_Answer]
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
-- Because of extensive changes it would be more effective to recreate the table once the BackUp has finished
-- (checking procedures pasted at the end as comments /* - */
/*------------------------------------------------------------------------------------------------------------------------*/
USE [forum]
GO
/**************************************************************************************************************************/
IF OBJECT_ID           (N'[forum].[dbo].[Pew_Answer_Std]', N'U') IS NOT NULL
DROP TABLE                [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/*------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE
    [Pew_Answer_Std]
(
	[Answer_Std_pk]                    [int]         NOT NULL,
	[AnswerSet_number]                 [int]             NULL,
	[Answer_value_std]                 [decimal](12, 2)  NULL,
	[Answer_Wording_std]               [nvarchar](max)   NULL,
	[Full_set_of_Answers]              [nvarchar](max)   NULL,
	[NA_by_set_of_Answers]             [int]             NULL,
    CONSTRAINT
    [PK_Pew_Answer_Std]
    PRIMARY KEY CLUSTERED 
    (
	  [Answer_Std_pk]
	                      ASC
                         )WITH (  PAD_INDEX              = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  ) ON [PRIMARY]
                                                                               ) ON [PRIMARY]
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
SET ANSI_PADDING OFF
GO
/**************************************************************************************************************************/
INSERT INTO
           [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
       [Answer_Std_pk]
      ,[AnswerSet_number]
      ,[Answer_value_std]         = [Answer_value]
      ,[Answer_Wording_std]
      ,[Full_set_of_Answers]
      ,[NA_by_set_of_Answers]
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM
           [xRLS2].[dbo].[Pew_Answer_Std]
/**************************************************************************************************************************/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT 
       *
  FROM
           [forum].[dbo].[Pew_Answer_Std]
/**************************************************************************************************************************/





/***
-- uses tables merging question/answer std and nostd 
/*********************************************************************************************************/
/*********************************************************************************************************/
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
        ca.[Answer_pk]
      , ca.[Answer_value]
      ,  A.[Answer_value]
      , ca.[Answer_wording]
      ,  A.[Answer_wording]
      --, ca.[answer_wording_std]
      --  ca.[Answer_pk]
      --, ca.[Answer_value]
      --, ca.[Question_fk]
      --, ca.[Answer_wording]
      --, ca.[answer_wording_std]
      --, ca.[Answer_value]
      --, ca.[Question_fk]
      --, ca.[Answer_wording]
      --, ca.[answer_wording_std]
      , *
  FROM
/*********************************************************************************************************/
       [xRLS2].[dbo].[oldvals]               ca
/*********************************************************************************************************/
  FULL
  OUTER
   JOIN
/*********************************************************************************************************/
       [xRLS2].[dbo].[tabtestqa]              A
/*********************************************************************************************************/
 ON
        ca.[Answer_pk]
       = A.[Answer_pk]
AND     ca.[Question_fk]
       = A.[Question_fk]
--AND     ca.[answer_wording_std]              --- 6867 of 7205 are both null; zero curr null; crret
--       = A.[answer_wording_std]
--AND     ca.[Answer_value]                    --- 673 ...
--       = A.[Answer_value]
--AND     ca.[Answer_wording]                  --- 245: all  are both null
--       = A.[Answer_wording]
-----------------------------------------------------------------------------------------------------------
where
-----------------------------------------------------------------------------------------------------------
         A.[Answer_pk] IS NULL        ----    does not exist
and
        ca.[Answer_pk] is not null    ----    has some answers
----          AND  A.[Answer_value] is  null )
--------AND     ca.[answer_wording_std]              --- 6867 of 7205 are both null; zero curr null; crret
--------       != A.[answer_wording_std]
------and
/*********************************************************************************************************/
/*********************************************************************************************************/
------------- [Answer_value]
--AND   ca.[Answer_value] is not null
--and   ca.[Question_abbreviation] NOT LIKE 'CSP%'
--and   ca.[Question_abbreviation_std] not LIKE 'PPR_0[1-2]'
--and   ca.[Question_abbreviation_std] not LIKE 'GRI_20_05_x1'
--and   ca.[Question_abbreviation_std] not LIKE 'SHI_05_b'
--and   ca.[Question_abbreviation_std] not in ( 'GRX_23_a', 'GRX_25_03_text', 'SHX_27_02_text' )
--and not (          ca.[Answer_pk] >= 2601
--          AND      ca.[Answer_pk] <= 6288
--          AND (    ca.[Question_abbreviation] LIKE 'AFR%'
--                OR ca.[Question_abbreviation] LIKE 'GSI%' ) )
--and not ( ca.[Answer_wording] = 'DK/Ref.' and ca.[Question_abbreviation] != 'AFR_48' )
/*********************************************************************************************************/
/*********************************************************************************************************/
------------- [Answer_value]
--AND   ca.[Answer_wording] is not null
/*********************************************************************************************************/
/*********************************************************************************************************/
                                                                                                       ***/
