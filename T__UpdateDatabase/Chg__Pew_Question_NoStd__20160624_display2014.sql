----------------------------------------------------------------------------------------------------------------------------
USE              [forum]
GO
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
/*****                                           BackUp  current Table(s)                                             *****/
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
/*------------------------------------------------------------------------------------------------------------------------*/
UPDATE
           [forum].[dbo].[Pew_Question_NoStd]
SET
           [forum].[dbo].[Pew_Question_NoStd].[Display] = 1
/*------------------------------------------------------------------------------------------------------------------------*/
--   SELECT * FROM       [Pew_Question_NoStd]
/*------------------------------------------------------------------------------------------------------------------------*/
                   WHERE [Display]        = 0
                     AND [Question_Year]  =  2014
                     AND [Question_pk]   IN (
											1776,
											1778,
											1779,
											1780,
											1781,
											1782,
											1783,
											1784,
											1786,
											1787,
											1791,
											1809,
											1810,
											1811,
											1812,
											1813,
											1815,
											1816,
											1817,
											1823,
											1835,
											1836,
											1837,
											1838,
											1839,
											1841,
											1889,
											1891,
											1892,
											1899,
											1904,
											1905,
											1906,
											1907,
											1909,
											1943,
											1915,
											1916
                                            )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
GO
/**************************************************************************************************************************/
