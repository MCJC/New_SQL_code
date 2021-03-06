

USE master;
GO

--ALTER DATABASE forum
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'forum';
--GO

--/* copy files */
--/*
--EXEC master.dbo.xp_cmdshell 'COPY E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum.mdf N:\JCEO_data\DBs_toSQL14\forum.mdf'
--*/
--CREATE DATABASE forum
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum_Log.ldf') 
--    FOR ATTACH; 

--/* in new*/

--CREATE DATABASE forum
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\forum.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\forum_Log.ldf')
--    FOR ATTACH; 

              



----------------------------------------------------------------------------------------------------
--ALTER DATABASE forum_ResAnal
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'forum_ResAnal';
--GO


--CREATE DATABASE forum_ResAnal
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum_ResAnal.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum_ResAnal_Log.ldf') 
--    FOR ATTACH; 


--/* in new*/

--CREATE DATABASE forum_ResAnal
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\forum_ResAnal.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\forum_ResAnal_Log.ldf') 
--    FOR ATTACH; 




--------------------------------------------------------------------------------------------------------
--ALTER DATABASE RLS
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'RLS';
--GO
--------------------------------------------------------------------------------------------------------


--CREATE DATABASE RLS
--    ON (FILENAME = 'F:\data\RLS.mdf')
--      ,(FILENAME = 'F:\data\RLS_Log.ldf') 
--    FOR ATTACH; 



--/* in new*/

--CREATE DATABASE RLS
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RLS.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RLS_Log.ldf') 
--    FOR ATTACH; 









----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------


------CREATE DATABASE forum
------    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum.mdf')
------      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum_Log.ldf') 
------    FOR ATTACH; 






--ALTER DATABASE xRLS2
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'xRLS2';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE xDataLoaded
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'xDataLoaded';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE x_LoadRLS1cUS
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'x_LoadRLS1cUS';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE wcd_metabase
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'wcd_metabase';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE TranslatQs
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'TranslatQs';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE stdaq
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'stdaq';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE Stacy
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'Stacy';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE RLS_temp
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'RLS_temp';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE RLS
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'RLS';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE ReportServerTempDB
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'ReportServerTempDB';
--GO
--------------------------------------------------------------------------------------------------------
----ALTER DATABASE ReportServer
----SET SINGLE_USER
------WITH ROLLBACK IMMEDIATE;
----GO
----EXEC sp_detach_db @dbname = N'ReportServer';
----GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE PRGI
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'PRGI';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE NCheck
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'NCheck';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE MyTest
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'MyTest';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE limesurvey
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'limesurvey';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE juancarlos
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'juancarlos';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE GRSHRcode
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'GRSHRcode';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE GRSHR2015
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'GRSHR2015';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE GRSHR2014
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'GRSHR2014';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE GRSHR_admin
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'GRSHR_admin';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE GRSHR
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'GRSHR';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE forumBlob
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'forumBlob';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE forum_d
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'forum_d';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE for_x
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'for_x';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE for_test
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'for_test';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE _bk_forum
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'_bk_forum';
--GO
--------------------------------------------------------------------------------------------------------
--ALTER DATABASE _Admin
--SET SINGLE_USER
----WITH ROLLBACK IMMEDIATE;
--GO
--EXEC sp_detach_db @dbname = N'_Admin';
--GO
--------------------------------------------------------------------------------------------------------

----CREATE DATABASE _Admin
----    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\_Admin.mdf')
----      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\_Admin_Log.ldf') 
----    FOR ATTACH; 


------CREATE DATABASE forum
------    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum.mdf')
------      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum_Log.ldf') 
------    FOR ATTACH; 


