/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
/***                                                                                                                                            ***/
/***     >>>>>         This is the script used to create all tables in the RLS database                                               <<<<<     ***/
/***                                                                                                                                            ***/
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
USE              [RLS]
GO
/**************************************************************************************************************************************************/

/**************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE
    [Pew_Question_NoStd]
(
    [Question_pk]                 [int]             NOT NULL,
	[Question_abbreviation]       [nvarchar](255)       NULL,
	[Question_wording]            [varchar](max)        NULL,
	[Question_Year]               [int]                 NULL,
	[Notes]                       [varchar](1000)       NULL,
	[Data_source_fk]              [int]                 NULL,
	[Question_Std_fk]             [int]                 NULL,
    CONSTRAINT
    [PK_Pew_Question_NoStd]
    PRIMARY KEY CLUSTERED 
    (
	  [Question_pk]
	                      ASC
                         )WITH (  PAD_INDEX              = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  ) ON [PRIMARY]
                                                                               ) ON [PRIMARY]
GO
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE
    [Pew_Answer_NoStd]
(
	[Answer_pk]                   [int]             NOT NULL,
	[Answer_value_NoStd]          [decimal](12, 2)      NULL,
	[Answer_Wording]              [nvarchar](max)       NULL,
	[Answer_Std_fk]               [int]                 NULL,
	[Question_fk]                 [int]                 NULL,
    CONSTRAINT
    [PK_Pew_Answer_NoStd]
    PRIMARY KEY CLUSTERED 
    (
	  [Answer_pk]
	                      ASC
                         )WITH (  PAD_INDEX              = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  ) ON [PRIMARY]
                                                                               ) ON [PRIMARY]
GO
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE
    [Pew_Question_Std]
(
	[Question_Std_pk]             [int]             NOT NULL,
	[Question_abbreviation_std]   [nvarchar](255)       NULL,
	[Question_wording_std]        [varchar](max)        NULL,
	[Question_short_wording_std]  [varchar](500)        NULL,
	[Display]                     [int]                 NULL,
	[AnswerSet_num]               [int]                 NULL,
	[Editorially_Checked]         [varchar](5)          NULL,
	[Question_Label_80Chars]      [varchar](90)         NULL,
    CONSTRAINT
    [PK_Pew_Question_Std]
    PRIMARY KEY CLUSTERED 
    (
	  [Question_Std_pk]
	                      ASC
                         )WITH (  PAD_INDEX              = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  ) ON [PRIMARY]
                                                                               ) ON [PRIMARY]
GO
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE
    [Pew_Answer_Std]
(
	[Answer_Std_pk]               [int]             NOT NULL,
	[AnswerSet_number]            [int]                 NULL,
	[Answer_value_std]            [decimal](12, 2)      NULL,
	[Answer_Wording_std]          [nvarchar](max)       NULL,
	[Full_set_of_Answers]         [nvarchar](max)       NULL,
	[NA_by_set_of_Answers]        [int]                 NULL,
    CONSTRAINT
    [PK_Pew_Answer_Std]
    PRIMARY KEY CLUSTERED 
    (
	  [Answer_Std_pk]
	                      ASC
                         )WITH (  PAD_INDEX              = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  ) ON [PRIMARY]
                                                                               ) ON [PRIMARY]
GO
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
SET ANSI_PADDING OFF
GO





/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Field]
         FROM [forum].[dbo].[Pew_Field]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Data_Source]
         FROM [forum].[dbo].[Pew_Data_Source]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Topic]
         FROM [forum].[dbo].[Pew_Topic]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Question_Topic]
         FROM [forum].[dbo].[Pew_Question_Topic]
/**************************************************************************************************************************************************/
GO
SELECT * INTO               [Pew_Survey_Respondent]
         FROM [forum].[dbo].[Pew_Survey_Respondent]
TRUNCATE TABLE              [Pew_Survey_Respondent]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Survey_Respondent_Answer]
TRUNCATE TABLE              [Pew_Survey_Respondent_Answer]
/**************************************************************************************************************************************************/
GO




