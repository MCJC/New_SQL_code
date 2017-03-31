
Stata:

use "W:\Forum\Demography Team\Education project\Data\educrelig_poprnk.dta", clear
save "\\Mac\Home\Desktop\jcedu____educrelig_poprnk.dta"
des
decode cohortana, gen(cohortana_str)
decode display, gen(display_str)



sql:


/*** update values for loading IIASA projection data **********************************************************************/
----------------------------------------------------------------------------------------------------------------------------
/**** database name specification (twice) *********************************************************************************/
----------------------------------------------------------------------------------------------------------------------------
USE              [forum_ResAnal]
GO
----------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID  (N'[forum_ResAnal].[dbo].[educrelig_poprnk__dta]', N'U') IS NOT NULL
DROP   TABLE                     [dbo].[educrelig_poprnk__dta]
GO
----------------------------------------------------------------------------------------------------------------------------
/**************************************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/**************************************************************************************************************************/
CREATE TABLE
    [educrelig_poprnk__dta]
(
	[educrelig]             [int]    NOT NULL,







	[Scenario_id]           [int]        NULL,
	[Scenario_description]  varchar(200) NULL,
	[Notes]                 varchar(200) NULL,
    CONSTRAINT
    [PK_Scenario]
    PRIMARY KEY CLUSTERED 
    (
	  [Scenario_pk] ASC
                         )WITH (  PAD_INDEX              = OFF,
                                  STATISTICS_NORECOMPUTE = OFF,
                                  IGNORE_DUP_KEY         = OFF,
                                  ALLOW_ROW_LOCKS        = ON ,
                                  ALLOW_PAGE_LOCKS       = ON  ) ON [PRIMARY]
                                                                               ) ON [PRIMARY]
GO
/**************************************************************************************************************************/
SET ANSI_PADDING OFF
GO




/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Nation_Religion_Age_Sex_Value_pk]
      ,[Field_fk]
      ,[Scenario_id]
      ,[Nation_fk]
      ,[Religion_Group_fk]
      ,[Distribution_Wave_id]
      ,[Sex_fk]
      ,[Age_fk]
      ,[Percentage]
      ,[Cases]
      ,[Cases_Notes]
      ,[Source]
      ,[Source_Year]
      ,[Nation_Value_Source]
      ,[Notes]
      ,[Display_AgeSex_Str]
      ,[Display_AgeStr_15Yrs]
      ,[Display_MedianAge]
  FROM [forum].[dbo].[Pew_Nation_Religion_Age_Sex_Value]


