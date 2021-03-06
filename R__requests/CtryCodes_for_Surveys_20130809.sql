USE [workspace]
GO
/***************************************************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************************************************************************/
--create VIEW
ALTER  VIEW
               [dbo].[V_CtryCodes.sql]
AS
/***************************************************************************************************************************************************************/
SELECT 
       DataBase_Key = [Nation_pk]

      --,[Nation]
      --,[Country_fk]
      --,[Weighting]
      --,[Nation_note]
      --,[Iso_3166_Code]
      --,[Nicknames]
      --,[Pfcountry]
      --,[CtryCapital]
      --,[Current_pop]
      --,[Reference_pop]
      --,[Life_Expectancy]
      --,[Literacy_Rate]
      --,[GDP_per_capita]
      ,[Ctry_EditorialName]
      --,[TPop1990]
      --,[TPop2000]
      --,[TPop2010]
      --,[TPop2020]
      --,[TPop2030]
      --,[Region]
      --,[SubRegion]
      --,[IMF_Advance]
      --,[Global_NS]
      --,[UN_Reg1]
      --,[UN_Reg2]
      --,[UN_Develop]
      --,[FOTM_Advance]
      --,[TPop1910]
      --,[Christian_pct1910]
      --,[Evangelical_pct2010]
      --,[Pentecostal_pct2010]
      --,[Charismatic_pct2010]
      --,[Num_UNStatDiv]
      --,[SubRegion6]
      --,[Internet_user_pct]
      --,[Source_GDP_per_capita]
      --,[Source_Adult_Literacy_Pct]
      --,[MainSources]
  FROM
       [forum].[dbo].[Pew_Nation]
/***************************************************************************************************************************************************************/
