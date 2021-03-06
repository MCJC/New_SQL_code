/**************************************************************************************************************************/
/***     >>>>>   This is the script used to create the table [forum].[dbo].[Pew_Display_Footnotes]            <<<<<     ***/
/**************************************************************************************************************************/
/*****                                              BackUp current Table                                              *****/
/**************************************************************************************************************************/
  DECLARE @CrDt    varchar( 8)
  DECLARE                          --  declare variable
          @TofI                    --  variable name
                   varchar(50)     --  data type of the variable
  SET     @CrDt = (CONVERT(VARCHAR(8),GETDATE(),112))
/*------------------------------------------------------------------------------------------------------------------------*/
EXEC ( ' SELECT *
                INTO  [_bk_forum].[dbo].[Pew_Display_Footnotes_' + @CrDt + ']
                FROM      [forum].[dbo].[Pew_Display_Footnotes]' )
/*------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************************************************/
-- identify updated rows
SELECT 
     [Stacy_pk]             =                  S.[Display_Footnotes_pk]
    ,[Forum_pk]             =                                                         DB.[Display_Footnotes_pk]
    ,[Display_Footnotes_pk] = CASE WHEN ISNULL(S.[Display_Footnotes_pk], 0)  = ISNULL(DB.[Display_Footnotes_pk], 0) THEN 'OK' END
    ,[List_fk]              = CASE WHEN ISNULL(S.[List_fk]             , 0)  = ISNULL(DB.[List_fk]             , 0) THEN 'OK' END
    ,[item_fk]              = CASE WHEN ISNULL(S.[item_fk]             , 0)  = ISNULL(DB.[item_fk]             , 0) THEN 'OK' END
    ,[Nation_fk]            = CASE WHEN ISNULL(S.[Nation_fk]           , 0)  = ISNULL(DB.[Nation_fk]           , 0) THEN 'OK' END
    ,[Locality_fk]          = CASE WHEN ISNULL(S.[Locality_fk]         , 0)  = ISNULL(DB.[Locality_fk]         , 0) THEN 'OK' END
    ,[Religion_fk]          = CASE WHEN ISNULL(S.[Religion_fk]         , 0)  = ISNULL(DB.[Religion_fk]         , 0) THEN 'OK' END
    ,[Topic_fk]             = CASE WHEN ISNULL(S.[Topic_fk]            , 0)  = ISNULL(DB.[Topic_fk]            , 0) THEN 'OK' END
    ,[Question_fk]          = CASE WHEN ISNULL(S.[Question_fk]         , 0)  = ISNULL(DB.[Question_fk]         , 0) THEN 'OK' END
    ,[Note_fk]              = CASE WHEN ISNULL(S.[Note_fk]             , 0)  = ISNULL(DB.[Note_fk]             , 0) THEN 'OK' END
    ,[Note_SortingNumber]   = CASE WHEN ISNULL(S.[Note_SortingNumber]  , 0)  = ISNULL(DB.[Note_SortingNumber]  , 0) THEN 'OK' END

FROM 
     [Stacy].[dbo].[Pew_Display_Footnotes_editable]    S
FULL JOIN
     [Forum].[dbo].[Pew_Display_Footnotes]             DB
ON 
          S.[Display_Footnotes_pk]
       = DB.[Display_Footnotes_pk]
/**************************************************************************************************************************/
/**************************************************************************************************************************/
-- Update by adding new note from Stacy's table:
INSERT INTO
           [forum].[dbo].[Pew_Display_Footnotes]
SELECT [Display_Footnotes_pk]
      ,[List_fk]
      ,[item_fk]
      ,[Nation_fk]
      ,[Locality_fk]
      ,[Religion_fk]
      ,[Topic_fk]
      ,[Question_fk]
      ,[Note_fk]
      ,[Note_SortingNumber]
  FROM [Stacy].[dbo].[Pew_Display_Footnotes_editable]
WHERE  
                     [Display_Footnotes_pk]  
       > (SELECT MAX([Display_Footnotes_pk]) FROM [Forum]..[Pew_Display_Footnotes])
/*********************************************************************************************************/
-- check results
SELECT 
       *
FROM
           [forum].[dbo].[Pew_Display_Footnotes]
ORDER BY
           [Display_Footnotes_pk]   DESC
/*********************************************************************************************************/