CREATE TABLE   
    [ database_name . [ schema_name ] . | schema_name . ] table_name   
    [ AS FileTable ]  
    ( {   <column_definition>   
        | <computed_column_definition> }   
        | <column_set_definition>   
        | [ <table_constraint> ]   
        | [ <table_index> ] }  
          [ ,...n ]    
          [ PERIOD FOR SYSTEM_TIME ( system_start_time_column_name   
             , system_end_time_column_name ) ]  
      )  
    [ ON { partition_scheme_name ( partition_column_name )   
           | filegroup   
           | "default" } ]   
    [ { TEXTIMAGE_ON { filegroup | "default" } ]   
    [ FILESTREAM_ON { partition_scheme_name   
           | filegroup   
           | "default" } ]  
    [ WITH ( <table_option> [ ,...n ] ) ]  
[ ; ]  
  
<column_definition> ::=  
column_name <data_type>  
    [ FILESTREAM ]  
    [ COLLATE collation_name ]   
    [ SPARSE ]  
    [ MASKED WITH ( FUNCTION = ' mask_function ') ]  
    [ CONSTRAINT constraint_name ] DEFAULT constant_expression ]   
    [ IDENTITY [ ( seed,increment ) ]  
    [ NOT FOR REPLICATION ]   
    [ GENERATED ALWAYS AS ROW { START | END } [ HIDDEN ] ]   
    [ NULL | NOT NULL ]  
    [ ROWGUIDCOL ]  
    [ ENCRYPTED WITH   
        ( COLUMN_ENCRYPTION_KEY = key_name ,  
          ENCRYPTION_TYPE = { DETERMINISTIC | RANDOMIZED } ,   
          ALGORITHM = 'AEAD_AES_256_CBC_HMAC_SHA_256'  
        ) ]  
    [ <column_constraint> [ ...n ] ]   
    [ <column_index> ]  
  
<data type> ::=   
[ type_schema_name . ] type_name   
    [ ( precision [ , scale ] | max |   
        [ { CONTENT | DOCUMENT } ] xml_schema_collection ) ]   
  
<column_constraint> ::=   
[ CONSTRAINT constraint_name ]   
{     { PRIMARY KEY | UNIQUE }   
        [ CLUSTERED | NONCLUSTERED ]   
        [   
            WITH FILLFACTOR = fillfactor    
          | WITH ( < index_option > [ , ...n ] )   
        ]   
        [ ON { partition_scheme_name ( partition_column_name )   
            | filegroup | "default" } ]  
  
  | [ FOREIGN KEY ]   
        REFERENCES [ schema_name . ] referenced_table_name [ ( ref_column ) ]   
        [ ON DELETE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]   
        [ ON UPDATE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]   
        [ NOT FOR REPLICATION ]   
  
  | CHECK [ NOT FOR REPLICATION ] ( logical_expression )   
}   
  
<column_index> ::=   
 INDEX index_name [ CLUSTERED | NONCLUSTERED ]  
    [ WITH ( <index_option> [ ,... n ] ) ]  
    [ ON { partition_scheme_name (column_name )   
         | filegroup_name  
         | default   
         }  
    ]   
    [ FILESTREAM_ON { filestream_filegroup_name | partition_scheme_name | "NULL" } ]  
  
<computed_column_definition> ::=  
column_name AS computed_column_expression   
[ PERSISTED [ NOT NULL ] ]  
[   
    [ CONSTRAINT constraint_name ]  
    { PRIMARY KEY | UNIQUE }  
        [ CLUSTERED | NONCLUSTERED ]  
        [   
            WITH FILLFACTOR = fillfactor   
          | WITH ( <index_option> [ , ...n ] )  
        ]  
        [ ON { partition_scheme_name ( partition_column_name )   
        | filegroup | "default" } ]  
  
    | [ FOREIGN KEY ]   
        REFERENCES referenced_table_name [ ( ref_column ) ]   
        [ ON DELETE { NO ACTION | CASCADE } ]   
        [ ON UPDATE { NO ACTION } ]   
        [ NOT FOR REPLICATION ]   
  
    | CHECK [ NOT FOR REPLICATION ] ( logical_expression )   
]   
  
<column_set_definition> ::=  
column_set_name XML COLUMN_SET FOR ALL_SPARSE_COLUMNS  
  
< table_constraint > ::=  
[ CONSTRAINT constraint_name ]   
{   
    { PRIMARY KEY | UNIQUE }   
        [ CLUSTERED | NONCLUSTERED ]   
        (column [ ASC | DESC ] [ ,...n ] )   
        [   
            WITH FILLFACTOR = fillfactor   
           |WITH ( <index_option> [ , ...n ] )   
        ]  
        [ ON { partition_scheme_name (partition_column_name)  
            | filegroup | "default" } ]   
    | FOREIGN KEY   
        ( column [ ,...n ] )   
        REFERENCES referenced_table_name [ ( ref_column [ ,...n ] ) ]   
        [ ON DELETE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]   
        [ ON UPDATE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]   
        [ NOT FOR REPLICATION ]   
    | CHECK [ NOT FOR REPLICATION ] ( logical_expression )  
 

  
< table_index > ::=   
{  
    {  
      INDEX index_name [ CLUSTERED | NONCLUSTERED ]   
         (column_name [ ASC | DESC ] [ ,... n ] )   
    | INDEX index_name CLUSTERED COLUMNSTORE  
    | INDEX index_name [ NONCLUSTERED ] COLUMNSTORE (column_name [ ,... n ] )  
    }  
    [ WITH ( <index_option> [ ,... n ] ) ]   
    [ ON { partition_scheme_name (column_name )   
         | filegroup_name  
         | default   
         }  
    ]   
    [ FILESTREAM_ON { filestream_filegroup_name | partition_scheme_name | "NULL" } ]  
  
}   


<table_option> ::=  
{  
    [DATA_COMPRESSION = { NONE | ROW | PAGE }  
      [ ON PARTITIONS ( { <partition_number_expression> | <range> }   
      [ , ...n ] ) ]]  
    [ FILETABLE_DIRECTORY = <directory_name> ]   
    [ FILETABLE_COLLATE_FILENAME = { <collation_name> | database_default } ]  
    [ FILETABLE_PRIMARY_KEY_CONSTRAINT_NAME = <constraint_name> ]  
    [ FILETABLE_STREAMID_UNIQUE_CONSTRAINT_NAME = <constraint_name> ]  
    [ FILETABLE_FULLPATH_UNIQUE_CONSTRAINT_NAME = <constraint_name> ]  
    [ SYSTEM_VERSIONING = ON [ ( HISTORY_TABLE = schema_name . history_table_name  
        [, DATA_CONSISTENCY_CHECK = { ON | OFF } ] ) ] ]  
    [ REMOTE_DATA_ARCHIVE =   
      {   
          ON [ ( <table_stretch_options> [,...n] ) ]  
        | OFF ( MIGRATION_STATE = PAUSED )   
      }   
    ]  
}  
  
<table_stretch_options> ::=  
{  
     [ FILTER_PREDICATE = { null | table_predicate_function } , ]  
       MIGRATION_STATE = { OUTBOUND | INBOUND | PAUSED }  
 }  
  
<index_option> ::=  
{   
    PAD_INDEX = { ON | OFF }   
  | FILLFACTOR = fillfactor   
  | IGNORE_DUP_KEY = { ON | OFF }   
  | STATISTICS_NORECOMPUTE = { ON | OFF }   
  | ALLOW_ROW_LOCKS = { ON | OFF}   
  | ALLOW_PAGE_LOCKS ={ ON | OFF}   
  | COMPRESSION_DELAY= {0 | delay [Minutes]}  
  | DATA_COMPRESSION = { NONE | ROW | PAGE | COLUMNSTORE | COLUMNSTORE_ARCHIVE }  
       [ ON PARTITIONS ( { <partition_number_expression> | <range> }   
       [ , ...n ] ) ]  
}  
<range> ::=   
<partition_number_expression> TO <partition_number_expression>  

  
      --Memory optimized CREATE TABLE Syntax  
CREATE TABLE  
    [database_name . [schema_name ] . | schema_name . ] table_name  
    ( { <column_definition>  
    | [ <table_constraint> ] [ ,... n ]  
    | [ <table_index> ]  
      [ ,... n ] }   
      [ PERIOD FOR SYSTEM_TIME ( system_start_time_column_name   
        , system_end_time_column_name ) ]  
)  
    [ WITH ( <table_option> [ ,... n ] ) ]  
 [ ; ]  
  
<column_definition> ::=  
column_name <data_type>  
    [ COLLATE collation_name ]  
    [ GENERATED ALWAYS AS ROW { START | END } [ HIDDEN ] ]   
    [ NULL | NOT NULL ]  
[  
    [ CONSTRAINT constraint_name ] DEFAULT memory_optimized_constant_expression ]  
    | [ IDENTITY [ ( 1, 1 ) ]  
]  
    [ <column_constraint> ]  
    [ <column_index> ]  
  
<data type> ::=  
 [type_schema_name . ] type_name [ (precision [ , scale ]) ]  
  
<column_constraint> ::=  
 [ CONSTRAINT constraint_name ]  
{   
  { PRIMARY KEY | UNIQUE }    
      {   NONCLUSTERED   
        | NONCLUSTERED HASH WITH (BUCKET_COUNT = bucket_count)   
      }   
  | [ FOREIGN KEY ]   
        REFERENCES [ schema_name . ] referenced_table_name [ ( ref_column ) ]   
  | CHECK ( logical_expression )   
}  
  
< table_constraint > ::=  
 [ CONSTRAINT constraint_name ]  
{    
   { PRIMARY KEY | UNIQUE }  
     {   
       NONCLUSTERED (column [ ASC | DESC ] [ ,... n ])  
       | NONCLUSTERED HASH (column [ ,... n ] ) WITH ( BUCKET_COUNT = bucket_count )   
                    }   
    | FOREIGN KEY   
        ( column [ ,...n ] )   
        REFERENCES referenced_table_name [ ( ref_column [ ,...n ] ) ]   
    | CHECK ( logical_expression )   
}  
  
<column_index> ::=  
  INDEX index_name  
{ [ NONCLUSTERED ] | [ NONCLUSTERED ] HASH WITH (BUCKET_COUNT = bucket_count)  }  
  
<table_index> ::=  
  INDEX index_name  
{   [ NONCLUSTERED ] HASH (column [ ,... n ] ) WITH (BUCKET_COUNT = bucket_count)   
  | [ NONCLUSTERED ] (column [ ASC | DESC ] [ ,... n ] )   
      [ ON filegroup_name | default ]  
  | CLUSTERED COLUMNSTORE [WITH ( COMPRESSION_DELAY = {0 | delay [Minutes]})]  
      [ ON filegroup_name | default ]  
  
}  
  
<table_option> ::=  
{  
    MEMORY_OPTIMIZED = ON   
  | DURABILITY = {SCHEMA_ONLY | SCHEMA_AND_DATA}  
  | SYSTEM_VERSIONING = ON [ ( HISTORY_TABLE = schema_name . history_table_name  
        [, DATA_CONSISTENCY_CHECK = { ON | OFF } ] ) ]   
  
}  



/****************************************************************************************************************************************/
IF OBJECT_ID('[juancarlos].[dbo].[LS_all_extracted_data]') IS NOT NULL
DROP TABLE    [juancarlos].[dbo].[LS_all_extracted_data]
/*--------------------------------------------------------------------------------------------------------------------------------------*/
SELECT 
       [repeated]    = SUM([C]) OVER (PARTITION BY QA_std, Ctry_pk, Locality_pk                                               )
      ,[NEWEST]      = RANK()   OVER (PARTITION BY QA_std, Ctry_pk, Locality_pk          ORDER BY [T_YEAR], [T_datestamp] DESC)
      ,[selected]    = CASE 
                       WHEN
                       RANK()   OVER (PARTITION BY QA_std, Ctry_pk, Locality_pk, [T_YEAR] ORDER BY           [T_datestamp] DESC)
                       =1
                       THEN  'YES'
                       ELSE  'NO'
                       END
      , *
/*--------------------------------------------------------------------------------------------------------------------------------------*/
INTO
        [dbo].[LS_all_extracted_data]
/*--------------------------------------------------------------------------------------------------------------------------------------*/
 FROM
/*--------------------------------------------------------------------------------------------------------------------------------------*/
(
/*--------------------------------------------------------------------------------------------------------------------------------------*/
/****************************************************************************************************************************************/
SELECT
       [id-in_table]
     , [C]           = 1
     , [Ctry_pk]
     , [Locality_pk]
     , [QA_std]
     , [VALUE]       = CASE 
                            WHEN [VALUE] IS NULL
                            THEN ''
                            ELSE [VALUE]
                            END
     , [WORDING]     = CASE 
                            WHEN [WORDING] IS NULL
                            THEN ''
                            ELSE [WORDING]
                            END
     , [T_ID]       
     , [V_ID]       
     , [T_rowid]    
     , [V_rowid]    
     , [T_Name]     
     , [V_Name]     
     , [T_coder]    
     , [V_coder]    
     , [T_YEAR]     
     , [V_YEAR]     
     , [T_QA_std_x] 
     , [V_QA_std_x] 
     , [T_Ctry_fk]  
     , [V_Ctry_fk]  
     , [T_datestamp]
     , [V_datestamp]
     , [T_Localt_fk]
     , [V_Localt_fk]
     , [T_expltext] 
     , [V_expltext] 
     , [T_jckey1]   
     , [V_jckey1]   
     , [T_jckey2]   
     , [V_jckey2]   
     , [T_lsvarname]
     , [V_lsvarname]
FROM
(
SELECT
       [id-in_table] = CASE 
                            WHEN T.[ID] IS NOT NULL
                            THEN T.[ID]
                            ELSE V.[ID]
                            END  
     , [Ctry_pk]     = CASE 
                            WHEN T.[Ctry_fk] IS NOT NULL
                            THEN T.[Ctry_fk]
                            ELSE V.[Ctry_fk]
                            END  
     , [Locality_pk] = CASE 
                            WHEN T.[Locality_fk] IS NOT NULL
                            THEN T.[Locality_fk]
                            ELSE V.[Locality_fk]
                            END  
     , [QA_std]      = CASE 
                            WHEN T.[QA_std_x] IS NOT NULL
                            THEN T.[QA_std_x]
                            ELSE V.[QA_std_x]
                            END  
     , [VALUE]       =           V.[expltext]
     , [WORDING]     =           T.[expltext]
     , [T_ID]        = T.[ID]
     , [V_ID]        = V.[ID]  
     , [T_rowid]     = T.[rowid]
     , [V_rowid]     = V.[rowid]  
     , [T_Name]      = T.[Name]
     , [V_Name]      = V.[Name]
     , [T_coder]     = T.[coder]
     , [V_coder]     = V.[coder]
     , [T_YEAR]      = T.[YEAR]
     , [V_YEAR]      = V.[YEAR]
     , [T_QA_std_x]  = T.[QA_std_x]
     , [V_QA_std_x]  = V.[QA_std_x]
     , [T_Ctry_fk]   = T.[Ctry_fk]
     , [V_Ctry_fk]   = V.[Ctry_fk]
     , [T_datestamp] = T.[datestamp]
     , [V_datestamp] = V.[datestamp]
     , [T_Localt_fk] = T.[Locality_fk]
     , [V_Localt_fk] = V.[Locality_fk]
     , [T_expltext]  = T.[expltext]
     , [V_expltext]  = V.[expltext]
     , [T_jckey1]    = T.[jckey1]
     , [V_jckey1]    = V.[jckey1]
     , [T_jckey2]    = T.[jckey2]
     , [V_jckey2]    = V.[jckey2]
     , [T_lsvarname] = T.[lsvarname]
     , [V_lsvarname] = V.[lsvarname]
/*-------------------------------------------------------------------------------------------------------------------------------------------------------*/
FROM
        [dbo].[LimeTxt]   T
FULL OUTER JOIN
        [dbo].[LimeVal]   V
  ON
       T.[ID]
     = V.[ID]
  AND  T.[QA_std_x]
     = V.[QA_std_x]
) AS ALLDATA
/****************************************************************************************************************************************/
/*--------------------------------------------------------------------------------------------------------------------------------------*/
)  EXTRACTED
/*--------------------------------------------------------------------------------------------------------------------------------------*/
