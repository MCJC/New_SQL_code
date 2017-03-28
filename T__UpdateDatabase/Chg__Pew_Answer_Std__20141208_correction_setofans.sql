/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/*****                                          BackUp updated >source Table                                          *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Answer_Std]'               )
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
-- correct set of answers
/*------------------------------------------------------------------------------------------------------------------------*/
USE [forum]
GO
/**************************************************************************************************************************/
UPDATE
           [forum].[dbo].[Pew_Answer_Std]
SET
           [forum].[dbo].[Pew_Answer_Std].[Full_set_of_Answers]
       =                            clone.[A]
--select *
FROM
           [forum].[dbo].[Pew_Answer_Std]                                   AS mydbt
 JOIN
      ( SELECT
               [AnswerSet_number]
              ,[A] = STUFF(
                           ( SELECT '   ||'
                                  + STR(S2.[Answer_value_std], 7,2 ) 
                                  + ': ' 
                                  +        [Answer_Wording_std]
                              FROM         [Pew_Answer_Std]          S2
                             WHERE      S1.[AnswerSet_number]
                                      = S2.[AnswerSet_number]
                          ORDER BY      S1.[AnswerSet_number] 
                          FOR XML PATH('') ), 1, 8, '')
          FROM [Pew_Answer_Std]                                      S1
          GROUP
            BY [AnswerSet_number]                                         ) AS clone
ON
           mydbt.[AnswerSet_number]
       =   clone.[AnswerSet_number]
WHERE      mydbt.[AnswerSet_number] NOT IN (   51, 53, 65, 67,   ---- to be checked
                                                1,               ---- religion
                                              169,               ---- age in years
                                              170,               ---- children
                                              999999             ---- continous count
                                                                      )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT 
       *
  FROM
           [forum].[dbo].[Pew_Answer_Std]
/**************************************************************************************************************************/




