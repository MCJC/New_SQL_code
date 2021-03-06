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
               [dbo].[XV_working_view]         -- to be restructured by request
AS
/***************************************************************************************************************************************************************/
SELECT 
       [Row]                     =
                                    ROW_NUMBER()
                                    OVER(ORDER BY
                                                   [Ctry_EditorialName]
                                                 , [Question_Year]
                                                 , [QA_std]              )
--      ,[V9xRow]
      ,[entity]
--      ,[link_fk]
--      ,[Nation_fk]
--      ,[Locality_fk]
--      ,[Religion_fk]
--      ,[Region]
      ,[Ctry_EditorialName]
--      ,[Locality]
--      ,[Religion]
      ,[Question_Year]
      ,[QA_std]
                = case 
                  when [QA_std]  = 'GRI_08_for_index'
                  then             'GRI_08'
                  when [QA_std]  = 'SHI_11_for_index'
                  then             'SHI_11'
                  else [QA_std]
                  end
      ,[QW_std]
      ,[Answer_value]
      ,[AW_std]
      ,[AW_det]
--      ,[Question_fk]
--      ,[Answer_fk]
--      ,[Notes]
  FROM [for_x].[dbo].[Vx_a_LongData&Region]
WHERE 
       [Question_Year]       IN ( 2011 )
AND
       [Ctry_EditorialName]  IN ( 'Canada', 'Netherlands', 'United States' )
AND
       [Answer_value]        >  0
/*---------------------------------------------------------------------------------*/
AND
/* Filters for the variables to be included ****************************************/
(
/*---------------------------------------------------------------------------------*/
/* >>  ANSWER by Country ***********************************************************/
       [QA_std]  IN (
                       'GRI_01'
                     , 'GRI_02'
                     , 'GRI_03'
                     , 'GRI_04'
                     , 'GRI_05'
                     , 'GRI_06'
                     , 'GRI_07'
                     , 'GRI_08_index'
                     , 'GRI_09'
                     , 'GRI_10'
                     , 'GRI_11'
                     , 'GRI_12'
                     , 'GRI_13'
                     , 'GRI_14'
                     , 'GRI_15'
                     , 'GRI_16'
                     , 'GRI_17'
                     , 'GRI_18'
                     , 'GRI_19'
--                     , 'GRI_20'
                     , 'GRI_20_01'
                     , 'GRI_20_02'
                     , 'GRI_20_03_a'
                     , 'GRI_20_03_b'
                     , 'GRI_20_03_c'
                     , 'GRI_20_04'
                     , 'GRI_20_05'
                     , 'SHI_01'
                     , 'SHI_02'
                     , 'SHI_03'
                     , 'SHI_04'
                     , 'SHI_05'
                     , 'SHI_06'
                     , 'SHI_07'
                     , 'SHI_08'
                     , 'SHI_09'
                     , 'SHI_10'
                     , 'SHI_11_index'
                     , 'SHI_12'
                     , 'SHI_13'
                                       )       
/* >>  ANSWER by Country ***********************************************************/
/*---------------------------------------------------------------------------------*/
OR
/*---------------------------------------------------------------------------------*/
/* >>  ANSWER specified by Religion ************************************************/
  (
       [entity]   =    'RGrp'
    AND
       [QA_std]  IN (
                       'GRI_11_01a'
                     , 'GRI_11_01b'
                     , 'GRI_11_02'
                     , 'GRI_11_03'
                     , 'GRI_11_04'
                     , 'GRI_11_05'
                     , 'GRI_11_06'
                     , 'GRI_11_07'
                     , 'GRI_11_08'
                     , 'GRI_11_09'
                     , 'GRI_11_10'
                     , 'GRI_11_11'
                     , 'GRI_11_12'
                     , 'GRI_11_13'
                     , 'GRI_11_14'
                     , 'GRI_11_15'
                     , 'GRI_11_16'
                     , 'GRI_11_17'

                     , 'GRI_20_01x_01a'
                     , 'GRI_20_01x_01b'
                     , 'GRI_20_01x_02'
                     , 'GRI_20_01x_03'
                     , 'GRI_20_01x_04'
                     , 'GRI_20_01x_05'
                     , 'GRI_20_01x_06'
                     , 'GRI_20_01x_07'
                     , 'GRI_20_01x_08'
                     , 'GRI_20_01x_09'
                     , 'GRI_20_01x_10'

                     , 'SHI_01_01a'
                     , 'SHI_01_01b'
                     , 'SHI_01_02'
                     , 'SHI_01_03'
                     , 'SHI_01_04'
                     , 'SHI_01_05'
                     , 'SHI_01_06'
                     , 'SHI_01_07'
                     , 'SHI_01_08'
                     , 'SHI_01_09'
                     , 'SHI_01_10'
                     , 'SHI_01_11'
                     , 'SHI_01_12'
                     , 'SHI_01_13'
                     , 'SHI_01_14'
                     , 'SHI_01_15'
                     , 'SHI_01_16'
                     , 'SHI_01_17'                     

                                       )
  )
/* <<  ANSWER specified by Religion ************************************************/
/*---------------------------------------------------------------------------------*/
OR
/*---------------------------------------------------------------------------------*/
/* >>  ANSWER WORDING detailed by Province *****************************************/
  (
       [entity]   =    'Prov'
    AND
       [QA_std]  IN (
                       'GRI_19_b'
                     , 'GRI_19_c'
                     , 'GRI_19_d'
                     , 'GRI_19_e'
                     , 'GRI_19_f'

                     , 'SHI_01_b'
                     , 'SHI_01_c'
                     , 'SHI_01_d'
                     , 'SHI_01_e'
                     , 'SHI_01_f'

                     , 'SHI_04_b'
                     , 'SHI_04_c'
                     , 'SHI_04_d'
                     , 'SHI_04_e'
                     , 'SHI_04_f'

                     , 'SHI_05_b'
                     , 'SHI_05_c'
                     , 'SHI_05_d'
                     , 'SHI_05_e'
                     , 'SHI_05_f'
                                       )
/*---------------------------------------------------------------------------------*/
  )
/* <<  ANSWER WORDING detailed by Province *****************************************/
/*---------------------------------------------------------------------------------*/
)
/* Filters for the variables to be included ****************************************/
