SELECT 

       [FertDiff] = n.[TFR] - o.[TFR]

  FROM
       [forum_ResAnal].[dbo].[vi_FertilityRate]                   N
--full outer
 join
       [forum_ResAnal].[dbo].[vi_FertilityRate_until_20140314]    O
on
         O.[TFRv_row]
      =  N.[TFRv_row]
and
         O.[YearPeriod]
      =  N.[YearPeriod]
and
         O.[level]
      =  N.[level]
and
         O.[Nation_fk]
      =  N.[Nation_fk]
and
         O.[Country]
      =  N.[Country]
and
         O.[Religion_fk]
      =  N.[Religion_fk]
and
         O.[Religion]
      =  N.[Religion]
--and
--         O.[TFR]
--      =  N.[TFR]
and
         O.[Display]
      =  N.[Display]
and 
       0 != n.[TFR] - o.[TFR]
order by 
            n.[TFR] - o.[TFR]
