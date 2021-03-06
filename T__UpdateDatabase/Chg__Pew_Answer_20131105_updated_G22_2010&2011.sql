/**************************************************************************************************************************/
/*****                                           BackUp  current Table(s)                                             *****/
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
                        'Pew_Nation_Answer'
           UNION SELECT 'Pew_Answer'
-- formerly used from the backup:
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
                INTO  [_bk_forum].[dbo].[' + @TofI + '_' + @CrDt + ']
                FROM      [forum].[dbo].[' + @TofI               + ']' )
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
/***                                                 **********************************************************************/
/***  run step by step >>  STEP 1: IDENTIFY CHANGES  **********************************************************************/
/***                                                 **********************************************************************/
/**************************************************************************************************************************/
-- CHECK differences between answers (CURRENT vs UPDATED):
/**************************************************************************************************************************/
IF OBJECT_ID('tempdb..#List_of_Changes') IS NOT NULL
DROP TABLE            #List_of_Changes
GO
/*** Set of data at country level ***********************************************************************************/
/* > CURRENT set of questions&answers by country -------------------------------------------------------------------*/
SELECT
          [status]                         = 
                                             CASE
                                                  WHEN A.[Answer_value]
                                                     = U.[Answer_value]
                                                   AND A.[answer_wording]
                                                     = U.[answer_wording]
                                                   AND A.[answer_wording_std]
                                                     = U.[answer_wording_std]
                                                   AND X.[Nation_answer_pk]
                                                     = Y.[Nation_answer_pk]
                                                                              THEN 'no change'
                                                  WHEN A.[Answer_value]
                                                     = U.[Answer_value]
                                                   AND A.[answer_wording]
                                                    != U.[answer_wording]
                                                   AND A.[answer_wording_std]
                                                     = U.[answer_wording_std]
                                                                              THEN 'just detailed wording changed'
                                                  WHEN A.[Answer_value]
                                                    != U.[Answer_value]
                                                   AND aA.[Answer_pk]
                                                       IS NOT NULL
                                                                              THEN 'value changed BUT answer already exists'
                                                  WHEN A.[Answer_value]
                                                    != U.[Answer_value]
                                                   AND aA.[Answer_pk]
                                                       IS NULL
                                                                              THEN 'value changed and answer does not exist'
                                              END
      , N.[Ctry_EditorialName]
      ,    Nation_fk                       = N.[Nation_pk]
      ,    Question_fk                     = Q.[Question_pk]
      ,    curr_Nation_answer_pk           = X.[Nation_answer_pk]
      ,    updt_Nation_answer_pk           = Y.[Nation_answer_pk]
      ,    curr_Answer_fk                  = A.[Answer_pk]
      ,    updt_Answer_fk                  =aA.[Answer_pk]
      , Q.[Question_Year]
      , Q.[Question_abbreviation_std]
      , Q.[Question_short_wording_std]
      ,    curr_Answer_value               = A.[Answer_value]
      ,    curr_Answer_wording             = A.[answer_wording]
      ,    curr_Answer_wording_std         = A.[answer_wording_std]
      ,    updt_Answer_value               = U.[Answer_value]
      ,    updt_Answer_wording             = U.[answer_wording]
      ,    updt_Answer_wording_std         = U.[answer_wording_std]
/*------------------------------------------------------------------------------------------------------------------*/
INTO
        #List_of_Changes
/*------------------------------------------------------------------------------------------------------------------*/
  FROM
       [forum].[dbo].[Pew_Nation_Answer]     X
JOIN
       [forum].[dbo].[Pew_Nation]            N
    ON
          N.[Nation_pk]
       =  X.[Nation_fk]
JOIN
       [forum].[dbo].[Pew_Answer]            A
    ON
          A.[Answer_pk]
       =  X.[Answer_fk]
JOIN
       [forum].[dbo].[Pew_Question]          Q
    ON
          Q.[Question_pk]
       =  A.[Question_fk]
JOIN                                            -- this join as a filter
       [GRSHR].[dbo].[uVL]                   f
    ON
          f.[Nation_fk]
       =  N.[Nation_pk]
   AND
         f.[Question_abbreviation_std]
       = Q.[Question_abbreviation_std]
   AND
         f.[Question_Year]
       = Q.[Question_Year]
/* < CURRENT set of questions&answers by country *-----------------------------------------------------------------------*/
FULL JOIN                                       -- this join for data
       [GRSHR].[dbo].[uVL]                   U  -- all data
    ON
          U.[Nation_fk]
       =  N.[Nation_pk]
   AND
          U.[Question_abbreviation_std]
       =  Q.[Question_abbreviation_std]
   AND
          U.[Question_Year]
       =  Q.[Question_Year]
  JOIN
       [forum].[dbo].[Pew_Question]      aQ
    ON
         aQ.[Question_abbreviation_std]
       =  U.[Question_abbreviation_std]
   AND
         aQ.[Question_Year]
       =  U.[Question_Year]
