








/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***         2. Code to load coded data into the database                                                                               ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
/***         2.1     BACKUP                                                                                                                             ***/
/***************************************************************************************************************************************************************/
  DECLARE  @CrDt    varchar( 8)
  DECLARE  @TofI    varchar(50)
  SET      @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
  DECLARE  MyCursor
  CURSOR FOR      SELECT 'Pew_Answer_NoStd'
            UNION SELECT 'Pew_Locality_Answer'
            UNION SELECT 'Pew_Nation_Answer'
            UNION SELECT 'Pew_Nation_Religion_Answer'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
   OPEN    MyCursor
	FETCH  NEXT
	FROM   MyCursor
	INTO   @TofI
	WHILE  @@FETCH_STATUS = 0
	BEGIN
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--           EXEC ( ' SELECT *
--                    INTO   [_bk_forum].[dbo].[' + @TofI + ']
--                    FROM       [forum].[dbo].[' + @TofI + ']' )
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	FETCH  NEXT
	FROM   MyCursor
	INTO   @TofI
    END
    CLOSE  MyCursor
DEALLOCATE MyCursor
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***         2.2         [Pew_Answer_NoStd]                                                                                                                      ***/
/***************************************************************************************************************************************************************/
--	INSERT INTO [forum]..[Pew_Answer_NoStd]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT
           DISTINCT
           [Answer_pk]
         , [Answer_value_NoStd]
         , [Answer_Wording]
         , [Answer_Std_fk]
         , [Question_fk]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
FROM   [#NLongCodedData]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
/***         2.3         [Pew_Nation_Answer]                                                                                                                   ***/
/***************************************************************************************************************************************************************/
--	INSERT INTO [forum]..[Pew_Nation_Answer]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT
/*--  >  Fields for PNA from the former coding-period ---------------------------------------------------------------------------------------------------------*/
       [Nation_answer_pk]    = ROW_NUMBER()
                                       OVER
                                  (ORDER BY   [Nation_fk]
                                            , [QA_Std]              )
                              +   (SELECT MAX([Nation_answer_pk]    )
                                FROM [forum]..[Pew_Nation_Answer]   )
      ,[Nation_fk]
      ,[Answer_fk]           = [Answer_pk]
      ,[display]
/*--  <  Fields for PNA from the former coding-period ---------------------------------------------------------------------------------------------------------*/
FROM   [#NLongCodedData]
WHERE  [entity]              = 'C'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
/***         2.4         [Pew_Locality_Answer]                                                                                                                   ***/
/***************************************************************************************************************************************************************/
--	INSERT INTO [forum]..[Pew_Locality_Answer]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT
/*--  >  Fields for PLA from the former coding-period ---------------------------------------------------------------------------------------------------------*/
       [Locality_answer_pk]  = ROW_NUMBER()
                                       OVER
                                  (ORDER BY   [Nation_fk]
                                            , [QA_Std]              )
                              +   (SELECT MAX([Locality_answer_pk])
                                FROM [forum]..[Pew_Locality_Answer] )
      ,[Locality_fk]
      ,[Answer_fk]           = [Answer_pk]
      ,[display]
/*--  <  Fields for PLA from the former coding-period ---------------------------------------------------------------------------------------------------------*/
FROM   [#NLongCodedData]
WHERE  [entity]              = 'L'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
/***         2.5         [Pew_Nation_Religion_Answer]                                                                                                            ***/
/***************************************************************************************************************************************************************/
--	INSERT INTO [forum]..[Pew_Nation_Religion_Answer]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT
/*--  >  Fields for PNRA from the former coding-period --------------------------------------------------------------------------------------------------------*/
       [Nation_religion_answer_pk] = ROW_NUMBER()
                                             OVER
                                        (ORDER BY   [Nation_fk]
                                                  , [QA_Std]                      )
                                    +   (SELECT MAX([Nation_religion_answer_pk])
                                      FROM [forum]..[Pew_Nation_Religion_Answer]  )  

      ,[Nation_fk]
      ,[Religion_group_fk]   = [Religion_fk]
      ,[Answer_fk]           = [Answer_pk]
      ,[display]
/*--  <  Fields for PLA from the former coding-period ---------------------------------------------------------------------------------------------------------*/
FROM   [#NLongCodedData]
WHERE  [entity]              = 'R'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
--		C   21,369
--		L    3,762
--		R    8,910
--          34,041
/***************************************************************************************************************************************************************/
