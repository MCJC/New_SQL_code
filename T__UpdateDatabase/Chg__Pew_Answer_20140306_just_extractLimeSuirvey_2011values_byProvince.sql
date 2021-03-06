/***********************************************************************************************************************/
/*****                                          run step by step script                                            *****/
/***********************************************************************************************************************/
/***********************************************************************************************************************/
/***                                                 *******************************************************************/
/***  run first step >>  create temporary table      *******************************************************************/
/***                                                 *******************************************************************/
/***********************************************************************************************************************/
USE 
            [juancarlos]
GO
/***********************************************************************************************************************/
--IF OBJECT_ID
--         (N'[juancarlos].[dbo].[LimeTemp_v]', N'U') IS NOT NULL
--DROP TABLE
--            [juancarlos].[dbo].[LimeTemp_v]
--GO
/*---------------------------------------------------------------------------------------------------------------------------*/
/* > * Set of NEW data at country level **************************************************************************************/
SELECT
       rowid =
               ROW_NUMBER()
               OVER(ORDER BY
							 [YEAR]
                            ,[QA_std_x]
                            ,[Ctry_fk]
                            ,[keyname]            )
     , [YEAR]
     , [QA_std_x]
     , [Ctry_fk]
     , [Locality_fk]
     , [expltext]
     , jckey1          =  keyname
     , jckey2		   =  [key]
     , lsvarname       =  title
