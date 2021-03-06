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
EXEC ( ' SELECT * INTO  [_bk_forum].[dbo].[Pew_Question_Attributes' + '_' + @CrDt + ']
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
           , [attk]                    = 'PubDS_scale'
           , [attr]                    = [s]
/*------------------------------------------------------------------------------------------------------------------------*/
      FROM
           (
/*------------------------------------------------------------------------------------------------------------------------*/
					  SELECT [v] = 'GRI_Q_16'                     , [q] = 'GRI_16_ny'     , [s] = '100  --   fromerly rescaled [GRI_16_ny1]'
				UNION SELECT [v] = 'GRI_Q_19'                     , [q] = 'GRI_19_ny'     , [s] = '100  --   fromerly rescaled [GRI_19_ny1]'
				UNION SELECT [v] = 'SHI_Q_4'                      , [q] = 'SHI_04_ny'     , [s] = '100  --   fromerly rescaled [SHI_04_ny0]'
				UNION SELECT [v] = 'SHI_Q_5'                      , [q] = 'SHI_05_ny'     , [s] = '100  --   fromerly rescaled [SHI_05_ny0]'
				UNION SELECT [v] = 'GRX_22_blasphemy'             , [q] = 'GRX_22_01_ny'  , [s] = '100  --   fromerly rescaled [GRX_22_01_ny1]'
				UNION SELECT [v] = 'GRX_22_apostasy'              , [q] = 'GRX_22_02_ny'  , [s] = '100  --   fromerly rescaled [GRX_22_02_ny1]'
				UNION SELECT [v] = 'GRX_22_hate_speech'           , [q] = 'GRX_22_03_ny'  , [s] = '100  --   fromerly rescaled [GRX_22_03_ny1]'
				UNION SELECT [v] = 'GRX_22_criticism_of_religion' , [q] = 'GRX_22_04_ny'  , [s] = '100  --   fromerly rescaled [GRX_22_04_ny1]'
/*------------------------------------------------------------------------------------------------------------------------*/
           ) DDTT
/*------------------------------------------------------------------------------------------------------------------------*/
			INNER
			JOIN
/*------------------------------------------------------------------------------------------------------------------------*/
			[Pew_Question_Std]
			ON [q] = [Question_abbreviation_std]
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
