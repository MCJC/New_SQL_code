/***********************************************************************************************************************/
/*****                                          run step by step script                                            *****/
/***********************************************************************************************************************/
/***********************************************************************************************************************/
/***                                                 *******************************************************************/
/***  run first step >>  create temporary table      *******************************************************************/
/***                                                 *******************************************************************/
/***********************************************************************************************************************/
USE 
            [for_x]
GO
/***********************************************************************************************************************/
IF OBJECT_ID
         (N'[for_x].[dbo].[LS2011_data]', N'U') IS NOT NULL
DROP TABLE
            [for_x].[dbo].[LS2011_data]
/*---------------------------------------------------------------------------------------------------------------------*/
/*** Set of NEW data at country level **********************************************************************************/
SELECT
       rowid =
               ROW_NUMBER()
               OVER(ORDER BY
							 [YEAR]
                            ,[Ctry]
                            ,[keyname]            )
--Ctry ,QA_std_x ,
     , * 
/*---------------------------------------------------------------------------------------------------------------------*/
INTO
        [dbo].[LS2011_data]
/*---------------------------------------------------------------------------------------------------------------------*/
from
( /***EntTab************************************************************************************************************/
SELECT 
        [Name]    = [11777X12X33742]
       ,[coder]   = [11777X12X33743]
       ,[YEAR]    = [11777X12X33744]
       ,[Ctry]    = [11777X12X33745]
       ,[keyname]
       ,[expltext]
FROM
(
select *
  FROM [limesurvey].[dbo].[lime_survey_11777]
WHERE [submitdate] IS NOT NULL
--order by [11777X12X33745]
) NONULLS
UNPIVOT
  (
     expltext
FOR
     keyname
in (
  [11777X1X34365]
, [11777X1X34366]
, [11777X1X34367]
, [11777X1X34404]
, [11777X1X34405]
, [11777X3X34368]
, [11777X3X34369]
, [11777X3X34370]
, [11777X3X34371]
, [11777X3X34372]
, [11777X3X34373]
, [11777X3X34374]
, [11777X4X34375]
, [11777X4X34376]
, [11777X4X34377]
, [11777X4X34378]
, [11777X4X34379]
, [11777X4X34380]
, [11777X4X34381]
, [11777X4X34382]
, [11777X4X34383]
, [11777X4X34384]
, [11777X5X34385]
, [11777X5X34386]
, [11777X5X34387]
, [11777X5X34388]
, [11777X5X34389]
, [11777X6X34390]
, [11777X6X34391]
, [11777X6X34392]
, [11777X7X34393]
, [11777X8X34394]
, [11777X8X34395]
, [11777X8X34396]
, [11777X8X34397]
, [11777X8X34398]
, [11777X8X34399]
, [11777X8X34400]
, [11777X8X34401]
                   ) ) as UNPIVTD1
/**************************************************************************************************************/ ) EntTab
,
( /***VarName***********************************************************************************************************/
SELECT 
       [key]     =         LTRIM(RTRIM(STR([sid]))) + 'X' + LTRIM(RTRIM(STR([gid]))) + 'X' + LTRIM(RTRIM(STR([qid])))
--    ,[code]    = ', [' + LTRIM(RTRIM(STR([sid]))) + 'X' + LTRIM(RTRIM(STR([gid]))) + 'X' + LTRIM(RTRIM(STR([qid]))) + ']'
--    ,[qid]
--    ,[parent_qid]
--    ,[sid]
--    ,[gid]
--    ,[type]
      ,[QA_std_x] = REPLACE(
                    (REPLACE(
                     (REPLACE([title], '_DSCPTN' , ''))
                                     , '_text'   , ''))
                                     , 'comment' , '')
      ,[title]
--    ,[question]
  FROM [limesurvey].[dbo].[lime_questions]
WHERE
       [title] LIKE  '%_DSCPTN'
   OR
       [title] LIKE  '%_text'
   OR
       [title] LIKE  '%comment'
/*************************************************************************************************************/ ) VarName
WHERE
        [key]
      = [keyname]
/************************************************************************************* Set of NEW data at country level ***/
GO

