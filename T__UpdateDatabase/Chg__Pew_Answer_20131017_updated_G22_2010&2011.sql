/**************************************************************************************************************************/
/*****                                            BackUp  current Tables                                              *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE                          --  declare variable
          @TofI                    --  variable name
                   varchar(50)     --  data type of the variable
SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
   DECLARE                                -- declare the cursor
              MyCursor                    -- cursor name
                             CURSOR FOR   -- as a cursor to take values from
                 SELECT   
/*------------------------------------------------------------------------------------------------------------------------*/
                        'Pew_Answer_2013_09_25'
           UNION SELECT 'Pew_Nation_Answer_2013_09_25'
-- actually used from the backup:
--  'Pew_Answer_2013_09_25'
--  'Pew_Nation_Answer_2013_09_25'

/*------------------------------------------------------------------------------------------------------------------------*/
   OPEN                                   -- open
              MyCursor                    -- cursor name
	FETCH NEXT                               -- retrieve the next row
          FROM                               -- from cursor
                 MyCursor                    -- cursor name
          INTO                               -- store it into the variable(s)
                 @TofI                       --  variable name
			 WHILE  @@FETCH_STATUS = 0
					BEGIN
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[' + @TofI + @CrDt + ']
                FROM      [forum].[dbo].[' + @TofI         + ']' )
/*------------------------------------------------------------------------------------------------------------------------*/
	FETCH NEXT                               -- retrieve the next row
          FROM                               -- from cursor
                 MyCursor                    -- cursor name
          INTO                               -- store it into the variable(s)
                 @TofI                       --  variable name
					END
   CLOSE                                  -- close
              MyCursor                    -- cursor name
DEALLOCATE                                -- remove reference and relase from memory
              MyCursor                    -- cursor name
/**************************************************************************************************************************/
/***                   ****************************************************************************************************/
/***  run step by step ****************************************************************************************************/
/***                   ****************************************************************************************************/
/**************************************************************************************************************************/
-- CHECK CURRENT 32 ANSWERS
SELECT 
       [Question_abbreviation_std]
      ,[Question_short_wording_std]
      ,[Answer_pk]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
  FROM [forum].[dbo].[Pew_Question]
     , [forum].[dbo].[Pew_Answer]
where 
       [Question_pk]
     = [Question_fk]
and
       [Question_Year]
       in (
              2010
            , 2011   )
and
       [Question_abbreviation_std]
       in (
            'GRX_22_01'
           ,'GRX_22_02'
           ,'GRX_22_03'
           ,'GRX_22_04'
                        )
-- CHECK CURRENT 1,584 ANSWERS by COUNTRY
SELECT [Nation_answer_pk]
      ,[Nation_fk]
      ,[Answer_pk]
      ,[display]
      ,[Question_abbreviation_std]
      ,[Question_short_wording_std]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
  FROM [forum].[dbo].[Pew_Question]
     , [forum].[dbo].[Pew_Answer]
     , [forum].[dbo].[Pew_Nation_Answer]
where 
       [Question_pk]
     = [Question_fk]
and
       [Answer_pk]
     = [Answer_fk]
and
       [Question_Year]
       in (
              2010
            , 2011   )
and
       [Question_abbreviation_std]
       in (
            'GRX_22_01'
           ,'GRX_22_02'
           ,'GRX_22_03'
           ,'GRX_22_04'
                        )
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/
-- >DELETE< CURRENT 1,584 ANSWERS by COUNTRY
DELETE
                 [forum].[dbo].[Pew_Nation_Answer]                                            -- DB name
FROM
--SELECT * FROM                                                                               -- (Only selected data)
                 [forum].[dbo].[Pew_Nation_Answer]                                            -- DB name
JOIN
                 [forum].[dbo].[Pew_Answer]                     A                             -- joined DB name
ON
                 [forum].[dbo].[Pew_Nation_Answer].[Answer_fk]
          =                                      A.[Answer_pk]
JOIN
                 [forum].[dbo].[Pew_Question]                   Q                             -- joined DB name
ON
                                                 Q.[Question_pk]
          =                                      A.[Question_fk]
WHERE
       [Question_Year]
       in (
              2010
            , 2011
                     )
AND
       [Question_abbreviation_std]
       in (
            'GRX_22_01'
           ,'GRX_22_02'
           ,'GRX_22_03'
           ,'GRX_22_04'
                        )
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/
-- >DELETE< CURRENT 32 ANSWERS
DELETE
                 [forum].[dbo].[Pew_Answer]                                                   -- DB name
FROM
--SELECT * FROM                                                                               -- (Only selected data)
                 [forum].[dbo].[Pew_Answer]                                                   -- DB name
JOIN
                 [forum].[dbo].[Pew_Question]                   Q                             -- joined DB name
ON
                 [forum].[dbo].[Pew_Answer].[Question_fk]
          =                               Q.[Question_pk]
WHERE
       [Question_Year]
       in (
              2010
            , 2011
                     )
