/**************************************************************************************************************************/
----------------------------------------------------------------------------------------------------------------------------
USE              [forum]
GO
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Display_by_Year_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Display_by_Year]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*** add field for diplaying URL metadata by question *********************************************************************/
ALTER TABLE
           [forum].[dbo].[Pew_Display_by_Year]
ADD
                                               [GRF_QMetadata]  [int] NULL
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Display_by_Year]
SET
                                               [GRF_QMetadata] = 0
/*------------------------------------------------------------------------------------------------------------------------*/
GO
UPDATE
           [forum].[dbo].[Pew_Display_by_Year]
SET
                                               [GRF_QMetadata] = 1
WHERE
                                               [Year]   IN ( 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013 )
/*------------------------------------------------------------------------------------------------------------------------*/
GO
/**************************************************************************************************************************/


/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
/*** check results ********************************************************************************************************/
SELECT * FROM [Pew_Display_by_Year]
/**************************************************************************************************************************/
/**************************************************************************************************************************/
