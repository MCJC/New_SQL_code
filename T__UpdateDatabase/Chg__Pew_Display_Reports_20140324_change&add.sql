--/**************************************************************************************************************************/
--USE       [forum]
--GO
--/**************************************************************************************************************************/
--/*****                                              BackUp current Table                                              *****/
--/**************************************************************************************************************************/
--  DECLARE @CrDt    varchar( 8)
--  DECLARE                          --  declare variable
--          @TofI                    --  variable name
--                   varchar(50)     --  data type of the variable
--  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
--/*------------------------------------------------------------------------------------------------------------------------*/
--EXEC ( ' SELECT *
--                INTO  [_bk_forum].[dbo].[Pew_Display_Reports_' + @CrDt + ']
--                FROM      [forum].[dbo].[Pew_Display_Reports]' )
--/*------------------------------------------------------------------------------------------------------------------------*/
--/**************************************************************************************************************************/
--UPDATE
--            [forum].[dbo].[Pew_Display_Reports]
--SET
--            [forum].[dbo].[Pew_Display_Reports].[GRF_Level]
--       =    'reports'
--WHERE
--            [forum].[dbo].[Pew_Display_Reports].[Religion_fk]
--            IS NOT NULL
--AND
--            [forum].[dbo].[Pew_Display_Reports].[GRF_Level]
--            IS     NULL
--/**************************************************************************************************************************/
--SELECT [Display_Reports_pk]
--      ,[List_fk]
--      ,[item_fk]
--      ,[Nation_fk]
--      ,[Locality_fk]
--      ,[Religion_fk]
--      ,[Topic_fk]
--      ,[Question_fk]
--      ,[Data_source_fk]
--      ,[Report_SortingNumber]
--      ,[GRF_Level]
--  FROM 
--       [forum].[dbo].[Pew_Display_Reports]
--WHERE
--       [forum].[dbo].[Pew_Display_Reports].[Religion_fk]
--       IS NOT NULL
--/**************************************************************************************************************************/
--INSERT INTO
--       [forum].[dbo].[Pew_Display_Reports]
--SELECT 
--       [Display_Reports_pk]      = (SELECT MAX([Display_Reports_pk]) 
--                                    FROM       [forum].[dbo].[Pew_Display_Reports])
--                                  + 
--                                   (ROW_NUMBER()
--                                    OVER(ORDER BY [Religion_fk]
--                                                , [Data_source_fk] ))
--      ,[List_fk]
--      ,[item_fk]
--      ,[Nation_fk]
--      ,[Locality_fk]
--      ,[Religion_fk]
--      ,[Topic_fk]
--      ,[Question_fk]
--      ,[Data_source_fk]        =  4 + [Data_source_fk]     -- code in Stacy was not updated
--      ,[Report_SortingNumber]
--      ,[GRF_Level]
--  FROM 
--       [Stacy].[dbo].[Pew_Display_Reports_editable_for_changessss]
--WHERE
-- (
--       [Stacy].[dbo].[Pew_Display_Reports_editable_for_changessss].[Religion_fk]
--       = 28
--  AND
--       [Stacy].[dbo].[Pew_Display_Reports_editable_for_changessss].[Data_source_fk]
--       = 65
-- )
--OR
-- (
--       [Stacy].[dbo].[Pew_Display_Reports_editable_for_changessss].[Religion_fk]
--       IS NOT NULL
--  AND
--       [Stacy].[dbo].[Pew_Display_Reports_editable_for_changessss].[Data_source_fk]
--       IS NOT NULL
--  AND
--       [Stacy].[dbo].[Pew_Display_Reports_editable_for_changessss].[GRF_Level]
--       = 'for_more_info'
-- )
--/**************************************************************************************************************************/
--SELECT [Display_Reports_pk]
--      ,[List_fk]
--      ,[item_fk]
--      ,[Nation_fk]
--      ,[Locality_fk]
--      ,[Religion_fk]
--      ,[Topic_fk]
--      ,[Question_fk]
--      ,[Data_source_fk]
--      ,[Report_SortingNumber]
--      ,[GRF_Level]
--  FROM 
--       [forum].[dbo].[Pew_Display_Reports]
----WHERE
----       [GRF_Level] IS NULL
--ORDER BY 
--       [Display_Reports_pk]  DESC
--/**************************************************************************************************************************/


