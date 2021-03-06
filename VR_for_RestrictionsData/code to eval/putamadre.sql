----/****** Script for SelectTopNRows command from SSMS  ******/
----SELECT TOP 1000 [Question_Attributes_pk'
----      ,[Question_Std_fk'
----      ,[attk'
----      ,[attr'
----  FROM 
  
----  [forum'.[dbo'.[Pew_Question_Attributes'

----  where 
----    [attk] = 'In_PubDataSet'


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT

       [v] =   ', ['
              + S.[Question_Abbreviation_Std]
              + ']   =   ['
              + Q.[attr]
              + CASE
			         WHEN             C.[attr] IS NOT NULL 
				     THEN ']   *  ' + C.[attr]
--ISNULL (C.[attr], '')
  else ''
  end    


  FROM 
          [Pew_Question_Std]                     S
  INNER
  JOIN
          ( SELECT *
              FROM [Pew_Question_Attributes]
             WHERE [attk] = 'In_PubDataSet'   )  Q
     ON
                 S.[Question_Std_pk]
               = Q.[Question_Std_fk]
LEFT
JOIN
          ( SELECT *
              FROM [Pew_Question_Attributes]
             WHERE [attk] = 'PubDS_scale'     )  C
     ON
                 S.[Question_Std_pk]
               = C.[Question_Std_fk]
 


--'

--  where 
--    [attk' 
--    [attk] = 'In_PubDataSet'


--SELECT
--       Question_Std_pk
--     , [v]
--	 , [s]
-- FROM
--(
--      SELECT [v] = 'GRI_Q_16'                     , [q] = 'GRI_16_ny'     , [s] = '100  --   fromerly rescaled [GRI_16_ny1]'
--UNION SELECT [v] = 'GRI_Q_19'                     , [q] = 'GRI_19_ny'     , [s] = '100  --   fromerly rescaled [GRI_19_ny1]'
--UNION SELECT [v] = 'SHI_Q_4'                      , [q] = 'SHI_04_ny'     , [s] = '100  --   fromerly rescaled [SHI_04_ny0]'
--UNION SELECT [v] = 'SHI_Q_5'                      , [q] = 'SHI_05_ny'     , [s] = '100  --   fromerly rescaled [SHI_05_ny0]'
--UNION SELECT [v] = 'GRX_22_blasphemy'             , [q] = 'GRX_22_01_ny'  , [s] = '100  --   fromerly rescaled [GRX_22_01_ny1]'
--UNION SELECT [v] = 'GRX_22_apostasy'              , [q] = 'GRX_22_02_ny'  , [s] = '100  --   fromerly rescaled [GRX_22_02_ny1]'
--UNION SELECT [v] = 'GRX_22_hate_speech'           , [q] = 'GRX_22_03_ny'  , [s] = '100  --   fromerly rescaled [GRX_22_03_ny1]'
--UNION SELECT [v] = 'GRX_22_criticism_of_religion' , [q] = 'GRX_22_04_ny'  , [s] = '100  --   fromerly rescaled [GRX_22_04_ny1]'
--) DDTT
--INNER
--JOIN
--[Pew_Question_Std]
--ON [q] = [Question_abbreviation_std]
