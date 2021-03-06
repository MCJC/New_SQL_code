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
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Std]'               )
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + '_sourcetable]
                FROM      [xRLS2].[dbo].[Pew_Question_Std]'               )
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
DROP TABLE
           [forum].[dbo].[Pew_Question_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/*------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE
     [Pew_Question_Std]
(
     [Question_Std_pk]                    [int]            NOT NULL
   , [Question_abbreviation_std]          [nvarchar](255)      NULL
   , [Question_wording_std]               [varchar](MAX)       NULL
   , [Question_short_wording_std]         [varchar](500)       NULL
   , [Display]                            [int]                NULL
   , [AnswerSet_num]                      [int]                NULL
   , [Editorially_Checked]                [varchar](5)         NULL
   ,CONSTRAINT
    [PK_Pew_Question_Std]
    PRIMARY KEY CLUSTERED 
    (
	  [Question_Std_pk]
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
           [forum].[dbo].[Pew_Question_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
       [Question_Std_pk]
      ,[Question_abbreviation_std]
      ,[Question_wording_std]
      ,[Question_short_wording_std]
      ,[Display]
      ,[AnswerSet_num]              = [AnswerSet_number]
      ,[Editorially_Checked]
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM
           [xRLS2].[dbo].[Pew_Question_Std]
/**************************************************************************************************************************/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT 
       *
  FROM
           [forum].[dbo].[Pew_Question_Std]
/**************************************************************************************************************************/





/***
-- uses tables merging question std and nostd 
/*********************************************************************************************************/
/*********************************************************************************************************/
SELECT 
        ca.[Question_pk]
      , ca.[Question_abbreviation]
      --,  A.[Question_abbreviation]
      --, ca.[Question_wording]
      --,  A.[Question_wording]
      --, ca.[Question_Year]
      --,  A.[Question_Year]
      --, ca.[Data_source_fk]
      --, ca.[Short_wording]
      --, ca.[Notes]
      --, ca.[Default_response]
      , ca.[Question_abbreviation_std]
      , ca.[Question_wording_std]
      , ca.[Question_short_wording_std]
      , ca.[Display]
      , ca.[Question_Std_fk]
      , *
  FROM
/*********************************************************************************************************/
       [forum].[dbo].[Pew_Question]               ca
/*********************************************************************************************************/

  FULL
  OUTER
   JOIN

/*********************************************************************************************************/
       [xRLS2].[dbo].[JCNEWQ]              A
/*********************************************************************************************************/

 ON
        ca.[Question_pk]
       = A.[Question_pk]
AND     ca.[Data_source_fk]
       = A.[Data_source_fk]
AND     ca.[Notes]
       = A.[Notes]

--AND     ca.[Question_abbreviation]                            ------ 17
--       = A.[Question_abbreviation]
--AND     ca.[Question_wording]
--       = A.[Question_wording]
--AND     ca.[Question_Year]
--       = A.[Question_Year]

--AND     ca.[Short_wording]
--       = A.[Short_wording]
--AND     ca.[Default_response]
--       = A.[Default_response]

--AND     ca.[Question_abbreviation_std]
--       = A.[Question_abbreviation_std]
--AND     ca.[Question_wording_std]
--       = A.[Question_wording_std]
--AND     ca.[Question_short_wording_std]
--       = A.[Question_short_wording_std]
--AND     ca.[Display]
--       = A.[Display]
--AND     ca.[Question_Std_fk]
--       = A.[Question_Std_fk]
/*********************************************************************************************************/
where
-----------------------------------------------------------------------------------------------------------
         A.[Question_pk] IS NULL        ----    does not exist
and
        ca.[Question_pk] is not null    ----    has some answers
/*********************************************************************************************************/
/***  [Question_abbreviation] & similar   ****************************************************************/
--AND   ca.[Question_abbreviation] is not NULL
/*********************************************************************************************************/
/***  [Question_short_wording] ... ***********************************************************************/
--AND   ca.[Short_wording] is not NULL
/*********************************************************************************************************/
/***  [Question_abbreviation_std]  ***********************************************************************/
--AND   ca.[Question_abbreviation_std] is not NULL
--AND   ca.[Question_abbreviation_std] not like '%_text'
--AND   ca.[Question_abbreviation_std] not like '%_DSCPTN'
/*********************************************************************************************************/
/*********************************************************************************************************/
                                                                                                       ***/