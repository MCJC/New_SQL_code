

SELECT 
[TABLE_NAME]
, [a] = ' AS                      T' + RIGHT(  ('0'+CAST(ROW_NUMBER() over (order by[TABLE_NAME]) AS NVARCHAR)),2)
--,*

  FROM [forum].[INFORMATION_SCHEMA].[TABLES]
SELECT [TABLE_NAME]
      ,[COLUMN_NAME]
      ,[ORDINAL_POSITION]
      ,[COLUMN_DEFAULT]
      ,[IS_NULLABLE]
      ,[DATA_TYPE]
      ,[CHARACTER_MAXIMUM_LENGTH]
      ,[CHARACTER_OCTET_LENGTH]
      ,[NUMERIC_PRECISION]
      ,[NUMERIC_PRECISION_RADIX]
      ,[NUMERIC_SCALE]
      ,[DATETIME_PRECISION]
      ,[CHARACTER_SET_CATALOG]
      ,[CHARACTER_SET_SCHEMA]
      ,[CHARACTER_SET_NAME]
      ,[COLLATION_CATALOG]
      ,[COLLATION_SCHEMA]
      ,[COLLATION_NAME]
      ,[DOMAIN_CATALOG]
      ,[DOMAIN_SCHEMA]
      ,[DOMAIN_NAME]




 WHERE [TABLE_NAME] LIKE 'Pew%'

TABLE_NAME	a





Pew_Age									 AS                      T01
Pew_Answer								 AS                      T02
Pew_Answer_NoStd						 AS                      T03
Pew_Answer_Std							 AS                      T04
Pew_Data_Source							 AS                      T05
Pew_Display_by_Nation&Religion			 AS                      T06
Pew_Display_by_Year						 AS                      T07
Pew_Display_Footnotes					 AS                      T08
Pew_Display_Question					 AS                      T09
Pew_Display_Reports						 AS                      T10
Pew_Field								 AS                      T11
Pew_Flag								 AS                      T12
Pew_Footnote							 AS                      T13
Pew_GRFsite_URLs_Topic					 AS                      T14
Pew_Index_Cut_Points					 AS                      T15
Pew_Indexes								 AS                      T16
Pew_Language							 AS                      T17
Pew_Lists								 AS                      T18
Pew_Locality							 AS                      T19
Pew_Locality_Answer						 AS                      T20
Pew_Migration							 AS                      T21
Pew_Migration_Data						 AS                      T22
Pew_Migration_Data_Quality_Level		 AS                      T23
Pew_Migration_Data_Source				 AS                      T24
Pew_Migration_Flow						 AS                      T25
Pew_Nation								 AS                      T26
Pew_Nation_Age_Sex_Value				 AS                      T27
Pew_Nation_Answer						 AS                      T28
Pew_Nation_Language						 AS                      T29
Pew_Nation_Religion_Age_Sex_Value		 AS                      T30
Pew_Nation_Religion_Answer				 AS                      T31
Pew_Nation_Religion_Fertility_Value		 AS                      T32
Pew_Nation_Religion_Switching_Base_Rate	 AS                      T33
Pew_Nation_Religion_Switching_Flow		 AS                      T34
Pew_Nation_Religion_Value				 AS                      T35
Pew_Nation_Subreligion_Distribution		 AS                      T36
Pew_Preferred_Scenario					 AS                      T37
Pew_Q&A									 AS                      T38
Pew_Q&A_Std								 AS                      T39
Pew_Question							 AS                      T40
Pew_Question_Displayable				 AS                      T41
Pew_Question_NoStd						 AS                      T42
Pew_Question_Std						 AS                      T43
Pew_Question_Topic						 AS                      T44
Pew_Religion_Group						 AS                      T45
Pew_Scenario							 AS                      T46
Pew_Sex									 AS                      T47
Pew_Survey_Answer						 AS                      T48
Pew_Survey_Respondent					 AS                      T49
Pew_Survey_Respondent_Answer			 AS                      T50
Pew_Thresholds							 AS                      T51
Pew_Topic								 AS                      T52










SELECT 
        * FROM
