--select * from [RLS].[dbo].[Displayable_NewWideVersion]
--except
--select * from [RLS].[dbo].[Displayable_NewWideVersion1]



--/************************************************************************************************************************/
--/************************************************************************************************************************/
--SELECT * FROM
--(

--select                              /* statement                         */
--      id1                     /* existing variable(s)              */
--     , Q1                       /* newvar: stores setofvars_1 names  */    
--     , mYDIF = CASE 
--                                               WHEN ANSINT1 
--                                                  = ANSINT2        THEN 0 
--                                               --WHEN [CUR].[RLS_DNWV_pk] = NULL
--                                               -- AND [OTH].[RLS_DNWV_pk] = NULL THEN 0 
--                                                                               ELSE 1
--                                               END 


--     , ANSINT1                        /* newvar: stores setofvars_1 values */
--     , ANSINT2                        /* newvar: stores setofvars_1 values */
------SELECT *
--FROM

--/*************************************************************************/
--(select                              /* statement                         */
--      ID1 = [RLSx0_001_main_ID]                     /* existing variable(s)              */
--     , Q1                       /* newvar: stores setofvars_1 names  */    
--     , ANSINT1                        /* newvar: stores setofvars_1 values */
--  from                              /* statement                         */
-- [Displayable_NewWideVersion] 
--unpivot (                           /* statement                         */
--       ANSINT1                        /* newvar: stores setofvars_1 values */
--       for                          /* statement                         */
--       Q1                       /* newvar: stores setofvars_1 names  */
--       in (                         /* statement                         */
-- RLSx1_001_year

--,RLSx4_001_reltradfordisplay_v
--,RLSx4_002_protfamfordisplay_v
--,RLSx4_003_familyfordisplay_v
--,RLSx4_004_denomfordisplay2_v    /* last name of the setofvars_1      */
--          )                         /* statement                         */
--        )                           /* statement                         */
--       as                           /* statement                         */
--       UP1                          /* statement                         */
--/*************************************************************************/
--) AS1
--FULL
--JOIN
--/*************************************************************************/
--(select                              /* statement                         */
--      ID2 = [RLSx0_001_main_ID]                     /* existing variable(s)              */
--     , Q2                       /* newvar: stores setofvars_1 names  */    
--     , ANSINT2                        /* newvar: stores setofvars_1 values */
--  from                              /* statement                         */
-- [Displayable_NewWideVersion1] 
--unpivot (                           /* statement                         */
--       ANSINT2                        /* newvar: stores setofvars_1 values */
--       for                          /* statement                         */
--       Q2                       /* newvar: stores setofvars_1 names  */
--       in (                         /* statement                         */
-- RLSx1_001_year

--,RLSx4_001_reltradfordisplay_v
--,RLSx4_002_protfamfordisplay_v
--,RLSx4_003_familyfordisplay_v
--,RLSx4_004_denomfordisplay2_v    /* last name of the setofvars_1      */
--          )                         /* statement                         */
--        )                           /* statement                         */
--       as                           /* statement                         */
--       UP2                          /* statement                         */
--/*************************************************************************/
--) AS2

--ON
--      ID1 = iD2                     /* existing variable(s)              */
--  AND Q1 = Q2
--)  DA12
--WHERE  mYDIF  != 0
--/************************************************************************************************************************/
--/************************************************************************************************************************/

