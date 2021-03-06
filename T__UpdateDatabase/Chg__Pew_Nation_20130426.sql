/*********************************************************************************************************/
SELECT *
  INTO [_bk_forum].[dbo].[Pew_Nation_2013_04_26]
  FROM     [forum].[dbo].[Pew_Nation]
/*********************************************************************************************************/
-- Update
-- Change the datatype to support enough characters
ALTER TABLE
           [forum].[dbo].[Pew_Nation]
ALTER COLUMN
                                      [Source_GDP_per_capita]
                                                                  VARCHAR(250)
----------------------------------------------------------------------------------------
ALTER TABLE
           [forum].[dbo].[Pew_Nation]
ALTER COLUMN
                                      [Source_Adult_Literacy_Pct]
                                                                  VARCHAR(100)
----------------------------------------------------------------------------------------
ALTER TABLE
           [forum].[dbo].[Pew_Nation]
ALTER COLUMN
                                      [MainSources]
                                                                  VARCHAR(400)
----------------------------------------------------------------------------------------
/**************************************************************************************************************************************************/
-- Load the data into a temporary table
IF OBJECT_ID  (N'[juancarlos].[dbo].[N_Update]', N'U') IS NOT NULL
DROP   TABLE     [juancarlos].[dbo].[N_Update]
/**************************************************************************************************************************************************/
-- create
CREATE TABLE
                 [juancarlos].[dbo].[N_Update]
           (   Nation_pk                    INT
             , Source_GDP_per_capita        VARCHAR(250)
             , Source_Adult_Literacy_Pct    VARCHAR(100)
             , MainSources                  VARCHAR(400)  )
/**************************************************************************************************************************************************/
INSERT INTO
                 [juancarlos].[dbo].[N_Update]
                                              (
                                                 [Nation_pk]
                                               , [Source_GDP_per_capita]
                                               , [Source_Adult_Literacy_Pct]
                                                                              )
SELECT
         1
       , '2005 GDP per capita (in 2005 PPP US$, from UNDP International Development Indicators)'
       , 'Literacy Rate in 2000 (from UN: MICS)'
UNION ALL
SELECT
         2
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         3
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         4
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         5
       , '2005 GDP per capita (in 2005 PPP US$, from World Map Report 2007, National Hospice and Palliative Care Organization)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         6
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         7
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2003 GDP in Canadian Trade Commissioner Service)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         8
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         9
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         10
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         11
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         12
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 1996 (from Brittanica 2007)'
UNION ALL
SELECT
         13
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         14
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         15
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from HDR 2007/2008)'
UNION ALL
SELECT
         16
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         17
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         18
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from HDR 2007/2008)'
UNION ALL
SELECT
         19
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         20
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         21
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         22
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         23
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2006 GDP in UK Foreign & Commonwealth Office)'
       , 'Literacy Rate in 1997 (from Brittanica 2007)'
UNION ALL
SELECT
         24
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         25
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         26
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         27
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         28
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         29
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2006 GDP in UK Foreign & Commonwealth Office)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         30
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         31
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         32
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         33
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         34
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         35
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         36
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2002 (from Brittanica 2007)'
UNION ALL
SELECT
         37
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         38
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2006 GDP in UK Foreign & Commonwealth Office)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         39
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         40
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         41
       , '2005 GDP per capita (in 2005 PPP US$, from States of Guernsey Policy Council)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         42
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         43
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         44
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         45
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         46
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from HDR 2007/2008)'
UNION ALL
SELECT
         47
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         48
       , '2005 GDP per capita (in 2005 PPP US$, from World Map Report 2007, National Hospice and Palliative Care Organization)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         49
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         50
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         51
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         52
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         53
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         54
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2001 (from Brittanica 2007)'
UNION ALL
SELECT
         55
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         56
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from HDR 2007/2008)'
UNION ALL
SELECT
         57
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 1996 (from Brittanica 2007)'
UNION ALL
SELECT
         58
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         59
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         60
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         61
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         62
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         63
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         64
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         65
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         66
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2003 GDP in ArcticStat database,  Chaire de recherche du Canada sur la condition autochtone comparée)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         67
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         68
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from HDR 2007/2008)'
UNION ALL
SELECT
         69
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         70
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         71
       , '2005 GDP per capita (in 2005 PPP US$, from Eurostat 2008, European Union)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         72
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2000 GDP in Herland, Michel. Insularité, indépendance et développement. Mondes francophones 27.2 (2007))'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         73
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         74
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         75
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         76
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         77
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         78
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         79
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         80
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2003 GDP in ArcticStat database,  Chaire de recherche du Canada sur la condition autochtone comparée)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         81
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 1995 (from Brittanica 2007)'
UNION ALL
SELECT
         82
       , '2005 GDP per capita (in 2005 PPP US$, from Eurostat 2008, European Union)'
       , 'Literacy Rate in 1992 (from Brittanica 2007)'
