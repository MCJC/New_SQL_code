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
                INTO  [_bk_forum].[dbo].[Pew_Answer_Std_' + @CrDt + 'b]
                FROM      [forum].[dbo].[Pew_Answer_Std]'               )
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 001                                                    *****/
/**************************************************************************************************************************/
/*------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO
     [x_LoadRLS1cUS].[dbo].[Pew_Answer_Std]
--           [forum].[dbo].[Pew_Answer_Std]
/*------------------------------------------------------------------------------------------------------------------------*/
SELECT
----------------------------------------------------------------------------------------------------------------------------
       [Answer_Std_pk]          =      (ROW_NUMBER () 
                                              OVER (ORDER BY [C] ))
                                   +   (SELECT MAX([Answer_Std_pk])
                                          FROM     [Pew_Answer_Std]
                                         WHERE     [Answer_Std_pk] < 999990)
----------------------------------------------------------------------------------------------------------------------------
      ,[AnswerSet_number]       =      ( 1 )
                                   +   (SELECT MAX([AnswerSet_number])
                                          FROM     [Pew_Answer_Std]
                                         WHERE     [AnswerSet_number] < 999990)
----------------------------------------------------------------------------------------------------------------------------
      ,[Answer_value_std]       =   [C]
      ,[Answer_Wording_std]     =   [D]
      ,[Full_set_of_Answers]    =   '278 Countries or Territories'
      ,[NA_by_set_of_Answers]   =    278
----------------------------------------------------------------------------------------------------------------------------
  FROM
----------------------------------------------------------------------------------------------------------------------------
(

      SELECT C = [Nation_pk], D = [Ctry_EditorialName]        FROM [forum].[dbo].[Pew_Nation]
UNION SELECT C =     601.00 , D = 'Outside the U.S.'
UNION SELECT C =     602.00 , D = 'Korea'
UNION SELECT C =     603.00 , D = 'USSR'
UNION SELECT C =     604.00 , D = 'Yugoslavia'
UNION SELECT C =    1000.00 , D = 'Americas'
UNION SELECT C =    1001.00 , D = 'North America'
UNION SELECT C =    1002.00 , D = 'Latin America-Caribbean'
UNION SELECT C =    1003.00 , D = 'Europe'
UNION SELECT C =    1004.00 , D = 'Middle East-North Africa'
UNION SELECT C =    1005.00 , D = 'Sub-Saharan Africa'
UNION SELECT C =    1006.00 , D = 'Asia-Pacific'
UNION SELECT C =    2100.00 , D = 'Africa'
UNION SELECT C =    2200.00 , D = 'Americas'
UNION SELECT C =    2300.00 , D = 'Asia'
UNION SELECT C =    2400.00 , D = 'Europe'
UNION SELECT C =    2500.00 , D = 'Oceania'
UNION SELECT C =    2110.00 , D = 'Eastern Africa'
UNION SELECT C =    2120.00 , D = 'Middle Africa'
UNION SELECT C =    2130.00 , D = 'Northern Africa'
UNION SELECT C =    2140.00 , D = 'Southern Africa'
UNION SELECT C =    2150.00 , D = 'Western Africa'
UNION SELECT C =    2210.00 , D = 'Latin America and the Caribbean'
UNION SELECT C =    2220.00 , D = 'Northern America'
UNION SELECT C =    2310.00 , D = 'Central Asia'
UNION SELECT C =    2320.00 , D = 'Eastern Asia'
UNION SELECT C =    2330.00 , D = 'Southern Asia'
UNION SELECT C =    2340.00 , D = 'South-Eastern Asia'
UNION SELECT C =    2350.00 , D = 'Western Asia'
UNION SELECT C =    2410.00 , D = 'Eastern Europe'
UNION SELECT C =    2420.00 , D = 'Northern Europe'
UNION SELECT C =    2430.00 , D = 'Southern Europe'
UNION SELECT C =    2440.00 , D = 'Western Europe'
UNION SELECT C =    2510.00 , D = 'Australia and New Zealand'
UNION SELECT C =    2520.00 , D = 'Melanesia'
UNION SELECT C =    2530.00 , D = 'Micronesia'
UNION SELECT C =    2540.00 , D = 'Polynesia'
UNION SELECT C =    2211.00 , D = 'Caribbean'
UNION SELECT C =    2212.00 , D = 'Central America'
UNION SELECT C =    2213.00 , D = 'South America'
UNION SELECT C =    8001.00 , D = 'Middle East'
UNION SELECT C =    9997.00 , D = 'Undesignated'
UNION SELECT C =    9998.00 , D = 'Other/Unclear/Undetermined (vol.)'
UNION SELECT C =    9999.00 , D = 'DK/Ref. (vol.)'
UNION SELECT C =   10000.00 , D = 'World'
)   XXX 
----------------------------------------------------------------------------------------------------------------------------
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/

/**************************************************************************************************************************/
/*****                                                    STEP 002                                                    *****/
/**************************************************************************************************************************/
-- check results
SELECT * FROM [forum].[dbo].[Pew_Answer_Std]
/**************************************************************************************************************************/
