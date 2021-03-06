/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Religion_group_pk]
      ,[Pew_religion]
      ,[Pew_religion_lev05]
      ,[Pew_religion_lev04]
      ,[Pew_religion_lev03]
      ,[Pew_religion_lev02_5]
      ,[Pew_religion_lev02]
      ,[Pew_RelL02_Display]
      ,[Pew_religion_lev01_5]
      ,[Pew_religion_lev01]
      ,[Pew_religion_lev00]
      ,[Wrd_religion_code]
  FROM [forum].[dbo].[Pew_Religion_Group]
where  
       Pew_religion  like '%ahm%' 
   or
       Pew_religion  like '%alir%' 
   or
       Pew_religion  like '%druz%' 
   or
       Pew_religion  like 'Other' 
   or
       Pew_religion  like 'Other Religions' 
   or
       Pew_religion  like 'Other Schismatic Muslim%' 
   or
       Pew_religion  like 'Other Muslim%' 
or Pew_religion_lev05 = 'Aliran Kepercayaan'


-- also make 	Pew_RelL02_5_display
-- different from Pew_religion_lev02_5 as:
pk	Pew_religion_lev02_5	Pew_RelL02_5_display
5	Sunni Muslims			Muslims
6	Shia Muslims			Muslims
169	Sunni Muslims			Muslims
170	Sunni Muslims			Muslims
171	Sunni Muslims			Muslims
172	Sunni Muslims			Muslims
173	Sunni Muslims			Muslims
174	Sunni Muslims			Muslims
175	Sunni Muslims			Muslims
176	Shia Muslims			Muslims
177	Shia Muslims			Muslims
178	Shia Muslims			Muslims
179	Shia Muslims			Muslims
180	Shia Muslims			Muslims
181	Shia Muslims			Muslims
182	Shia Muslims			Muslims
183	Shia Muslims			Muslims