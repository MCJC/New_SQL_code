 WITH
    SO
    AS (
/*      *********************************************************************************************/
        SELECT 
                [id]          =   '0_'                  +      CAST([object_id] AS VARCHAR(MAX))
              , [n]           =  '[forum].[dbo].'           + QUOTENAME([name]                     )
              , [type]
          FROM                    [forum]            .[sys].[objects]
         WHERE  [type]                               IN ('U','V')
        UNION
		ALL
        SELECT 
                [id]          =   '1_'          +      CAST([object_id] AS VARCHAR(MAX))
              , [n]           =  '[forum_ResAnal].[dbo].'   + QUOTENAME([name]                     )
              , [type]
          FROM                    [forum_ResAnal]    .[sys].[objects]
         WHERE  [type]                               IN ('U','V')
        UNION
		ALL
        SELECT 
                [id]          =   '3_'              +      CAST([object_id] AS VARCHAR(MAX))
              , [n]           =  '[GRSHRcode].[dbo].'       + QUOTENAME([name]                     )
              , [type]
          FROM                    [GRSHRcode]        .[sys].[objects]
         WHERE  [type]                               IN ('U','V')
/*      *********************************************************************************************/
       )
  ,
   SED
    AS (
/*      *********************************************************************************************/
        SELECT 
                [ChildID]     =   '0_'
                                                   + CAST(     [referencing_id] AS VARCHAR(MAX))
              , [ParentID]    =   '0_'
                                                   + CAST(     [referenced_id]  AS VARCHAR(MAX))
              , [ParentName]  =                      QUOTENAME(
			                                            ISNULL([referenced_database_name],
                                  'forum'                                                         ))
                               +                     '.'
                               +                     QUOTENAME(
			                                            CASE
			                                            WHEN [referenced_schema_name] IS NULL THEN 'dbo'
			                                            WHEN [referenced_schema_name]  =  ''  THEN 'dbo'
                                                        ELSE [referenced_schema_name]          END       )
                               +                     '.'
                               +                     QUOTENAME([referenced_entity_name]            )
          FROM                    [forum]            .[sys].[sql_expression_dependencies]
         WHERE                                                 [referenced_entity_name] NOT IN
                                                                ('dtproperties', 'sysdiagrams')
        UNION
		ALL
        SELECT 
                [ChildID]     =   '1_'
                                                   + CAST(     [referencing_id] AS VARCHAR(MAX))
              , [ParentID]    =   '1_'
                                                   + CAST(     [referenced_id]  AS VARCHAR(MAX))
              , [ParentName]  =                      QUOTENAME(
			                                            ISNULL([referenced_database_name],
                                  'forum_ResAnal'                                                 ))
                               +                     '.'

                               +                     QUOTENAME(
			                                            CASE
			                                            WHEN [referenced_schema_name] IS NULL THEN 'dbo'
			                                            WHEN [referenced_schema_name]  =  ''  THEN 'dbo'
                                                        ELSE [referenced_schema_name]          END       )
                               +                     '.'
                               +                     QUOTENAME([referenced_entity_name]            )
          FROM                    [forum_ResAnal]    .[sys].[sql_expression_dependencies]
         WHERE                                                 [referenced_entity_name] NOT IN
                                                                ('dtproperties', 'sysdiagrams')
        UNION
		ALL
        SELECT 
                [ChildID]     =   '3_'
                                                   + CAST(     [referencing_id] AS VARCHAR(MAX))
              , [ParentID]    =   '3_'
                                                   + CAST(     [referenced_id]  AS VARCHAR(MAX))
              , [ParentName]  =                      QUOTENAME(
			                                            ISNULL([referenced_database_name],
                                  'GRSHRcode'                                                     ))
                               +                     '.'
                               +                     QUOTENAME(
			                                            CASE
			                                            WHEN [referenced_schema_name] IS NULL THEN 'dbo'
			                                            WHEN [referenced_schema_name]  =  ''  THEN 'dbo'
                                                        ELSE [referenced_schema_name]          END       )
                               +                     '.'
                               +                     QUOTENAME([referenced_entity_name]            )
          FROM                    [GRSHRcode]        .[sys].[sql_expression_dependencies]
         WHERE                                                 [referenced_entity_name] NOT IN
                                                                ('dtproperties', 'sysdiagrams')
/*      *********************************************************************************************/
       )
  ,
   RRC
    AS (
/*      *********************************************************************************************/
        SELECT 
                DISTINCT
                [ChildID]
		      , [ParentID]    =  ISNULL([ParentID]  , P.[id]) 
              , [ChildN]      =                       C.[n]
              , [ParentN]     =         [ParentName]
              , [ChildFullN]  =                       '( '
                                                    + C.[type]
                                                    + ')   '
                                                    + C.[n]
			                  COLLATE SQL_Latin1_General_CP1_CI_AS
              , [ParentFullN] =                       '( '
                                                    + P.[type]
                                                    + ')   '
                                                    + P.[n]
			                  COLLATE SQL_Latin1_General_CP1_CI_AS
          FROM  [SED] D
		  LEFT
		  JOIN  [SO]  C
            ON        C.[id]
			        = D.[ChildID]
		  LEFT
		  JOIN  [SO]  P
            ON        P.[n]
			        = D.[ParentName]
/*      *********************************************************************************************/
       )
 
  ,
   REL
    AS (
/*      *********************************************************************************************/
        SELECT 
                [eID] = [ChildID]
              , [ENT] = [ChildFullN]
              , [pID]   = [ParentID]
          FROM  [RRC]
        UNION
		ALL
        SELECT 
                DISTINCT
                [eID] = R1.[ParentID]
              , [ENT] = R1.[ParentFullN]
              , [pID]   = R2.[ChildID]        /* or NULL */
          FROM  [RRC]      R1
        LEFT
		JOIN
                [RRC]      R2
            ON
                R1.[ParentID]
              = R2.[ChildID]
         WHERE
                R2.[ChildID] IS NULL
/*      *********************************************************************************************/
       )

  ,
   xL
    AS (
/*      *********************************************************************************************/
-- Anchor member definition
        SELECT 
                A.[eID]
              , A.[ENT]
              , A.[pID]                                --Initial Subquery
              ,   [LEV] = 0                        --Expression to track level
          FROM    [REL]           A
         WHERE
                A.[pID] IS NULL
        UNION
        ALL                                          --Union All combining Anchor and Recursive queries
-- Recursive member definition
        SELECT 
                E.[eID]
              , E.[ENT]
              , E.[pID]                                --Recursive Subquery
              ,   [LEV] + 1             --Expression to track level (just a placeholder here)
          FROM    [REL]           E
        INNER
		 JOIN     [xL]    L
		  ON    E.[pID] = L.[eID]
/*      *********************************************************************************************/
       )

