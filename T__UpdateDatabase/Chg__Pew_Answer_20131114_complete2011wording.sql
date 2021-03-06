select * from
/***********************************************************************************************************************/
(  /*** Set of data at country level ***********************************************************************************/
SELECT
           entity      = 'Ctry'
      ,    link_fk     = KN.[Nation_answer_pk]
      ,    Nation_fk   = N.[Nation_pk]
      ,    Locality_fk = NULL
      ,    Religion_fk = NULL
      , N.[Ctry_EditorialName]
      ,    Locality    = 'not detailed'
      ,    Religion    = ''
      , Q.[Question_Year]
      ,    QA_std      = Q.[Question_abbreviation_std]
      ,    QW_std      = Q.[Question_short_wording_std]
      , A.[Answer_value]
      , A.[answer_wording]
      , A.[answer_wording_std]
      ,    Question_fk = Q.[Question_pk]
      ,    Answer_fk   = A.[Answer_pk]
      , Q.[Notes]
  FROM [forum].[dbo].[Pew_Answer]            A
      ,[forum].[dbo].[Pew_Question]          Q
      ,[forum].[dbo].[Pew_Nation]            N
      ,[forum].[dbo].[Pew_Nation_Answer]     KN
WHERE Q.[Question_pk] =  A.[Question_fk]
  AND A.[Answer_pk]   = KN.[Answer_fk]
  AND N.[Nation_pk]   = KN.[Nation_fk]
  AND Q.[Question_Year] = 2011
/******************************************************************************* Set of data at country level ***/  ) DCL
/***********************************************************************************************************************/
,
/***********************************************************************************************************************/
(  /*** Set of NEW data at country level *******************************************************************************/
select * from
( /***EntTab************************************************************************************************************/
SELECT 
        [Name]    = [11777X12X33742]
       ,[coder]   = [11777X12X33743]
       ,[YEAR]    = [11777X12X33744]
       ,[Ctry]    = [11777X12X33745]
       ,[keyname]
       ,[expltext]
  FROM [limesurvey].[dbo].[lime_survey_11777]
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
       [key]     = LTRIM(RTRIM(STR([sid]))) + 'X' + LTRIM(RTRIM(STR([gid]))) + 'X' + LTRIM(RTRIM(STR([qid])))
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
/*************************************************************************** Set of NEW data at country level ***/  ) NCL
/***********************************************************************************************************************/
WHERE
        [QA_std]
      = [QA_std_x]
  AND    
        [Nation_fk]
      = [Ctry]




/****** Script for SelectTopNRows command from SSMS  ******/

--ORDER BY
--       [sid]
--      ,[gid]
--      ,[qid]


                   
                   
                   
                   
