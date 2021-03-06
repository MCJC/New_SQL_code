/***********************************************************************************************************************/
/*****                                          run step by step script                                            *****/
/***********************************************************************************************************************/
/***********************************************************************************************************************/
/***  error identified when creatinf access tool: JC misscoded StdAsnwer      ******************************************/
/***********************************************************************************************************************/
/*****                                           BackUp  current Table(s)                                             *****/
/**************************************************************************************************************************/
USE [forum];
/*------------------------------------------------------------------------------------------------------------------------*/
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
                        'Pew_Answer'
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
/***  run next step >>  UPDATE DATA                  **********************************************************************/
/***                                                 **********************************************************************/
/**************************************************************************************************************************/

-----------------------------------------------------------------------------------------------------------
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'No'
WHERE
            [forum].[dbo].[Pew_answer].[Question_fk]        = 1518
  AND       [forum].[dbo].[Pew_answer].[Answer_value]       = 0
-----------------------------------------------------------------------------------------------------------
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'Yes, in limited ways'
WHERE
            [forum].[dbo].[Pew_answer].[Question_fk]        = 1518
  AND       [forum].[dbo].[Pew_answer].[Answer_value]       = 0.5
-----------------------------------------------------------------------------------------------------------
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'yes, widespread social harassment'
WHERE
            [forum].[dbo].[Pew_answer].[Question_fk]        = 1518
  AND       [forum].[dbo].[Pew_answer].[Answer_value]       = 1

/*********************************************************************************************************/
-----------------------------------------------------------------------------------------------------------
SELECT
       distinct
       [Question_Year]
      ,[Question_pk]
      ,[Question_abbreviation_std]
      ,[Answer_value]
      ,[answer_wording_std]

------------------------------------------------------------------------------------       
  FROM
       [forum].[dbo].[Pew_Question]                                               Q
  JOIN
       [forum].[dbo].[Pew_Answer]                                                 A
------------------------------------------------------------------------------------       
    ON
       [Question_pk]
      =[Question_fk]
WHERE
       [Question_abbreviation_std]
      ='SHI_01_a'
ORDER BY
       [Answer_value]
      ,[Question_Year]
------------------------------------------------------------------------------------       




/*********************************************************************************************************/
/*********************************************************************************************************/
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'Yes, widespread social harassment'
WHERE
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'yes, widespread social harassment'
/*********************************************************************************************************/
SELECT
       distinct
       [Question_Year]
      ,[Question_pk]
      ,[Question_abbreviation_std]
      ,[Answer_value]
      ,[answer_wording_std]
  FROM [forum].[dbo].[Pew_Question]                                               Q
  JOIN [forum].[dbo].[Pew_Answer]                                                 A
------------------------------------------------------------------------------------       
    ON [Question_pk]
      =[Question_fk]
WHERE  [Answer_wording_std] = 'yes, widespread social harassment'
ORDER BY
       [Answer_value]
      ,[Question_Year]
------------------------------------------------------------------------------------       


---DONE  !!! JCEO 




        