--/************************************************************************************************************************/
--/************************************************************************************************************************/
--SELECT * FROM
--(

--select                              /* statement                         */
--      id1                     /* existing variable(s)              */
--     , Q1                       /* newvar: stores setofvars_1 names  */    
--     , mYDIF = CASE 
--                                               WHEN ANSINT1 
--                                                  = ANSINT2        THEN 0 
--                                               --WHEN [CUR].[RLS_DNWV_pk] = NULL
--                                               -- AND [OTH].[RLS_DNWV_pk] = NULL THEN 0 
--                                                                               ELSE 1
--                                               END 


--     , ANSINT1                        /* newvar: stores setofvars_1 values */
--     , ANSINT2                        /* newvar: stores setofvars_1 values */
------SELECT *
--FROM

--/*************************************************************************/
--(select                              /* statement                         */
--      ID1 = [RLSx0_001_main_ID]                     /* existing variable(s)              */
--     , Q1                       /* newvar: stores setofvars_1 names  */    
--     , ANSINT1                        /* newvar: stores setofvars_1 values */
--  from                              /* statement                         */
-- [Displayable_NewWideVersion] 
--unpivot (                           /* statement                         */
--       ANSINT1                        /* newvar: stores setofvars_1 values */
--       for                          /* statement                         */
--       Q1                       /* newvar: stores setofvars_1 names  */
--       in (                         /* statement                         */
-- RLSx2_001_WEIGHT
--,RLSx2_002_akhiweight2007
--,RLSx2_003_WGT_all_MSA
--          )                         /* statement                         */
--        )                           /* statement                         */
--       as                           /* statement                         */
--       UP1                          /* statement                         */
--/*************************************************************************/
--) AS1
--FULL
--JOIN
--/*************************************************************************/
--(select                              /* statement                         */
--      ID2 = [RLSx0_001_main_ID]                     /* existing variable(s)              */
--     , Q2                       /* newvar: stores setofvars_1 names  */    
--     , ANSINT2  = ISNULL(ANSINT2, 0)                        /* newvar: stores setofvars_1 values */
--  from                              /* statement                         */
-- [Displayable_NewWideVersion1] 
--unpivot (                           /* statement                         */
--       ANSINT2                        /* newvar: stores setofvars_1 values */
--       for                          /* statement                         */
--       Q2                       /* newvar: stores setofvars_1 names  */
--       in (                         /* statement                         */
-- RLSx2_001_WEIGHT
--,RLSx2_002_akhiweight2007
--,RLSx2_003_WGT_all_MSA
--          )                         /* statement                         */
--        )                           /* statement                         */
--       as                           /* statement                         */
--       UP2                          /* statement                         */
--/*************************************************************************/
--) AS2

--ON
--      ID1 = iD2                     /* existing variable(s)              */
--  AND Q1 = Q2
--)  DA12
--WHERE  mYDIF  != 0
--   OR  mYDIF  = NULL
--/************************************************************************************************************************/
--/************************************************************************************************************************/



--/************************************************************************************************************************/
--/************************************************************************************************************************/
--SELECT * FROM
--(

--select                              /* statement                         */
--      id1                     /* existing variable(s)              */
--     , Q1                       /* newvar: stores setofvars_1 names  */    
--     , mYDIF = CASE 
--                                               WHEN ANSINT1 
--                                                  = ANSINT2        THEN 0 
--                                               --WHEN [CUR].[RLS_DNWV_pk] = NULL
--                                               -- AND [OTH].[RLS_DNWV_pk] = NULL THEN 0 
--                                                                               ELSE 1
--                                               END 


--     , ANSINT1                        /* newvar: stores setofvars_1 values */
--     , ANSINT2                        /* newvar: stores setofvars_1 values */
------SELECT *
--FROM

--/*************************************************************************/
--(select                              /* statement                         */
--      ID1 = [RLSx0_001_main_ID]                     /* existing variable(s)              */
--     , Q1                       /* newvar: stores setofvars_1 names  */    
--     , ANSINT1                        /* newvar: stores setofvars_1 values */
--  from                              /* statement                         */
-- [Displayable_NewWideVersion] 
--unpivot (                           /* statement                         */
--       ANSINT1                        /* newvar: stores setofvars_1 values */
--       for                          /* statement                         */
--       Q1                       /* newvar: stores setofvars_1 names  */
--       in (                         /* statement                         */
-- RLSx3_000_other_and_christian
--,RLSx3_001_otherfaithfordisplay
--,RLSx3_002_christianfordisplay
--,RLSx3_003_protestantfordisplay
--,RLSx4_001_reltradfordisplay_w
--,RLSx4_002_protfamfordisplay_w
--,RLSx4_003_familyfordisplay_w
--,RLSx4_004_denomfordisplay2_w
--          )                         /* statement                         */
--        )                           /* statement                         */
--       as                           /* statement                         */
--       UP1                          /* statement                         */
--/*************************************************************************/
--) AS1
--FULL
--JOIN
--/*************************************************************************/
--(select                              /* statement                         */
--      ID2 = [RLSx0_001_main_ID]                     /* existing variable(s)              */
--     , Q2                       /* newvar: stores setofvars_1 names  */    
--     , ANSINT2                        /* newvar: stores setofvars_1 values */
--  from                              /* statement                         */
-- [Displayable_NewWideVersion1] 
--unpivot (                           /* statement                         */
--       ANSINT2                        /* newvar: stores setofvars_1 values */
--       for                          /* statement                         */
--       Q2                       /* newvar: stores setofvars_1 names  */
--       in (                         /* statement                         */
-- RLSx3_000_other_and_christian
--,RLSx3_001_otherfaithfordisplay
--,RLSx3_002_christianfordisplay
--,RLSx3_003_protestantfordisplay
--,RLSx4_001_reltradfordisplay_w
--,RLSx4_002_protfamfordisplay_w
--,RLSx4_003_familyfordisplay_w
--,RLSx4_004_denomfordisplay2_w
--          )                         /* statement                         */
--        )                           /* statement                         */
--       as                           /* statement                         */
--       UP2                          /* statement                         */
--/*************************************************************************/
--) AS2

--ON
--      ID1 = iD2                     /* existing variable(s)              */
--  AND Q1 = Q2
--)  DA12
--WHERE  mYDIF  != 0
--/************************************************************************************************************************/
--/************************************************************************************************************************/