------CREATE DATABASE forum_ResAnal
------    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum_ResAnal.mdf')
------      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forum_ResAnal_Log.ldf') 
------    FOR ATTACH; 
--CREATE DATABASE forumBlob
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forumBlobDB.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\forumBlobLOG.ldf') 
--    FOR ATTACH; 
----CREATE DATABASE GRSHR
----    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GRSHR.mdf')
----      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GRSHR_Log.ldf') 
----    FOR ATTACH; 
----CREATE DATABASE GRSHR2014
----    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GRSHR2014.mdf')
----      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GRSHR2014_Log.ldf') 
----    FOR ATTACH; 
----CREATE DATABASE GRSHR2015
----    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GRSHR2015.mdf')
----      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GRSHR2015_Log.ldf') 
----    FOR ATTACH; 
--CREATE DATABASE GRSHRcode
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GRSHRcode.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GRSHRcode_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE MyTest
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MyTest.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MyTest_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE NCheck
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\NCheck.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\NCheck_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE PRGI
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PRGI.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PRGI_Log.ldf') 
--    FOR ATTACH; 
------CREATE DATABASE ReportServer
------    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ReportServer.mdf')
------      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ReportServer_Log.ldf') 
------    FOR ATTACH; 
--CREATE DATABASE ReportServerTempDB
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ReportServerTempDB.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ReportServerTempDB_Log.ldf') 
--    FOR ATTACH; 
----CREATE DATABASE RLS
----    ON (FILENAME = 'F:\data\RLS.mdf')
----      ,(FILENAME = 'F:\data\RLS_Log.ldf') 
----    FOR ATTACH; 
--CREATE DATABASE RLS_temp
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RLS_temp.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RLS_temp_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE stdaq
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\stdaq.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\stdaq_Log.ldf') 
--    FOR ATTACH; 
----CREATE DATABASE TranslatQs
----    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TranslatQs.mdf')
----      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TranslatQs_Log.ldf') 
----    FOR ATTACH; 
--CREATE DATABASE xDataLoaded
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\xDataLoaded.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\xDataLoaded_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE xRLS2
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LRLS2.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LRLS2_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE x_LoadRLS1cUS
--    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LoadRLS1cUS.mdf')
--      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LoadRLS1cUS_Log.ldf') 
--    FOR ATTACH; 
----CREATE DATABASE for_test
----    ON (FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\for_test.mdf')
----      ,(FILENAME = 'E:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\for_test_Log.ldf') 
----    FOR ATTACH; 
----CREATE DATABASE _bk_forum
----    ON (FILENAME = 'F:\data\BackUp_data.mdf')
----      ,(FILENAME = 'F:\data\BackUp_log.ldf') 
----    FOR ATTACH; 
--CREATE DATABASE for_x
--    ON (FILENAME = 'F:\data\for_x.mdf')
--      ,(FILENAME = 'F:\data\for_x_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE forum_d
--    ON (FILENAME = 'F:\data\forum_d.mdf')
--      ,(FILENAME = 'F:\data\forum_d_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE GRSHR_admin
--    ON (FILENAME = 'F:\data\GRSHR_admin.mdf')
--      ,(FILENAME = 'F:\data\GRSHR_admin_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE juancarlos
--    ON (FILENAME = 'F:\data\juancarlos.mdf')
--      ,(FILENAME = 'F:\data\juancarlos_Log.ldf') 
--    FOR ATTACH; 
--CREATE DATABASE limesurvey
--    ON (FILENAME = 'F:\data\limesurvey.mdf')
--      ,(FILENAME = 'F:\data\limesurvey_Log.ldf') 
--    FOR ATTACH; 


--ALTER DATABASE forum
--SET MULTI_USER;
--GO
--ALTER DATABASE forum_ResAnal
--SET MULTI_USER;
--GO
--ALTER DATABASE xRLS2
--SET MULTI_USER;
--GO
--ALTER DATABASE xDataLoaded
--SET MULTI_USER;
--GO
--ALTER DATABASE x_LoadRLS1cUS
--SET MULTI_USER;
--GO
--ALTER DATABASE wcd_metabase
--SET MULTI_USER;
--GO
--ALTER DATABASE TranslatQs
--SET MULTI_USER;
--GO
--ALTER DATABASE stdaq
--SET MULTI_USER;
--GO
--ALTER DATABASE Stacy
--SET MULTI_USER;
--GO
--ALTER DATABASE RLS_temp
--SET MULTI_USER;
--GO
--ALTER DATABASE RLS
--SET MULTI_USER;
--GO
--ALTER DATABASE ReportServerTempDB
--SET MULTI_USER;
--GO
--ALTER DATABASE ReportServer
--SET MULTI_USER;
--GO
--ALTER DATABASE PRGI
--SET MULTI_USER;
--GO
--ALTER DATABASE NCheck
--SET MULTI_USER;
--GO
--ALTER DATABASE MyTest
--SET MULTI_USER;
--GO
--ALTER DATABASE limesurvey
--SET MULTI_USER;
--GO
--ALTER DATABASE juancarlos
--SET MULTI_USER;
--GO
--ALTER DATABASE GRSHRcode
--SET MULTI_USER;
--GO
--ALTER DATABASE GRSHR2015
--SET MULTI_USER;
--GO
--ALTER DATABASE GRSHR2014
--SET MULTI_USER;
--GO
--ALTER DATABASE GRSHR_admin
--SET MULTI_USER;
--GO
--ALTER DATABASE GRSHR
--SET MULTI_USER;
--GO
--ALTER DATABASE forumBlob
--SET MULTI_USER;
--GO
--ALTER DATABASE forum_d
--SET MULTI_USER;
--GO
--ALTER DATABASE for_x
--SET MULTI_USER;
--GO
--ALTER DATABASE for_test
--SET MULTI_USER;
--GO
--ALTER DATABASE _bk_forum
--SET MULTI_USER;
--GO
--ALTER DATABASE _Admin
--SET MULTI_USER;
--GO


/*
SELECT name, database_id, create_date, *
FROM sys.databases ;

  SELECT * FROM sys.database_files


 sp_helpfile and view the FileName column
 
 
 
 
 SELECT *
FROM sys.databases sd
INNER JOIN sys.master_files smf ON sd.database_id = smf.database_id




SELECT name, database_id, create_date
FROM sys.databases ;


*/