--        SELECT  * FROM    [xL]  /*



  ,
   L
    AS (
/*      *********************************************************************************************/
-- non-linkable
        SELECT 
                  *
              ,   [lnk] = 0
          FROM    [xL]
       UNION
	     ALL
-- linkable
        SELECT 
                  *
              ,   [lnk] = 1
          FROM    [xL]
/*      *********************************************************************************************/
       )
--  ,
--   RES
--    AS (
--/*      *********************************************************************************************/
---- Anchor member definition
        SELECT 
                   [L00].[eID]
                 , [L00].[ENT]
--               , [L00].[pID]
			     , [L00].[LEV]
                 , [L00].[ENT] AS [ENT00]
                 , [L01].[ENT] AS [ENT01]
			     , [L01].[LEV]
                 , [L02].[ENT] AS [ENT02]
			     , [L02].[LEV]
                 , [L03].[ENT] AS [ENT03]
			     , [L03].[LEV]
                 , [L04].[ENT] AS [ENT04]
			     , [L04].[LEV]
                 , [L05].[ENT] AS [ENT05]
			     , [L05].[LEV]
                 , [L06].[ENT] AS [ENT06]
			     , [L06].[LEV]
                 , [L07].[ENT] AS [ENT07]
			     , [L07].[LEV]
                 , [L08].[ENT] AS [ENT08]
			     , [L08].[LEV]
                 , [L09].[ENT] AS [ENT09]
			     , [L09].[LEV]
          FROM  [L] L00
     LEFT
     JOIN
                [L] L01
            ON 
                   [L00].[eID]
                 = [L01].[pID]
and
                   [L00].[lnk] = 0
     LEFT
     JOIN
                [L] L02
            ON 
                   [L01].[eID]
                 = [L02].[pID]
and
                   [L01].[lnk] = 0
     LEFT
     JOIN
                [L] L03
            ON 
                   [L02].[eID]
                 = [L03].[pID]
and
                   [L02].[lnk] = 0
     LEFT
     JOIN
                [L] L04
            ON 
                   [L03].[eID]
                 = [L04].[pID]
and
                   [L03].[lnk] = 0
     LEFT
     JOIN
                [L] L05
            ON 
                   [L04].[eID]
                 = [L05].[pID]
and
                   [L04].[lnk] = 0
     LEFT
     JOIN
                [L] L06
            ON 
                   [L05].[eID]
                 = [L06].[pID]
and
                   [L05].[lnk] = 0
     LEFT
     JOIN
                [L] L07
            ON 
                   [L06].[eID]
                 = [L07].[pID]
and
                   [L06].[lnk] = 0
     LEFT
     JOIN
                [L] L08
            ON 
                   [L07].[eID]
                 = [L08].[pID]
and
                   [L07].[lnk] = 0
     LEFT
     JOIN
                [L] L09
            ON 
                   [L08].[eID]
                 = [L09].[pID]
and
                   [L08].[lnk] = 0

WHERE
			       [L00].[LEV] = 0



--        SELECT 
--                   [L00].[eID]
--               ,   [L00].[ENT]
--               ,   [L00].[pID]
--			   ,   [L00].[LEV]
--          FROM  [L] L00




--ORDER BY [LEV];




--		ChildN	ParentN		ParentFullN



--SELECT EMPNO, ENAME, MGR                --Initial Subquery
--FROM EMP
--WHERE MGR IS NULL


/*






SELECT EMPNO, ENAME, MGR, LEVEL
FROM EMP
START WITH MGR IS NULL
CONNECT BY MGR = PRIOR EMPNO
ORDER SIBLINGS BY MGR;






*/


--ORDER BY C.[n],    [ParentName]