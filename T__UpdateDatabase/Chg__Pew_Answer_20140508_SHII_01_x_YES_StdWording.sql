/**************************************************************************************************************************/
/*****                                           run step by step script                                              *****/
/**************************************************************************************************************************/
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
-- Peter's upadte of the answer to facilitate coders task
-- (we will keep unstd wording as it was coded before 2012)
-- (2012 [Answer_wording] as "No description coded" means standrd version was original coding)
UPDATE
            [forum].[dbo].[Pew_Answer]                                                    -- DB name
SET
            [forum].[dbo].[Pew_Answer].[Answer_wording_std] = 'Yes'
--select *
FROM 
            [forum].[dbo].[Pew_Answer]      PA
INNER JOIN
            [forum].[dbo].[Pew_Question]    PQ
ON
                                              [Question_pk]
                                            = [Question_fk]
WHERE
                                           PQ.[Question_abbreviation_std] LIKE 'SHI_01_x_%'
                                       AND
                                           PA.[Answer_value]                 =  1.00
/**************************************************************************************************************************/
-- TEST
select distinct                                 [Answer_wording_std]
FROM        [forum].[dbo].[Pew_Answer]      PA
INNER JOIN  [forum].[dbo].[Pew_Question]    PQ
ON                                              [Question_pk]
                                              = [Question_fk]
WHERE                                      PQ.[Question_abbreviation_std] LIKE 'SHI_01_x_%'
                                       AND PA.[Answer_value]                 =  1.00
/**************************************************************************************************************************/




---DONE  !!! JCEO 




        