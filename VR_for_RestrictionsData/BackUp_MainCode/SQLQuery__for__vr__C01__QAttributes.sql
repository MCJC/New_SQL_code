USE [forum_ResAnal]
GO

/****** Object:  View [dbo].[vr__C01_]    Script Date: 3/16/17 11:12:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/* IF OBJECT_ID(N'[forum_ResAnal].[dbo].[vr__C01_]', N'U') IS NOT NULL
      DROP VIEW                   [dbo].[vr__C01_]                                                                                                             */
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
CREATE  VIEW                      [dbo].[vr__C01_]
AS
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT *
FROM
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
(
/*** Set of data ***********************************************************************************************************************************************/
SELECT
          [row]                                  = ROW_NUMBER()OVER(ORDER BY QS.[attr])
     ,    [DBLINK]                               = ISNULL(QX.[Question_Attributes_pk], '0')
     , QL.[attr]
	 , QA.[Question_wording_std]
     ,    [CURRENT_NOTE]                         = ISNULL(QX.[attr], '---   NO current note in database    ---')
     ,    [Changes_or_addition_of_NOTES_Y/N_?]   = ' '
     ,    [New note:]                            = ''
  FROM 
       [forum].[dbo].[Pew_Question_Attributes]       QF
  LEFT
  JOIN
       [forum].[dbo].[Pew_Question_Attributes]       QL
    ON
       QF.[Question_Std_fk]
     = QL.[Question_Std_fk]
  INNER
  JOIN
       [forum].[dbo].[Pew_Question_Attributes]       QS
    ON
       QF.[Question_Std_fk]
     = QS.[Question_Std_fk]
  LEFT
  JOIN
      (SELECT * FROM
       [forum].[dbo].[Pew_Question_Attributes]
       WHERE [attk] like '%note01'              )     QX
    ON
       QF.[Question_Std_fk]
     = QX.[Question_Std_fk]
  INNER
  JOIN
       [forum].[dbo].[Pew_Question_Std]              QA
    ON
       QF.[Question_Std_fk]
     = QA.[Question_Std_pk]
where
       QF.[attk] like 'iTL'
  and
       QF.[attr] like  '1'
  and
       QL.[attk] like 'TopLine label'
  and
       QS.[attk] like 'SortKey'
/*** Set of data ***********************************************************************************************************************************************/
)    Set_of_data
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/

GO


