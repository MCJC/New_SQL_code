USE [GRSHRcode]
GO

/****** Object:  UserDefinedFunction [dbo].[GetAncestors]    Script Date: 2/7/17 11:43:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****************************************************************************************************/
----DECLARE @ChildName    VarChar(MAX)
----SET     @ChildName    =  '[forum].[dbo].[Pew_Answer]';
/****************************************************************************************************/
ALTER FUNCTION [dbo].[GetAncestors](
                              @ChildName  VarChar(MAX)
                                                          )
  RETURNS @result TABLE (
                              [sort]        INT
                            , [child]       VarChar(MAX)
                            , [lvl]         INT
                            , [through]     VarChar(MAX)
                            , [ancestors]   VarChar(MAX)
                            , [tree]        VarChar(MAX)
                            , [ChildID]     VarChar(MAX)
                            , [ParentID]    VarChar(MAX)
                            , [ChildFullN]  VarChar(MAX)
                            , [ParentFullN] VarChar(MAX)
                                                         )
  AS
  BEGIN
/****************************************************************************************************/
  ;
/****************************************************************************************************/
  WITH
    SO
    AS (
/*      *********************************************************************************************/
        SELECT 
                [id]          =   'forum_'                  +      CAST([object_id] AS VARCHAR(MAX))
              , [n]           =  '[forum].[dbo].'           + QUOTENAME([name]                     )
              , [type]
          FROM                    [forum]            .[sys].[objects]
         WHERE  [type]                               IN ('U','V')
        UNION
		ALL
        SELECT 
                [id]          =   'forum_ResAnal_'          +      CAST([object_id] AS VARCHAR(MAX))
              , [n]           =  '[forum_ResAnal].[dbo].'   + QUOTENAME([name]                     )
              , [type]
          FROM                    [forum_ResAnal]    .[sys].[objects]
         WHERE  [type]                               IN ('U','V')
        UNION
		ALL
        SELECT 
                [id]          =   'GRSHRcode_'              +      CAST([object_id] AS VARCHAR(MAX))
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
                [ChildID]     =   'forum_'
                                                   + CAST(     [referencing_id] AS VARCHAR(MAX))
              , [ParentID]    =   'forum_'
                                                   + CAST(     [referenced_id]  AS VARCHAR(MAX))
              , [ParentName]  =                      QUOTENAME(
			                                            ISNULL([referenced_database_name],
                                  'forum'                                                         ))
                               +                     '.'
                               +                     QUOTENAME(
			                                            ISNULL([referenced_schema_name]  , 'dbo'  ))
                               +                     '.'
                               +                     QUOTENAME([referenced_entity_name]            )
          FROM                    [forum]            .[sys].[sql_expression_dependencies]
         WHERE                                                 [referenced_entity_name] NOT IN
                                                                ('dtproperties', 'sysdiagrams')
        UNION
		ALL
        SELECT 
                [ChildID]     =   'forum_ResAnal_'
                                                   + CAST(     [referencing_id] AS VARCHAR(MAX))
              , [ParentID]    =   'forum_ResAnal_'
                                                   + CAST(     [referenced_id]  AS VARCHAR(MAX))
              , [ParentName]  =                      QUOTENAME(
			                                            ISNULL([referenced_database_name],
                                  'forum_ResAnal'                                                 ))
                               +                     '.'
                               +                     QUOTENAME(
			                                            ISNULL([referenced_schema_name]  , 'dbo'  ))
                               +                     '.'
                               +                     QUOTENAME([referenced_entity_name]            )
          FROM                    [forum_ResAnal]    .[sys].[sql_expression_dependencies]
         WHERE                                                 [referenced_entity_name] NOT IN
                                                                ('dtproperties', 'sysdiagrams')
        UNION
		ALL
        SELECT 
                [ChildID]     =   'GRSHRcode_'
                                                   + CAST(     [referencing_id] AS VARCHAR(MAX))
              , [ParentID]    =   'GRSHRcode_'
                                                   + CAST(     [referenced_id]  AS VARCHAR(MAX))
              , [ParentName]  =                      QUOTENAME(
			                                            ISNULL([referenced_database_name],
                                  'GRSHRcode'                                                     ))
                               +                     '.'
                               +                     QUOTENAME(
			                                            ISNULL([referenced_schema_name]  , 'dbo'  ))
                               +                     '.'
                               +                     QUOTENAME([referenced_entity_name]            )
          FROM                    [GRSHRcode]        .[sys].[sql_expression_dependencies]
         WHERE                                                 [referenced_entity_name] NOT IN
                                                                ('dtproperties', 'sysdiagrams')
/*      *********************************************************************************************/
       )
  ,
   OBJ
    AS (
/*      *********************************************************************************************/
        SELECT 
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
   CTE
    AS (
/*      *********************************************************************************************/
        SELECT 
                [lvl]         =  1
              , [ChildN]
			  , [ParentN]
			  , [ChildID]
              , [ParentID]
              , [ChildFullN]
              , [ParentFullN]
        FROM  [OBJ] 
		WHERE [ChildN] = @ChildName
        UNION ALL 
        SELECT
             p.[lvl] + 1 
           , c.[ChildN]
           , c.[ParentN]
           , c.[ChildID]
           , c.[ParentID]
		   , c.[ChildFullN]
		   , c.[ParentFullN]
        FROM [CTE] P 
       INNER
	    JOIN [OBJ] C
		  ON  P.[ParentID] 
		    = C.[ChildID]
/*      *********************************************************************************************/
       )
/*  *************************************************************************************************/
  INSERT INTO @result (
                         [sort]
                       , [child]
                       , [lvl]
                       , [through]
                       , [ancestors]
                       , [tree]
                       , [ChildID]
                       , [ParentID]
                       , [ChildFullN]
                       , [ParentFullN]
                                                    )
/*  *************************************************************************************************/
    SELECT 
             [sort]        =   ROW_NUMBER()
                               OVER(ORDER BY
                                               [lvl]
                                             , [ChildN]
                                             , [ParentN]
                                                         )
           , [child]       =   @ChildName
           , [lvl]
           , [through]     =   CASE
                               WHEN [ChildN] = @ChildName
                               THEN ''
                               ELSE [ChildFullN]
                                END
           , [ancestors]    =  [ParentN]
           , [tree]         =  '<-'
                             + REPLICATE('-',(lvl * 4))
                             + ']  '
                             + LEFT('                                                ',(48-(lvl * 4))) 
                             + [ParentFullN]
           , [ChildID]
           , [ParentID]
           , [ChildFullN]
           , [ParentFullN]
    FROM     [CTE]
/*  *************************************************************************************************/
    OPTION (maxrecursion 0)
/*  *************************************************************************************************/
--    ORDER BY [lvl], [ChildN], [ParentN]
/*  *************************************************************************************************/
    RETURN 
END
/****************************************************************************************************/
--	SELECT * FROM [dbo].[GetAncestors](TableName/@tablename)
--	SELECT * FROM [dbo].[GetAncestors]('[GRSHRcode].[dbo].[v07_CodedNoAggregated]')
--	SELECT * FROM [dbo].[GetAncestors]('[forum].[dbo].[Pew_Answer]')

/****************************************************************************************************/



GO


