/**************************************************************************************************************************/
USE [forum]
GO
/**************************************************************************************************************************/
/*****                                                    STEP 000                                                    *****/
/*****                                           BackUp  current Table(s)                                             *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT * INTO  [_bk_forum].[dbo].[Pew_Question_Std' + '_' + @CrDt + ']
                  FROM      [forum].[dbo].[Pew_Question_Std]'                      )
/**************************************************************************************************************************/
/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
--	INSERT INTO                                                                /* insert statement                        */
--	              [Pew_Question_Std]                                           /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* select statement...                     */
/*------------------------------------------------------------------------------------------------------------------------*/
       [Question_Std_pk]            =    1                                     /* number all rows                         */
                                      + (SELECT MAX([Question_Std_pk])         /* add currently max pk                    */
                                           FROM [Pew_Question_Std])            /* from StdQuestions                       */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_abbreviation_std]  = 'SHI_11_b'
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_wording_std]       = 'Were women harassed for violating religious dress codes?'
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_short_wording_std] = 'Were women harassed for violating religious dress codes?'
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Display]                    = 0                                        /* set display to zero (provisionally)     */
/*------------------------------------------------------------------------------------------------------------------------*/
	  ,[AnswerSet_num]              = 47                                       /*                                         */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Editorially_Checked]        = 'NO!'                                    /* label as not editorially checked        */
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[Question_Label_80Chars]     = 'Were women harassed for violating religious dress codes?'
/*------------------------------------------------------------------------------------------------------------------------*/
      ,[In_PubDataSet]              = '.'
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/


/**************************************************************************************************************************/
/*****                                                    STEP 004                                                    *****/
/**************************************************************************************************************************/
SELECT * FROM [Pew_Question_Std]                                               /* check results in modified table         */
/**************************************************************************************************************************/