/**************************************************************************************************************************/
/***                                                 **********************************************************************/
/***  run step 02 >>  remove/replace weird characts  **********************************************************************/
/***                                                 **********************************************************************/
/**************************************************************************************************************************/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , CHAR(9),' ')
WHERE 
                          [expltext] LIKE                                      '%'+CHAR(9)+'%'
GO
/*--------------------------------------------------------------------------------------------------------------- tab -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(13)+char(10), ' ')
WHERE 
                          [expltext] LIKE                                      '%'+char(13)+char(10)+'%'
GO
/*----------------------------------------------------------------------------------------------------- CR & new line -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , CHAR(10),' ')
WHERE 
                          [expltext] LIKE                                      '%'+CHAR(10)+'%'
GO
/*---------------------------------------------------------------------------------------------------------- new line -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , CHAR(13),' ')
WHERE 
                          [expltext] LIKE                                      '%'+CHAR(13)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------- CR -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(226)
                                                                                  +char(128)
                                                                                  +char(159),     char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(226)
                                                                                  +char(128)
                                                                                  +char(159)
                                                                                  +
                                                                               '%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(226)
                                                                                  +char(130)
                                                                                  +char(172),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(226)
                                                                                  +char(130)
                                                                                  +char(172)
                                                                                  +
                                                                               '%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(34)+char(153), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(34)+char(153)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(152), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(152)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(153), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(153)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(156), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(156)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(34)+char(162), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(34)+char(162)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(147), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(147)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(148), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(148)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(39)+char(149), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(39)+char(149)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(171), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(171)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(187), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(187)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(163), '')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(163)+'%'
GO
/*-------------------------------------------------------------------------------------------------------- [currency] -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(167), '')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(167)+'%'
GO
/*------------------------------------------------------------------------------------------------------------ [item] -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(176), 'o.')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(176)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------- o. -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(194)+char(186), 'o.')
WHERE 
                          [expltext] LIKE                                      '%'+char(194)+char(186)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------- o. -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(137), 'E')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(137)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(141), 'I')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(141)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(147), 'O')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(147)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(150), 'O')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(150)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(160), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(160)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(161), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(161)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(162), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(162)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(163), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(163)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(164), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(164)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(165), 'a')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(165)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(167), 'c')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(167)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(168), 'e')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(168)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(169), 'e')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(169)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(170), 'e')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(170)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(173), 'i')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(173)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(174), 'i')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(174)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(175), 'i')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(175)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(177), 'n')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(177)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(179), 'o')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(179)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(180), 'o')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(180)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(181), 'o')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(181)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(182), 'o')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(182)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(186), 'u')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(186)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(187), 'u')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(187)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195)+char(188), 'u')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+char(188)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(135), 'c')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(135)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(141), 'c')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(141)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(159), 'g')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(159)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(176), 'I')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(176)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(196)+char(177), 'i')
WHERE 
                          [expltext] LIKE                                      '%'+char(196)+char(177)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(197)+char(130), 'l')
WHERE 
                          [expltext] LIKE                                      '%'+char(197)+char(130)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(197)+char(159), 's')
WHERE 
                          [expltext] LIKE                                      '%'+char(197)+char(159)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(197)+char(160), 'S')
WHERE 
                          [expltext] LIKE                                      '%'+char(197)+char(160)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(197)+char(161), 's')
WHERE 
                          [expltext] LIKE                                      '%'+char(197)+char(161)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(35),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(35)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(42),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(42)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(128),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(128)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(130),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(130)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(166),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(166)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(195), 'A')
WHERE 
                          [expltext] LIKE                                      '%'+char(195)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(226),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(226)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(156),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(156)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(157),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(157)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(162),     '')
WHERE 
                          [expltext] LIKE                                      '%'+char(162)+'%'
GO
/*---------------------------------------------------------------------------------------------------------------------*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(146), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(146)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(147), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(147)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(148), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(148)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(149), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(149)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(150), '"')
WHERE 
                          [expltext] LIKE                                      '%'+char(150)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- " -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(152), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(152)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/
UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                          [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , char(153), char(39))
WHERE 
                          [expltext] LIKE                                      '%'+char(153)+'%'
GO
/*----------------------------------------------------------------------------------------------------------------- ' -*/

hhhhhhhhhhhhhhhhhhheeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrreeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

--    select * from        [for_x].[dbo].[LS2011_data]
WHERE 
                                       [expltext] LIKE '%'+CHAR(280)+'%'