AND
       [Question_abbreviation_std]
       in (
            'GRX_22_01'
           ,'GRX_22_02'
           ,'GRX_22_03'
           ,'GRX_22_04'
                        )
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/
-- > C R E A T E < temporary table including 406 distinct ANSWERS and 1584 Country/Answers
SELECT 
/*------------------------------------------------------------------------------------------------------------------------*/
          Nation_answer_pk    = ROW_NUMBER()
                                OVER(ORDER BY      
                                                     U.[Question_year]
                                                ,    K.[Question_fk]
                                                ,    U.[Nation_fk]        ) 
                                + (SELECT DISTINCT MAX([Nation_answer_pk])
                                   FROM  [forum].[dbo].[Pew_Nation_Answer])
      ,U.Nation_fk
      ,  [Answer_fk]          = K.[Answer_pk]
      ,  [Display] = 0
/*------------------------------------------------------------------------------------------------------------------------*/
      ,K.[Answer_pk]
      ,K.[Question_fk]
      ,K.[Answer_value]
      ,K.[Answer_wording]
      ,K.[Answer_wording_std]
/*------------------------------------------------------------------------------------------------------------------------*/
      ,U.[Ctry_EditorialName]
      ,K.[Question_abbreviation_std]
      ,K.[Question_year]
/*------------------------------------------------------------------------------------------------------------------------*/
INTO
     #CTRYANS
/*------------------------------------------------------------------------------------------------------------------------*/
FROM
/*------------------------------------------------------------------------------------------------------------------------*/
       [GRSHR].[dbo].[uVL]              U
FULL OUTER JOIN
(
SELECT                                                                                        -- Query to select data
/*------------------------------------------------------------------------------------------------------------------------*/
       [Answer_pk]            = ROW_NUMBER()
                                   OVER(ORDER BY   
                                                  [Question_year]
                                                , [Question_abbreviation_std]
                                                , [Answer_value]               ) 
                                + (SELECT DISTINCT MAX(Answer_pk)
                                   FROM [forum].[dbo].[Pew_Answer])
      ,[Question_fk]
      ,[Answer_value]
      ,[Answer_wording]
      ,[Answer_wording_std]
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_abbreviation_std]
      ,[Question_year]
/*------------------------------------------------------------------------------------------------------------------------*/
FROM
(
SELECT
       DISTINCT
         [Question_fk]               =    Q.[Question_pk]
      ,U.[Question_abbreviation_std]
      ,U.[Question_year]
      ,U.[Answer_value]
      ,U.[Answer_wording]
      ,U.[Answer_wording_std]
  FROM
       [GRSHR].[dbo].[uVL]              U
  JOIN
       [forum].[dbo].[Pew_Question]     Q
    ON
         Q.[Question_abbreviation_std]
       = U.[Question_abbreviation_std]
   AND
         Q.[Question_Year]
       = U.[Question_Year]
) AS UPDATED
) AS K  -- answer pk coded
    ON
            K.[Question_abbreviation_std]
       =    U.[Question_abbreviation_std]
   AND
            K.[Question_year]
       =    U.[Question_year]
   AND
            K.[Answer_value]
       =    U.[Answer_value]
   AND 
            K.[Answer_wording]
       =    U.[Answer_wording]
-- where K.Question_Year IS NULL OR Ctry_EditorialName IS NULL
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- > C R E A T E < UPDATED 1,584 ANSWERS by COUNTRY
INSERT INTO
                 [forum].[dbo].[Pew_Nation_Answer]                                            -- DB name
SELECT                                                                                        -- Query to select data
       [Nation_answer_pk]
      ,[Nation_fk]
      ,[Answer_fk]
      ,[display]
  FROM
     #CTRYANS
/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- > C R E A T E < UPDATED 406 ANSWERS
INSERT INTO
                 [forum].[dbo].[Pew_Answer]                                                   -- DB name
SELECT                                                                                        -- Query to select data
       DISTINCT
       [Answer_pk]
      ,[Answer_value]
      ,[Question_fk]
      ,[Answer_wording]
      ,[answer_wording_std]
  FROM
     #CTRYANS
/**************************************************************************************************************************/
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/
-- CHECK CURRENTLY UPDATED 406 ANSWERS
SELECT 
       *
  FROM [forum].[dbo].[Pew_Question]
     , [forum].[dbo].[Pew_Answer]
where 
       [Question_pk]
     = [Question_fk]
and
       [Question_Year]
       in (
              2010
            , 2011   )
and
       [Question_abbreviation_std]
       in (
            'GRX_22_01'
           ,'GRX_22_02'
           ,'GRX_22_03'
           ,'GRX_22_04'
                        )
/*------------------------------------------------------------------------------------------------------------------------*/
-- CHECK CURRENTLY UPDATED 1,584 ANSWERS by COUNTRY
SELECT *
  FROM [forum].[dbo].[Pew_Question]
     , [forum].[dbo].[Pew_Answer]
     , [forum].[dbo].[Pew_Nation_Answer]
where 
       [Question_pk]
     = [Question_fk]
and
       [Answer_pk]
     = [Answer_fk]
and
       [Question_Year]
       in (
              2010
            , 2011   )
and
       [Question_abbreviation_std]
       in (
            'GRX_22_01'
           ,'GRX_22_02'
           ,'GRX_22_03'
           ,'GRX_22_04'
                        )
/**************************************************************************************************************************/
/**************************************************************************************************************************/
