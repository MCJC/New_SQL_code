/***************************************************************************************************************************************************************/
Print 
'--- ' + CONVERT (VARCHAR(19), SYSDATETIME()) + ' ==>  script 2.007    ---------------------------------------------------------------------------------------- '
/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the VIEW   [GRSHRcode].[dbo].[v07_CodedNoAggregated]                                            <<<<<     ***/
/***                                    as well as the TABLE  [GRSHRcode].[dbo].[T07_CodedNoAggregated]                                                      ***/
/***                                                                                                                                                         ***/
/***                                                                                                                                                         ***/
/***                    -  The table should be the source for loading data because the view is dinamically updated                                           ***/
/***                                                                                                                                                         ***/
/***                                                                                                                                                         ***/
/***                                               |                 W                 |                F D                |                                 ***/
/***                                               |        working environment        |            final  data            |                                 ***/
/***                     --------------------------+-----------------------------------+-----------------------------------+                                 ***/
/***                                    database:  |            [GRSHRcode]            |          [forum_ResAnal]          |                                 ***/
/***                     --------------------------+-----------------------------------+-----------------------------------+                                 ***/
/***                               1st step view:  |  [v07_CodedNoAggregated]          |                                   |                                 ***/
/***                     --------------------------+-----------------------------------+-----------------------------------+                                 ***/
/***                       2nd step lookup table:  |  [T07_CodedNoAggregated]          |                                   |                                 ***/
/***                     --------------------------+-----------------------------------+-----------------------------------+                                 ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [forum_ResAnal]
GO
/***************************************************************************************************************************************************************/
If(OBJECT_ID('tempdb..#t') Is Not Null)  Drop Table #t;
/***************************************************************************************************************************************************************/
WITH BT AS
(
          SELECT [Ctry_EditorialName] = 'Equatorial Guinea'         , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_02', [Answer_Value] = '0.75'  , [NewVal] = 0       , [seq] = 1
UNION ALL SELECT [Ctry_EditorialName] = 'Mongolia'                  , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_02', [Answer_Value] = '0.5'   , [NewVal] = 0       , [seq] = 2
UNION ALL SELECT [Ctry_EditorialName] = 'Indonesia'                 , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_02', [Answer_Value] = '0.5'   , [NewVal] = 0       , [seq] = 3
UNION ALL SELECT [Ctry_EditorialName] = 'Central African Republic'  , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 4
UNION ALL SELECT [Ctry_EditorialName] = 'Ethiopia'                  , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 5
UNION ALL SELECT [Ctry_EditorialName] = 'Guinea'                    , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 6
UNION ALL SELECT [Ctry_EditorialName] = 'Tanzania'                  , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 7
UNION ALL SELECT [Ctry_EditorialName] = 'Bahamas'                   , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 8
UNION ALL SELECT [Ctry_EditorialName] = 'Cyprus'                    , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 9
UNION ALL SELECT [Ctry_EditorialName] = 'El Salvador'               , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 10
UNION ALL SELECT [Ctry_EditorialName] = 'Lebanon'                   , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 11
UNION ALL SELECT [Ctry_EditorialName] = 'Mauritius'                 , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 12
UNION ALL SELECT [Ctry_EditorialName] = 'Nigeria'                   , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 13
UNION ALL SELECT [Ctry_EditorialName] = 'Singapore'                 , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 14
UNION ALL SELECT [Ctry_EditorialName] = 'Tajikistan'                , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0       , [seq] = 15
UNION ALL SELECT [Ctry_EditorialName] = 'Vanuatu'                   , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0.33    , [seq] = 16
UNION ALL SELECT [Ctry_EditorialName] = 'Kyrgyzstan'                , [Question_Year] = 2015, [QA_std] = 'GRI_20_01_x_01', [Answer_Value] = '0.67'  , [NewVal] = 0       , [seq] = 17
)
/***************************************************************************************************************************************************************/
SELECT
                                                                     [BT].[seq]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [as_Answer_Std_pk]                                         = [v1].[Answer_Std_fk]
      , [as_AnswerSet_number]                                      = [v1].[AnswerSet_number]
      , [as_Answer_value_std]                                      = [v1].[Answer_value_Std]
      , [as_Answer_Wording_std]                                    = [v1].[answer_wording_std]
      , [as_Full_set_of_Answers]                                   = [v1].[Full_set_of_Answers]
      , [as_NA_by_set_of_Answers]                                  = [v1].[NA_by_set_of_Answers]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [ar_Answer_pk]                                             = [v1].[Answer_fk]
      , [ar_Answer_value_NoStd]                                    = [v1].[Answer_value_NoStd]
      , [ar_Answer_Wording]                                        = [v1].[answer_wording]
      , [ar_Answer_Std_fk]                                         = [v1].[Answer_Std_fk]
	  , [nw_Answer_Std_fk]                                         =
                                                         CASE WHEN   [BT].[NewVal]                  <> 0
                                                              THEN   [AS].[Answer_Std_pk]
                                                          END
      , [ar_Question_fk]                                           = [v1].[Question_fk]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [na_Nation_answer_pk]                                      = [v1].[link_fk]
      , [na_Nation_fk]                                             = [v1].[Nation_fk]
      , [na_Answer_fk]                                             = [v1].[Answer_fk]
	  , [nw_Answer_fk]                                             =
                                                         CASE WHEN   [BT].[NewVal]                   = 0
                                                              THEN   [AR].[Answer_pk]
                                                          END
 --   , [na_display]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
      ,                                                              [v1].[entity]
      ,                                                              [v1].[Ctry_EditorialName]
      ,                                                              [v1].[Question_Year]
      ,                                                              [v1].[QA_std]
      , [v1_Answer_value]                                          = [v1].[Answer_value]
      , [bt_Answer_value]                                          = [BT].[Answer_value]
	  ,                                                              [BT].[NewVal]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
  INTO                                                               [#t]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
  FROM                                                               [BT]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
		 INNER
		  JOIN [forum_ResAnal].[dbo].[vr___01_]                      [v1]
			ON
			   [v1].[Ctry_EditorialName]
			  =[bt].[Ctry_EditorialName]
		  AND
			   [v1].[Question_Year]
			  =[bt].[Question_Year]
		  AND
			   [v1].[QA_std]
			  =[bt].[QA_std]
		  --AND
		  --     [v1].[Answer_value]
		  --    =[bt].[Answer_value]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*    link to no-std zeroes for CHANGES FROM NON ZERO TO ZERO                                                                                                  */
/*    => will change in Pew_Nation_Answer table --- recode [Answer_fk] to be linked to the corresponding zero.                                                 */
/*    => will change in Pew_Answer_NoStd  table --- delete rows corresponding to the non-zero values (no further linked).                                      */
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
  LEFT 
  JOIN  (SELECT * FROM
        [forum]..[Pew_Answer_NoStd]
		WHERE [Answer_value_NoStd] = 0 )                             [ar]
    ON  [ar].[Answer_value_NoStd]
      = [BT].[NewVal]
   AND  [ar].[Question_fk]
      = [v1].[Question_fk]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*    link to std non-zero for CHANGES FROM NON ZERO TO NON ZERO                                                                                               */
/*    => will change in Pew_Answer_NoStd  table --- recode [Answer_value_NoStd] to the new value.                                                              */
/*                                              --- recode [Answer_Std_fk] to be linked to the corresponding std answer.                                       */
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
  LEFT 
  JOIN  [forum]..[Pew_Answer_Std]                                    [as]
    ON  [as].[Answer_value_Std]
      = [BT].[NewVal]
   AND  [as].[AnswerSet_number]
      = [v1].[AnswerSet_number]
/*    ---------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
/*  -- PERFORMED TESTS --                                                                                                                                      */
/***************************************************************************************************************************************************************/
/*  -- =>  unique in NA_pk & Ar_pk - because NO current value is zero and they have text                                                                       */
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*  -- =>  unique in NA_pk         - because NO current value is zero and they have text
           SELECT DISTINCT [na_Nation_answer_pk] FROM [#t]
                                                                                                                                                               */
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*  -- =>  unique            Ar_pk - because NO current value is zero and they have text
           SELECT DISTINCT [aR_Answer_pk] FROM [#t]
                                                                                                                                                               */
/***************************************************************************************************************************************************************/
/*  -- =>  unique link of Ar_pk    - because NO current value is zero and they have text
           SELECT          *
             FROM                                             [#t]
                         , [forum_ResAnal].[dbo].[vr___01_]   [v1]
            WHERE          [v1].[Answer_fk]
                         =   [ar_Answer_pk]
         ORDER BY            [seq]
                                                                                                                                                               */
/***************************************************************************************************************************************************************/
/*  -- =>  unique in NA
           SELECT * FROM [forum].[dbo].[Pew_Nation_Answer]
                   WHERE                   [Nation_Answer_pk] 
                      IN (SELECT        [na_Nation_Answer_pk] FROM [#t])
                                                                                                                                                               */
/***************************************************************************************************************************************************************/
/*  -- =>  unique in Ar - because NO current value is zero and they have text
           SELECT * FROM [forum].[dbo].[Pew_Answer_NoStd]
                   WHERE                   [Answer_pk] 
  		              IN (SELECT        [aR_Answer_pk] FROM [#t])
                                                                                                                                                               */
/***************************************************************************************************************************************************************/
/*  -- =>  check ACTUAL zero values - if NO current value is zero
           SELECT * FROM [forum_ResAnal].[dbo].[vr___01_]   [v1]
            WHERE                                           [v1].[Answer_value] = 0
              AND                                           [v1].[Question_fk]
               IN        (SELECT DISTINCT                     [ar_Question_fk] FROM [#t])
                                                                                                                                                               */
/***************************************************************************************************************************************************************/


/***************************************************************************************************************************************************************/
/***          BACKUP                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
  DECLARE  @CrDt    varchar( 8)
  DECLARE  @TofI    varchar(50)
  SET      @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
  DECLARE  MyCursor
  CURSOR FOR      SELECT 'Pew_Answer_NoStd'
            UNION SELECT 'Pew_Nation_Answer'
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
   OPEN    MyCursor
	FETCH  NEXT
	FROM   MyCursor
	INTO   @TofI
	WHILE  @@FETCH_STATUS = 0
	BEGIN
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--           EXEC ( ' SELECT *
--                    INTO   [_bk_forum].[dbo].[' + @TofI + '_' + @CrDt + ']
--                    FROM       [forum].[dbo].[' + @TofI               + ']' )
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	FETCH  NEXT
	FROM   MyCursor
	INTO   @TofI
    END
    CLOSE  MyCursor
DEALLOCATE MyCursor
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/


/***************************************************************************************************************************************************************/
/***  [Pew_Nation_Answer]                                                                                                                                    ***/
/*    => recode [Answer_fk] to be linked to the corresponding zero for CHANGES FROM NON ZERO TO ZERO                                                           */
/***************************************************************************************************************************************************************/
	UPDATE
           [forum].[dbo].[Pew_Nation_Answer]
	SET                                               [Answer_fk]       = [#t].[nw_Answer_fk]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--select *
FROM
           [forum].[dbo].[Pew_Nation_Answer]                           AS [db]
 JOIN                                                                     [#t]
ON
           [db].   [Nation_answer_pk]
       =   [#t].[na_Nation_answer_pk]
WHERE      [#t].[v1_Answer_value]                                       > 0.00
  AND      [#t].[NewVal]                                                = 0.00
  AND      [db].[Answer_fk]
        <> [#t].[nw_Answer_fk]
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/


/***************************************************************************************************************************************************************/
/***  [Pew_Answer_NoStd]                                                                                                                                     ***/
/*    => recode [Answer_value_NoStd] to the new value for CHANGES FROM NON ZERO TO NON ZERO                                                                    */
/*    => recode [Answer_Std_fk] to be linked to the corresponding std answer for CHANGES FROM NON ZERO TO NON ZERO                                             */
/***************************************************************************************************************************************************************/
	UPDATE
           [forum].[dbo].[Pew_Answer_NoStd]
	SET                                            [Answer_value_NoStd] = [#t].[NewVal]
	                                             , [Answer_Std_fk]      = [#t].[nw_Answer_Std_fk]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--select *
FROM
           [forum].[dbo].[Pew_Answer_NoStd]                            AS [db]
 JOIN                                                                     [#t]
ON
           [db].   [Answer_pk]
       =   [#t].[ar_Answer_pk]
WHERE      [#t].[v1_Answer_value]                                       > 0.00
  AND      [#t].[NewVal]                                                > 0.00
  AND      [db].[Answer_value_NoStd]
        <> [#t].[NewVal]
  AND      [db].[Answer_Std_fk]
        <> [#t].[nw_Answer_Std_fk]
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
/***************************************************************************************************************************************************************/
/***  [Pew_Answer_NoStd]                                                                                                                                     ***/
/*    => delete rows corresponding to the non-zero values (no further linked) for CHANGES FROM NON ZERO TO ZERO                                                */
/***************************************************************************************************************************************************************/
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--	DELETE                                                                [db]                                      /* deletion statement!                     */
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--select *
FROM
           [forum].[dbo].[Pew_Answer_NoStd]                            AS [db]
 JOIN                                                                     [#t]
ON
           [db].   [Answer_pk]
       =   [#t].[ar_Answer_pk]
WHERE      [#t].[v1_Answer_value]                                       > 0.00
  AND      [#t].[NewVal]                                                = 0.00
  AND      [db].[Answer_value_NoStd]
        <> [#t].[NewVal]
  AND      [#t].[nw_Answer_Std_fk]                                        IS NULL
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
