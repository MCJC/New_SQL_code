/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
USE [forum]
GO
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Question_NoStd_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Question_NoStd]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
-- Remove data linked to NorthernCyprus
/**************************************************************************************************************************/
/**************************************************************************************************************************/
/* >>     test and remove RLS DATA ****************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	DELETE                                     T                               /* deletion statement!                     */
/*------------------------------------------------------------------------------------------------------------------------*/
--	SELECT *                                                                   /* TEST number of linked rows to delete... */
/*------------------------------------------------------------------------------------------------------------------------*/
  FROM                                                                         /*                                         */
       [forum].[dbo].[Pew_Question_NoStd]      T                               /* TEST number of rows...                  */
     , [forum].[dbo].[Pew_Answer_NoStd]                                        /*                                         */
 WHERE               [Question_pk]                                             /*                                         */
                   = [Question_fk]                                             /*                                         */
               AND   (    [Answer_pk]        = 3663                            /*                                         */
                       OR [Question_pk]      =  422   )                        /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
/* <<     test and remove RLS DATA ****************************************************************************************/
/**************************************************************************************************************************/
-- deleted data:
/*
Answer_pk
3663
Answer_value_NoStd
233.00
Answer_Wording
FH 2010 - Greek Orthodox and Catholic residents cannot vote.
Answer_Std_fk
-1
Question_fk
422
Question_pk
422
Question_abbreviation
G23a
Question_wording
Explain
Question_Year
2010
Notes
July 2009 - June 2010
Data_source_fk
27
Question_Std_fk
116
Question_Std_pk
116
Question_abbreviation_std
GRX_23_a
Question_wording_std
Explain how public expressions of faith or religiously based socio-political arguments restricted by any level of government.
Question_short_wording_std
Explain how the government restricts expressions of faith or religion-related speech.
Display
0
AnswerSet_num
-9
Editorially_Checked
Yes
Question_Label_80Chars
Explain how the government restricts expressions of faith or religion-related speech.
*//**************************************************************************************************************************/
