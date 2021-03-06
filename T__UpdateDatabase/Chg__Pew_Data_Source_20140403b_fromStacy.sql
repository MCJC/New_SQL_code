/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
-- BACK UP was earlier today
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
-- Update from Stacy's table:
--   Table in Stacy DB cannot be directly used (both tables would have the same exposed names)
--   Thus we use correlation names to distinguish them.
UPDATE
           [forum].[dbo].[Pew_Data_Source]
SET
           [forum].[dbo].[Pew_Data_Source].[Data_source_url]
       =                             clone.[Data_source_url]
--select *
FROM
          [forum].[dbo].[Pew_Data_Source]            AS mydbt
 JOIN
          [Stacy].[dbo].[Pew_Data_Source_editable]   AS clone

ON
           mydbt.[Data_source_pk]
       =   clone.[Data_source_pk]
WHERE
           mydbt.[Data_source_url]
      !=   clone.[Data_source_url]
/*********************************************************************************************************/
SELECT  
        F.[Data_source_pk]
       ,S.[Data_source_pk]
       ,F.[Data_source_name]
       ,S.[Data_source_name]
       ,F.[Data_source_description]
       ,S.[Data_source_description]
       ,F.[Data_source_url]
       ,S.[Data_source_url]
       ,F.[Source_Display_Name]
       ,S.[Source_Display_Name]
  FROM [forum].[dbo].[Pew_Data_Source]             F
     , [Stacy].[dbo].[Pew_Data_Source_editable]    S
WHERE 
        F.[Data_source_pk]
       =S.[Data_source_pk]
AND (   F.[Data_source_name]
      !=S.[Data_source_name]
     OR
        F.[Data_source_description]
      !=S.[Data_source_description]
     OR
        F.[Data_source_url]
      !=S.[Data_source_url]
     OR
        F.[Source_Display_Name]
      !=S.[Source_Display_Name]             )
/*********************************************************************************************************/

