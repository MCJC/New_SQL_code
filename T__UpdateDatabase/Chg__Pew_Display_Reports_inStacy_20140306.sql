/*********************************************************************************************************/
--Work in [Stacy]
USE       [Stacy]GO
/*********************************************************************************************************/
/*********************************************************************************************************/
UPDATE
            [Stacy].[dbo].[Pew_Display_Reports_editable]
SET
            [Stacy].[dbo].[Pew_Display_Reports_editable].[GRF_Level]
       =    'reports'
WHERE
            [Stacy].[dbo].[Pew_Display_Reports_editable].[Religion_fk]
            IS NOT NULL
AND
            [Stacy].[dbo].[Pew_Display_Reports_editable].[GRF_Level]
            IS     NULL
/*********************************************************************************************************/
SELECT [Display_Reports_pk]
      ,[List_fk]
      ,[item_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Topic_fk]
      ,[Question_fk]
      ,[Data_source_fk]
      ,[Report_SortingNumber]
      ,[GRF_Level]
  FROM 
       [Stacy].[dbo].[Pew_Display_Reports_editable]
WHERE
       [Stacy].[dbo].[Pew_Display_Reports_editable].[Religion_fk]
       IS NOT NULL
/*********************************************************************************************************/

