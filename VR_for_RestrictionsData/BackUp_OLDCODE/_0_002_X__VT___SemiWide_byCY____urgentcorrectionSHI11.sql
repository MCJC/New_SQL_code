--USE [forum_ResAnal]
--SET ANSI_NULLS ON
--SET QUOTED_IDENTIFIER ON


ALTER  VIEW              [vr___02_]
AS
SELECT * FROM

(
SELECT 
       [Nation_fk]
      ,[Region5]
      ,[Region6]
      ,[Ctry_EditorialName]
      ,[Question_Year]
	  ,SHI_11 = CASE WHEN SHI_11   is not null     THEN SHI_11
	                 WHEN SHI_11   is     null 
					 AND  SHI_11_b         > 0     THEN 1.00
	                 WHEN SHI_11 is       null 
					 AND  SHI_11_a         > 0     THEN 0.50
	                 WHEN SHI_11 is       null 
					 AND  SHI_11_a
					    + SHI_11_b         = 0     THEN 0.00
					                                             END

, GRI_01, GRI_01_x, GRI_01_x2, GRI_02, GRI_03, GRI_04, GRI_05, GRI_06, GRI_07, GRI_08, GRI_08_a, GRI_09, GRI_10, GRI_10_01
, GRI_10_02, GRI_10_03, GRI_11, GRI_11_01a, GRI_11_01b, GRI_11_02, GRI_11_03, GRI_11_04, GRI_11_05, GRI_11_06, GRI_11_07
, GRI_11_08, GRI_11_09, GRI_11_10, GRI_11_11, GRI_11_12, GRI_11_13, GRI_11_14, GRI_11_15, GRI_11_16, GRI_11_17, GRI_12, GRI_13
, GRI_14, GRI_15, GRI_16, GRI_16_01, GRI_17, GRI_18, GRI_19, GRI_19_b = ISNULL(GRI_19_b, 0), GRI_19_c = ISNULL(GRI_19_c, 0)
, GRI_19_d = ISNULL(GRI_19_d, 0), GRI_19_e = ISNULL(GRI_19_e, 0), GRI_19_f = ISNULL(GRI_19_f, 0), GRI_20_01, GRI_20_01_x_01
, GRI_20_01_x_02, GRI_20_01x_01a, GRI_20_01x_01b, GRI_20_01x_02, GRI_20_01x_03, GRI_20_01x_04, GRI_20_01x_05, GRI_20_01x_06
, GRI_20_01x_07, GRI_20_01x_08, GRI_20_01x_09, GRI_20_01x_10, GRI_20_01x_11, GRI_20_02, GRI_20_03_a, GRI_20_03_a_xx, GRI_20_03_b
, GRI_20_03_b_xx, GRI_20_03_c, GRI_20_03_c_xx, GRI_20_04, GRI_20_04_x, GRI_20_05, GRI_20_05_x, GRI_20_05_x1, GRX_21_01, GRX_21_02
, GRX_21_03, GRX_22, GRX_22_01, GRX_22_02, GRX_22_03, GRX_22_04, GRX_22_x_01, GRX_22_x_02, GRX_22_x_03, GRX_22_x_04, GRX_23
, GRX_24, GRX_25_01, GRX_25_02, GRX_25_03, GRX_26_01, GRX_26_02, GRX_26_03, GRX_26_04, GRX_26_05, GRX_26_06, GRX_26_07, GRX_26_08
, GRX_27_01, GRX_27_02, GRX_27_03, GRX_28_01, GRX_28_02, GRX_28_03, GRX_29_01, GRX_29_02, GRX_29_03, GRX_29_04, GRX_29_05, GRX_30
, GRX_31, GRX_32, GRX_33, GRX_34_01, GRX_34_02_a, GRX_34_02_b, GRX_34_02_c, GRX_34_02_d, GRX_34_02_e, GRX_34_02_f, GRX_34_02_g
, GRX_34_03, GRX_35_01, GRX_35_02, GRX_36, SHI_01_a, SHI_01_b = ISNULL(SHI_01_b, 0), SHI_01_c = ISNULL(SHI_01_c, 0)
, SHI_01_d = ISNULL(SHI_01_d, 0), SHI_01_e = ISNULL(SHI_01_e, 0), SHI_01_f = ISNULL(SHI_01_f, 0), SHI_01_x_01a, SHI_01_x_01b
, SHI_01_x_02, SHI_01_x_03, SHI_01_x_04, SHI_01_x_05, SHI_01_x_06, SHI_01_x_07, SHI_01_x_08, SHI_01_x_09, SHI_01_x_10, SHI_01_x_11
, SHI_01_x_12, SHI_01_x_13, SHI_01_x_14, SHI_01_x_15, SHI_01_x_16, SHI_01_x_17, SHI_02, SHI_02_01, SHI_03, SHI_04
, SHI_04_b = ISNULL(SHI_04_b, 0), SHI_04_c = ISNULL(SHI_04_c, 0), SHI_04_d = ISNULL(SHI_04_d, 0), SHI_04_d_x_1, SHI_04_d_x_2
, SHI_04_e = ISNULL(SHI_04_e, 0), SHI_04_f = ISNULL(SHI_04_f, 0), SHI_04_f_x_01a, SHI_04_f_x_01b, SHI_04_f_x_02, SHI_04_f_x_03
, SHI_04_f_x_04, SHI_04_f_x_05, SHI_04_f_x_06, SHI_04_f_x_07, SHI_04_f_x_08, SHI_04_f_x_09, SHI_04_f_x_10, SHI_04_f_x_11
, SHI_04_f_x_12, SHI_04_f_x_13, SHI_04_f_x_15, SHI_04_f_x_16, SHI_04_f_x_17, SHI_04_x01, SHI_05, SHI_05_01, SHI_05_b
, SHI_05_c = ISNULL(SHI_05_c, 0), SHI_05_d = ISNULL(SHI_05_d, 0), SHI_05_d_x_1, SHI_05_d_x_2, SHI_05_e = ISNULL(SHI_05_e, 0)
, SHI_05_f = ISNULL(SHI_05_f, 0), SHI_06, SHI_06_01, SHI_07, SHI_07_01, SHI_08, SHI_08_01, SHI_09, SHI_09_01, SHI_09_n, SHI_10
, SHI_10_01, SHI_10_n
, SHI_11_a, SHI_11_a_01, SHI_11_a_n, SHI_11_b, SHI_11_b_01, SHI_11_b_n, SHI_11_x
, SHI_12, SHI_12_01, SHI_13, SHI_13_01, SHX_14_01, SHX_14_02, SHX_14_03, SHX_14_04, SHX_15_01, SHX_15_02, SHX_15_03, SHX_15_04
, SHX_15_05, SHX_15_06, SHX_15_07, SHX_15_08, SHX_15_09, SHX_15_10, SHX_25, SHX_26, SHX_27_01, SHX_27_02, SHX_27_03, SHX_28_01, SHX_28_02, SHX_28_03, SHX_28_04, SHX_28_05, SHX_28_06, SHX_28_07, SHX_28_08, XSG_24, XSG_S_01, XSG_S_02, XSG_S_03, XSG_S_04, XSG_S_05, XSG_S_06, XSG_S_07, XSG_S_08, XSG_S_09, XSG_S_10, XSG_S_11, XSG_S_12, XSG_S_13, XSG_S_14, XSG_S_15, XSG_S_16, XSG_S_17, XSG_S_18, XSG_S_19, XSG_S_20, XSG_S_21, XSG_S_22, XSG_S_23, XSG_S_99_01, XSG_S_99_02, XSG_S_99_03, XSG_S_99_04, XSG_S_99_05, XSG_S_99_06
FROM ( 

SELECT 
       [Nation_fk]
      ,[Region5]
      ,[Region6]
      ,[Ctry_EditorialName]
      ,[Question_Year]
      ,[QA_std]
      ,[Answer_value]      = SUM([Answer_value])
  FROM
vr___01_
GROUP BY
       [Nation_fk]
      ,[Region5]
      ,[Region6]
      ,[Ctry_EditorialName]
      ,[Question_Year]
      ,[QA_std]
)                                                                                                                                                      AS   lnpr

PIVOT
(
  MAX([Answer_value])
  FOR [QA_std]
                   in (
 GRI_20_05_x, GRX_24, SHI_11_b, GRX_29_02, SHI_11_a, SHI_05_b, SHI_01_a, XSG_S_18, SHI_04_d, GRI_12, SHX_15_08, GRI_11_03, SHI_01_c, GRI_10, GRI_11_09, GRI_10_01, GRI_20_03_a, SHI_10_01, SHI_05_e, GRI_20_01x_07, XSG_S_99_06, SHX_14_02, SHI_01_x_11, SHI_04_b, XSG_S_99_02, SHI_01_f, SHI_09, GRI_20_04_x, GRI_19_b, GRI_20_03_b_xx, XSG_24, SHI_04_f_x_07, GRX_26_01, XSG_S_03, GRX_26_08, SHI_04_c, SHI_04_e, XSG_S_05, GRI_16, GRX_29_01, GRI_19_f, XSG_S_99_01, SHI_04_f_x_17, SHI_13, SHX_25, SHX_27_02, XSG_S_17, GRI_06, GRX_26_06, GRX_27_01, XSG_S_06, GRI_11_02, GRI_11_14, SHI_01_x_16, GRX_28_02, GRX_28_03, GRI_20_01x_09, GRX_28_01, SHI_07_01, GRI_02, GRX_34_02_f, SHI_01_x_12, GRX_33, SHI_12, GRI_08_a, GRX_34_02_g, GRX_34_02_a, GRX_21_03, SHI_04_f_x_04, GRI_11_08, SHI_04_d_x_2, GRI_14, SHI_04_f_x_01a, SHI_05_f, SHI_04_f_x_08, SHI_09_n, SHI_03, XSG_S_02, SHI_01_x_08, GRX_27_03, SHX_15_07, SHI_01_x_10, SHI_01_x_13, GRI_20_03_a_xx, GRI_11_01b, GRI_16_01, GRI_20_01, XSG_S_23, SHI_01_x_01a, XSG_S_07, XSG_S_99_05, SHI_01_x_09, SHI_04, XSG_S_99_04, GRX_23, SHI_04_f_x_02, GRI_20_01x_05, SHI_04_f_x_10, GRI_20_05_x1, SHI_04_f_x_09, GRX_30, GRX_22_x_01, GRI_11_01a, SHI_01_x_17, SHI_04_f_x_06, GRI_17, SHI_11_a_n, SHI_04_f_x_03, SHX_28_04, GRI_07, SHI_04_f_x_12, GRI_20_01x_01a, SHI_04_f_x_01b, SHX_26, SHX_14_01, SHX_15_06, GRX_25_02, SHX_15_10, XSG_S_04, GRI_20_03_b, GRI_18, GRI_11_15, GRX_27_02, GRI_11_17, SHI_04_f_x_13, GRI_01_x2, GRI_08, SHX_28_05, SHI_04_f_x_16, GRI_03, XSG_S_09, SHI_01_x_14, SHI_06, SHX_15_05, GRX_26_02, GRX_26_07, GRX_31, SHX_15_04, XSG_S_13, GRX_26_03, SHX_15_03, GRI_04, GRX_25_01, GRI_20_01x_10, GRI_13, GRI_01, GRI_15, XSG_S_14, GRX_26_04, SHI_02_01, SHI_11_b_n, GRI_05, SHI_05, SHI_04_f_x_11, GRI_20_03_c_xx, GRX_25_03, SHI_05_d_x_1, GRX_34_02_c, SHI_04_f_x_15, XSG_S_19, GRI_11, SHI_08, SHX_28_07, SHI_01_x_01b, GRI_20_02, SHI_11_a_01, GRI_11_06, GRX_35_02, XSG_S_01, GRI_01_x, GRI_20_04, GRI_11_16, GRI_09, SHI_04_f_x_05, GRI_20_01x_02, GRX_35_01, SHI_04_x01, GRX_21_02, GRX_29_05, SHX_28_02, SHI_10, XSG_S_12, GRI_19, GRI_20_01x_08, SHI_05_d, SHI_11_x, GRX_22_x_02, SHI_13_01, GRX_26_05, SHI_10_n, SHI_04_f, GRI_20_01x_04, SHI_01_x_05, SHX_28_01, GRI_20_01x_11, SHI_05_01, XSG_S_22, GRX_21_01, SHI_11, SHI_05_c, SHI_07, GRI_11_05, GRX_22_04, GRX_34_02_e, GRX_22_03, GRI_11_07, SHX_28_03, GRI_11_13, GRI_20_03_c, GRX_36, SHI_01_b, SHI_04_d_x_1, SHX_28_08, XSG_S_16, XSG_S_99_03, SHI_11_b_01, GRI_11_11, SHX_27_03, GRI_20_01x_01b, GRI_10_02, SHI_05_d_x_2, XSG_S_10, GRI_11_12, SHI_01_x_07, GRX_32, SHX_15_02, XSG_S_20, GRX_22_x_03, SHI_09_01, SHI_02, GRI_20_01_x_02, SHI_01_x_03, GRI_20_01_x_01, GRI_11_04, SHI_01_x_02, SHI_12_01, SHX_15_09, GRX_29_03, GRX_34_02_d, GRX_22_x_04, SHX_15_01, GRI_19_c, SHX_28_06, GRX_34_02_b, SHI_06_01, XSG_S_08, GRX_22_01, SHI_08_01, XSG_S_11, SHI_01_x_06, SHI_01_x_15, GRX_22, GRI_20_01x_03, SHX_27_01, SHI_01_e, GRI_19_d, SHI_01_d, GRI_11_10, GRI_19_e, XSG_S_21, GRX_22_02, GRI_10_03, GRI_20_05, SHX_14_03, GRX_29_04, SHX_14_04, GRX_34_01, GRI_20_01x_06, GRX_34_03, XSG_S_15, SHI_01_x_04
)
 )                                                                                                                                                     AS   pivt
  )                                                                                                                                                    AS   berc
go



 -- IF OBJECT_ID  (N'[forum_ResAnal].[dbo].[vr___02_cDB_Wide__by_Ctry&Year]', N'U') IS NOT NULL
 --   DROP TABLE      [forum_ResAnal].[dbo].[vr___02_cDB_Wide__by_Ctry&Year]
 --SELECT * INTO      [forum_ResAnal].[dbo].[vr___02_cDB_Wide__by_Ctry&Year]
 --         FROM      [forum_ResAnal].[dbo].[vr___02_]
