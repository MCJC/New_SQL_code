/***************************************************************************************************************************************************************/
/***                                                                                                                                                         ***/
/***     >>>>>   This is the script used to create the view [forum_ResAnal].[dbo].[V3_WRestr&Extras_by_Ctry&Year]                                  <<<<<     ***/
/***                                                                                                                                                         ***/
/***************************************************************************************************************************************************************/
USE [forum_ResAnal]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
ALTER  VIEW
               [dbo].[V3_W&Extras_by_Ctry&Year]
AS
/***************************************************************************************************************************************************************/
--*** May need to:
--    Clean XSG_25n27  as rowmax(GRX_25_01_2010 SHX_27_01_2010)
/*** main select statement *************************************************************************************************************************************/
/*** table including numeric values + Step-3 calculated variables **********************************************************************************************/
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* GRI_scaled index */
         GRI_scaled 
         =        CAST ((
                  CASE
                  WHEN GRI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'low'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'GRI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 1.00
                  WHEN GRI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'moderate'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'GRI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 2.00
                  WHEN GRI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'high'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'GRI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 3.00
                  WHEN GRI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'very high'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'GRI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 4.00
                  END
                                                               ) AS DECIMAL (38,2))
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* SHI_scaled index */
      ,  SHI_scaled 
         =        CAST ((
                  CASE
                  WHEN SHI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'low'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'SHI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 1.00
                  WHEN SHI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'moderate'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'SHI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 2.00
                  WHEN SHI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'high'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'SHI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 3.00
                  WHEN SHI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'very high'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'SHI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 4.00
                  END
                                                               ) AS DECIMAL (38,2))
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* GFI_scaled index */
      ,  GFI_scaled 
         =        CAST ((
                  CASE
                  WHEN GFI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'low'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'GFI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 1.00
                  WHEN GFI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'moderate'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'GFI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 2.00
                  WHEN GFI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'high'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'GFI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 3.00
                  WHEN GFI <= ( SELECT [CutPoint] FROM [forum].[dbo].[Pew_Field]
                                                     , [forum].[dbo].[Pew_Index_Cut_Points]
                                WHERE  [Field_fk]   = [Field_pk]
                                  AND  [Level]      = 'very high'
                                  AND  [Point]      = 'highest'
                                  AND  [Field_type] = 'GFI'
                                  AND  [Field_year] = '2007'
                              )
                  THEN 4.00
                  END
                                                               ) AS DECIMAL (38,2))
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* GRI_rounded index */
      ,  GRI_rd_1d 
         =        CAST ((
                                  GRI 
                                                               ) AS DECIMAL (38,1))
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* SHI_rounded index */
      ,  SHI_rd_1d 
         =        CAST ((
                                  SHI 
                                                               ) AS DECIMAL (38,1))
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* GFI_rounded index */
      ,  GFI_rd_1d 
         =        CAST ((
                                  GFI
                                                               ) AS DECIMAL (38,1))
-------------------------------------------------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------------------------------------------------------
       ,
 *
FROM
/***************************************************************************************************************************************************************/
(
/*** table including numeric values + Step-2 calculated variables **********************************************************************************************/
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* GRI index */
         GRI 
         =
--/*********************************************************************************************/    
--                  CASE
--/*  Fit previously published data  ----------------------------------------------------------*/    
--    ---------------------------------------------------------------------------------------
--	                                        WHEN Nation_fk	               = 69
--	                                         AND Question_Year             = 2011
--	                                        THEN 1.8
--    -----------------------------------------------------------------------------------------
--                                            WHEN Nation_fk	               = 146
--                                             AND Question_Year             = 2011
--                                            THEN 1.950
--    -----------------------------------------------------------------------------------------
--                                            WHEN Nation_fk	               = 131
--                                             AND Question_Year             = 2011
--                                            THEN 1.350
--    -----------------------------------------------------------------------------------------
--                                            WHEN Nation_fk	               = 186
--                                             AND Question_Year             = 2011
--                                            THEN 1.750
--    -----------------------------------------------------------------------------------------
--/*  Fit previously published median  --------------------------------------------------------*/    
--    ---------------------------------------------------------------------------------------
--                                            WHEN Nation_fk	               = 116
--                                             AND Question_Year             = 2010
--                                            THEN 5.844
--    ---------------------------------------------------------------------------------------
--                  ELSE
--/*********************************************************************************************/    
                  ROUND(
                  CAST ((((
                                [GRI_01]
                         +      [GRI_02]
                         +      [GRI_03]
                         +      [GRI_04]
                         +      [GRI_05]
                         +      [GRI_06]
                         +      [GRI_07]
                         +      [GRI_08_for_index]
                         +      [GRI_09]
                         +      [GRI_10]
                         +      [GRI_11]
                         +      [GRI_12]
                         +      [GRI_13]
                         +      [GRI_14]
                         +      [GRI_15]
                         +      [GRI_16]
                         +      [GRI_17]
                         +      [GRI_18]
                         +      [GRI_19]
                         +      [GRI_20]
                                                       ) / 2    )
                                                                  ) AS float) ,64)
--                                                                ) AS DECIMAL (38,4)) ,4)
--                  END
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* SHI index */
       , SHI 
         =        ROUND(
                  CAST ((((
                                [SHI_01]
                         +      [SHI_02]
                         +      [SHI_03]
                         +      [SHI_04]
                         +      [SHI_05]
                         +      [SHI_06]
                         +      [SHI_07]
                         +      [SHI_08]
                         +      [SHI_09]
                         +      [SHI_10]
                         +      [SHI_11_for_index]
                         +      [SHI_12]
                         +      [SHI_13]
                                                       ) / 1.3  )
                                                                  ) AS float) ,64)