--/************************************************************************************************************************/
--/************************************************************************************************************************/
--SELECT * FROM
--(

--select                              /* statement                         */
--      id1                     /* existing variable(s)              */
--     , Q1                       /* newvar: stores setofvars_1 names  */    
--     , mYDIF = CASE 
--                                               WHEN ANSINT1 
--                                                  = ANSINT2        THEN 0 
--                                               WHEN ANSINT1  = '' 
--                                                and ANSINT2    Is null    THEN 0 
--                                               --WHEN [CUR].[RLS_DNWV_pk] = NULL
--                                               -- AND [OTH].[RLS_DNWV_pk] = NULL THEN 0 
--                                                                               ELSE 1
--                                               END 


--     , ANSINT1                        /* newvar: stores setofvars_1 values */
--     , ANSINT2                        /* newvar: stores setofvars_1 values */
------SELECT *
--FROM

--/*************************************************************************/
--(select                              /* statement                         */
--      ID1 = [RLSx0_001_main_ID]                     /* existing variable(s)              */
--     , Q1                       /* newvar: stores setofvars_1 names  */    
--     , ANSINT1                        /* newvar: stores setofvars_1 values */
--  from                              /* statement                         */
-- [Displayable_NewWideVersion] 
--unpivot (                           /* statement                         */
--       ANSINT1                        /* newvar: stores setofvars_1 values */
--       for                          /* statement                         */
--       Q1                       /* newvar: stores setofvars_1 names  */
--       in (                         /* statement                         */
-- RLSx5_001_cregion
--,RLSx5_002_state
--,RLSx5_003_qa1
--,RLSx5_004_qa2a
--,RLSx5_005_qa2b
--,RLSx5_006_qb1a
--,RLSx5_007_qb1b
--,RLSx5_008_qb1c
--,RLSx5_009_qb2a
--,RLSx5_010_qb2b
--,RLSx5_011_qb2c
--,RLSx5_012_qb2d
--,RLSx5_013_qb20
--,RLSx5_014_qb21
--,RLSx5_015_qb22
--,RLSx5_016_qb30
--,RLSx5_017_qb30b
--,RLSx5_018_qb31
--,RLSx5_019_marital
--,RLSx5_020_attend
--,RLSx5_021_qf2
--,RLSx5_022_qf5
--,RLSx5_023_qg1
--,RLSx5_024_qg1b
--,RLSx5_025_qg1c
--,RLSx5_026_qg3
--,RLSx5_027_qg5
--,RLSx5_028_qg6
--,RLSx5_029_qg7
--,RLSx5_030_qg7b
--,RLSx5_031_qh1
--,RLSx5_032_qh2
--,RLSx5_033_qh4
--,RLSx5_034_qi1
--,RLSx5_035_qi2a
--,RLSx5_036_qi2b
--,RLSx5_037_qi2c
--,RLSx5_038_qi2d
--,RLSx5_039_qi2g
--,RLSx5_040_qi2h
--,RLSx5_041_qi2m
--,RLSx5_042_qi2t
--,RLSx5_043_qi2u
--,RLSx5_044_qi3
--,RLSx5_045_qi3b
--,RLSx5_046_qi4a
--,RLSx5_047_qi4b
--,RLSx5_048_qi4c
--,RLSx5_049_qi4d
--,RLSx5_050_children
--,RLSx5_051_chage1
--,RLSx5_052_chageold
--,RLSx5_053_chageyng
--,RLSx5_054_qk10a
--,RLSx5_055_qk10b
--,RLSx5_056_qk10c
--,RLSx5_057_qk10d
--,RLSx5_058_qm5a
--,RLSx5_059_qm5b
--,RLSx5_060_qm5d
--,RLSx5_061_qm5e
--,RLSx5_062_qm5f
--,RLSx5_063_qm5g
--,RLSx5_064_age
--,RLSx5_065_educ
--,RLSx5_066_income
--,RLSx5_067_income2
--,RLSx5_068_party
--,RLSx5_069_partyln
--,RLSx5_070_ideo
--,RLSx5_071_fert
--,RLSx5_072_qp99
--,RLSx5_073_lgbt
--,RLSx5_074_born
--,RLSx5_075_chborn
--,RLSx5_076_spborn
--,RLSx5_077_sex
--,RLSx5_078_respondent_birthregion
--,RLSx5_079_father_birthregion
--,RLSx5_080_mother_birthregion
--,RLSx5_081_racenew
--,RLSx5_082_educcmb
--,RLSx5_083_citizen
--,RLSx5_084_regvoter
--,RLSx5_085_educ2cat
--,RLSx5_086_MetroRegion
--          )                         /* statement                         */
--        )                           /* statement                         */
--       as                           /* statement                         */
--       UP1                          /* statement                         */
--/*************************************************************************/
--) AS1
--FULL
--JOIN
--/*************************************************************************/
--(select                              /* statement                         */
--      ID2 = [RLSx0_001_main_ID]                     /* existing variable(s)              */
--     , Q2                       /* newvar: stores setofvars_1 names  */    
--     , ANSINT2 = ISNULL(ANSINT2, '')                        /* newvar: stores setofvars_1 values */
--  from                              /* statement                         */
-- [Displayable_NewWideVersion1] 
--unpivot (                           /* statement                         */
--       ANSINT2                        /* newvar: stores setofvars_1 values */
--       for                          /* statement                         */
--       Q2                       /* newvar: stores setofvars_1 names  */
--       in (                         /* statement                         */
-- RLSx5_001_cregion
--,RLSx5_002_state
--,RLSx5_003_qa1
--,RLSx5_004_qa2a
--,RLSx5_005_qa2b
--,RLSx5_006_qb1a
--,RLSx5_007_qb1b
--,RLSx5_008_qb1c
--,RLSx5_009_qb2a
--,RLSx5_010_qb2b
--,RLSx5_011_qb2c
--,RLSx5_012_qb2d
--,RLSx5_013_qb20
--,RLSx5_014_qb21
--,RLSx5_015_qb22
--,RLSx5_016_qb30
--,RLSx5_017_qb30b
--,RLSx5_018_qb31
--,RLSx5_019_marital
--,RLSx5_020_attend
--,RLSx5_021_qf2
--,RLSx5_022_qf5
--,RLSx5_023_qg1
--,RLSx5_024_qg1b
--,RLSx5_025_qg1c
--,RLSx5_026_qg3
--,RLSx5_027_qg5
--,RLSx5_028_qg6
--,RLSx5_029_qg7
--,RLSx5_030_qg7b
--,RLSx5_031_qh1
--,RLSx5_032_qh2
--,RLSx5_033_qh4
--,RLSx5_034_qi1
--,RLSx5_035_qi2a
--,RLSx5_036_qi2b
--,RLSx5_037_qi2c
--,RLSx5_038_qi2d
--,RLSx5_039_qi2g
--,RLSx5_040_qi2h
--,RLSx5_041_qi2m
--,RLSx5_042_qi2t
--,RLSx5_043_qi2u
--,RLSx5_044_qi3
--,RLSx5_045_qi3b
--,RLSx5_046_qi4a
--,RLSx5_047_qi4b
--,RLSx5_048_qi4c
--,RLSx5_049_qi4d
--,RLSx5_050_children
--,RLSx5_051_chage1
--,RLSx5_052_chageold
--,RLSx5_053_chageyng
--,RLSx5_054_qk10a
--,RLSx5_055_qk10b
--,RLSx5_056_qk10c
--,RLSx5_057_qk10d
--,RLSx5_058_qm5a
--,RLSx5_059_qm5b
--,RLSx5_060_qm5d
--,RLSx5_061_qm5e
--,RLSx5_062_qm5f
--,RLSx5_063_qm5g
--,RLSx5_064_age
--,RLSx5_065_educ
--,RLSx5_066_income
--,RLSx5_067_income2
--,RLSx5_068_party
--,RLSx5_069_partyln
--,RLSx5_070_ideo
--,RLSx5_071_fert
--,RLSx5_072_qp99
--,RLSx5_073_lgbt
--,RLSx5_074_born
--,RLSx5_075_chborn
--,RLSx5_076_spborn
--,RLSx5_077_sex
--,RLSx5_078_respondent_birthregion
--,RLSx5_079_father_birthregion
--,RLSx5_080_mother_birthregion
--,RLSx5_081_racenew
--,RLSx5_082_educcmb
--,RLSx5_083_citizen
--,RLSx5_084_regvoter
--,RLSx5_085_educ2cat
--,RLSx5_086_MetroRegion
--          )                         /* statement                         */
--        )                           /* statement                         */
--       as                           /* statement                         */
--       UP2                          /* statement                         */
--/*************************************************************************/
--) AS2

--ON
--      ID1 = iD2                     /* existing variable(s)              */
--  AND Q1 = Q2
--)  DA12
--WHERE  mYDIF  != 0
--/************************************************************************************************************************/
--/************************************************************************************************************************/

