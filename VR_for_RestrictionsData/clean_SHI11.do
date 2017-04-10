





cd "\\Mac\Home\Desktop\SQL_code_at_desktop\VR_for_RestrictionsData"


clear
#delimit ;
odbc load, exec
("
SELECT *
  FROM [forum_ResAnal].[dbo].[MYTEMPSHITABLE]
;
") 

user(JCMac) password(MJCCseno1987) dsn("ForumDB")

clear ;
#delimit cr

compress

save "LS.dta"


clear
#delimit ;
odbc load, exec
("
SELECT [byCY_row]
      ,[Nation_fk]
      ,[Ctry_EditorialName]
      ,[UN_TotalPopulation]
      ,[Region5]
      ,[Region6]
      ,[Question_Year]
      ,[GRI]
      ,[GRI_rd_1d]
      ,[GRI_scaled]
      ,[SHI]
      ,[SHI_rd_1d]
      ,[SHI_scaled]
      ,[SHI_11]
      ,[SHI_11_a]
      ,[SHI_11_a_01]
      ,[SHI_11_a_n]
      ,[SHI_11_b]
      ,[SHI_11_b_01]
      ,[SHI_11_b_n]
      ,[SHI_11_for_index]
      ,[SHI_11_x]
  FROM [forum_ResAnal].[dbo].[vr___04_cDB_SemiWide_byCtry&Yr]
;
") 

user(JCMac) password(MJCCseno1987) dsn("ForumDB")

clear ;
#delimit cr

compress

save "WS.dta"



** SHI_11_x of 2010 remains
** because it is a different variable
use "WS.dta", clear
keep if Question_Year == 2010
tab SHI_11 SHI_11_x, m


** SHI_11_x of 2011 remains
** because it is a different variable
use "WS.dta", clear
keep if Question_Year == 2011
tab SHI_11 SHI_11_x, m

** SHI_11_x of 2012 remains
** because it is a different variable
use "WS.dta", clear
keep if Question_Year == 2012
tab SHI_11 SHI_11_x, m

** SHI_11_x of 2013 remains
** because it is a different variable
use "WS.dta", clear
keep if Question_Year == 2013
tab SHI_11 SHI_11_x, m


use "LS.dta", clear
tab Question_Year Answer_value if QA_std  == "SHI_11"







