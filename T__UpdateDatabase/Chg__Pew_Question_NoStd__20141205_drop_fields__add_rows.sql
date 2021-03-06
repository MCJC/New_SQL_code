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
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + '_sourcetable]
                FROM      [xRLS2].[dbo].[Pew_Question_NoStd]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
-- Because of extensive changes it would be more effective to recreate the table once the BackUp has finished
-- NOTICE: fields [Short_wording] & [Default_response] will not be included any more (incomplete, not from Survey team)
-- (checking procedures pasted at the end as comments /* - */
/*------------------------------------------------------------------------------------------------------------------------*/
USE [forum]
GO
/**************************************************************************************************************************/
DROP TABLE
           [forum].[dbo].[Pew_Question_NoStd]
/*------------------------------------------------------------------------------------------------------------------------*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/*------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE
     [Pew_Question_NoStd]
(
     [Question_pk]                        [int]            NOT NULL
   , [Question_abbreviation]              [nvarchar](255)      NULL
   , [Question_wording]                   [varchar](MAX)       NULL
   , [Question_Year]                      [int]                NULL
   , [Notes]                              [varchar](1000)      NULL
   , [Data_source_fk]                     [int]                NULL
   , [Question_Std_fk]                    [int]                NULL	
   ,CONSTRAINT
    [PK_Pew_Question_NoStd]
    PRIMARY KEY CLUSTERED 
    (
	  [Question_pk]
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
           [forum].[dbo].[Pew_Question_NoStd]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
       [Question_pk]
      ,[Question_abbreviation]
      ,[Question_wording]
      ,[Question_Year]
      ,[Notes]
      ,[Data_source_fk]
      ,[Question_Std_fk]
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM
           [xRLS2].[dbo].[Pew_Question_NoStd]
/**************************************************************************************************************************/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- update RLSI
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
                                              [Question_abbreviation] = STUFF([Question_abbreviation], 6,1, 'cUS_')
                                            , [Data_source_fk]        = 72    --- hardcided for faster
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_abbreviation] LIKE 'RLS07_%'
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
-- add RLSI - extra set
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
           [forum].[dbo].[Pew_Question_NoStd]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
       [Question_pk]            =    ROW_NUMBER()
                                     OVER(ORDER BY [Question_pk])
                                  + (SELECT MAX([Question_pk])
                                     FROM [forum].[dbo].[Pew_Question_NoStd])
      --,[Question_pk]
      ,[Question_abbreviation]  = STUFF([Question_abbreviation], 6,4, 'A&H_')
      ,[Question_wording]
      ,[Question_Year]
      ,[Notes]
      ,[Data_source_fk]         = 73    --- hardcided for faster
      ,[Question_Std_fk]
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM
           [forum].[dbo].[Pew_Question_NoStd]
/*------------------------------------------------------------------------------------------------------------------------*/
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_abbreviation] LIKE 'RLS07%'
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 003                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT 
       *
  FROM
           [forum].[dbo].[Pew_Question_NoStd]
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