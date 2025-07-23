/*
=============================================================
Create Database and Schemas
=============================================================
Purpose: This script prepares a fresh DataWarehouse database by:
1. Dropping the existing DataWarehouse if it exists
2. Creating a new DataWarehouse database
3. Setting up three standard schemas (bronze, silver, gold) for data organization

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;

-- Check and drop existing database to ensure clean setup
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN 
    DROP DATABASE DataWarehouse;
END;

-- Create new database and immediately start using it
CREATE DATABASE DataWarehouse;
USE DataWarehouse;

-- Create standard schemas for data organization tiers
-- bronze: raw data, silver: cleaned/processed, gold: business-ready
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
