/*********************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Answer_2013_06_03]
  FROM      [forum].[dbo].[Pew_Answer]
/*********************************************************************************************************/
-- Reverse values
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- table name
SET
            [forum].[dbo].[Pew_Answer].[Answer_value]       = 1.00
     ,
            [forum].[dbo].[Pew_Answer].[Answer_wording]     = 'Yes [Not selected]'
     ,
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'Yes'
WHERE
            [forum].[dbo].[Pew_answer].[Answer_pk] IN                                    -- DB name
                                                           (
                                                               3868	    -- value is 0: Not selected
                                                             , 13813	-- value is 0: Not selected
                                                           )
-----------------------------------------------------------------------------------------------------------
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
            [forum].[dbo].[Pew_Answer].[Answer_value]       = 0.00
     ,
            [forum].[dbo].[Pew_Answer].[Answer_wording]     = 'No [option selected]'
     ,
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'No'
WHERE
            [forum].[dbo].[Pew_answer].[Answer_pk] IN                                    -- DB name
                                                           (
                                                               3869	    -- value is 1: option selected
                                                             , 13814	-- value is 1: option selected
                                                           )
/*********************************************************************************************************/
-- test results
SELECT 
       [Answer_pk]
      ,[Answer_value]
      ,[Answer_wording]
      ,[answer_wording_std]
  FROM [forum].[dbo].[Pew_Answer]
     , [forum].[dbo].[Pew_Question]
WHERE  Question_fk
     = Question_pk   
 AND   Question_abbreviation_std like 'SHX_27_01'
--------------------------------------------------
-- test results
SELECT 
       [Answer_pk]
      ,[Answer_value]
      ,[Answer_wording]
      ,[answer_wording_std]
  FROM [_bk_forum].[dbo].[Pew_Answer_2013_06_03]
     , [forum].[dbo].[Pew_Question]
WHERE  Question_fk
     = Question_pk   
 AND   Question_abbreviation_std like 'SHX_27_01'
/*********************************************************************************************************/
