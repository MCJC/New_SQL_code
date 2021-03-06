/**********************************************************************************************************************************************************/
/*****                                              BackUp current Tables                                                                             *****/
/**********************************************************************************************************************************************************/
  USE [forum]
GO
/**********************************************************************************************************************************************************/
  --DECLARE @CrDt    varchar( 8)
  --SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Answer_NoStd_' + @CrDt + ']
--                FROM      [forum].[dbo].[Pew_Answer_NoStd]'               )
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Nation_Answer_' + @CrDt + ']
--                FROM      [forum].[dbo].[Pew_Nation_Answer]'               )
/**********************************************************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
IF OBJECT_ID('tempdb..#CODE_A') IS NOT NULL   DROP TABLE #CODE_A
IF OBJECT_ID('tempdb..#CODE_B') IS NOT NULL   DROP TABLE #CODE_B
IF OBJECT_ID('tempdb..#CODE_C') IS NOT NULL   DROP TABLE #CODE_C
IF OBJECT_ID('tempdb..#CODE_X') IS NOT NULL   DROP TABLE #CODE_X
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
GO



/* 
From: Katayoun Kishi 
Sent: Thursday, July 28, 2016 11:47 AM
Subject: Syria 2013
 
Hi Juan Carlos,
 
Sorry to add something new!
Could you change the value for GRX_22_01 from 1 to 0 for Syria in 2013?
All the rest of the changes were for 2014 and look good,
I should have made it clearer that we needed this one change for 2013 as well.
I believe since it is going from 1 to 0 you shouldn’t have to worry
about adding source text. Let me know if that’s ok! 
Thanks,
Katayoun
*/



/**********************************************************************************************************************************************************/
/*                                                                                                                                                        */
/*                                                  M  E  T  A  C  O  D  E           Q  U  E  R  I  E  S                                                  */
/*                                                                                                                                                        */
/**********************************************************************************************************************************************************/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-    CODE EXTRACTION QUERY FROM CORRECTIONS SPREADSHEET TYPE A: {  >0 to  0  }     ---------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT * INTO #CODE_A FROM (
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
 SELECT
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
[code3] =
'
DELETE
  FROM [Pew_Answer_NoStd]
  WHERE        [Answer_pk]                       = '   + CAST(cDB.[Answer_fk]     AS NVARCHAR(MAX))  + '

'
,
[code4] =
'
UPDATE [Pew_Nation_Answer] 
    SET                     [Answer_fk]          = '   + CAST(rA2.[Answer_pk]     AS NVARCHAR(MAX))  + '
  WHERE                     [Nation_answer_pk]   = '   + CAST(cDB.[link_fk]       AS NVARCHAR(MAX))  + '

