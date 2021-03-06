/**************************************************************************************************************************/
/*****                                                NO current Table                                                *****/
/**************************************************************************************************************************/
USE [forum]
GO
/**************************************************************************************************************************/
IF OBJECT_ID (N'[Pew_Survey_Respondent]', N'U') IS NOT NULL
DROP TABLE      [Pew_Survey_Respondent]
/**************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/**************************************************************************************************************************/
CREATE TABLE
                [Pew_Survey_Respondent]
(
	[Svy_Respondent_pk]                [int]         NOT NULL,
    [SVY_psraid]                       [nvarchar](20)    NULL,
	[Religion_fk]                      [int]             NULL,
    [weight]                           [decimal](38, 16) NULL,
    [SampleWgt]                        [decimal](38, 16) NULL,
    [interview_date]                   [date]            NULL,
    CONSTRAINT
    [PK_Pew_Survey_Respondent]
    PRIMARY KEY CLUSTERED 
    (
	  [Svy_Respondent_pk]
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
                [Pew_Survey_Respondent]
/**************************************************************************************************************************/