select CHAR(159)














UPDATE
            [for_x].[dbo].[LS2011_data]
SET
                                       [expltext] = REPLACE( CAST([expltext] AS VARCHAR(MAX)) , '  ', ' ')
WHERE 
                                       [expltext] LIKE '%  %'

--FROM


--DROP TABLE
--    select * from        [for_x].[dbo].[LS2011_data]
WHERE
rowid
IN (
1050
,1053
,1108
,3014
)


 
                                       [expltext] LIKE '%'+CHAR(9)+'%'




--/**************************************************************************************************************************/
--/*****                                           BackUp  current Table(s)                                             *****/
--/**************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  DECLARE                          --  declare variable
--          @TofI                    --  variable name
--                   varchar(50)     --  data type of the variable
--SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--   DECLARE                                -- declare the cursor
--              MyCursor                    -- cursor name
--                             CURSOR FOR   -- as a cursor to take values from
--                 SELECT   
--/*------------------------------------------------------------------------------------------------------------------------*/
--                        'Pew_Answer'
--/*------------------------------------------------------------------------------------------------------------------------*/
--   OPEN                                   -- open
--              MyCursor                    -- cursor name
--	FETCH NEXT                               -- retrieve the next row
--          FROM                               -- from cursor
--                 MyCursor                    -- cursor name
--          INTO                               -- store it into the variable(s)
--                 @TofI                       --  variable name
--			 WHILE  @@FETCH_STATUS = 0
--					BEGIN
--/*------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[' + @TofI + '_' + @CrDt + ']
--                FROM      [forum].[dbo].[' + @TofI               + ']' )
--/*------------------------------------------------------------------------------------------------------------------------*/
--	FETCH NEXT                               -- retrieve the next row
--          FROM                               -- from cursor
--                 MyCursor                    -- cursor name
--          INTO                               -- store it into the variable(s)
--                 @TofI                       --  variable name
--					END
--   CLOSE                                  -- close
--              MyCursor                    -- cursor name
--DEALLOCATE                                -- remove reference and relase from memory
--              MyCursor                    -- cursor name
--/**************************************************************************************************************************/
--/***                                                 **********************************************************************/
--/***  run next step >>  UPDATE DATA                  **********************************************************************/
--/***                                                 **********************************************************************/
--/**************************************************************************************************************************/
--USE [forum];



--/*------------------------------------------------------------------------------------------------------------------------*/
--	FETCH NEXT                               -- retrieve the next row
--          FROM                               -- from cursor
--                 MyCursor                    -- cursor name
--          INTO                               -- store it into the variable(s)
--                 @TofI                       --  variable name
--					END
--   CLOSE                                  -- close
--              MyCursor                    -- cursor name
--DEALLOCATE                                -- remove reference and relase from memory
--              MyCursor                    -- cursor name
--/**************************************************************************************************************************/





