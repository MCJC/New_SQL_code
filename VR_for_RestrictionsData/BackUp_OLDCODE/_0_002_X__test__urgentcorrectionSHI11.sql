USE [forum_ResAnal]                                                                      /***/

SELECT * FROM

(
SELECT 
       [Nation_fk]

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
					 else 999999999
					 END
, SHI_10_01, SHI_10_n
, SHI_11_a, SHI_11_a_01, SHI_11_a_n, SHI_11_b, SHI_11_b_01, SHI_11_b_n, SHI_11_x
, SHI_12, SHI_12_01, SHI_13, SHI_13_01, SHX_14_01, SHX_14_02, SHX_14_03, SHX_14_04, SHX_15_01, SHX_15_02, SHX_15_03, SHX_15_04
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
where 
       [Question_Year] =2015
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
SHI_11
, SHI_10_01, SHI_10_n
, SHI_11_a, SHI_11_a_01, SHI_11_a_n, SHI_11_b, SHI_11_b_01, SHI_11_b_n, SHI_11_x
, SHI_12, SHI_12_01, SHI_13, SHI_13_01, SHX_14_01, SHX_14_02, SHX_14_03, SHX_14_04, SHX_15_01, SHX_15_02, SHX_15_03, SHX_15_04
)
 )                                                                                                                                                     AS   pivt
  )                                                                                                                                                    AS   berc