UNION ALL
SELECT
         83
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         84
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         85
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         86
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         87
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from HDR 2007/2008)'
UNION ALL
SELECT
         88
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         89
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         90
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         91
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from HDR 2007/2008)'
UNION ALL
SELECT
         92
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         93
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         94
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         95
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         96
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         97
       , '2005 GDP per capita (in 2005 PPP US$, from UNDP International Development Indicators)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         98
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         99
       , '2005 GDP per capita (in 2005 PPP US$, from Isle of Man Government)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         100
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2004 (from UN: SU)'
UNION ALL
SELECT
         101
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         102
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         103
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         104
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         105
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         106
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         107
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 1995 (from Brittanica 2007)'
UNION ALL
SELECT
         108
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2002 GDP in UNDP International Development Indicators)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         109
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         110
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         111
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         112
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         113
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         114
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         115
       , '2005 GDP per capita (in 2005 PPP US$, from UNDP International Development Indicators)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         116
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         117
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2004 GDP in Liechtenstein in Figures 2007/2008, Liechtenstein Office of Economic Affairs)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         118
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         119
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2001 (from Brittanica 2007)'
UNION ALL
SELECT
         120
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         121
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         122
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         123
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         124
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         125
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         126
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         127
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         128
       , '2005 GDP per capita (in 2005 PPP US$, from World Map Report 2007, National Hospice and Palliative Care Organization)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         129
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2004 GDP in Eurostat 2008, European Union)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         130
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         131
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         132
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2002 GDP in Groupe de recherche en développement international de l''Université Laval)'
       , 'Literacy Rate in 1997 (from Brittanica 2007)'
UNION ALL
SELECT
         133
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         134
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         135
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         136
       , '2005 GDP per capita (in 2005 PPP US$, from World Map Report 2007, National Hospice and Palliative Care Organization)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         137
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         138
       , '2005 GDP per capita (in 2005 PPP US$, from UNDP International Development Indicators)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         139
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         140
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         141
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         142
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         143
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         144
       , '2005 GDP per capita (in 2005 PPP US$, from World Map Report 2007, National Hospice and Palliative Care Organization)'
       , 'Literacy Rate in 1999 (from Brittanica 2007)'
UNION ALL
SELECT
         145
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         146
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         147
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         148
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2000 GDP in Herland, Michel. Insularité, indépendance et développement. Mondes francophones 27.2 (2007))'
       , 'Literacy Rate in 1996 (from UN: PC)'
UNION ALL
SELECT
         149
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         150
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         151
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         152
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         153
       , '2005 GDP per capita (in 2005 PPP US$, from World Map Report 2007, National Hospice and Palliative Care Organization)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         154
       , '2005 GDP per capita (in 2005 PPP US$, from UNDP International Development Indicators)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         155
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 1990 (from Brittanica 2007)'
UNION ALL
SELECT
         156
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         157
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         158
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         159
       , '2005 GDP per capita (in 2005 PPP US$, from UNDP International Development Indicators)'
       , 'Literacy Rate in 1997 (from Brittanica 2007)'
UNION ALL
SELECT
         160
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         161
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         162
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         163
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         164
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         165
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         167
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         168
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         169
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2003 GDP estimate in World Development Indicators database, World Bank, 2005)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         170
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         171
       , '2005 GDP per capita (in 2005 PPP US$, from Eurostat 2008, European Union)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         172
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         173
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         174
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         175
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         176
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 1990 (from Brittanica 2007)'
UNION ALL
SELECT
         177
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         178
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         179
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 1991 (from Brittanica 2007)'
UNION ALL
SELECT
         180
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         181
       , '2005 GDP per capita (in 2005 PPP US$, from World Map Report 2007, National Hospice and Palliative Care Organization)'
       , 'Literacy Rate in 1997 (from Brittanica 2007)'
