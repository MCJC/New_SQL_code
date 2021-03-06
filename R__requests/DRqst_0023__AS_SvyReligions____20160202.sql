USE [forum_ResAnal]
GO
/***************************************************************************************************************************************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************************************************************************************************************/
/*
          Jan 20, 2016
FROM      Aleksandra Sandstrom

Request:  
Hey, Juan Carlos.
Do you know if any country names have changed since May? The style committee is finally circling around to these so I will be working with Global to check for differences in our lists and work on standard abbreviations for graphics. 
Also, do you have time sometime this week to pull a list of all of the religious groups in the database? I would really appreciate it!
Thanks so much for your help with this!
  
ANSWER
I can send you the list of countries later today
However, I think we should talk a little bit about religions to give you a better idea and avoid misunderstandings 
                                                                                                                                                                                   */
/***********************************************************************************************************************************************************************************/
  CREATE VIEW
--ALTER  VIEW
               [dbo].[DRqst_0023]
AS
/***********************************************************************************************************************************************************************************/
SELECT 
       DISTINCT
	   [Survey_religion_name]
--    ,[Survey_religion_note]
  FROM [forum].[dbo].[Survey_religion_code]
/***********************************************************************************************************************************************************************************/
