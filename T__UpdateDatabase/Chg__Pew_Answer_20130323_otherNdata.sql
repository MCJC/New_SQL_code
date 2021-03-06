/*********************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Answer_2013_03_26c_other]
  FROM      [forum].[dbo].[Pew_Answer]
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Nation_Answer_2013_03_26c_other]
  FROM      [forum].[dbo].[Pew_Nation_Answer]
/*********************************************************************************************************/


TRUNCATE
   TABLE    [forum].[dbo].[Pew_Answer]
INSERT
  INTO      [forum].[dbo].[Pew_Answer]
SELECT *
  FROM  [_bk_forum].[dbo].[Pew_Answer_2013_03_26c_other]



-- Step 00
-- Check there are no rows from nation-asnwer linking table
-- whith no answers ("empty" links)

SELECT * FROM
                 [forum].[dbo].[Pew_Nation_Answer]                                            -- DB name
LEFT OUTER JOIN
                 [forum].[dbo].[Pew_Answer]                 A                                 -- DB name
ON
                 [forum].[dbo].[Pew_Nation_Answer].[Answer_fk]
          =                                      A.[Answer_pk]
WHERE                                            A.[Answer_pk]   IS NULL

----> Non-Zero answer values not corresponding to any answer text will be identified at the end

/*********************************************************************************************************/

-- GRX_23_a & GRX_23_a
-- Step 01
-- attach answer values, standard wording, and question keys to corresponding description answers
-- (country level)

