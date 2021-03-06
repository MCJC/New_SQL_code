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
                INTO  [_bk_forum].[dbo].[Pew_Question_Topic_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Topic]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
TRUNCATE
TABLE
       [forum].[dbo].[Pew_Question_Topic]
-- notice current mas pk is 659, start from 660 next insertion!!!!
--SELECT MAX(question_topic_pk)
--  FROM [forum].[dbo].[Pew_Question_Topic]
/**************************************************************************************************************************/
-- add only rows currently used but keep current pk
INSERT INTO
       [forum].[dbo].[Pew_Question_Topic]
SELECT
       *
  FROM 
       [Stacy].[dbo].[Pew_Question_Topic]
ORDER
BY
       [Question_topic_pk]
/**************************************************************************************************************************/
SELECT MAX(question_topic_pk)
  FROM [forum].[dbo].[Pew_Question_Topic]
SELECT *
  FROM [forum].[dbo].[Pew_Question_Topic]
/**************************************************************************************************************************/
