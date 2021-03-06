/*********************************************************************************************************/
/**************************************************************************************************************************/
/*****                                           BackUp  current Table(s)                                             *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- add six questions: 
INSERT
INTO
           [forum].[dbo].[Pew_Question_NoStd]
                                           (  
                                             [Question_pk]
                                            ,[Data_source_fk]
                                            ,[Notes]
                                            ,[Question_Std_fk]
                                                                           )
          SELECT 1608, 3, 'question for aggregated values', 529
UNION ALL SELECT 1609, 3, 'question for aggregated values', 530
UNION ALL SELECT 1610, 3, 'question for aggregated values', 531
UNION ALL SELECT 1611, 3, 'question for aggregated values', 791
UNION ALL SELECT 1612, 3, 'question for aggregated values', 792
UNION ALL SELECT 1613, 3, 'question for aggregated values', 793
/**************************************************************************************************************************/
-- update source values when they are missing
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk] = 28
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_Std_fk]
      IN (
             167    -- SHI_01_summary_a
           , 168    -- SHI_01_summary_b
           , 169    -- SHI_01_x
           , 237    -- SHX_14
           , 761    -- SHI_01_x_17
                                          )
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk] = 27
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_Std_fk]
      IN (
               47    -- GRI_11_x
            , 636    -- GRI_11_17
            , 106    -- GRX_21
            , 118    -- GRX_25
                                          )
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk] = 30
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_Std_fk]
      IN (
             254    -- SHX_27
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Data_source_fk] = 1
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_Std_fk]
      IN (
              525    -- XSG_01c11
            , 527    -- XSG_25c26c24
            , 528    -- XSG_27c25
                                          )
/**************************************************************************************************************************/
-- check results
SELECT 
       [Question_abbreviation]
      ,[Question_pk]
      ,[Data_source_fk]
      ,[Notes]
      ,[Question_Std_fk]
      ,[Question_abbreviation_std]
      ,[Question_short_wording_std]
  FROM [forum].[dbo].[Pew_Question]
WHERE
       [Question_abbreviation]     is null
   OR
       [Question_abbreviation_std] is null

ORDER BY
       [Question_abbreviation]
/**************************************************************************************************************************/