

CREATE DATABASE AdventureWorks ON 
(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.WIN10\MSSQL\DATA\AdventureWorks2012_Data.mdf')
 FOR ATTACH_REBUILD_LOG;



USE [master]

RESTORE DATABASE AdventureWorks2014
       FROM disk= '\\Mac\Home\Downloads\aw\AdventureWorks2014.bak'
 WITH
       MOVE 'AdventureWorks2014_data' TO 'C:\Program Files\Microsoft SQL Server\MSSQL12.WIN10\MSSQL\DATA\AdventureWorks2014_Data.mdf'
	 , MOVE 'AdventureWorks2014_Log'  TO 'C:\Program Files\Microsoft SQL Server\MSSQL12.WIN10\MSSQL\DATA\AdventureWorks2014_Data.ldf'
     , REPLACE

-----------------------------------------------------------------------------------------------------------------------------------------------
-- Detach/Attach a database
-- that is currently not in use
-- from a server instance
-- to from a server instance
-- optionally UPDATE STATISTICS on all tables before detaching.
-----------------------------------------------------------------------------------------------------------------------------------------------
USE master;
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Detaching a database requires exclusive access to the database
-- Set the database to SINGLE_USER mode to obtain exclusive access
-- (after all current users disconnect from the database)
ALTER DATABASE                            AdventureWorks2014
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;                              -- force current users out of the database immediately
GO
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Syntax
EXEC 
sp_detach_db   @dbname                 = 'AdventureWorks2014'      -- (is a sysname value) name of the database to be detached
             , @skipchecks             = 'true'       -- skip UPDATE STATISTIC
--           , @keepfulltextindexfile  = 'true'       -- default 'true' and can be set to 'false' (removed in future version of SQL Server)
-----------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE AdventureWorks2014 ON 
(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.WIN10\MSSQL\DATA\AdventureWorks2014_Data.mdf')
 FOR ATTACH_REBUILD_LOG;





CREATE DATABASE AdventureWorks2008R2 ON 
(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.WIN10\MSSQL\DATA\AdventureWorks2008R2_Data.mdf')
 FOR ATTACH_REBUILD_LOG;



CREATE DATABASE AdventureWorks2008 ON 
(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.WIN10\MSSQL\DATA\AdventureWorks2008_Data.mdf')
 FOR ATTACH_REBUILD_LOG;


