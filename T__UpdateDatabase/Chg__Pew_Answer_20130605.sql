/**************************************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Answer_2013_06_05]
  FROM      [forum].[dbo].[Pew_Answer]
/**************************************************************************************************************************/
-- Standardize answers (errors probably when coding wit no std wording)
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- table name
SET
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'Yes, security reasons stated as rationale'
WHERE
            [forum].[dbo].[Pew_answer].[Answer_pk] IN                                     -- selected rows
                                                  (
                                                      8543    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8547    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8548    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8551    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8552    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8555    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8557    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8560    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8561    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8562    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8566    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8572    -- wording_std is 'Yes, for alleged security reasons'
                                                    , 8576    -- wording_std is 'Yes, for alleged security reasons'
                                                  )
----------------------------------------------------------------------------------------------------------------------------
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- table name
SET
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'Yes, nonsecurity reasons stated as rationale'
WHERE
            [forum].[dbo].[Pew_answer].[Answer_pk] IN                                     -- selected rows
                                                  (
                                                      8539    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8540    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8541    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8542    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8544    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8545    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8546    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8549    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8553    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8554    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8556    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8558    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8559    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8563    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8564    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8565    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8568    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8575    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8577    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8578    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8579    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 8580    -- wording_std is 'Yes, for non-security related reasons'
                                                    , 15700   -- wording_std is 'Yes, for non-security related reasons'
                                                  )
----------------------------------------------------------------------------------------------------------------------------
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- table name
SET
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'Yes, both security and nonsecurity reasons stated as rationale'
WHERE
            [forum].[dbo].[Pew_answer].[Answer_pk] IN                                     -- selected rows
                                                  (
                                                      8537    -- wording_std is 'Yes, for both'
                                                    , 8538    -- wording_std is 'Yes, for both'
                                                    , 8550    -- wording_std is 'Yes, for both'
                                                    , 8567    -- wording_std is 'Yes, for both'
                                                    , 8569    -- wording_std is 'Yes, for both'
                                                    , 8570    -- wording_std is 'Yes, for both'
                                                    , 8571    -- wording_std is 'Yes, for both'
                                                    , 8573    -- wording_std is 'Yes, for both'
                                                    , 8574    -- wording_std is 'Yes, for both'
                                                    , 15774   -- wording_std is 'Yes, for both'
                                                  )
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------


