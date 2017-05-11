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
EXEC ( ' SELECT * INTO  [_bk_forum].[dbo].[Pew_Question_Attributes' + '_' + @CrDt + 'b]
                  FROM      [forum].[dbo].[Pew_Question_Attributes]'                      )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
	INSERT INTO                                                                /* insert statement                        */
	                                      [Pew_Question_Attributes]            /* target table in current database        */
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT                                                                         /* select statement...                     */
/*------------------------------------------------------------------------------------------------------------------------*/
             [Question_Attributes_pk]  = ROW_NUMBER()
                                         OVER(ORDER BY  [Question_Std_pk])     /* number all rows                         */
                                      + (SELECT MAX([Question_Attributes_pk])  /* add currently max pk                    */
                                           FROM [Pew_Question_Attributes])     /* from QAttributes                        */
/*------------------------------------------------------------------------------------------------------------------------*/
           , [Question_Std_fk]         = [Question_Std_pk]
           , [attk]                    = 'PubDS_note'
           , [attr]                    = [s]
/*------------------------------------------------------------------------------------------------------------------------*/
      FROM
           (
/*------------------------------------------------------------------------------------------------------------------------*/
          SELECT [v] = 'GRI_16_ny'                     , [s] = 'formerly rescaled [GRI_16_ny1]'
    UNION SELECT [v] = 'GRI_19_ny'                     , [s] = 'formerly rescaled [GRI_19_ny1]'
    UNION SELECT [v] = 'SHI_04_ny'                     , [s] = 'formerly rescaled [SHI_04_ny0]'
    UNION SELECT [v] = 'SHI_05_ny'                     , [s] = 'formerly rescaled [SHI_05_ny0]'
    UNION SELECT [v] = 'GRX_22_01_ny'                  , [s] = 'formerly rescaled [GRX_22_01_ny1]'
    UNION SELECT [v] = 'GRX_22_02_ny'                  , [s] = 'formerly rescaled [GRX_22_02_ny1]'
    UNION SELECT [v] = 'GRX_22_03_ny'                  , [s] = 'formerly rescaled [GRX_22_03_ny1]'
    UNION SELECT [v] = 'GRX_22_04_ny'                  , [s] = 'formerly rescaled [GRX_22_04_ny1]'
/*------------------------------------------------------------------------------------------------------------------------*/
           ) DDTT
/*------------------------------------------------------------------------------------------------------------------------*/
			INNER
			JOIN
/*------------------------------------------------------------------------------------------------------------------------*/
			[Pew_Question_Std]
			ON [v] = [Question_abbreviation_std]
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results                                                                                                          --
	select * from                         [Pew_Question_Attributes]            /* test statement...                       */
WHERE                                                                          /* filters...                              */
             [attk]                    = 'PubDS_note'                          /*            filter condition             */
/**************************************************************************************************************************/