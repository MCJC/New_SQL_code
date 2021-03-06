/*********************************************************************************************************/
/**************************************************************************************************************************/
/*****                                           BackUp  current Table(s)                                             *****/
/**************************************************************************************************************************/
----------------------------------------------------------------------------------------------------------------------------
USE              [forum]
GO
----------------------------------------------------------------------------------------------------------------------------
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_Std_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_Std]'               )
/**************************************************************************************************************************/
-- add four questions: 
INSERT
INTO
           [forum].[dbo].[Pew_Question_Std]
                                           (  
                                             [Question_Std_pk]
                                            ,[Question_abbreviation_std]
                                            ,[Question_wording_std]
                                            ,[Question_short_wording_std]
                                            ,[Display]
                                                                           )
/*------------------------------------------------------------------------------------------------------------------------*/
  VALUES
  ( (SELECT MAX([Question_Std_pk]) FROM [Pew_Question_Std])+ 1,
     'GRX_30',
     'Is there a police force that enforces religious norms?',
     'Is there a police force that enforces religious norms?',
     0                                                                                             ),
  ( (SELECT MAX([Question_Std_pk]) FROM [Pew_Question_Std])+ 2,
     'GRX_31',
     'Does the government restrict the ability of individuals to profess or act upon '
    +'beliefs that are atheistic, agnostic, or reject organized religion?',
     'Does the government restrict the ability of individuals to profess or act upon '
    +'beliefs that are atheistic, agnostic, or reject organized religion?',
     0                                                                                             ),
  ( (SELECT MAX([Question_Std_pk]) FROM [Pew_Question_Std])+ 3,
     'GRX_32',
     'Was there any government harassment of individuals because they did not adhere to a '
    +'religious tradition or did not participate in religious activities?',
     'Was there any government harassment of individuals because they did not adhere to a '
    +'religious tradition or did not participate in religious activities?',
     0                                                                                             ),
  ( (SELECT MAX([Question_Std_pk]) FROM [Pew_Question_Std])+ 4,
     'GRX_33',
     'Does the government have any policies or laws criminalizing homosexual behavior or '
    +'discriminating against individuals based on gender identity or sexual orientation?',
     'Does the government have any policies or laws criminalizing homosexual behavior or '
    +'discriminating against individuals based on gender identity or sexual orientation?',
     0                                                                                             )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/**************************************************************************************************************************/
-- check results
SELECT *
  FROM [forum].[dbo].[Pew_Question_Std]
ORDER BY
       [Question_Std_pk]             DESC
/**************************************************************************************************************************/
