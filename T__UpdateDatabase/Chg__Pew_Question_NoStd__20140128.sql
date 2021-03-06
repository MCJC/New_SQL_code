/*********************************************************************************************************/
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
                        'Pew_Question_NoStd'
/*------------------------------------------------------------------------------------------------------------------------*/
   OPEN                                      -- open
              MyCursor                       -- cursor name
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
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Notes]
         =  'January - December 2011'
WHERE
           [forum].[dbo].[Pew_Question_NoStd].[Question_Year]           = 2011
/*********************************************************************************************************/
-- check results
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
        --distinct
        substring([Question_abbreviation],1,3)
      ,           [Question_Year]
      ,           [Notes]
     
  FROM [forum].[dbo].[Pew_Question_NoStd]
WHERE
  Question_Year = 2011
--"Notes
--January - December 2012"
/*********************************************************************************************************/

