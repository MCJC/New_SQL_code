
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Survey_pk]
      ,[Survey_field_name]
      ,[Survey_Country]
      ,[Main_country_fk]
      ,[Survey_name]
      ,[Survey_short_name]
      ,[Source_type]
      ,[Survey_year]
      ,[Provinces_Covered_Pct]
      ,[Provinces_100Cases_Pct]
      ,[Response_rate]
      ,[Valid_sample_size]
      ,[Male_and_female]
      ,[Religious_categories]
      ,[Multiple_languages]
      ,[Sample_design]
      ,[Mode]
      ,[Languages]
      ,[Fieldwork_dates]
      ,[Representative_coverage]
      ,[Portion_Not_Covered]
      ,[Survey_note]
      ,[Population_Covered_Pct]
      ,[Languages_Offered]
      ,[Available_Translations]
      ,[Question_Type]
      ,[Question_Wording]
      ,[Answer_Choices]
      ,[Sample_universe]
      ,[Weighting]
      ,[Cases]
      ,[Data_release_note]
      ,[Exclude_Data_From_Online]
      ,[Source_Reference]
  FROM [forum].[dbo].[Survey]




/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Survey_fk]
      ,[Survey_locality_fk]
      ,[Adherents_Pct_of_Province]
      ,[Survey_Religion_fk]
      ,[Adherents_note]
      ,[Survey_data_pk]
  FROM [forum].[dbo].[Survey_data]



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Survey_locality_pk]
      ,[Survey_fk]
      ,[Survey_locality_name]
      ,[Province_fk]
      ,[Survey_locality_note]
      ,[Cases]
      ,[Religion_string]
      ,[Pct_of_Country]
  FROM [forum].[dbo].[Survey_locality]



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Survey_Religion_pk]
      ,[Survey_fk]
      ,[Survey_religion_name]
      ,[WRD_religion_code_fk]
      ,[Survey_religion_note]
      ,[Adherents_Pct_of_Country]
  FROM [forum].[dbo].[Survey_religion_code]