--select 
--         expltext
--       --, answer_wording
--       --, mycheckpoint =
--       --                  CASE
--       --                       WHEN SUBSTRING(answer_wording, 1, 50)
--       --                          = SUBSTRING(expltext      , 1, 50)
--       --                       THEN 'ok'
--       --                       ELSE 'XXXXXX'
--       --                   END 
--       --, *
--from
--/***********************************************************************************************************************/
--(  /*** Set of data at country level ***********************************************************************************/
--SELECT
--           entity      = 'Ctry'
--      ,    link_fk     = KN.[Nation_answer_pk]
--      ,    Nation_fk   = N.[Nation_pk]
--      ,    Locality_fk = NULL
--      ,    Religion_fk = NULL
--      , N.[Ctry_EditorialName]
--      ,    Locality    = 'not detailed'
--      ,    Religion    = ''
--      , Q.[Question_Year]
--      ,    QA_std      = Q.[Question_abbreviation_std]
--      ,    QW_std      = Q.[Question_short_wording_std]
--      , A.[Answer_value]
--      , A.[answer_wording]
--      , A.[answer_wording_std]
--      ,    Question_fk = Q.[Question_pk]
--      ,    Answer_fk   = A.[Answer_pk]
--      , Q.[Notes]
--  FROM [forum].[dbo].[Pew_Answer]            A
--      ,[forum].[dbo].[Pew_Question]          Q
--      ,[forum].[dbo].[Pew_Nation]            N
--      ,[forum].[dbo].[Pew_Nation_Answer]     KN
--WHERE Q.[Question_pk] =  A.[Question_fk]
--  AND A.[Answer_pk]   = KN.[Answer_fk]
--  AND N.[Nation_pk]   = KN.[Nation_fk]
--  AND Q.[Question_Year] = 2011
--/******************************************************************************* Set of data at country level ***/  ) DCL
--/***********************************************************************************************************************/
--,
--/***********************************************************************************************************************/
--(  /*** Set of NEW data at country level *******************************************************************************/
--select 
----Ctry ,QA_std_x ,
--       * 
--from
--( /***EntTab************************************************************************************************************/
--SELECT 
--        [Name]    = [11777X12X33742]
--       ,[coder]   = [11777X12X33743]
--       ,[YEAR]    = [11777X12X33744]
--       ,[Ctry]    = [11777X12X33745]
--       ,[keyname]
--       ,[expltext]
--FROM
--(
--select *
--  FROM [limesurvey].[dbo].[lime_survey_11777]
--WHERE [submitdate] IS NOT NULL
----order by [11777X12X33745]
--) NONULLS
--UNPIVOT
--  (
--     expltext
--FOR
--     keyname
--in (
--  [11777X1X34365]
--, [11777X1X34366]
--, [11777X1X34367]
--, [11777X1X34404]
--, [11777X1X34405]
--, [11777X3X34368]
--, [11777X3X34369]
--, [11777X3X34370]
--, [11777X3X34371]
--, [11777X3X34372]
--, [11777X3X34373]
--, [11777X3X34374]
--, [11777X4X34375]
--, [11777X4X34376]
--, [11777X4X34377]
--, [11777X4X34378]
--, [11777X4X34379]
--, [11777X4X34380]
--, [11777X4X34381]
--, [11777X4X34382]
--, [11777X4X34383]
--, [11777X4X34384]
--, [11777X5X34385]
--, [11777X5X34386]
--, [11777X5X34387]
--, [11777X5X34388]
--, [11777X5X34389]
--, [11777X6X34390]
--, [11777X6X34391]
--, [11777X6X34392]
--, [11777X7X34393]
--, [11777X8X34394]
--, [11777X8X34395]
--, [11777X8X34396]
--, [11777X8X34397]
--, [11777X8X34398]
--, [11777X8X34399]
--, [11777X8X34400]
--, [11777X8X34401]
--                   ) ) as UNPIVTD1
--/**************************************************************************************************************/ ) EntTab
--,
--( /***VarName***********************************************************************************************************/
--SELECT 
--       [key]     =         LTRIM(RTRIM(STR([sid]))) + 'X' + LTRIM(RTRIM(STR([gid]))) + 'X' + LTRIM(RTRIM(STR([qid])))
----    ,[code]    = ', [' + LTRIM(RTRIM(STR([sid]))) + 'X' + LTRIM(RTRIM(STR([gid]))) + 'X' + LTRIM(RTRIM(STR([qid]))) + ']'
----    ,[qid]
----    ,[parent_qid]
----    ,[sid]
----    ,[gid]
----    ,[type]
--      ,[QA_std_x] = REPLACE(
--                    (REPLACE(
--                     (REPLACE([title], '_DSCPTN' , ''))
--                                     , '_text'   , ''))
--                                     , 'comment' , '')
--      ,[title]
----    ,[question]
--  FROM [limesurvey].[dbo].[lime_questions]
--WHERE
--       [title] LIKE  '%_DSCPTN'
--   OR
--       [title] LIKE  '%_text'
--   OR
--       [title] LIKE  '%comment'
--/*************************************************************************************************************/ ) VarName
--WHERE
--        [key]
--      = [keyname]
--/*************************************************************************** Set of NEW data at country level ***/  ) NCL
--/***********************************************************************************************************************/
--WHERE
--        [QA_std]
--      = [QA_std_x]
--  AND    
--        [Nation_fk]
--      = [Ctry]




--/****** Script for SelectTopNRows command from SSMS  ******/

----ORDER BY
----       [sid]
----      ,[gid]
----      ,[qid]


                   
                   
                   
                   