LEFT OUTER JOIN
       [forum].[dbo].[Pew_Answer]         aA
    ON
         aA.[Question_fk]
       = aQ.[Question_pk]
   AND
         aA.[Answer_value]
       =  U.[Answer_value]
   AND
         aA.[Answer_wording]
       =  U.[answer_wording]
   AND
         aA.[Answer_wording_std]
       =  U.[answer_wording_std]
LEFT JOIN
       [forum].[dbo].[Pew_Nation_Answer]     Y
    ON
          Y.[Nation_fk]
       =  U.[Nation_fk]
   AND
          Y.[Answer_fk]
       = aA.[Answer_pk]
WHERE
          A.[Answer_value]
      !=  U.[Answer_value]
   OR     A.[answer_wording]
      !=  U.[answer_wording]
   OR     A.[answer_wording_std]
      !=  U.[answer_wording_std]
   OR     X.[Nation_answer_pk]
      !=  Y.[Nation_answer_pk]
/**************************************************************************************************************************/
SELECT
          *
FROM
          #List_of_Changes
ORDER BY
         [status],
          Ctry_EditorialName
        , Question_abbreviation_std
        , Question_Year
/**************************************************************************************************************************/
/***                                            ***************************************************************************/
/***  run step by step >>  STEP 2: ADD ANSWERS  ***************************************************************************/
/***                                            ***************************************************************************/
/**************************************************************************************************************************/
INSERT INTO
                 [forum].[dbo].[Pew_Answer]                                                   -- DB name
SELECT                                                                                        -- Query to select data
       [Answer_pk]            = ROW_NUMBER()
                                OVER(ORDER BY
											  [Question_Year]
                                             ,[Nation_fk]
                                             ,[Question_abbreviation_std]  ) 
                                +
                                 (SELECT
                                         MAX([Answer_pk])
                                    FROM
                                         [forum].[dbo].[Pew_Answer]        )
      ,[Answer_value]         = [updt_Answer_value]
      ,[Question_fk]          = [Question_fk]
      ,[Answer_wording]       = [updt_Answer_wording]
      ,[answer_wording_std]   = [updt_Answer_wording_std]
  FROM
          #List_of_Changes
WHERE
       [status] = 'value changed and answer does not exist'
GO
/**************************************************************************************************************************/
/***                                                 **********************************************************************/
/***  run step by step >>  STEP 3: UPDATE WORDING    **********************************************************************/
/***                                                 **********************************************************************/
/**************************************************************************************************************************/
UPDATE
       [forum].[dbo].[Pew_Answer]
SET
       [forum].[dbo].[Pew_Answer].[Answer_Wording]
     =                          U.[updt_Answer_Wording]
FROM
       [forum].[dbo].[Pew_Answer]   C
       INNER JOIN
		(  SELECT *
		     FROM #List_of_Changes
		   WHERE  [status] LIKE 'just detailed word%' )   U
ON
          C.Answer_pk
        = U.curr_Answer_fk
/**************************************************************************************************************************/
/***                                                 **********************************************************************/
/***  run step by step >>  STEP 4: NEW ANSWER-LINKS  **********************************************************************/
/***                                                 **********************************************************************/
/**************************************************************************************************************************/
UPDATE
       [forum].[dbo].[Pew_Nation_Answer]
SET
       [forum].[dbo].[Pew_Nation_Answer].[Answer_fk]
     =                                 U.[Answer_fk]
FROM
       [forum].[dbo].[Pew_Nation_Answer]   C
       INNER JOIN
       (
         SELECT
		            [curr_Nation_answer_pk]
		         ,  [Answer_fk]          = [Answer_pk]
		         ,  [curr_Answer_fk]
		         ,  [updt_Answer_fk]
		         ,  [status]
			FROM
		(  SELECT *
		     FROM #List_of_Changes
		   WHERE  [status] LIKE 'value changed%' ) L
		LEFT OUTER JOIN
		       [forum].[dbo].[Pew_Answer]          A
		    ON
		         A.[Question_fk]
		       = L.[Question_fk]
		   AND
		           [Answer_value]
		       =   [updt_Answer_value]
		   AND
		           [Answer_wording]
		       =   [updt_Answer_wording]
		   AND
		           [Answer_wording_std]
		       =   [updt_Answer_wording_std]
                                                      )   U
ON
          C.Nation_answer_pk
        = U.curr_Nation_answer_pk
/**************************************************************************************************************************/
/***                                                    *******************************************************************/
/***  run step by step >>  STEP 5: DROP UNUSED ANSWERS  *******************************************************************/
/***                                                    *******************************************************************/
/**************************************************************************************************************************/
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
LEFT OUTER JOIN
                 [forum].[dbo].[Pew_Nation_Answer]              X                             -- joined DB name
ON
                 [forum].[dbo].[Pew_Answer].[Answer_pk]
          =                               X.[Answer_fk]
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
AND
       [Nation_answer_pk]
       IS NULL