'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [clk_Nation_answer_pk]              =   clk.[Nation_answer_pk]
      , [clk_Nation_fk]                     =   clk.[Nation_fk]
      , [clk_Answer_fk]                     =   clk.[Answer_fk]
      , [clk_display]                       =   clk.[display]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [nuV_c]                             =   nuV.[c]
      , [nuV_y]                             =   nuV.[y]
      , [nuV_q]                             =   nuV.[q]
      , [nuV_v]                             =   nuV.[v]
      , [nuV_nv]                            =   nuV.[nv]
      , [nuV_nW]                            =   '------'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [cDB_entity]                        =   cDB.[entity]
      , [cDB_QA_fk]                         =   cDB.[QA_fk]
      , [cDB_link_fk]                       =   cDB.[link_fk]
      , [cDB_Nation_fk]                     =   cDB.[Nation_fk]
      , [cDB_Locality_fk]                   =   cDB.[Locality_fk]
      , [cDB_Religion_fk]                   =   cDB.[Religion_fk]
      , [cDB_Region5]                       =   cDB.[Region5]
      , [cDB_Region6]                       =   cDB.[Region6]
      , [cDB_Ctry_EditorialName]            =   cDB.[Ctry_EditorialName]
      , [cDB_Locality]                      =   cDB.[Locality]
      , [cDB_Religion]                      =   cDB.[Religion]
      , [cDB_Question_Year]                 =   cDB.[Question_Year]
      , [cDB_QA_std]                        =   cDB.[QA_std]
      , [cDB_QW_std]                        =   cDB.[QW_std]
      , [cDB_Answer_value]                  =   cDB.[Answer_value]
      , [cDB_Answer_value_Std]              =   cDB.[Answer_value_Std]
      , [cDB_Answer_value_NoStd]            =   cDB.[Answer_value_NoStd]
      , [cDB_answer_wording]                =   cDB.[answer_wording]
      , [cDB_answer_wording_std]            =   cDB.[answer_wording_std]
      , [cDB_Data_source_name]              =   cDB.[Data_source_name]
      , [cDB_Question_Std_fk]               =   cDB.[Question_Std_fk]
      , [cDB_Question_fk]                   =   cDB.[Question_fk]
      , [cDB_Answer_Std_fk]                 =   cDB.[Answer_Std_fk]
      , [cDB_Answer_fk]                     =   cDB.[Answer_fk]
      , [cDB_AnswerSet_number]              =   cDB.[AnswerSet_number]
      , [cDB_Question_wording_std]          =   cDB.[Question_wording_std]
      , [cDB_Question_wording]              =   cDB.[Question_wording]
      , [cDB_Question_abbreviation]         =   cDB.[Question_abbreviation]
      , [cDB_NA_by_set_of_Answers]          =   cDB.[NA_by_set_of_Answers]
      , [cDB_Full_set_of_Answers]           =   cDB.[Full_set_of_Answers]
      , [cDB_Display_by_StdQ]               =   cDB.[Display_by_StdQ]
      , [cDB_Display_by_NoSQ]               =   cDB.[Display_by_NoSQ]
      , [cDB_Display_by_Ans]                =   cDB.[Display_by_Ans]
      , [cDB_Editorially_Checked]           =   cDB.[Editorially_Checked]
      , [cDB_Notes]                         =   cDB.[Notes]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
      , [rA2_Answer_pk]                     =   rA2.[Answer_pk]
      , [rA2_Answer_value_NoStd]            =   rA2.[Answer_value_NoStd]
      , [rA2_Answer_Wording]                =   rA2.[Answer_Wording]
      , [rA2_Answer_Std_fk]                 =   rA2.[Answer_Std_fk]
      , [rA2_Question_fk]                   =   rA2.[Question_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  FROM 
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
       [forum].[dbo].[Pew_Nation_Answer]                                                          clk
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     ,(
	          SELECT [c] = 'Syria'   , [y] = 2013, [q] = 'GRX_22_01' , [v] = '1',[nv] = 0 
      )                                                                                           nuV
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     , [forum_ResAnal].[dbo].[vr___01_cDB_Long__NoAggregated]                                     cDB
     , [forum].[dbo].[Pew_Answer_NoStd]                                                           rA2
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
WHERE
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        clk.[Nation_answer_pk]
      = cDB.[link_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
     (      cDB.[Ctry_EditorialName]  = nuV.[c]
        AND cDB.[Question_Year]       = nuV.[y]
        AND cDB.[QA_std]              = nuV.[q]
        AND cDB.[Answer_value]        = nuV.[v]  )
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        cDB.[Question_fk]
      = rA2.[Question_fk]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
  AND
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
        nuV.[nv]
      = rA2.[Answer_value_NoStd]
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                                                                                                                 ) QCODE_A
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/**********************************************************************************************************************************************************/
/*-    CODE EXTRACTION QUERY FROM CORRECTIONS SPREADSHEET TYPE B: {  >0 to >0  }     ---------------------------------------------------------------------*/
/**********************************************************************************************************************************************************/
/*-    CODE EXTRACTION QUERY FROM CORRECTIONS SPREADSHEET TYPE C: {   0 to >0  }     ---------------------------------------------------------------------*/
/**********************************************************************************************************************************************************/
    SELECT [code4] 
      INTO [#CODE_X]
      FROM (
                   SELECT [code4] FROM [#CODE_A]
           ) A_AND_C
/**********************************************************************************************************************************************************/
declare @ALLCODE nvarchar(max)
/**********************************************************************************************************************************************************/
set     @ALLCODE = 
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'
/*  THIS IS THE CODE TO BE EXECUTED                                                             */

/*  1.    CHANGES IN [Pew_Answer_NoStd]                                                         */
/*  1.1.  ADD ROWS COORESPONDING TO NEW NO-STD ANSWERS (not coded before)                       */

/*  1.2.  CHANGE NON-ZERO NO-STD ANSWERS TO DIFFERENT NON-ZERO VALUES                           */

/*  1.3.  DELETE ROWS COORESPONDING TO NON-ZERO NO-STD ANSWERS WHICH ARE NOT NEEDED ANY MORE    */

'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
(                                                                                /*** parenthesis to include query for the cell to be stuffed           ***/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view ********************************************************/
    SELECT [code3] FROM [#CODE_A]                                                /*** selection statemet                                                ***/
                   for xml path('')                                              /*** nesting all selected cells into a unique XML string cell          ***/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields **********************************************************************/
, type).value('.', 'nvarchar(max)')                                              /*** parenth + datatype & escaped whitespace chs (avoids XML datatype) ***/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'

/*  2.    CHANGES IN [Pew_Nation_Answer]                                                         */
/*  2.1.  CHANGE ANSWER TO ADDED ANSWERS OR ZERO VALUES (non-zero to non-zero keep answer key)  */

'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
(                                                                                /*** parenthesis to include query for the cell to be stuffed           ***/
/*** Begin selection (into text, in a cell) of a comma delimited list of fields from a system view ********************************************************/
    SELECT [code4] FROM [#CODE_X]                                                /*** selection statement                                               ***/
                   for xml path('')                                              /*** nesting all selected cells into a unique XML string cell          ***/
/*** End of the selection (into text, in a cell) of a comma delimited list of fields **********************************************************************/
, type).value('.', 'nvarchar(max)')                                              /*** parenth + datatype & escaped whitespace chs (avoids XML datatype) ***/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
+
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
N'
/*  THE CODE TO BE EXECUTED ENDS HERE !!!                                                       */
'
/*--------------------------------------------------------------------------------------------------------------------------------------------------------*/
/***************************************************************************************************************************************************************/
/*** checking / executing SQL statement that has been stored as a string variable ******************************************************************************/
--	EXEC dbo.LongPrint @ALLCODE                                     /***        display the currently stored code (to be executed)                           ***/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
	EXEC              (@ALLCODE)                                    /***        execute the code that has been stored as text                                ***/
/***************************************************************************************************************************************************************/
GO
/***************************************************************************************************************************************************************/
----SELECT * FROM  #CODE_A
----SELECT * FROM  #CODE_B
----SELECT * FROM  #CODE_C
/***************************************************************************************************************************************************************/


