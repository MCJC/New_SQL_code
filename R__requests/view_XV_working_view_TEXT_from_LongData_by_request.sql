USE [for_x]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
/*
FROM
          Paul Rasor
Request:  is there a way to get behind the scores for individual countries and see the specific incidents or events or policies that led to a score above 0.00
          for particular questions? I would be interested in the actual incidents for these countries for all questions where their scores were higher than zero.
          I am doing a comparative project involving Canada, the Netherlands, and the U.S. I would like to see all the specific items and incidents for all three
          countries for all GRI and SHI questions where their scores were higher than zero.
          For me the best format would be per question, per country, per year - so that I can easily trace each country's movement on each question, and then
          compare the countries with respect to each question.
          I suspect excel would work well, but I'd be grateful if you could also send this in a simple MSWord document.
          I often print all of parts of material like this to facilitate my own note-taking, and I have found that printing from excel sometimes cuts off parts of 
          the material I want to look at.  
ANSWER
          The actual incidents or laws that are coded, however, are not indicated. If there are particular countries of interest, we could prepare a file with some
          of this information for a few countries.
*/

--create VIEW
ALTER  VIEW
               [dbo].[XV_working_view_text]         -- to be restructured by request
AS
/***************************************************************************************************************************************************************/
SELECT 
       [NRow]                    =
                                    ROW_NUMBER()
                                    OVER(ORDER BY  [Row]  )
      ,*
FROM
(
SELECT 
       [Row]                     =  [Row] + .01
--      ,[entity]
--      ,[Region]
      ,[Country]                 =  [Ctry_EditorialName]
--      ,[Locality]
--      ,[Religion]
      ,[YEAR]                    =  [Question_Year]
      ,[Question]
                                 = CASE 
                                   WHEN LEN([QA_std]) =  6 THEN 'Question: ' + REPLACE([QA_std],'_','.')
                                                           ELSE '   Sub-Q: ' + REPLACE([QA_std],'_','.')
                                   END
      ,[Wording]                 = [QW_std]
  FROM [for_x].[dbo].[XV_working_view]
UNION
SELECT 
       [Row]                     =  [Row] + .02
--      ,[entity]
--      ,[Region]
      ,[Country]                 =  [Ctry_EditorialName]
--      ,[Locality]
--      ,[Religion]
      ,[YEAR]                    =  [Question_Year]
      ,[Question]
                                 = CASE 
                                   WHEN LEN([QA_std]) =  6 THEN '  Answer:'
                                                           ELSE '   Sub-A:'
                                   END
      ,[Wording]                 = '(' + STR([Answer_value], 12, 2) + ') ' + [AW_std]
  FROM [for_x].[dbo].[XV_working_view]
UNION
SELECT 
       [Row]                     =  [Row] + .03
--      ,[entity]
--      ,[Region]
      ,[Country]                 =  [Ctry_EditorialName]
--      ,[Locality]
--      ,[Religion]
      ,[YEAR]                    =  [Question_Year]
      ,[Question]
                                 = CASE 
                                   WHEN LEN([QA_std]) =  6 THEN '  AnsDet:'
                                                           ELSE '  SubADt:'
                                   END
      ,[Wording]                 = [AW_det]
  FROM [for_x].[dbo].[XV_working_view]
) AS A
