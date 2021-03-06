/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
/***                                                                                                                                            ***/
/***     >>>>>         This is the script used to remove all tables (no views used) from the database used to load survey data        <<<<<     ***/
/***                                                                                                                                            ***/
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
USE              [x_LoadRLS1cUS]
GO
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
/*********************************************************     >>>>>  cursor                                                                    ***/
DECLARE @CODEmain1 nvarchar(max)                          /***        declare variable for storing code during each data retreival              ***/
DECLARE @tablename nvarchar(max)                          /***        declare variable for storing data from cursor                             ***/
DECLARE MyCursor   CURSOR FOR                             /*** >>>>   declare cursor to take values from the following select sataement         ***/
/**************************************************************************************************************************************************/
SELECT      [TABLE_NAME]                                  /*** >>>    select table names                                                        ***/
FROM        [INFORMATION_SCHEMA].[TABLES]                 /***        from the system view listing tables & views in the database               ***/
WHERE       [TABLE_TYPE]    = 'BASE TABLE'                /*** <<<    filter to display only tables (excluding views)                           ***/
--    AND   [TABLE_NAME] NOT LIKE '%_BkUp'                /*** <<<    filter to NOT display backup                                              ***/
/**************************************************************************************************************************************************/
OPEN             MyCursor                                 /*** >>>    open cursor by its name                                                   ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
FETCH NEXT FROM  MyCursor                                 /***        retrieve the next row from cursor                                         ***/
           INTO  @tablename                               /***        store it into the corresponding variable(s)                               ***/
          WHILE  @@FETCH_STATUS = 0                       /***        while the status of the last retreival has been successful                ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
BEGIN                                                     /*** >>     BEGIN the procedures using values of each row of the cursor               ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
SET     @CODEmain1 =                                       /*** >      the code to be stored as string (for each row of the cursor) begins here: ***/
N'
       DROP TABLE [' + @tablename + ']
 '                                                        /*** <      the code to be stored as string ends here                                 ***/
PRINT  (@CODEmain1)                                       /***        display the currently stored code (to be executed)                        ***/
EXEC   (@CODEmain1)                                       /***        execute the code that has been stored as text                             ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                          /*** <<     ENDING of the procedures using values of each row of the cursor           ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
FETCH NEXT FROM  MyCursor                                 /***        retrieve the next row from cursor                                         ***/
           INTO  @tablename                               /***        store it into the corresponding variable(s)                               ***/
           END                                            /***        and end when last row has been retreived                                  ***/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
   CLOSE         MyCursor                                 /*** <<<    close cursor by its name                                                  ***/
DEALLOCATE       MyCursor                                 /*** <<<<   remove reference and relase from memory by cursor name                    ***/
/*********************************************************     <<<<<  cursor                                                                    ***/
/**************************************************************************************************************************************************/


--/**************************************************************************************************************************************************/
--/*********************************************************     >>>>>  cursor                                                                    ***/
--DECLARE @CODEmain2 nvarchar(max)                          /***        declare variable for storing code during each data retreival              ***/
--DECLARE @viewname  nvarchar(max)                          /***        declare variable for storing data from cursor                             ***/
--DECLARE MyCursor   CURSOR FOR                             /*** >>>>   declare cursor to take values from the following select sataement         ***/
--/**************************************************************************************************************************************************/
--SELECT      [TABLE_NAME]                                  /*** >>>    select view names                                                         ***/
--FROM        [INFORMATION_SCHEMA].[TABLES]                 /***        from the system view listing tables & views in the database               ***/
--WHERE       [TABLE_TYPE] = 'VIEW'                         /*** <<<    filter to display only views (excluding tables)                           ***/
--/**************************************************************************************************************************************************/
--OPEN             MyCursor                                 /*** >>>    open cursor by its name                                                   ***/
--/*------------------------------------------------------------------------------------------------------------------------------------------------*/
--FETCH NEXT FROM  MyCursor                                 /***        retrieve the next row from cursor                                         ***/
--           INTO  @viewname                                /***        store it into the corresponding variable(s)                               ***/
--          WHILE  @@FETCH_STATUS = 0                       /***        while the status of the last retreival has been successful                ***/
--/*------------------------------------------------------------------------------------------------------------------------------------------------*/
--BEGIN                                                     /*** >>     BEGIN the procedures using values of each row of the cursor               ***/
--/*------------------------------------------------------------------------------------------------------------------------------------------------*/
--SET     @CODEmain2 =                                       /*** >      the code to be stored as string (for each row of the cursor) begins here: ***/
--N'
--  ALTER VIEW [' + @viewname + '] AS SELECT [a] = ''a'' 
-- '                                                        /*** <      the code to be stored as string ends here                                 ***/
--PRINT  (@CODEmain2)                                       /***        display the currently stored code (to be executed)                        ***/
--EXEC   (@CODEmain2)                                       /***        execute the code that has been stored as text                             ***/
--/*------------------------------------------------------------------------------------------------------------------------------------------------*/
--                                                          /*** <<     ENDING of the procedures using values of each row of the cursor           ***/
--/*------------------------------------------------------------------------------------------------------------------------------------------------*/
--FETCH NEXT FROM  MyCursor                                 /***        retrieve the next row from cursor                                         ***/
--           INTO  @viewname                                /***        store it into the corresponding variable(s)                               ***/
--           END                                            /***        and end when last row has been retreived                                  ***/
--/*------------------------------------------------------------------------------------------------------------------------------------------------*/
--   CLOSE         MyCursor                                 /*** <<<    close cursor by its name                                                  ***/
--DEALLOCATE       MyCursor                                 /*** <<<<   remove reference and relase from memory by cursor name                    ***/
--/*********************************************************     <<<<<  cursor                                                                    ***/
--/**************************************************************************************************************************************************/

/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Answer_NoStd]
         FROM [forum].[dbo].[Pew_Answer_NoStd]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Answer_Std]
         FROM [forum].[dbo].[Pew_Answer_Std]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Answer]
         FROM [forum].[dbo].[Pew_Answer]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Question_NoStd]
         FROM [forum].[dbo].[Pew_Question_NoStd]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Question_Std]
         FROM [forum].[dbo].[Pew_Question_Std]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Question]
         FROM [forum].[dbo].[Pew_Question]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Q&A]
         FROM [forum].[dbo].[Pew_Q&A]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Data_Source]
         FROM [forum].[dbo].[Pew_Data_Source]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Religion_Group]
         FROM [forum].[dbo].[Pew_Religion_Group]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Survey_Respondent]
         FROM [forum].[dbo].[Pew_Survey_Respondent]
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Survey_Respondent_Answer]
         FROM [forum].[dbo].[Pew_Survey_Respondent_Answer]
/**************************************************************************************************************************************************/
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Question_Topic]
         FROM [forum].[dbo].[Pew_Question_Topic]
/**************************************************************************************************************************************************/
GO
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Survey_Respondent__bkup]
         FROM               [Pew_Survey_Respondent]
TRUNCATE TABLE              [Pew_Survey_Respondent]
/**************************************************************************************************************************************************/
GO
/**************************************************************************************************************************************************/
SELECT * INTO               [Pew_Survey_Respondent_Answer__bkup]
         FROM               [Pew_Survey_Respondent_Answer]
TRUNCATE TABLE              [Pew_Survey_Respondent_Answer]
/**************************************************************************************************************************************************/
GO