--                                                                ) AS DECIMAL (38,4)) ,4)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* GFI index */
       , GFI 
         =        ROUND(
                  CAST ((((
                                [GRI_20_01]
                         +      [GRI_20_02]
                         + ( (  [GRI_20_03_a]
                              + [GRI_20_03_b]
                              + [GRI_20_03_c]
                                               ) / 3 )
                         +      [GRI_20_04]
                         +      [GRI_20_05]
                                                       ) / 5 ) 
                                                              * 10
                                                                  ) AS float) ,64)
--                                                                ) AS DECIMAL (38,4)) ,4)
--         =        GRI_20 * 10
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Government & Social harassment of Christianity */
       , XSG_01_xG1 
         =        CAST ((
                  CASE
                  WHEN GRI_11_xG1 + SHI_01_xG1 > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Government & Social harassment of Islam */
       , XSG_01_xG2 
         =        CAST ((
                  CASE
                  WHEN GRI_11_xG2 + SHI_01_xG2 > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Government & Social harassment of Buddhism */
       , XSG_01_xG3 
         =        CAST ((
                  CASE
                  WHEN GRI_11_xG3 + SHI_01_xG3 > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Government & Social harassment of Hinduism */
       , XSG_01_xG4 
         =        CAST ((
                  CASE
                  WHEN GRI_11_xG4 + SHI_01_xG4 > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Government & Social harassment of Judaism */
       , XSG_01_xG5 
         =        CAST ((
                  CASE
                  WHEN GRI_11_xG5 + SHI_01_xG5 > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Government & Social harassment of Other ('New' Religions, Ancient Religions, Sikhs, Zoroastrianism) */
       , XSG_01_xG6 
         =        CAST ((
                  CASE
                  WHEN GRI_11_xG6 + SHI_01_xG6 > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Government & Social harassment of Ethnic or Tribal Religions */
       , XSG_01_xG7 
         =        CAST ((
                  CASE
                  WHEN GRI_11_xG7 + SHI_01_xG7 > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 SHI_01_summary_a_ny           for toplines */
       ,           SHI_01_summary_a_ny0
       = CAST ((
         CASE 
              WHEN SHI_01     =  0.00
              THEN               0.00
              WHEN SHI_01     >  0.00
              THEN               0.01
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_summary_a_ny1
       = CAST ((
         CASE 
              WHEN SHI_01_a   >  0.00
              THEN               1.01
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_summary_a_ny2
       = CAST ((
         CASE 
              WHEN SHI_01_b   >  0.00
              THEN               1.02
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_summary_a_ny3
       = CAST ((
         CASE 
              WHEN SHI_01_c   >  0.00
              THEN               1.03
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_summary_a_ny4
       = CAST ((
         CASE 
              WHEN SHI_01_d   >  0.00
              THEN               1.04
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_summary_a_ny5
       = CAST ((
         CASE 
              WHEN SHI_01_e   >  0.00
              THEN               1.05
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_summary_a_ny6
       = CAST ((
         CASE 
              WHEN SHI_01_f   >  0.00
              THEN               1.06
         END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 XSG_242526_ny           for toplines */
       ,           XSG_242526_ny0
       = CAST ((
         CASE WHEN GRX_24     = 0.00
               AND SHX_25     = 0.00
               AND SHX_26     = 0.00
              THEN              0.00
              WHEN GRX_24     = 1.00
                OR SHX_25     = 1.00
                OR SHX_26     = 1.00
              THEN              1.00
              WHEN GRX_24     = 0.67
                OR SHX_25     = 0.67
                OR SHX_26     = 0.67
              THEN              0.67
              WHEN GRX_24     = 0.33
                OR SHX_25     = 0.33
                OR SHX_26     = 0.33
              THEN              0.33
              END
                                                               ) AS DECIMAL (38,2))
       ,           XSG_242526_ny1
       = CAST ((
         CASE WHEN GRX_24     > 0.00
                OR SHX_25     > 0.00
                OR SHX_26     > 0.00
              THEN              0.01
              END
                                                               ) AS DECIMAL (38,2))
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 XSG_25n27_ny           for toplines */
       ,           XSG_25n27_ny1
       = CAST ((
         CASE WHEN GRX_25_ny1 = 0.00
               AND SHX_27_ny1 = 0.00
              THEN              0.00
              WHEN GRX_25_ny1 = 0.01
                OR SHX_27_ny1 = 0.01
              THEN              0.01
              END
                                                               ) AS DECIMAL (38,2))
       ,           XSG_25n27_ny2
       = CAST ((
         CASE WHEN GRX_25_ny2 = 0.02
                OR SHX_27_ny2 = 0.02
              THEN              0.02
              END
                                                               ) AS DECIMAL (38,2))
       ,           XSG_25n27_ny3
       = CAST ((
         CASE WHEN GRX_25_ny3 = 0.03
                OR SHX_27_ny3 = 0.03
              THEN              0.03
              END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

       , *
FROM
/***************************************************************************************************************************************************************/
(
/*** table including numeric values + Step-1 calculated variables **********************************************************************************************/
SELECT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
         GRI_20
         =        ROUND(
                  CAST ((((
                                [GRI_20_01]
                         +      [GRI_20_02]
                         + ( (  [GRI_20_03_a]
                              + [GRI_20_03_b]
                              + [GRI_20_03_c]
                                               ) / 3 )
                         +      [GRI_20_04]
                         +      [GRI_20_05]
                                                       ) / 5  )
                                                               ) AS DECIMAL (38,2)) ,2)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
       , GRI_20_top
         =        CAST ((
                  CASE
                  WHEN GRI_20_03_a = 1
                    OR GRI_20_03_b = 1
                    OR GRI_20_03_c = 1
                    OR GRI_20_02   > 0.5
                  THEN               1.00
                  WHEN GRI_20_01   > 0
                    OR GRI_20_02   > 0
                    OR GRI_20_03_a > 0
                    OR GRI_20_03_b > 0
                    OR GRI_20_03_c > 0
                    OR GRI_20_04   > 0
                    OR GRI_20_05   > 0
                  THEN               0.50
                  ELSE               0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
       , GRI_20_03_top
         =        CAST ((
                  CASE
                  WHEN GRI_20_03_a >= GRI_20_03_b
                   AND GRI_20_03_a >= GRI_20_03_c
                  THEN GRI_20_03_a
                  WHEN GRI_20_03_b >= GRI_20_03_a
                   AND GRI_20_03_b >= GRI_20_03_c
                  THEN GRI_20_03_b
                  WHEN GRI_20_03_c >= GRI_20_03_b
                   AND GRI_20_03_c >= GRI_20_03_c
                  THEN GRI_20_03_c
                  ELSE NULL
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
       , 
--       select
       SHI_01
         =        CAST ((
                  (
                  CAST ((
                    ( CASE
                      WHEN SHI_01_a > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_b > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_c > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_d > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_e > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_f > 0 THEN 1
                      ELSE                   0
                       END                     )
                                                       
                                                               ) AS DECIMAL (38,2))
                                                                                    / 6 )
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
       , SHI_01_summary_b
         =        CAST ((
                    ( CASE
                      WHEN SHI_01_a > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_b > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_c > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_d > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_e > 0 THEN 1
                      ELSE                   0
                       END                     )
                  + ( CASE
                      WHEN SHI_01_f > 0 THEN 1
                      ELSE                   0
                       END                     )
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 SHI_01_[a,b,c,d,e,f]_dummy for tables of question answers by country */
       ,           SHI_01_a_dummy
       = CAST ((
         CASE 
              WHEN SHI_01_a   >  0.00
              THEN               1
              ELSE               0
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_b_dummy
       = CAST ((
         CASE 
              WHEN SHI_01_b   >  0.00
              THEN               1
              ELSE               0
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_c_dummy
       = CAST ((
         CASE 
              WHEN SHI_01_c   >  0.00
              THEN               1
              ELSE               0
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_d_dummy
       = CAST ((
         CASE 
              WHEN SHI_01_d   >  0.00
              THEN               1
              ELSE               0
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_e_dummy
       = CAST ((
         CASE 
              WHEN SHI_01_e   >  0.00
              THEN               1
              ELSE               0
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHI_01_f_dummy
       = CAST ((
         CASE 
              WHEN SHI_01_f   >  0.00
              THEN               1
              ELSE               0
         END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Gov harassment of Christianity */
       , GRI_11_xG1
         =        CAST ((
                  CASE
                  WHEN   GRI_11_01a
                       + GRI_11_01b
                       + GRI_11_02
                       + GRI_11_03
                       + GRI_11_11
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Gov harassment of Islam */
       , GRI_11_xG2 
         =        CAST ((
                  CASE
                  WHEN   GRI_11_04
                       + GRI_11_05
                       + GRI_11_06
                       + GRI_11_12
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Gov harassment of Buddhism */
       , GRI_11_xG3 
         =        CAST ((
                  CASE
                  WHEN   GRI_11_07
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Gov harassment of Hinduism */
       , GRI_11_xG4 
         =        CAST ((
                  CASE
                  WHEN   GRI_11_08
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Gov harassment of Judaism */
       , GRI_11_xG5 
         =        CAST ((
                  CASE
                  WHEN   GRI_11_09
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Gov harassment of Other ('New' Religions, Ancient Religions, Sikhs, Zoroastrianism) */
       , GRI_11_xG6 
         =        CAST ((
                  CASE
                  WHEN   isnull(GRI_11_10, 0)
                       + isnull(GRI_11_14, 0)
                       + isnull(GRI_11_15, 0)
                       + isnull(GRI_11_16, 0)
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Gov harassment of Ethnic or Tribal Religions */
       , GRI_11_xG7
         =        CAST ((
                  CASE
                  WHEN   GRI_11_13
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Social harassment of Christianity */
       , SHI_01_xG1
         =        CAST ((
                  CASE
                  WHEN   SHI_01_x_01a
                       + SHI_01_x_01b
                       + SHI_01_x_02
                       + SHI_01_x_03
                       + SHI_01_x_11
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Social harassment of Islam */
       , SHI_01_xG2 
         =        CAST ((
                  CASE
                  WHEN   SHI_01_x_04
                       + SHI_01_x_05
                       + SHI_01_x_06
                       + SHI_01_x_12
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Social harassment of Buddhism */
       , SHI_01_xG3 
         =        CAST ((
                  CASE
                  WHEN   SHI_01_x_07
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Social harassment of Hinduism */
       , SHI_01_xG4 
         =        CAST ((
                  CASE
                  WHEN   SHI_01_x_08
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Social harassment of Judaism */
       , SHI_01_xG5 
         =        CAST ((
                  CASE
                  WHEN   SHI_01_x_09
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Social harassment of Other ('New' Religions, Ancient Religions, Sikhs, Zoroastrianism) */
       , SHI_01_xG6 
         =        CAST ((
                  CASE
                  WHEN   isnull(SHI_01_x_10, 0)
                       + isnull(SHI_01_x_14, 0)
                       + isnull(SHI_01_x_15, 0)
                       + isnull(SHI_01_x_16, 0)
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Social harassment of Ethnic or Tribal Religions */
       , SHI_01_xG7
         =        CAST ((
                  CASE
                  WHEN   SHI_01_x_13
                  > 0
                  THEN 1.00
                  ELSE 0.00
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* recode GRI_08 to be used as index-factor */
       , GRI_08_for_index
         =        CAST ((
                  CASE
                  WHEN GRI_08  = 0.5
                  THEN           1
                  ELSE GRI_08
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* recode SHI_Q_11 to be used as index-factor */
       , SHI_11_for_index
         =        CAST ((
                  CASE
                  WHEN SHI_11  = 0.5
                  THEN           1
                  ELSE SHI_11
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRI_16               for toplines */
       ,           GRI_16_ny1
       =           GRI_16
       ,           GRI_16_ny2
       = CAST ((
         CASE WHEN GRI_16  > 0
                  THEN           0.01
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRI_19               for toplines */
       ,           GRI_19_ny1
       =           GRI_19
       ,           GRI_19_ny2
       = CAST ((
         CASE WHEN GRI_19  > 0
              THEN           0.01
              END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRI_19_summ_ny          for toplines */
       ,           GRI_19_summ_ny1
       = CAST ((
         CASE 
              WHEN GRI_19     =  0.00
              THEN               0.00
              WHEN GRI_19     >  0.00
              THEN               0.01
         END
                                                               ) AS DECIMAL (38,2))
       ,           GRI_19_summ_ny2
       = CAST ((
         CASE 
              WHEN GRI_19_b   >  0.00
              THEN               1.02
         END
                                                               ) AS DECIMAL (38,2))
       ,           GRI_19_summ_ny3
       = CAST ((
         CASE 
              WHEN GRI_19_c   >  0.00
              THEN               1.03
         END
                                                               ) AS DECIMAL (38,2))
       ,           GRI_19_summ_ny4
       = CAST ((
         CASE 
              WHEN GRI_19_d   >  0.00
              THEN               1.04
         END
                                                               ) AS DECIMAL (38,2))
       ,           GRI_19_summ_ny5
       = CAST ((
         CASE 
              WHEN GRI_19_e   >  0.00
              THEN               1.05
         END
                                                               ) AS DECIMAL (38,2))
       ,           GRI_19_summ_ny6
       = CAST ((
         CASE 
              WHEN GRI_19_f   >  0.00
              THEN               1.06
         END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRI_19_x              for toplines */
       ,           GRI_19_x
       =           ISNULL(GRI_19_b, 0)
                 + ISNULL(GRI_19_c, 0)
                 + ISNULL(GRI_19_d, 0)
                 + ISNULL(GRI_19_e, 0)
                 + ISNULL(GRI_19_f, 0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 SHI_04_ny          for toplines */
       ,           SHI_04_ny0
       =           SHI_04

       ,           SHI_04_ny1
       = CAST ((
         CASE 
              WHEN SHI_04     >  0.00
              THEN               0.01
         END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 SHI_05_ny          for toplines */
       ,           SHI_05_ny0
       =           SHI_05
       ,           SHI_05_ny1
       = CAST ((
         CASE 
              WHEN SHI_05     >  0.00
              THEN               0.01
         END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 SHI_07_ny          for toplines */
       ,           SHI_07_ny0
       =           SHI_07
       ,           SHI_07_ny1
       = CAST ((
         CASE 
              WHEN SHI_07     >  0.00
              THEN               0.01
         END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--/*                 SHI_01_x              for toplines shoul;d be added???*/
--       ,           SHI_01_x
--       =           ISNULL(SHI_01_b, 0)
--                 + ISNULL(SHI_01_c, 0)
--                 + ISNULL(SHI_01_d, 0)
--                 + ISNULL(SHI_01_e, 0)
--                 + ISNULL(SHI_01_f, 0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRX_22               for toplines */
       ,           GRX_22_ny1
       = CAST ((
         CASE WHEN ISNULL(GRX_22   , 0)  < 0.66
               AND ISNULL(GRX_22_01, 0)  < 0.66
               AND ISNULL(GRX_22_02, 0)  < 0.66
               AND ISNULL(GRX_22_04, 0)  < 0.66
              THEN                         0
              WHEN ISNULL(GRX_22   , 0)  < 1.00
               AND ISNULL(GRX_22_01, 0)  < 1.00
               AND ISNULL(GRX_22_02, 0)  < 1.00
               AND ISNULL(GRX_22_04, 0)  < 1.00
              THEN                         0.67
              WHEN ISNULL(GRX_22   , 0)  = 1.00
                OR ISNULL(GRX_22_01, 0)  = 1.00
                OR ISNULL(GRX_22_02, 0)  = 1.00
                OR ISNULL(GRX_22_04, 0)  = 1.00
              THEN                         1.00
--              ELSE GRX_22_01                 -- value does not fit logical distribution where 2 "no" cetegories are collapsed 
              END
                                                               ) AS DECIMAL (38,2))
--       ,           GRX_22_ny2
--       = CAST ((
--         CASE WHEN GRX_22    >= 0.66
--                OR GRX_22_01 >= 0.66
--                OR GRX_22_02 >= 0.66
--                OR GRX_22_04 >= 0.66
--              THEN              0.01
--              END
--                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRX_22_01               for toplines */
       ,           GRX_22_01_ny1
       = CAST ((
         CASE WHEN GRX_22_01  < 0.66
              THEN              0
              ELSE GRX_22_01
              END
                                                               ) AS DECIMAL (38,2))
       ,           GRX_22_01_ny2
       = CAST ((
         CASE WHEN GRX_22_01 >= 0.66
              THEN              0.01
              END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRX_22_02               for toplines */
       ,           GRX_22_02_ny1
       = CAST ((
         CASE WHEN GRX_22_02  < 0.66
              THEN              0
              ELSE GRX_22_02
              END
                                                               ) AS DECIMAL (38,2))
       ,           GRX_22_02_ny2
       = CAST ((
         CASE WHEN GRX_22_02 >= 0.66
              THEN              0.01
              END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRX_22_03               for toplines */
       ,           GRX_22_03_ny1
       = CAST ((
         CASE WHEN GRX_22_03  < 0.66
              THEN              0
              ELSE GRX_22_03
              END
                                                               ) AS DECIMAL (38,2))
       ,           GRX_22_03_ny2
       = CAST ((
         CASE WHEN GRX_22_03 >= 0.66
              THEN              0.01
              END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRX_22_04               for toplines */
       ,           GRX_22_04_ny1
       = CAST ((
         CASE WHEN GRX_22_04  < 0.66
              THEN              0
              ELSE GRX_22_04
              END
                                                               ) AS DECIMAL (38,2))
       ,           GRX_22_04_ny2
       = CAST ((
         CASE WHEN GRX_22_04 >= 0.66
              THEN              0.01
              END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRX_24               for toplines */
       ,           GRX_24_ny1
       =           GRX_24
       ,           GRX_24_ny2
       = CAST ((
         CASE WHEN GRX_24  > 0
                  THEN           0.01
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 GRX_25               for toplines */
       ,           GRX_25_ny1
       = CAST ((
         CASE 
              WHEN GRX_25_01  =  0.00
              THEN               0.00
              WHEN GRX_25_01  =  1.00
              THEN               0.01
         END
                                                               ) AS DECIMAL (38,2))
       ,           GRX_25_ny2
       = CAST ((
         CASE 
              WHEN GRX_25_02  =  1.00
              THEN               0.02
         END
                                                               ) AS DECIMAL (38,2))
       ,           GRX_25_ny3
       = CAST ((
         CASE 
              WHEN GRX_25_03  =  1.00
              THEN               0.03
         END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 SHX_25               for toplines */
       ,           SHX_25_ny1
       =           SHX_25
       ,           SHX_25_ny2
       = CAST ((
         CASE WHEN SHX_25  > 0
                  THEN           0.01
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 SHX_26               for toplines */
       ,           SHX_26_ny1
       =           SHX_26
       ,           SHX_26_ny2
       = CAST ((
         CASE WHEN SHX_26  > 0
                  THEN           0.01
                  END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*                 SHX_27               for toplines */
       ,           SHX_27_ny1
       = CAST ((
         CASE 
              WHEN SHX_27_01  =  0.00
              THEN               0.00
              WHEN SHX_27_01  =  1.00
              THEN               0.01
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHX_27_ny2
       = CAST ((
         CASE 
              WHEN SHX_27_02  =  1.00
              THEN               0.02
         END
                                                               ) AS DECIMAL (38,2))
       ,           SHX_27_ny3
       = CAST ((
         CASE 
              WHEN SHX_27_03  =  1.00
              THEN               0.03
         END
                                                               ) AS DECIMAL (38,2))
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
       , *
FROM
/*** View including numeric values aggregated by country/religion & year ***************************************************************************************/
               [dbo].[V2_W_by_Ctry&Year]
/*************************************************************************************** View including numeric values aggregated by country/religion & year ***/
/********************************************************************************************** table including numeric values + Step-1 calculated variables ***/
)                                                                                                                                                       AS NV_S1
/***************************************************************************************************************************************************************/
)                                                                                                                                                       AS NV_S2
/********************************************************************************************** table including numeric values + Step-2 calculated variables ***/
/* filters */
WHERE
Ctry_EditorialName                                   != 'North Korea'
AND
Ctry_EditorialName + '_/_' + STR(Question_Year, 4,0) != 'South Sudan_/_2010'            /* although data are not aggregated for the other part of former Sudan */
/* filters */
/********************************************************************************************** table including numeric values + Step-3 calculated variables ***/
/************************************************************************************************************************************* main select statement ***/
/***************************************************************************************************************************************************************/
