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
 
 /*
  ,
   LST
    AS (
/*      *********************************************************************************************/
        SELECT 
                DISTINCT
                [ID]
              , [N]
        FROM
       (
        SELECT 
                [ID]          =  [ChildID]
              , [N]           =  [ChildFullN]
          FROM  [RRC]
          UNION
          ALL
        SELECT 
                [ID]          =  [ParentID]
              , [N]           =  [ParentFullN]
          FROM  [RRC]
       )  prelist
/*      *********************************************************************************************/
       )
  ,
   REL
    AS (
/*      *********************************************************************************************/
        SELECT 
                [IDc]         =  [ChildID]
		      , [IDp]         =  [ParentID]
          FROM  [RRC]
/*      *********************************************************************************************/
       )
 
 
  --,
  -- REL
  --  AS (
/*      *********************************************************************************************/
        SELECT 
                [ID]
              , [N]
,R01.[IDc]
,R02.[IDp]
          FROM  [LST]
        LEFT
		JOIN
                [REL]            R01
            ON
                [ID] = R01.[IDc]
        LEFT
		JOIN
                [REL]            R02
            ON
                [ID] = R02.[IDp]
/*      *********************************************************************************************/
       )
/*      *********************************************************************************************/
*/

  ,
   EMP
    AS (
/*      *********************************************************************************************/
        SELECT 
                [eID] = [ChildID]
              , [ENAME] = [ChildFullN]
              , [pID]   = [ParentID]
          FROM  [RRC]
        UNION
		ALL
        SELECT 
                DISTINCT
                [eID] = R1.[ParentID]
              , [ENAME] = R1.[ParentFullN]
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
   OURCTE
    AS (
/*      *********************************************************************************************/


-- Anchor member definition
        SELECT 
                A.[eID]
              , A.[ENAME]
              , A.[pID]                                --Initial Subquery
			   




    --SELECT e.ManagerID, e.EmployeeID, e.Title, ---edh.DepartmentID, 
    --    0 AS Level
   
   
   
    --FROM dbo.MyEmployees AS e
    --WHERE ManagerID IS NULL
    --UNION ALL


              , [EMPLEVEL] = 0                        --Expression to track level
          FROM  [EMP]           A
         WHERE
                A.[pID] IS NULL
        UNION
        ALL                                          --Union All combining Anchor and Recursive queries

-- Recursive member definition


    --SELECT e.ManagerID, e.EmployeeID, e.Title,---- edh.DepartmentID,
    --    Level + 1
    --FROM dbo.MyEmployees AS e

    --INNER JOIN DirectReports AS d
    --    ON e.ManagerID = d.EmployeeID



        SELECT 
                E.[eID]
              , E.[ENAME]
              , E.[pID]                                --Recursive Subquery
              ,   [EMPLEVEL] + 1             --Expression to track level (just a placeholder here)
          FROM    [EMP]           E
        INNER
		 JOIN     [OURCTE] CTE
		  ON    E.[pID] = CTE.[eID]
         --WHERE
         --       E.[MGR] IS NOT NULL





/*      *********************************************************************************************/
       )





        SELECT 
                 [eID]
              ,  [ENAME]
              ,  [pID]
			  , [EMPLEVEL]
FROM OURCTE 
ORDER BY [EMPLEVEL];




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