/**************************************************************************************************************************/
/***                                              *************************************************************************/
/***  run step by step >>  STEP 6: CHECK UPDATES  *************************************************************************/
/***                                              *************************************************************************/
/**************************************************************************************************************************/
-- CHECK differences between answers (CURRENT vs UPDATED):
/**************************************************************************************************************************/
IF OBJECT_ID('tempdb..#List_of_Changes') IS NOT NULL
DROP TABLE            #List_of_Changes
GO
/*** Set of data at country level ***********************************************************************************/
/* > CURRENT set of questions&answers by country -------------------------------------------------------------------*/
/**************************************************************************************************************************/
/**************************************************************************************************************************/
SELECT
          [status]                         = 
                                             CASE
                                                  WHEN A.[Answer_value]
                                                     = U.[Answer_value]
                                                   AND A.[answer_wording]
                                                     = U.[answer_wording]
                                                   AND A.[answer_wording_std]
                                                     = U.[answer_wording_std]
                                                   AND X.[Nation_answer_pk]
                                                     = Y.[Nation_answer_pk]
                                                                              THEN 'no change'
                                                  WHEN A.[Answer_value]
                                                     = U.[Answer_value]
                                                   AND A.[answer_wording]
                                                    != U.[answer_wording]
                                                   AND A.[answer_wording_std]
                                                     = U.[answer_wording_std]
                                                                              THEN 'just detailed wording changed'
                                                  WHEN A.[Answer_value]
                                                    != U.[Answer_value]
                                                   AND aA.[Answer_pk]
                                                       IS NOT NULL
                                                                              THEN 'value changed BUT answer already exists'
                                                  WHEN A.[Answer_value]
                                                    != U.[Answer_value]
                                                   AND aA.[Answer_pk]
                                                       IS NULL
                                                                              THEN 'value changed and answer does not exist'
                                              END
      , N.[Ctry_EditorialName]
      ,    Nation_fk                       = N.[Nation_pk]
      ,    Question_fk                     = Q.[Question_pk]
      ,    curr_Nation_answer_pk           = X.[Nation_answer_pk]
      ,    updt_Nation_answer_pk           = Y.[Nation_answer_pk]
      ,    curr_Answer_fk                  = A.[Answer_pk]
      ,    updt_Answer_fk                  =aA.[Answer_pk]
      , Q.[Question_Year]
      , Q.[Question_abbreviation_std]
      , Q.[Question_short_wording_std]
      ,    curr_Answer_value               = A.[Answer_value]
      ,    curr_Answer_wording             = A.[answer_wording]
      ,    curr_Answer_wording_std         = A.[answer_wording_std]
      ,    updt_Answer_value               = U.[Answer_value]
      ,    updt_Answer_wording             = U.[answer_wording]
      ,    updt_Answer_wording_std         = U.[answer_wording_std]
/*------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------*/
  FROM
       [forum].[dbo].[Pew_Nation_Answer]     X
JOIN
       [forum].[dbo].[Pew_Nation]            N
    ON
          N.[Nation_pk]
       =  X.[Nation_fk]
JOIN
       [forum].[dbo].[Pew_Answer]            A
    ON
          A.[Answer_pk]
       =  X.[Answer_fk]
JOIN
       [forum].[dbo].[Pew_Question]          Q
    ON
          Q.[Question_pk]
       =  A.[Question_fk]
JOIN                                            -- this join as a filter
       [GRSHR].[dbo].[uVL]                   f
    ON
          f.[Nation_fk]
       =  N.[Nation_pk]
   AND
         f.[Question_abbreviation_std]
       = Q.[Question_abbreviation_std]
   AND
         f.[Question_Year]
       = Q.[Question_Year]
/* < CURRENT set of questions&answers by country *-----------------------------------------------------------------------*/
FULL JOIN                                       -- this join for data
       [GRSHR].[dbo].[uVL]                   U  -- all data
    ON
          U.[Nation_fk]
       =  N.[Nation_pk]
   AND
          U.[Question_abbreviation_std]
       =  Q.[Question_abbreviation_std]
   AND
          U.[Question_Year]
       =  Q.[Question_Year]
  JOIN
       [forum].[dbo].[Pew_Question]      aQ
    ON
         aQ.[Question_abbreviation_std]
       =  U.[Question_abbreviation_std]
   AND
         aQ.[Question_Year]
       =  U.[Question_Year]
LEFT OUTER JOIN
       [forum].[dbo].[Pew_Answer]         aA
    ON
         aA.[Question_fk]
       = aQ.[Question_pk]
   AND
         aA.[Answer_value]
       =  U.[Answer_value]
   AND
         aA.[Answer_wording]
       =  U.[answer_wording]
   AND
         aA.[Answer_wording_std]
       =  U.[answer_wording_std]
LEFT JOIN
       [forum].[dbo].[Pew_Nation_Answer]     Y
    ON
          Y.[Nation_fk]
       =  U.[Nation_fk]
   AND
          Y.[Answer_fk]
       = aA.[Answer_pk]
WHERE
          A.[Answer_value]
      !=  U.[Answer_value]
   OR     A.[answer_wording]
      !=  U.[answer_wording]
   OR     A.[answer_wording_std]
      !=  U.[answer_wording_std]
   OR     X.[Nation_answer_pk]
      !=  Y.[Nation_answer_pk]
/**************************************************************************************************************************/
/**************************************************************************************************************************/
