/*****************************************************************************************************************************************/
/*****                                                     BackUp  current Table                                                     *****/
/*****************************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE                          --  declare variable
          @TofI                    --  variable name
                   varchar(50)     --  data type of the variable
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Nation_Religion_Answer_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Nation_Religion_Answer]' )
/*****************************************************************************************************************************************/
/*   -- RELIGION CODED WITH WRONG REFERENCE FOR 2010 AND 2011 --   ***********************************************************************/
/*****************************************************************************************************************************************/
	UPDATE
           [forum].[dbo].[Pew_Nation_Religion_Answer]
	SET                                               [Religion_group_fk]  =  223
/*---------------------------------------------------------------------------------------------------------------------------------------*/
--select *
FROM
           [forum].[dbo].[Pew_Nation_Religion_Answer]               AS KR
 INNER
  JOIN
           [forum].[dbo].[Pew_Q&A]                                  AS QA

    ON   QA.[Answer_fk]
       = KR.[Answer_fk]
           WHERE  [Question_abbreviation_std]   IN ('GRI_11_16', 'SHI_01_x_16')
             AND  [Religion_group_fk]            =   15
/*---------------------------------------------------------------------------------------------------------------------------------------*/
-- check results
SELECT 
       DISTINCT
       [Religion_group_fk]
  FROM
           [forum].[dbo].[Pew_Nation_Religion_Answer]               AS KR
 INNER
  JOIN
           [forum].[dbo].[Pew_Q&A]                                  AS QA

    ON   QA.[Answer_fk]
       = KR.[Answer_fk]
           WHERE  [Question_abbreviation_std]   IN ('GRI_11_16', 'SHI_01_x_16')
/*****************************************************************************************************************************************/