UPDATE
                [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
                [forum].[dbo].[Pew_Answer].[Answer_value]                                     -- DB name
       =                             toolT.[Answer_value]
     ,
                [forum].[dbo].[Pew_Answer].[Answer_wording_std]                               -- DB name
       =                             toolT.[Answer_wording_std]
     ,
                [forum].[dbo].[Pew_Answer].[Question_fk]                                      -- DB name
       =                             toolT.[Question_fk]
FROM
--select * from
                [forum].[dbo].[Pew_Answer]   AS mydbt                                         -- DB name
 JOIN
       (
          SELECT 
                  Answer_pk                    = TT.[Answer_fk]
                , Answer_value                 = VV.[Answer_value]
                , Question_fk                  = VV.[Question_fk]
                , Answer_wording               = TT.[Answer_wording]
                , Answer_wording_std           = VV.[answer_wording_std]
--select distinct *
          FROM
          /****************************************************************************************************/
          (
          SELECT 
                  level                      = 'Ctry'
                , Answer_fk                  = A.[Answer_pk]
                , Answer_value               = A.[Answer_value]
                , Answer_wording             = A.[Answer_wording]
                , answer_wording_std         = A.[answer_wording_std]
                , Question_fk                = Q.[Question_pk]
                , Question_abbreviation_std  = Q.[Question_abbreviation_std]
                , Question_abbreviation      = Q.[Question_abbreviation]
                , Question_wording           = Q.[Question_wording]
                , Data_source_fk             = Q.[Data_source_fk]
                , Question_Year              = Q.[Question_Year]
                , Short_wording              = Q.[Short_wording]
                , Notes                      = Q.[Notes]
                , Default_response           = Q.[Default_response]
                , Question_wording_std       = Q.[Question_wording_std]
                , Question_short_wording_std = Q.[Question_short_wording_std]
                , Nation_fk                  = KN.[Nation_fk]
                , link_fk                    = KN.[Nation_answer_pk]
            FROM      [forum].[dbo].[Pew_Answer]            A                                 -- DB name
                ,     [forum].[dbo].[Pew_Question]          Q                                 -- DB name
                ,     [forum].[dbo].[Pew_Nation_Answer]     KN                                -- DB name
          WHERE Q.[Question_pk] =  A.[Question_fk]
            AND A.[Answer_pk]   = KN.[Answer_fk]
            AND Q.[Question_abbreviation_std]     LIKE 'GRX_23_a'
          ) TT
          /****************************************************************************************************/
          join
          /****************************************************************************************************/
          (
          SELECT 
                  level                      = 'Ctry'
                , Answer_fk                  = A.[Answer_pk]
                , Answer_value               = A.[Answer_value]
                , Answer_wording             = A.[Answer_wording]
                , answer_wording_std         = A.[answer_wording_std]
                , Question_fk                = Q.[Question_pk]
                , Question_abbreviation_std  = Q.[Question_abbreviation_std]
                , Question_abbreviation      = Q.[Question_abbreviation]
                , Question_wording           = Q.[Question_wording]
                , Data_source_fk             = Q.[Data_source_fk]
                , Question_Year              = Q.[Question_Year]
                , Short_wording              = Q.[Short_wording]
                , Notes                      = Q.[Notes]
                , Default_response           = Q.[Default_response]
                , Question_wording_std       = Q.[Question_wording_std]
                , Question_short_wording_std = Q.[Question_short_wording_std]
                , Nation_fk                  = KN.[Nation_fk]
                , link_fk                    = KN.[Nation_answer_pk]
            FROM      [forum].[dbo].[Pew_Answer]            A                                 -- DB name
                ,     [forum].[dbo].[Pew_Question]          Q                                 -- DB name
                ,     [forum].[dbo].[Pew_Nation_Answer]     KN                                -- DB name
          WHERE Q.[Question_pk] =  A.[Question_fk]
            AND A.[Answer_pk]   = KN.[Answer_fk]
            AND Q.[Question_abbreviation_std] LIKE 'GRX_23'
            AND A.Answer_value                = 1

          ) VV
          /****************************************************************************************************/
          ON 
                  VV.Nation_fk
                = TT.Nation_fk
          AND
                  VV.Question_Year
                = TT.Question_Year
          AND
                            VV.Question_abbreviation_std
                = SUBSTRING(TT.Question_abbreviation_std,1, 6)
       ) AS toolT
ON
           mydbt.Answer_pk
       =   toolT.Answer_pk

/*********************************************************************************************************/

-- GRX_23_a & GRX_23_a
-- Step 02
-- drop answers (text-answer & value answer)

DELETE FROM 
--select*from
                 [forum].[dbo].[Pew_answer]                                                   -- DB name
WHERE
                 [forum].[dbo].[Pew_answer].[Answer_pk] IN                                    -- DB name
                                                           (
                                                               3573   -- Answer_value is -1, no wording
                                                             , 3458	  -- Answer_value is  1, values attached to text answers
                                                                     )

/*********************************************************************************************************/

-- GRX_23_a & GRX_23_a
-- Step 03
-- drop 198 rows from nation-asnwer linking table where
-- answers have been deleted & links are not needed any more

DELETE FROM 
--select*from
                 [forum].[dbo].[Pew_Nation_Answer]                                            -- DB name
WHERE
                 [forum].[dbo].[Pew_Nation_Answer].[Answer_fk] IN                                    -- DB name
                                                           (
                                                               3573   -- Answer_value is -1, no wording
                                                             , 3458	  -- Answer_value is  1, values attached to text answers
                                                                     )


/*********************************************************************************************************/
/*********************************************************************************************************/

-- GRI_16_01 & SHI_04_x01
-- Step 01
-- attach answer values & standard wording for no-zero values
-- (country level)

UPDATE
                [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
                [forum].[dbo].[Pew_Answer].[Answer_value]       = 1                           -- DB name
     ,
                [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'One or more groups'        -- DB name
FROM
--select distinct * from
                [forum].[dbo].[Pew_Answer]   AS mydbt                                         -- DB name
 JOIN
       (
          SELECT 
                  level                      = 'Ctry'
                , Answer_pk                  = A.[Answer_pk]
                , Answer_value               = A.[Answer_value]
                , Answer_wording             = A.[Answer_wording]
                , answer_wording_std         = A.[answer_wording_std]
                , Question_fk                = Q.[Question_pk]
                , Question_abbreviation_std  = Q.[Question_abbreviation_std]
                , Question_abbreviation      = Q.[Question_abbreviation]
                , Question_wording           = Q.[Question_wording]
                , Data_source_fk             = Q.[Data_source_fk]
                , Question_Year              = Q.[Question_Year]
                , Short_wording              = Q.[Short_wording]
                , Notes                      = Q.[Notes]
                , Default_response           = Q.[Default_response]
                , Question_wording_std       = Q.[Question_wording_std]
                , Question_short_wording_std = Q.[Question_short_wording_std]
                --, Nation_fk                  = KN.[Nation_fk]
                --, link_fk                    = KN.[Nation_answer_pk]
            FROM      [forum].[dbo].[Pew_Answer]            A                                 -- DB name
                ,     [forum].[dbo].[Pew_Question]          Q                                 -- DB name
                ,     [forum].[dbo].[Pew_Nation_Answer]     KN                                -- DB name
          WHERE Q.[Question_pk] =  A.[Question_fk]
            AND A.[Answer_pk]   = KN.[Answer_fk]
            AND Q.[Question_abbreviation_std] IN ( 'GRI_16_01', 'SHI_04_x01' )
            AND A.[Answer_wording] != ''
       ) AS toolT
ON
           mydbt.Answer_pk
       =   toolT.Answer_pk

/*********************************************************************************************************/
/*********************************************************************************************************/

-- GRI_16_01 & SHI_04_x01
-- Step 01
-- attach answer values & standard wording for no-zero values
-- (country level)

UPDATE
                [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
                [forum].[dbo].[Pew_Answer].[Answer_value]       = 0                           -- DB name
     ,
                [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'No groups'                 -- DB name
FROM
--select distinct * from
                [forum].[dbo].[Pew_Answer]   AS mydbt                                         -- DB name
 JOIN
       (
          SELECT 
                  level                      = 'Ctry'
                , Answer_pk                  = A.[Answer_pk]
                , Answer_value               = A.[Answer_value]
                , Answer_wording             = A.[Answer_wording]
                , answer_wording_std         = A.[answer_wording_std]
                , Question_fk                = Q.[Question_pk]
                , Question_abbreviation_std  = Q.[Question_abbreviation_std]
                , Question_abbreviation      = Q.[Question_abbreviation]
                , Question_wording           = Q.[Question_wording]
                , Data_source_fk             = Q.[Data_source_fk]
                , Question_Year              = Q.[Question_Year]
                , Short_wording              = Q.[Short_wording]
                , Notes                      = Q.[Notes]
                , Default_response           = Q.[Default_response]
                , Question_wording_std       = Q.[Question_wording_std]
                , Question_short_wording_std = Q.[Question_short_wording_std]
                --, Nation_fk                  = KN.[Nation_fk]
                --, link_fk                    = KN.[Nation_answer_pk]
            FROM      [forum].[dbo].[Pew_Answer]            A                                 -- DB name
                ,     [forum].[dbo].[Pew_Question]          Q                                 -- DB name
                ,     [forum].[dbo].[Pew_Nation_Answer]     KN                                -- DB name
          WHERE Q.[Question_pk] =  A.[Question_fk]
            AND A.[Answer_pk]   = KN.[Answer_fk]
            AND Q.[Question_abbreviation_std] IN ( 'GRI_16_01', 'SHI_04_x01' )
            AND A.[Answer_wording] = ''
       ) AS toolT
ON
           mydbt.Answer_pk
       =   toolT.Answer_pk

/*********************************************************************************************************/