Pew_Age	 AS                      T02
Pew_Answer	 AS                      T03
Pew_Answer_NoStd	 AS                      T04
Pew_Answer_Std	 AS                      T05
Pew_Data_Source	 AS                      T06
Pew_Display_by_Nation&Religion	 AS                      T07
Pew_Display_by_Year	 AS                      T08
Pew_Display_Footnotes	 AS                      T09
Pew_Display_Question	 AS                      T10
Pew_Display_Reports	 AS                      T11
Pew_Field	 AS                      T12
Pew_Flag	 AS                      T13
Pew_Footnote	 AS                      T14
Pew_GRFsite_URLs_Topic	 AS                      T15
Pew_Index_Cut_Points	 AS                      T16
Pew_Indexes	 AS                      T17
Pew_Language	 AS                      T18
Pew_Lists	 AS                      T19
Pew_Locality	 AS                      T20
Pew_Locality_Answer	 AS                      T21
Pew_Migration	 AS                      T22
Pew_Migration_Data	 AS                      T23
Pew_Migration_Data_Quality_Level	 AS                      T24
Pew_Migration_Data_Source	 AS                      T25
Pew_Migration_Flow	 AS                      T26
Pew_Nation	 AS                      T27
Pew_Nation_Age_Sex_Value	 AS                      T28
Pew_Nation_Answer	 AS                      T29
Pew_Nation_Language	 AS                      T30
Pew_Nation_Religion_Age_Sex_Value	 AS                      T31
Pew_Nation_Religion_Answer	 AS                      T32
Pew_Nation_Religion_Fertility_Value	 AS                      T33
Pew_Nation_Religion_Switching_Base_Rate	 AS                      T34
Pew_Nation_Religion_Switching_Flow	 AS                      T35
Pew_Nation_Religion_Value	 AS                      T36
Pew_Nation_Subreligion_Distribution	 AS                      T37
Pew_Preferred_Scenario	 AS                      T38
Pew_Q&A	 AS                      T39
Pew_Q&A_Std	 AS                      T40
Pew_Question	 AS                      T41
Pew_Question_Displayable	 AS                      T42
Pew_Question_NoStd	 AS                      T43
Pew_Question_Std	 AS                      T44
Pew_Question_Topic	 AS                      T45
Pew_Religion_Group	 AS                      T46
Pew_Scenario	 AS                      T47
Pew_Sex	 AS                      T48
Pew_Survey_Answer	 AS                      T49
Pew_Survey_Respondent	 AS                      T50
Pew_Survey_Respondent_Answer	 AS                      T51
Pew_Thresholds	 AS                      T52
Pew_Topic	 AS                      T53
Province	 AS                      T54
Restrictions_byCtry	 AS                      T55
Survey	 AS                      T56
Survey_data	 AS                      T57
Survey_locality	 AS                      T58
Survey_religion_code	 AS                      T59
sysdiagrams	 AS                      T60
v__AllCodedData	 AS                      T61
v_Current_Survey_Questions	 AS                      T62
v_Data_for_WRD_Religion_Comparison	 AS                      T63
v_GRI_20_01_all	 AS                      T64
V_Pew_LongIndex	 AS                      T65
v_Religion_Group_for_Surveys	 AS                      T66
vd_01__Forum_IIASA_codes	 AS                      T67
vg_04__Switching_BasicRate	 AS                      T68
vi_AgeSexValue	 AS                      T69
vi_AgeSexValue_Pct_of_W	 AS                      T70
vi_CutPoints	 AS                      T71
vi_FertilityRate	 AS                      T72
vi_Field	 AS                      T73
vi_ForMoreInformationLinks_by_Region_or_Ctry	 AS                      T74
vi_ForMoreInformationLinks_by_Religion	 AS                      T75
vi_Locations_by_Question	 AS                      T76
vi_MedianAge	 AS                      T77
vi_Migrants	 AS                      T78
vi_Migrants_by_Ctry	 AS                      T79
vi_Nation_Attributes	 AS                      T80
vi_Nation_Flags	 AS                      T81
vi_QuestionMetadata_Svy&Restr	 AS                      T82
vi_Religion_Attributes	 AS                      T83
vi_Reportable_DataSource_Joins	 AS                      T84
vi_ReportLinks_by_Region_or_Ctry	 AS                      T85
vi_ReportLinks_by_Religion	 AS                      T86
vi_Restrictions_byCtryYr	 AS                      T87
vi_Restrictions_Ctry&Q&Yr_Displayable	 AS                      T88
vi_Restrictions_Index_by_CtryRegion&Yr	 AS                      T89
vi_Restrictions_Q&Yr_Displayable	 AS                      T90
vi_Restrictions_Tables_by_region&world	 AS                      T91
vi_Sources_by_Tabs&Charts	 AS                      T92
vi_Survey_Tables_Displayable	 AS                      T93
vi_SurveyQuestion&Answers_Unique	 AS                      T94
vi_SurveyQuestions_ByYear	 AS                      T95
vi_SurveyQuestions_Unique	 AS                      T96
vi_Thresholds	 AS                      T97
vi_Topic&Question_Displayable	 AS                      T98
vi_Topic&Question_link_RelatedPewResearchReports	 AS                      T99
vm__Migration_by_DestCountry_2010to2015	 AS                      T00
vm__Migration_by_Religion_2010to2015	 AS                      T01
vm__Migration_Flow_all	 AS                      T02
vm__Migration_Flow_by_Country	 AS                      T03
vm__RegionalMigration	 AS                      T04
vm__RegionalMigration_IN&OUT&NET_2010to2015	 AS                      T05
vm__RegionalMigration_IN&OUT&NET_2010to2050	 AS                      T06
zg_WRD_Religion	 AS                      T07

















