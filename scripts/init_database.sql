/* 
=============================================================
Create Database and Schemas
=============================================================

Script Purpose:
	This script creates a new database named 'datawarehouse' after checking if it already exists.
	if the database exists, it is dropped and recreated. Additionally, the scripts sets up three schemas within the database: 'bronze','silver','gold'.

WARNING:
	Running the script will drop the entire 'datawarehouse' database if it exists.
	All data in the database will be permanently deleted. Proceed with caution
	and ensure you have proper backups before running the script.
*/

USE master;
GO

-- Drop and Recreate the 'datawarehouse' databases
IF EXISTS (SELECT 1 FROM sys.databases WHERE name ='datawarehouse')
BEGIN 
	ALTER DATABASE datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE datawarehouse;
END;
GO

-- Create Database 'DataWarehouse'
CREATE DATABASE datawarehouse;
GO

USE datawarehouse;
GO

-- Create Scehmas

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO