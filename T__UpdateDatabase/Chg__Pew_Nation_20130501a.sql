/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Nation_2013_05_01]
  FROM     [forum].[dbo].[Pew_Nation]
/*********************************************************************************************************/
IF OBJECT_ID  (N'[juancarlos].[dbo].[Pew_Nation]', N'U') IS NOT NULL
DROP   TABLE     [juancarlos].[dbo].[Pew_Nation]
SELECT
       [Nation_pk]
      ,[Source_GDP_per_capita]
      ,[Source_Adult_Literacy_Pct]
      ,[MainSources]
  INTO           [juancarlos].[dbo].[Pew_Nation]
  FROM                [forum].[dbo].[Pew_Nation]
/*********************************************************************************************************/
--   Update from editorial suggestions
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_Adult_Literacy_Pct]
       =        
--select test =
                STUFF(                                 [Source_Adult_Literacy_Pct]
                      , CHARINDEX('Literacy Rate in',  [Source_Adult_Literacy_Pct]) 
                      ,       LEN('Literacy Rate in'                              )
                      ,           'Literacy rate for'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('Literacy Rate in',  [Source_Adult_Literacy_Pct]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_Adult_Literacy_Pct]
       =        
--select test =
                STUFF(                              [Source_Adult_Literacy_Pct]
                      , CHARINDEX('(from UNESCO)',  [Source_Adult_Literacy_Pct]) 
                      ,       LEN('(from UNESCO)'                              )
                      ,           'from U.N. Organization for Education, Science and Culture'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('(from UNESCO)',  [Source_Adult_Literacy_Pct]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_Adult_Literacy_Pct]
       =        
--select test =
                STUFF(                                  [Source_Adult_Literacy_Pct]
                      , CHARINDEX('(from Brittanica 2007)',  [Source_Adult_Literacy_Pct]) 
                      ,       LEN('(from Brittanica 2007)'                              )
                      ,           'from 2007 Brittanica'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('(from Brittanica 2007)',  [Source_Adult_Literacy_Pct]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_Adult_Literacy_Pct]
       =        
--select test =
                STUFF(                                    [Source_Adult_Literacy_Pct]
                      , CHARINDEX('(estimate from WRD)',  [Source_Adult_Literacy_Pct]) 
                      ,       LEN('(estimate from WRD)'                              )
                      ,           'from World Religion Database'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('(estimate from WRD)',  [Source_Adult_Literacy_Pct]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_Adult_Literacy_Pct]
       =        
--select test =
                STUFF(                                     [Source_Adult_Literacy_Pct]
                      , CHARINDEX('(from HDR 2007/2008)',  [Source_Adult_Literacy_Pct]) 
                      ,       LEN('(from HDR 2007/2008)'                              )
                      ,           'from 2007/2008 U.N. Human Development Report'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('(from HDR 2007/2008)',  [Source_Adult_Literacy_Pct]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_Adult_Literacy_Pct]
       =        
--select test =
                STUFF(                                   [Source_Adult_Literacy_Pct]
                      , CHARINDEX('(from Taiwan Govt)',  [Source_Adult_Literacy_Pct]) 
                      ,       LEN('(from Taiwan Govt)'                              )
                      ,           'from Taiwan government'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('(from Taiwan Govt)',  [Source_Adult_Literacy_Pct]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_Adult_Literacy_Pct]
       =        
--select test =
                STUFF(                              [Source_Adult_Literacy_Pct]
                      , CHARINDEX('(from UN: PC)',  [Source_Adult_Literacy_Pct]) 
                      ,       LEN('(from UN: PC)'                              )
                      ,           'from 1996 Population Census of New Caledonia'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('(from UN: PC)',  [Source_Adult_Literacy_Pct]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_Adult_Literacy_Pct]
       =        
--select test =
                STUFF(                                [Source_Adult_Literacy_Pct]
                      , CHARINDEX('(from UN: MICS)',  [Source_Adult_Literacy_Pct]) 
                      ,       LEN('(from UN: MICS)'                              )
                      ,           'from Multiple Indicator Cluster Survey, conducted by U.N. Children''s Fund'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('(from UN: MICS)',  [Source_Adult_Literacy_Pct]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_Adult_Literacy_Pct]
       =        
--select test =
                STUFF(                              [Source_Adult_Literacy_Pct]
                      , CHARINDEX('(from UN: SU)',  [Source_Adult_Literacy_Pct]) 
                      ,       LEN('(from UN: SU)'                              )
                      ,           'from 2006 Indicators on Literacy of U.N. Statistics Division'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('(from UN: SU)',  [Source_Adult_Literacy_Pct]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                  [Source_GDP_per_capita]
                      , CHARINDEX(')',  [Source_GDP_per_capita]) 
                      ,       LEN(')'                              )
                      ,           ''
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX(')',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                  [Source_GDP_per_capita]
                      , CHARINDEX('(in 2005 PPP US$,',  [Source_GDP_per_capita]) 
                      ,       LEN('(in 2005 PPP US$,'                              )
                      ,           '(in 2005 PPP $)'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('(in 2005 PPP US$,',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                [Source_GDP_per_capita]
                      , CHARINDEX('HDR 2007 / 2008',  [Source_GDP_per_capita]) 
                      ,       LEN('HDR 2007 / 2008'                              )
                      ,           '2007/2008 U.N. Human Development Report'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('HDR 2007 / 2008',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                   [Source_GDP_per_capita]
                      , CHARINDEX('from WRD, estimate',  [Source_GDP_per_capita]) 
                      ,       LEN('from WRD, estimate'                              )
                      ,           'World Religion Database'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('from WRD, estimate',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                     [Source_GDP_per_capita]
                      , CHARINDEX('UNDP',  [Source_GDP_per_capita]) 
                      ,       LEN('UNDP'                              )
                      ,           'U.N. Development Programme'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('UNDP',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                       [Source_GDP_per_capita]
                      , CHARINDEX('World Map Report 2007, National Hospice and Palliative Care Organization',  [Source_GDP_per_capita]) 
                      ,       LEN('World Map Report 2007, National Hospice and Palliative Care Organization'                              )
                      ,           '2007 National Hospice and Palliative Care Organization World Map Report'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('World Map Report 2007, National Hospice and Palliative Care Organization',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                              [Source_GDP_per_capita]
                      , CHARINDEX('Eurostat 2008, European Union',  [Source_GDP_per_capita]) 
                      ,       LEN('Eurostat 2008, European Union'                              )
                      ,           '2008 Eurostat'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('Eurostat 2008, European Union',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                                                                                         [Source_GDP_per_capita]
                      , CHARINDEX('ArcticStat database,  Chaire de recherche du Canada sur la condition autochtone comparée',  [Source_GDP_per_capita]) 
                      ,       LEN('ArcticStat database,  Chaire de recherche du Canada sur la condition autochtone comparée'                          )
                      ,           'Chaire de recherche du Canada sur la condition autochtone comparée ArcticStat database'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('ArcticStat database,  Chaire de recherche du Canada sur la condition autochtone comparée',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                                                                                            [Source_GDP_per_capita]
                      , CHARINDEX('Herland, Michel. Insularité, indépendance et développement. Mondes francophones 27.2 (2007)',  [Source_GDP_per_capita]) 
                      ,       LEN('Herland, Michel. Insularité, indépendance et développement. Mondes francophones 27.2 (2007)'                          )
                      ,           'Michel Herland, Insularité, indépendance et développement, Mondes francophones 27.2'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('Herland, Michel. Insularité, indépendance et développement. Mondes francophones 27.2 (2007)',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                                                                             [Source_GDP_per_capita]
                      , CHARINDEX('Liechtenstein in Figures 2007/2008, Liechtenstein Office of Economic Affairs',  [Source_GDP_per_capita]) 
                      ,       LEN('Liechtenstein in Figures 2007/2008, Liechtenstein Office of Economic Affairs'                          )
                      ,           '2007/2008 Liechtenstein Office of Economic Affairs Liechtenstein in Figures'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('Liechtenstein in Figures 2007/2008, Liechtenstein Office of Economic Affairs',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                                             [Source_GDP_per_capita]
                      , CHARINDEX('Commission of the European Communities, 2006',  [Source_GDP_per_capita]) 
                      ,       LEN('Commission of the European Communities, 2006'                          )
                      ,           '2006 Commission of the European Communities'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('Commission of the European Communities, 2006',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                                                                                                                       [Source_GDP_per_capita]
                      , CHARINDEX('Cordellier, Serge, Béatrice Didiot, and Sarah Netter. L''état Du Monde 2004: Annuaire Économique Géopolitique Mondial.',  [Source_GDP_per_capita]) 
                      ,       LEN('Cordellier, Serge, Béatrice Didiot, and Sarah Netter. L''état Du Monde 2004: Annuaire Économique Géopolitique Mondial.'                          )
                      ,           'Serge Cordellier, Béatrice Didiot and Sarah Netter, L''état Du Monde 2004: Annuaire Économique Géopolitique Mondial'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('Cordellier, Serge, Béatrice Didiot, and Sarah Netter. L''état Du Monde 2004: Annuaire Économique Géopolitique Mondial.',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                                                        [Source_GDP_per_capita]
                      , CHARINDEX('World Development Indicators database, World Bank, 2005',  [Source_GDP_per_capita]) 
                      ,       LEN('World Development Indicators database, World Bank, 2005'                          )
                      ,           '2005 World Bank World Development Indicators database'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('World Development Indicators database, World Bank, 2005',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                                       [Source_GDP_per_capita]
                      , CHARINDEX('Isle of Man Government',  [Source_GDP_per_capita]) 
                      ,       LEN('Isle of Man Government'                              )
                      ,           'Isle of Man government'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('Isle of Man Government',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
                    [Source_GDP_per_capita]
       =        
--select test =
                STUFF(                              [Source_GDP_per_capita]
                      , CHARINDEX('WEO data, IMF',  [Source_GDP_per_capita]) 
                      ,       LEN('WEO data, IMF'                              )
                      ,           'I.M.F. World Economic Outlook database'
                     )
--from
--           [forum].[dbo].[Pew_Nation]
WHERE
                        CHARINDEX('WEO data, IMF',  [Source_GDP_per_capita]) 
                        != 0
-----------------------------------------------------------------------------------------------------------
/*********************************************************************************************************/

UPDATE
           [juancarlos].[dbo].[Pew_Nation]
SET
           [juancarlos].[dbo].[Pew_Nation].[MainSources]

         =  'Population data from United Nations (updated June 2011); '
          + [Source_GDP_per_capita]
          + '; '
          + [Source_Adult_Literacy_Pct]
/*********************************************************************************************************/
/*********************************************************************************************************/
-- check updates
SELECT 
         Source = 'Population_data'
       , Current_Wording = 'Population data from United Nations (updated June 2011)'
       , Edited_Wording  = 'Population data from United Nations (updated June 2011)'
UNION
SELECT 
       DISTINCT
         Source = 'GDP_per_capita'
       , Current_Wording = Source_GDP_per_capita
       , Edited_Wording  = Source_GDP_per_capita
  FROM [juancarlos].[dbo].[Pew_Nation]
UNION
SELECT 
       DISTINCT
         Source = 'Adult_Literacy_Pct'
       , Current_Wording = Source_Adult_Literacy_Pct
       , Edited_Wording  = Source_Adult_Literacy_Pct
  FROM [juancarlos].[dbo].[Pew_Nation]
/*********************************************************************************************************/
/*********************************************************************************************************/
SELECT
       [Nation_pk]
      ,[Source_GDP_per_capita]
      ,[Source_Adult_Literacy_Pct]
      ,[MainSources]
FROM
           [juancarlos].[dbo].[Pew_Nation]
/*********************************************************************************************************/
/*********************************************************************************************************/
/*********************************************************************************************************/
--   New Table cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_Nation]
SET
           [forum].[dbo].[Pew_Nation].[Source_GDP_per_capita]
       =                        clone.[Source_GDP_per_capita]
      ,
           [forum].[dbo].[Pew_Nation].[Source_Adult_Literacy_Pct]
       =                        clone.[Source_Adult_Literacy_Pct]
      ,
           [forum].[dbo].[Pew_Nation].[MainSources]
       =                        clone.[MainSources]
FROM
                [forum].[dbo].[Pew_Nation]  AS mydbt
 JOIN
           [juancarlos].[dbo].[Pew_Nation]  AS clone

ON
           mydbt.[Nation_pk]
       =   clone.[Nation_pk]
/*********************************************************************************************************/
/*********************************************************************************************************/
/*********************************************************************************************************/
-- check results
SELECT 
       [Nation_pk]
      ,[Ctry_EditorialName]
      ,[Literacy_Rate]
      ,[GDP_per_capita]
      ,[Source_GDP_per_capita]
      ,[Source_Adult_Literacy_Pct]
      ,[MainSources]
FROM    [forum].[dbo].[Pew_Nation]
/*********************************************************************************************************/
IF OBJECT_ID  (N'[juancarlos].[dbo].[Pew_Nation]', N'U') IS NOT NULL
DROP   TABLE     [juancarlos].[dbo].[Pew_Nation]
/*********************************************************************************************************/
