/***************************************************************************************************************/
SELECT *
  INTO  [_bk_forum].[dbo].[Pew_Data_Source_2013_06_05]
  FROM      [forum].[dbo].[Pew_Data_Source]
/***************************************************************************************************************/
-- Update by adding a new source (for sources on restrictions)
INSERT INTO
            [forum].[dbo].[Pew_Data_Source]
                                             (  [Data_source_pk]
                                              , [Data_source_name]
                                              , [Data_source_description]
                                              , [Data_source_url]
                                              , [Source_Display_Name]     )
SELECT
         1 + ( SELECT DISTINCT MAX([Data_source_pk])
               FROM [forum].[dbo].[Pew_Data_Source]  )
       , 'Global Restriction on Religion Study'
       , 'Sources for coding Government Restrictions and Social Hostilities on Religion'
       , 'http://www.pewforum.org/Government/Rising-Restrictions-on-Religion.aspx'
       , 'Global Restrictions on Religion studies'
/*********************************************************************************************************/
-- Update by adding a new source (for Restrictions' report 4)
INSERT INTO
            [forum].[dbo].[Pew_Data_Source]
                                             (  [Data_source_pk]
                                              , [Data_source_name]
                                              , [Data_source_description]  )
SELECT
         1 + ( SELECT DISTINCT MAX([Data_source_pk])
               FROM [forum].[dbo].[Pew_Data_Source]  )
       , 'Global Restriction on Religion Study'
       , 'Religious Restrictions Report 4'
/*********************************************************************************************************/
-- Update by adding new sources (for new Pew Research Global Indexes)
INSERT INTO
            [forum].[dbo].[Pew_Data_Source]
                                             (  [Data_source_pk]
                                              , [Data_source_name]         )
SELECT
         RN =
                ROW_NUMBER() OVER(ORDER BY [DSN])
              + (SELECT DISTINCT MAX([Data_source_pk])
            FROM [forum].[dbo].[Pew_Data_Source])
       , DSN
FROM
     (
             SELECT DSN = 'Political Process Restrictions Study'
       UNION SELECT DSN = 'Civil Society Restrictions Study'
       UNION SELECT DSN = 'Restrictions on Individual Rights Study'
       UNION SELECT DSN = 'Individual Empowerment Study'
       UNION SELECT DSN = 'Economic Regulation Study'
                                                                      ) AS D
/*********************************************************************************************************/
/*********************************************************************************************************/
/*********************************************************************************************************/

-- check results
SELECT 
       *
         FROM      [forum].[dbo].[Pew_Data_Source]
SELECT 
       * 
         FROM  [_bk_forum].[dbo].[Pew_Data_Source_2013_06_05]
/*********************************************************************************************************/