UNION ALL
SELECT
         182
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         183
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         184
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         185
       , '2005 GDP per capita (in 2005 PPP US$, from UNDP International Development Indicators)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         186
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         187
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         188
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         189
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2001 (from Brittanica 2007)'
UNION ALL
SELECT
         190
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         191
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 1999 (from Brittanica 2007)'
UNION ALL
SELECT
         192
       , '2005 GDP per capita (in 2005 PPP US$, from UNDP International Development Indicators)'
       , 'Literacy Rate in 1995 (from Brittanica 2007)'
UNION ALL
SELECT
         193
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         194
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         195
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         196
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         197
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         198
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         199
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         200
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2002 (from Brittanica 2007)'
UNION ALL
SELECT
         201
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         202
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         203
       , '2005 GDP per capita (in 2005 PPP US$, from WEO data, IMF)'
       , 'Literacy Rate in 2008 (from Taiwan Govt)'
UNION ALL
SELECT
         204
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         205
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         206
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         207
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         208
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         209
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2002 GDP in Pacific Institute of Advanced Studies in Development and Governance, University of the South Pacific)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         210
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         211
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         212
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         213
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         214
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         215
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         216
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2003 GDP in Cordellier, Serge, Béatrice Didiot, and Sarah Netter. L''état Du Monde 2004: Annuaire Économique Géopolitique Mondial.)'
       , 'Literacy Rate in 1990 (from Brittanica 2007)'
UNION ALL
SELECT
         217
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         218
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         219
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         220
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2002 (from Brittanica 2007)'
UNION ALL
SELECT
         221
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2000 (from Brittanica 2007)'
UNION ALL
SELECT
         222
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         223
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         224
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         225
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         226
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         227
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         228
       , '2005 GDP per capita (in 2005 PPP US$, projected from 2004 GDP in Commission of the European Communities, 2006)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         229
       , '2005 GDP per capita (in 2005 PPP US$, from from WRD, estimate)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
UNION ALL
SELECT
         230
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         231
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         232
       , '2005 GDP per capita (in 2005 PPP US$, from HDR 2007 / 2008)'
       , 'Literacy Rate in 2012 (from UNESCO)'
UNION ALL
SELECT
         237
       , '2005 GDP per capita (in 2005 PPP US$, from GDP of Sudan in HDR 2007 / 2008)'
       , 'Literacy Rate in 2010 (estimate from WRD)'
/*********************************************************************************************************/
/*********************************************************************************************************/
/*********************************************************************************************************/
UPDATE
           [juancarlos].[dbo].[N_Update]
SET
           [juancarlos].[dbo].[N_Update].[MainSources]

         =  'Population data from United Nations (updated June 2011); '
          + [Source_GDP_per_capita]
          + '; '
          + [Source_Adult_Literacy_Pct]
/*********************************************************************************************************/
--   New Table cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_Nation]
SET
           [forum].[dbo].[Pew_Nation].[Source_GDP_per_capita]
       =                        clone.[Source_GDP_per_capita]
      ,
           [forum].[dbo].[Pew_Nation].[Source_Adult_Literacy_Pct]
       =                        clone.[Source_Adult_Literacy_Pct]
      ,
           [forum].[dbo].[Pew_Nation].[MainSources]
       =                        clone.[MainSources]
FROM
                [forum].[dbo].[Pew_Nation]  AS mydbt
 JOIN
           [juancarlos].[dbo].[N_Update]    AS clone

ON
           mydbt.[Nation_pk]
       =   clone.[Nation_pk]

/*********************************************************************************************************/
-- check results
SELECT 
       [Nation_pk]
      ,[Ctry_EditorialName]
      ,[Literacy_Rate]
      ,[GDP_per_capita]
      ,[Source_GDP_per_capita]
      ,[Source_Adult_Literacy_Pct]
      ,[MainSources]
FROM    [forum].[dbo].[Pew_Nation]
/*********************************************************************************************************/
