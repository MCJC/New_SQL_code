/*********************************************************************************************************/
--SELECT *
--  INTO  [_bk_forum].[dbo].[Pew_Nation_Answer_2013_06_21b]
--  FROM      [forum].[dbo].[Pew_Nation_Answer]
/*********************************************************************************************************/
/* add data */
INSERT INTO
            [forum].[dbo].[Pew_Nation_Answer]
                                             (  [Nation_answer_pk]
                                              , [Nation_fk]
                                              , [Answer_fk]
                                              , [Display]             )
SELECT Nation_answer_pk          = ROW_NUMBER()
                                   OVER(ORDER BY      
                                                   Nation_fk
                                                 , Answer_fk ) 
                                + (SELECT DISTINCT MAX(Nation_answer_pk)
                                   FROM [_bk_forum].[dbo].[Pew_Nation_Answer_2013_06_21b])
      , Nation_fk
      , Answer_fk
      , Display                 = 0
FROM
(
SELECT distinct
       A.[Nation_fk]
      ,c.[Question_abbreviation_std]
      ,c.[Question_short_wording_std]
      ,c.[Answer_value]
      ,c.[answer_wording_std]
      ,c.[Question_fk]
      ,   Answer_fk                  = CASE WHEN c.[Answer_fk] IS NULL THEN 14082
                                            ELSE c.[Answer_fk]
                                       END
       
  FROM [forum].[dbo].[Restrictions_byCtry] A

left outer join
( 
SELECT 
       [Nation_fk]
      ,[Ctry_EditorialName]
      ,[Question_Year]
      ,[Question_abbreviation_std]
      ,[Question_short_wording_std]
      ,[Answer_value]
      ,[answer_wording_std]
      ,[Question_fk]
      ,[Answer_fk]
  FROM [forum].[dbo].[Restrictions_byCtry]
  where Question_abbreviation_std = 'SHI_05'
  and Question_Year = 2011
) as C
 ON A.Nation_fk = C.Nation_fk
 
where c.Answer_value = 0.00
OR    c.Answer_value is null
) MYALL
WHERE [Question_abbreviation_std] IS NULL
 

/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT *
--  FROM [forum].[dbo].[Pew_Nation_Answer]