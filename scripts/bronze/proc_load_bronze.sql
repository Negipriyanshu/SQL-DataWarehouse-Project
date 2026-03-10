/*
============================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
============================================================================================
Script Purpose:
  This stored procedure loads data into the 'bronze' scehma frpm external CSV files.
  It performsthe following actions:
  - Truncates the bronze tables vefore loading data.
  - Uses the'BULK INSERT' command to load data from CSV files to bronze tables.

Parameters:
  None.
This stored procedure does not accept any parameters or return any values.

Usuage Example:
    EXEC bronze.load_bronze;
============================================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
BEGIN TRY
	PRINT '==================================================';
	PRINT 'Loading Bronze Layer';
	PRINT '==================================================';
	
	PRINT '--------------------------------------------------';
	PRINT 'Loading CRM tables';
	PRINT '--------------------------------------------------';

SET @start_time =GETDATE();
PRINT '>> Truncating tables :bronze.crm_cust_info';
TRUNCATE TABLE bronze.crm_cust_info;

PRINT '>>Inserting table: bronze.crm_cust_info';
BULK INSERT bronze.crm_cust_info
FROM 'C:\Negi\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
SET @end_time=GETDATE();
PRINT '>> lOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + ' SECONDS';
PRINT '-------------------------------------------------------------';

SET @start_time =GETDATE();
PRINT '>> Truncating tables :bronze.crm_prd_info';
TRUNCATE TABLE bronze.crm_prd_info;

PRINT '>>Inserting table: bronze.crm_prd_info';
BULK INSERT bronze.crm_prd_info
FROM 'C:\Negi\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
SET @end_time=GETDATE();
PRINT '>> lOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + ' SECONDS';
PRINT '-------------------------------------------------------------';



SET @start_time =GETDATE();
PRINT '>> Truncating tables :bronze.crm_sales_details';
TRUNCATE TABLE bronze.crm_sales_details;

PRINT '>>Inserting table: bronze.crm_sales_details';
BULK INSERT bronze.crm_sales_details
FROM 'C:\Negi\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
SET @end_time=GETDATE();
PRINT '>> lOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + ' SECONDS';
PRINT '-------------------------------------------------------------';



	PRINT '--------------------------------------------------';
	PRINT 'Loading ERP tables';
	PRINT '--------------------------------------------------';

SET @start_time =GETDATE();
PRINT '>> Truncating tables :bronze.erp_cust_az12';
TRUNCATE TABLE bronze.erp_cust_az12;

PRINT '>>Inserting table: bronze.erp_cust_az12';
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Negi\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
SET @end_time=GETDATE();
PRINT '>> lOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + ' SECONDS';
PRINT '-------------------------------------------------------------';


SET @start_time =GETDATE();
PRINT '>> Truncating tables :bronze.erp_loc_a101';
TRUNCATE TABLE bronze.erp_loc_a101;

PRINT '>>Inserting table: bronze.erp_loc_a101';
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Negi\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
SET @end_time=GETDATE();
PRINT '>> lOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + ' SECONDS';
PRINT '-------------------------------------------------------------';



SET @start_time =GETDATE();
PRINT '>> Truncating tables :bronze.erp_px_cat_g1v2';
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

PRINT '>>Inserting table: bronze.erp_px_cat_g1v2';
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Negi\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
SET @end_time=GETDATE();
PRINT '>> lOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + ' SECONDS';
PRINT '-------------------------------------------------------------';


	END TRY
	BEGIN CATCH
		PRINT '========================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '========================================================';
	END CATCH
END;