/*---------------------------------------------------------------------------------------------------------------------*/
--INTO
--            [juancarlos].[dbo].[LimeTemp_v]
/*---------------------------------------------------------------------------------------------------------------------*/
FROM
(
/*-----------------------------------------------------------------------------------------------------------*/
/* > LIMESURVEY unpivoted by province/question - only last date **********************************************/
SELECT 
        [YEAR]
       ,[Ctry_fk]
       --,[datestamp]
       ,[Locality_fk]
       ,[keyname]
       ,[expltext] = CONVERT(VARCHAR(MAX),[expltext])
FROM
(
/* > LIMESURVEY by province text only last date **************************************************************/
SELECT 
       *
FROM
(
/* > LIMESURVEY by province text data sorted descendently by date ********************************************/
SELECT 
       NEWEST = RANK() OVER (PARTITION BY   [YEAR]
                                          , [Ctry_fk]
                                          , [Locality_fk]
                                 ORDER BY   [datestamp] DESC)
      ,*
FROM
(




/* > LIMESURVEY by province text data ************************************************************************/
SELECT 
       [YEAR]       = [76424X25X33860]
      ,[Ctry_fk]    = [76424X25X33861]
      ,[datestamp]
      ,[76424X25X33858]         --  coder number 0/1/3/5/6
      --,[76424X25X33859]         --  coder key = 2

-- The following code adds the values for all the fields having Locality_fk (one for eaach country)
-- -> we add based on the assumption of all fields null except for the corresponding code
      , Locality_fk = (
                            CASE WHEN [76424X25X34020] IS NULL THEN 0 ELSE [76424X25X34020] END
                         +  CASE WHEN [76424X25X34021] IS NULL THEN 0 ELSE [76424X25X34021] END
                         +  CASE WHEN [76424X25X34022] IS NULL THEN 0 ELSE [76424X25X34022] END
                         +  CASE WHEN [76424X25X34023] IS NULL THEN 0 ELSE [76424X25X34023] END
                         +  CASE WHEN [76424X25X34024] IS NULL THEN 0 ELSE [76424X25X34024] END
                         +  CASE WHEN [76424X25X34025] IS NULL THEN 0 ELSE [76424X25X34025] END
                         +  CASE WHEN [76424X25X34026] IS NULL THEN 0 ELSE [76424X25X34026] END
                         +  CASE WHEN [76424X25X34027] IS NULL THEN 0 ELSE [76424X25X34027] END
                         +  CASE WHEN [76424X25X34028] IS NULL THEN 0 ELSE [76424X25X34028] END
                         +  CASE WHEN [76424X25X34029] IS NULL THEN 0 ELSE [76424X25X34029] END
                         +  CASE WHEN [76424X25X34030] IS NULL THEN 0 ELSE [76424X25X34030] END
                         +  CASE WHEN [76424X25X34031] IS NULL THEN 0 ELSE [76424X25X34031] END
                         +  CASE WHEN [76424X25X34032] IS NULL THEN 0 ELSE [76424X25X34032] END
                         +  CASE WHEN [76424X25X34033] IS NULL THEN 0 ELSE [76424X25X34033] END
                         +  CASE WHEN [76424X25X34034] IS NULL THEN 0 ELSE [76424X25X34034] END
                         +  CASE WHEN [76424X25X34035] IS NULL THEN 0 ELSE [76424X25X34035] END
                         +  CASE WHEN [76424X25X34036] IS NULL THEN 0 ELSE [76424X25X34036] END
                         +  CASE WHEN [76424X25X34037] IS NULL THEN 0 ELSE [76424X25X34037] END
                         +  CASE WHEN [76424X25X34038] IS NULL THEN 0 ELSE [76424X25X34038] END
                         +  CASE WHEN [76424X25X34039] IS NULL THEN 0 ELSE [76424X25X34039] END
                         +  CASE WHEN [76424X25X34040] IS NULL THEN 0 ELSE [76424X25X34040] END
                         +  CASE WHEN [76424X25X34041] IS NULL THEN 0 ELSE [76424X25X34041] END
                         +  CASE WHEN [76424X25X34042] IS NULL THEN 0 ELSE [76424X25X34042] END
                         +  CASE WHEN [76424X25X34043] IS NULL THEN 0 ELSE [76424X25X34043] END
                         +  CASE WHEN [76424X25X34044] IS NULL THEN 0 ELSE [76424X25X34044] END
                         +  CASE WHEN [76424X25X34045] IS NULL THEN 0 ELSE [76424X25X34045] END
                         +  CASE WHEN [76424X25X34046] IS NULL THEN 0 ELSE [76424X25X34046] END
                         +  CASE WHEN [76424X25X34047] IS NULL THEN 0 ELSE [76424X25X34047] END
                         +  CASE WHEN [76424X25X34048] IS NULL THEN 0 ELSE [76424X25X34048] END
                         +  CASE WHEN [76424X25X34049] IS NULL THEN 0 ELSE [76424X25X34049] END
                         +  CASE WHEN [76424X25X34050] IS NULL THEN 0 ELSE [76424X25X34050] END
                         +  CASE WHEN [76424X25X34051] IS NULL THEN 0 ELSE [76424X25X34051] END
                         +  CASE WHEN [76424X25X34052] IS NULL THEN 0 ELSE [76424X25X34052] END
                         +  CASE WHEN [76424X25X34053] IS NULL THEN 0 ELSE [76424X25X34053] END
                         +  CASE WHEN [76424X25X34054] IS NULL THEN 0 ELSE [76424X25X34054] END
                         +  CASE WHEN [76424X25X34055] IS NULL THEN 0 ELSE [76424X25X34055] END
                         +  CASE WHEN [76424X25X34056] IS NULL THEN 0 ELSE [76424X25X34056] END
                         +  CASE WHEN [76424X25X34057] IS NULL THEN 0 ELSE [76424X25X34057] END
                         +  CASE WHEN [76424X25X34058] IS NULL THEN 0 ELSE [76424X25X34058] END
                         +  CASE WHEN [76424X25X34059] IS NULL THEN 0 ELSE [76424X25X34059] END
                         +  CASE WHEN [76424X25X34060] IS NULL THEN 0 ELSE [76424X25X34060] END
                         +  CASE WHEN [76424X25X34061] IS NULL THEN 0 ELSE [76424X25X34061] END
                         +  CASE WHEN [76424X25X34062] IS NULL THEN 0 ELSE [76424X25X34062] END
                         +  CASE WHEN [76424X25X34063] IS NULL THEN 0 ELSE [76424X25X34063] END
                         +  CASE WHEN [76424X25X34064] IS NULL THEN 0 ELSE [76424X25X34064] END
                         +  CASE WHEN [76424X25X34065] IS NULL THEN 0 ELSE [76424X25X34065] END
                         +  CASE WHEN [76424X25X34066] IS NULL THEN 0 ELSE [76424X25X34066] END
                         +  CASE WHEN [76424X25X34067] IS NULL THEN 0 ELSE [76424X25X34067] END
                         +  CASE WHEN [76424X25X34068] IS NULL THEN 0 ELSE [76424X25X34068] END
                         +  CASE WHEN [76424X25X34069] IS NULL THEN 0 ELSE [76424X25X34069] END
                         +  CASE WHEN [76424X25X34070] IS NULL THEN 0 ELSE [76424X25X34070] END
                         +  CASE WHEN [76424X25X34071] IS NULL THEN 0 ELSE [76424X25X34071] END
                         +  CASE WHEN [76424X25X34073] IS NULL THEN 0 ELSE [76424X25X34073] END
                         +  CASE WHEN [76424X25X34074] IS NULL THEN 0 ELSE [76424X25X34074] END
                         +  CASE WHEN [76424X25X34075] IS NULL THEN 0 ELSE [76424X25X34075] END
                         +  CASE WHEN [76424X25X34076] IS NULL THEN 0 ELSE [76424X25X34076] END
                         +  CASE WHEN [76424X25X34077] IS NULL THEN 0 ELSE [76424X25X34077] END
                         +  CASE WHEN [76424X25X34078] IS NULL THEN 0 ELSE [76424X25X34078] END
                         +  CASE WHEN [76424X25X34079] IS NULL THEN 0 ELSE [76424X25X34079] END
                         +  CASE WHEN [76424X25X34080] IS NULL THEN 0 ELSE [76424X25X34080] END
                         +  CASE WHEN [76424X25X34081] IS NULL THEN 0 ELSE [76424X25X34081] END
                         +  CASE WHEN [76424X25X34082] IS NULL THEN 0 ELSE [76424X25X34082] END
                         +  CASE WHEN [76424X25X34083] IS NULL THEN 0 ELSE [76424X25X34083] END
                         +  CASE WHEN [76424X25X34084] IS NULL THEN 0 ELSE [76424X25X34084] END
                         +  CASE WHEN [76424X25X34085] IS NULL THEN 0 ELSE [76424X25X34085] END
                         +  CASE WHEN [76424X25X34086] IS NULL THEN 0 ELSE [76424X25X34086] END
                         +  CASE WHEN [76424X25X34087] IS NULL THEN 0 ELSE [76424X25X34087] END
                         +  CASE WHEN [76424X25X34088] IS NULL THEN 0 ELSE [76424X25X34088] END
                         +  CASE WHEN [76424X25X34089] IS NULL THEN 0 ELSE [76424X25X34089] END
                         +  CASE WHEN [76424X25X34090] IS NULL THEN 0 ELSE [76424X25X34090] END
                         +  CASE WHEN [76424X25X34091] IS NULL THEN 0 ELSE [76424X25X34091] END
                         +  CASE WHEN [76424X25X34092] IS NULL THEN 0 ELSE [76424X25X34092] END
                         +  CASE WHEN [76424X25X34093] IS NULL THEN 0 ELSE [76424X25X34093] END
                         +  CASE WHEN [76424X25X34094] IS NULL THEN 0 ELSE [76424X25X34094] END
                         +  CASE WHEN [76424X25X34095] IS NULL THEN 0 ELSE [76424X25X34095] END
                         +  CASE WHEN [76424X25X34096] IS NULL THEN 0 ELSE [76424X25X34096] END
                         +  CASE WHEN [76424X25X34097] IS NULL THEN 0 ELSE [76424X25X34097] END
                         +  CASE WHEN [76424X25X34098] IS NULL THEN 0 ELSE [76424X25X34098] END
                         +  CASE WHEN [76424X25X34099] IS NULL THEN 0 ELSE [76424X25X34099] END
                         +  CASE WHEN [76424X25X34100] IS NULL THEN 0 ELSE [76424X25X34100] END
                         +  CASE WHEN [76424X25X34101] IS NULL THEN 0 ELSE [76424X25X34101] END
                         +  CASE WHEN [76424X25X34102] IS NULL THEN 0 ELSE [76424X25X34102] END
                         +  CASE WHEN [76424X25X34103] IS NULL THEN 0 ELSE [76424X25X34103] END
                         +  CASE WHEN [76424X25X34104] IS NULL THEN 0 ELSE [76424X25X34104] END
                         +  CASE WHEN [76424X25X34105] IS NULL THEN 0 ELSE [76424X25X34105] END
                         +  CASE WHEN [76424X25X34106] IS NULL THEN 0 ELSE [76424X25X34106] END
                         +  CASE WHEN [76424X25X34107] IS NULL THEN 0 ELSE [76424X25X34107] END
                         +  CASE WHEN [76424X25X34108] IS NULL THEN 0 ELSE [76424X25X34108] END
                         +  CASE WHEN [76424X25X34109] IS NULL THEN 0 ELSE [76424X25X34109] END
                         +  CASE WHEN [76424X25X34110] IS NULL THEN 0 ELSE [76424X25X34110] END
                         +  CASE WHEN [76424X25X34111] IS NULL THEN 0 ELSE [76424X25X34111] END
                         +  CASE WHEN [76424X25X34112] IS NULL THEN 0 ELSE [76424X25X34112] END
                         +  CASE WHEN [76424X25X34113] IS NULL THEN 0 ELSE [76424X25X34113] END
                         +  CASE WHEN [76424X25X34114] IS NULL THEN 0 ELSE [76424X25X34114] END
                         +  CASE WHEN [76424X25X34115] IS NULL THEN 0 ELSE [76424X25X34115] END
                         +  CASE WHEN [76424X25X34116] IS NULL THEN 0 ELSE [76424X25X34116] END
                         +  CASE WHEN [76424X25X34117] IS NULL THEN 0 ELSE [76424X25X34117] END
                         +  CASE WHEN [76424X25X34118] IS NULL THEN 0 ELSE [76424X25X34118] END
                         +  CASE WHEN [76424X25X34119] IS NULL THEN 0 ELSE [76424X25X34119] END
                         +  CASE WHEN [76424X25X34120] IS NULL THEN 0 ELSE [76424X25X34120] END
                         +  CASE WHEN [76424X25X34121] IS NULL THEN 0 ELSE [76424X25X34121] END
                         +  CASE WHEN [76424X25X34122] IS NULL THEN 0 ELSE [76424X25X34122] END
                         +  CASE WHEN [76424X25X34123] IS NULL THEN 0 ELSE [76424X25X34123] END
                         +  CASE WHEN [76424X25X34124] IS NULL THEN 0 ELSE [76424X25X34124] END
                         +  CASE WHEN [76424X25X34125] IS NULL THEN 0 ELSE [76424X25X34125] END
                         +  CASE WHEN [76424X25X34126] IS NULL THEN 0 ELSE [76424X25X34126] END
                         +  CASE WHEN [76424X25X34127] IS NULL THEN 0 ELSE [76424X25X34127] END
                         +  CASE WHEN [76424X25X34128] IS NULL THEN 0 ELSE [76424X25X34128] END
                         +  CASE WHEN [76424X25X34129] IS NULL THEN 0 ELSE [76424X25X34129] END
                         +  CASE WHEN [76424X25X34130] IS NULL THEN 0 ELSE [76424X25X34130] END
                         +  CASE WHEN [76424X25X34131] IS NULL THEN 0 ELSE [76424X25X34131] END
                         +  CASE WHEN [76424X25X34132] IS NULL THEN 0 ELSE [76424X25X34132] END
                         +  CASE WHEN [76424X25X34133] IS NULL THEN 0 ELSE [76424X25X34133] END
                         +  CASE WHEN [76424X25X34134] IS NULL THEN 0 ELSE [76424X25X34134] END
                         +  CASE WHEN [76424X25X34135] IS NULL THEN 0 ELSE [76424X25X34135] END
                         +  CASE WHEN [76424X25X34136] IS NULL THEN 0 ELSE [76424X25X34136] END
                         +  CASE WHEN [76424X25X34137] IS NULL THEN 0 ELSE [76424X25X34137] END
                         +  CASE WHEN [76424X25X34138] IS NULL THEN 0 ELSE [76424X25X34138] END
                         +  CASE WHEN [76424X25X34139] IS NULL THEN 0 ELSE [76424X25X34139] END
                         +  CASE WHEN [76424X25X34140] IS NULL THEN 0 ELSE [76424X25X34140] END
                         +  CASE WHEN [76424X25X34141] IS NULL THEN 0 ELSE [76424X25X34141] END
                         +  CASE WHEN [76424X25X34142] IS NULL THEN 0 ELSE [76424X25X34142] END
                         +  CASE WHEN [76424X25X34143] IS NULL THEN 0 ELSE [76424X25X34143] END
                         +  CASE WHEN [76424X25X34144] IS NULL THEN 0 ELSE [76424X25X34144] END
                         +  CASE WHEN [76424X25X34145] IS NULL THEN 0 ELSE [76424X25X34145] END
                         +  CASE WHEN [76424X25X34146] IS NULL THEN 0 ELSE [76424X25X34146] END
                         +  CASE WHEN [76424X25X34147] IS NULL THEN 0 ELSE [76424X25X34147] END
                         +  CASE WHEN [76424X25X34148] IS NULL THEN 0 ELSE [76424X25X34148] END
                         +  CASE WHEN [76424X25X34149] IS NULL THEN 0 ELSE [76424X25X34149] END
                         +  CASE WHEN [76424X25X34150] IS NULL THEN 0 ELSE [76424X25X34150] END
                         +  CASE WHEN [76424X25X34151] IS NULL THEN 0 ELSE [76424X25X34151] END
                         +  CASE WHEN [76424X25X34152] IS NULL THEN 0 ELSE [76424X25X34152] END
                         +  CASE WHEN [76424X25X34153] IS NULL THEN 0 ELSE [76424X25X34153] END
                         +  CASE WHEN [76424X25X34154] IS NULL THEN 0 ELSE [76424X25X34154] END
                         +  CASE WHEN [76424X25X34155] IS NULL THEN 0 ELSE [76424X25X34155] END
                         +  CASE WHEN [76424X25X34156] IS NULL THEN 0 ELSE [76424X25X34156] END
                         +  CASE WHEN [76424X25X34157] IS NULL THEN 0 ELSE [76424X25X34157] END
                         +  CASE WHEN [76424X25X34158] IS NULL THEN 0 ELSE [76424X25X34158] END
                         +  CASE WHEN [76424X25X34159] IS NULL THEN 0 ELSE [76424X25X34159] END
                         +  CASE WHEN [76424X25X34160] IS NULL THEN 0 ELSE [76424X25X34160] END
                         +  CASE WHEN [76424X25X34161] IS NULL THEN 0 ELSE [76424X25X34161] END
                         +  CASE WHEN [76424X25X34162] IS NULL THEN 0 ELSE [76424X25X34162] END
                         +  CASE WHEN [76424X25X34163] IS NULL THEN 0 ELSE [76424X25X34163] END
                         +  CASE WHEN [76424X25X34164] IS NULL THEN 0 ELSE [76424X25X34164] END
                         +  CASE WHEN [76424X25X34165] IS NULL THEN 0 ELSE [76424X25X34165] END
                         +  CASE WHEN [76424X25X34166] IS NULL THEN 0 ELSE [76424X25X34166] END
                         +  CASE WHEN [76424X25X34167] IS NULL THEN 0 ELSE [76424X25X34167] END
                         +  CASE WHEN [76424X25X34168] IS NULL THEN 0 ELSE [76424X25X34168] END
                         +  CASE WHEN [76424X25X34169] IS NULL THEN 0 ELSE [76424X25X34169] END
                         +  CASE WHEN [76424X25X34170] IS NULL THEN 0 ELSE [76424X25X34170] END
                         +  CASE WHEN [76424X25X34171] IS NULL THEN 0 ELSE [76424X25X34171] END
                         +  CASE WHEN [76424X25X34172] IS NULL THEN 0 ELSE [76424X25X34172] END
                         +  CASE WHEN [76424X25X34173] IS NULL THEN 0 ELSE [76424X25X34173] END
                         +  CASE WHEN [76424X25X34174] IS NULL THEN 0 ELSE [76424X25X34174] END
                         +  CASE WHEN [76424X25X34175] IS NULL THEN 0 ELSE [76424X25X34175] END
                         +  CASE WHEN [76424X25X34176] IS NULL THEN 0 ELSE [76424X25X34176] END
                         +  CASE WHEN [76424X25X34177] IS NULL THEN 0 ELSE [76424X25X34177] END
                         +  CASE WHEN [76424X25X34178] IS NULL THEN 0 ELSE [76424X25X34178] END
                         +  CASE WHEN [76424X25X34179] IS NULL THEN 0 ELSE [76424X25X34179] END
                         +  CASE WHEN [76424X25X34180] IS NULL THEN 0 ELSE [76424X25X34180] END
                         +  CASE WHEN [76424X25X34181] IS NULL THEN 0 ELSE [76424X25X34181] END
                         +  CASE WHEN [76424X25X34182] IS NULL THEN 0 ELSE [76424X25X34182] END
                         +  CASE WHEN [76424X25X34183] IS NULL THEN 0 ELSE [76424X25X34183] END
                         +  CASE WHEN [76424X25X34184] IS NULL THEN 0 ELSE [76424X25X34184] END
                         +  CASE WHEN [76424X25X34185] IS NULL THEN 0 ELSE [76424X25X34185] END
                         +  CASE WHEN [76424X25X34186] IS NULL THEN 0 ELSE [76424X25X34186] END
                         +  CASE WHEN [76424X25X34187] IS NULL THEN 0 ELSE [76424X25X34187] END
                         +  CASE WHEN [76424X25X34188] IS NULL THEN 0 ELSE [76424X25X34188] END
                         +  CASE WHEN [76424X25X34189] IS NULL THEN 0 ELSE [76424X25X34189] END
                         +  CASE WHEN [76424X25X34190] IS NULL THEN 0 ELSE [76424X25X34190] END
                         +  CASE WHEN [76424X25X34191] IS NULL THEN 0 ELSE [76424X25X34191] END
                         +  CASE WHEN [76424X25X34192] IS NULL THEN 0 ELSE [76424X25X34192] END
                         +  CASE WHEN [76424X25X34193] IS NULL THEN 0 ELSE [76424X25X34193] END
                         +  CASE WHEN [76424X25X34194] IS NULL THEN 0 ELSE [76424X25X34194] END
                         +  CASE WHEN [76424X25X34195] IS NULL THEN 0 ELSE [76424X25X34195] END
                         +  CASE WHEN [76424X25X34196] IS NULL THEN 0 ELSE [76424X25X34196] END
                         +  CASE WHEN [76424X25X34197] IS NULL THEN 0 ELSE [76424X25X34197] END
                         +  CASE WHEN [76424X25X34198] IS NULL THEN 0 ELSE [76424X25X34198] END
                         +  CASE WHEN [76424X25X34199] IS NULL THEN 0 ELSE [76424X25X34199] END
                         +  CASE WHEN [76424X25X34200] IS NULL THEN 0 ELSE [76424X25X34200] END
                         +  CASE WHEN [76424X25X34201] IS NULL THEN 0 ELSE [76424X25X34201] END
                         +  CASE WHEN [76424X25X34202] IS NULL THEN 0 ELSE [76424X25X34202] END
                         +  CASE WHEN [76424X25X34203] IS NULL THEN 0 ELSE [76424X25X34203] END
                         +  CASE WHEN [76424X25X34204] IS NULL THEN 0 ELSE [76424X25X34204] END
                         +  CASE WHEN [76424X25X34205] IS NULL THEN 0 ELSE [76424X25X34205] END
                         +  CASE WHEN [76424X25X34206] IS NULL THEN 0 ELSE [76424X25X34206] END
                         +  CASE WHEN [76424X25X34207] IS NULL THEN 0 ELSE [76424X25X34207] END
                         +  CASE WHEN [76424X25X34208] IS NULL THEN 0 ELSE [76424X25X34208] END
                         +  CASE WHEN [76424X25X34209] IS NULL THEN 0 ELSE [76424X25X34209] END
                         +  CASE WHEN [76424X25X34210] IS NULL THEN 0 ELSE [76424X25X34210] END
                         +  CASE WHEN [76424X25X34211] IS NULL THEN 0 ELSE [76424X25X34211] END
                         +  CASE WHEN [76424X25X34212] IS NULL THEN 0 ELSE [76424X25X34212] END
                         +  CASE WHEN [76424X25X34213] IS NULL THEN 0 ELSE [76424X25X34213] END
                         +  CASE WHEN [76424X25X34214] IS NULL THEN 0 ELSE [76424X25X34214] END
                         +  CASE WHEN [76424X25X34215] IS NULL THEN 0 ELSE [76424X25X34215] END
                         +  CASE WHEN [76424X25X34216] IS NULL THEN 0 ELSE [76424X25X34216] END
                         +  CASE WHEN [76424X25X34217] IS NULL THEN 0 ELSE [76424X25X34217] END
                         +  CASE WHEN [76424X25X34218] IS NULL THEN 0 ELSE [76424X25X34218] END
                         +  CASE WHEN [76424X25X34219] IS NULL THEN 0 ELSE [76424X25X34219] END
                         +  CASE WHEN [76424X25X34220] IS NULL THEN 0 ELSE [76424X25X34220] END
                         +  CASE WHEN [76424X25X34221] IS NULL THEN 0 ELSE [76424X25X34221] END
                         +  CASE WHEN [76424X25X34222] IS NULL THEN 0 ELSE [76424X25X34222] END
                         +  CASE WHEN [76424X25X34223] IS NULL THEN 0 ELSE [76424X25X34223] END
                         +  CASE WHEN [76424X25X34224] IS NULL THEN 0 ELSE [76424X25X34224] END
                         +  CASE WHEN [76424X25X34225] IS NULL THEN 0 ELSE [76424X25X34225] END
                         +  CASE WHEN [76424X25X34226] IS NULL THEN 0 ELSE [76424X25X34226] END
                         +  CASE WHEN [76424X25X34227] IS NULL THEN 0 ELSE [76424X25X34227] END
                         +  CASE WHEN [76424X25X34228] IS NULL THEN 0 ELSE [76424X25X34228] END
                         +  CASE WHEN [76424X25X34229] IS NULL THEN 0 ELSE [76424X25X34229] END
                         +  CASE WHEN [76424X25X34230] IS NULL THEN 0 ELSE [76424X25X34230] END
                         +  CASE WHEN [76424X25X34231] IS NULL THEN 0 ELSE [76424X25X34231] END
                         +  CASE WHEN [76424X25X34232] IS NULL THEN 0 ELSE [76424X25X34232] END
                         +  CASE WHEN [76424X25X34233] IS NULL THEN 0 ELSE [76424X25X34233] END
                         +  CASE WHEN [76424X25X34234] IS NULL THEN 0 ELSE [76424X25X34234] END
                         +  CASE WHEN [76424X25X34235] IS NULL THEN 0 ELSE [76424X25X34235] END
                         +  CASE WHEN [76424X25X34236] IS NULL THEN 0 ELSE [76424X25X34236] END
                         +  CASE WHEN [76424X25X34237] IS NULL THEN 0 ELSE [76424X25X34237] END
                         +  CASE WHEN [76424X25X34238] IS NULL THEN 0 ELSE [76424X25X34238] END
                         +  CASE WHEN [76424X25X34239] IS NULL THEN 0 ELSE [76424X25X34239] END
                         +  CASE WHEN [76424X25X34240] IS NULL THEN 0 ELSE [76424X25X34240] END
                         +  CASE WHEN [76424X25X34241] IS NULL THEN 0 ELSE [76424X25X34241] END
                         +  CASE WHEN [76424X25X34242] IS NULL THEN 0 ELSE [76424X25X34242] END
                         +  CASE WHEN [76424X25X34243] IS NULL THEN 0 ELSE [76424X25X34243] END
                         +  CASE WHEN [76424X25X34244] IS NULL THEN 0 ELSE [76424X25X34244] END
                         +  CASE WHEN [76424X25X34245] IS NULL THEN 0 ELSE [76424X25X34245] END
                         +  CASE WHEN [76424X25X34246] IS NULL THEN 0 ELSE [76424X25X34246] END
                         +  CASE WHEN [76424X25X34247] IS NULL THEN 0 ELSE [76424X25X34247] END
                         +  CASE WHEN [76424X25X34248] IS NULL THEN 0 ELSE [76424X25X34248] END
                         +  CASE WHEN [76424X25X34249] IS NULL THEN 0 ELSE [76424X25X34249] END
                         +  CASE WHEN [76424X25X34250] IS NULL THEN 0 ELSE [76424X25X34250] END
                         +  CASE WHEN [76424X25X34253] IS NULL THEN 0 ELSE [76424X25X34253] END
                         +  CASE WHEN [76424X25X34402] IS NULL THEN 0 ELSE [76424X25X34402] END
                        )
      ,[76424X20X34280]
      ,[76424X20X34286]
      ,[76424X20X34287]
      ,[76424X20X34288]
      ,[76424X20X34289]
      ,[76424X21X34302]
      ,[76424X21X34308]
      ,[76424X21X34314]
      ,[76424X21X34315]
      ,[76424X21X34316]
      ,[76424X22X34323]
      ,[76424X22X34329]
      ,[76424X22X34330]
      ,[76424X22X34333]
      ,[76424X22X34334]
      ,[76424X22X34335]
      ,[76424X22X34359]
      ,[76424X22X34340]
      ,[76424X22X34346]
      ,[76424X22X34351]
      ,[id]
  FROM  [limesurvey].[dbo].[lime_survey_76424_bak]
/* < LIMESURVEY by province text data ************************************************************************/
) LSPTD
/* < LIMESURVEY by province text data sorted descendently by date ********************************************/
) LSPSD
WHERE NEWEST = 1
/* < LIMESURVEY by province text only last date **************************************************************/
) LSPOLD
/*-----------------------------------------------------------------------------------------------------------*/
UNPIVOT
  (
     expltext
FOR
     keyname
in (
       [76424X20X34280]
      ,[76424X20X34286]
      ,[76424X20X34287]
      ,[76424X20X34288]
      ,[76424X20X34289]
      ,[76424X21X34302]
      ,[76424X21X34308]
      ,[76424X21X34314]
      ,[76424X21X34315]
      ,[76424X21X34316]
      ,[76424X22X34323]
      ,[76424X22X34329]
      ,[76424X22X34330]
      ,[76424X22X34333]
      ,[76424X22X34334]
      ,[76424X22X34335]
      ,[76424X22X34359]
      ,[76424X22X34340]
      ,[76424X22X34346]
      ,[76424X22X34351]
                        ) ) as UNPIVTD1
/* < LIMESURVEY unpivoted by province/question - only last date **********************************************/
) ASLS
,
(
/* > SET of variable names (questions) ***********************************************************************/
SELECT 
       [key]     =         LTRIM(RTRIM(STR([sid]))) + 'X' + LTRIM(RTRIM(STR([gid]))) + 'X' + LTRIM(RTRIM(STR([qid])))
      ,[QA_std_x] = title
      ,[title]
  FROM [limesurvey].[dbo].[lime_questions]
--/* < SET of variable names (questions) ***********************************************************************/
) VarName
WHERE
        [key]
      = [keyname]
/* < ************************************************************************************ Set of NEW data at country level ***/
/*---------------------------------------------------------------------------------------------------------------------------*/
GO
