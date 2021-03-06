/**************************************************************************************************************************/
/*****                                                NO current Table                                                *****/
/**************************************************************************************************************************/
USE [forum]
GO
/**************************************************************************************************************************/
IF OBJECT_ID (N'[Pew_Survey_Respondent_Answer]', N'U') IS NOT NULL
DROP TABLE      [Pew_Survey_Respondent_Answer]
/**************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/**************************************************************************************************************************/
CREATE TABLE
                [Pew_Survey_Respondent_Answer]
(
	[Svy_RespAnswer_pk]                [int]         NOT NULL,
	[Svy_Respondent_fk]                [int]             NULL,
	[Answer_fk]                        [int]             NULL,
    CONSTRAINT
    [PK_Pew_Survey_Respondent_Answer]
    PRIMARY KEY CLUSTERED 
    (
	  [Svy_RespAnswer_pk]
	                      ASC
                         )WITH (  PAD_INDEX              = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  ) ON [PRIMARY]
                                                                               ) ON [PRIMARY]
GO
/**************************************************************************************************************************/
SET ANSI_PADDING OFF
GO
/**************************************************************************************************************************/
-------- test
SELECT * FROM
                [Pew_Survey_Respondent_Answer]
/**************************************************************************************************************************/
