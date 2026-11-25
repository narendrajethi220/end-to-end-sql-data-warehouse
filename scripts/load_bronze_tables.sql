/*
===============================================================================
Script:     load_bronze_tables.sql
Purpose:    Reload all CRM and ERP source extracts into Bronze-layer tables.

WARNING:    Each table is truncated before its CSV file is loaded.
===============================================================================
*/

USE bronze;

SET @batch_start_time := NOW();

SELECT '=============================================' AS status;
SELECT 'Loading Bronze layer' AS status;
SELECT CONCAT('Batch started: ', @batch_start_time) AS status;
SELECT '=============================================' AS status;

-- CRM source tables
SELECT '---------------------------------------------' AS status;
SELECT 'Loading CRM tables' AS status;
SELECT '---------------------------------------------' AS status;

SELECT 'Truncating table: crm_cust_info' AS status;
TRUNCATE TABLE crm_cust_info;

SET @load_start_time := NOW();
SELECT CONCAT('Loading data into table: crm_cust_info | Started: ', @load_start_time) AS status;
LOAD DATA LOCAL INFILE 'datasets/source_crm/cust_info.csv'
INTO TABLE crm_cust_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @load_end_time := NOW();
SELECT
    'crm_cust_info' AS table_name,
    @load_start_time AS load_start_time,
    @load_end_time AS load_end_time,
    TIMESTAMPDIFF(SECOND, @load_start_time, @load_end_time) AS duration_seconds;
SELECT COUNT(*) AS crm_cust_info_row_count FROM crm_cust_info;


SELECT 'Truncating table: crm_prd_info' AS status;
TRUNCATE TABLE crm_prd_info;

SET @load_start_time := NOW();
SELECT CONCAT('Loading data into table: crm_prd_info | Started: ', @load_start_time) AS status;
LOAD DATA LOCAL INFILE 'datasets/source_crm/prd_info.csv'
INTO TABLE crm_prd_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @load_end_time := NOW();
SELECT
    'crm_prd_info' AS table_name,
    @load_start_time AS load_start_time,
    @load_end_time AS load_end_time,
    TIMESTAMPDIFF(SECOND, @load_start_time, @load_end_time) AS duration_seconds;
SELECT COUNT(*) AS crm_prd_info_row_count FROM crm_prd_info;


SELECT 'Truncating table: crm_sales_details' AS status;
TRUNCATE TABLE crm_sales_details;

SET @load_start_time := NOW();
SELECT CONCAT('Loading data into table: crm_sales_details | Started: ', @load_start_time) AS status;
LOAD DATA LOCAL INFILE 'datasets/source_crm/sales_details.csv'
INTO TABLE crm_sales_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @load_end_time := NOW();
SELECT
    'crm_sales_details' AS table_name,
    @load_start_time AS load_start_time,
    @load_end_time AS load_end_time,
    TIMESTAMPDIFF(SECOND, @load_start_time, @load_end_time) AS duration_seconds;
SELECT COUNT(*) AS crm_sales_details_row_count FROM crm_sales_details;


-- ERP source tables
SELECT '---------------------------------------------' AS status;
SELECT 'Loading ERP tables' AS status;
SELECT '---------------------------------------------' AS status;

SELECT 'Truncating table: erp_cust_az12' AS status;
TRUNCATE TABLE erp_cust_az12;

SET @load_start_time := NOW();
SELECT CONCAT('Loading data into table: erp_cust_az12 | Started: ', @load_start_time) AS status;
LOAD DATA LOCAL INFILE 'datasets/source_erp/CUST_AZ12.csv'
INTO TABLE erp_cust_az12
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @load_end_time := NOW();
SELECT
    'erp_cust_az12' AS table_name,
    @load_start_time AS load_start_time,
    @load_end_time AS load_end_time,
    TIMESTAMPDIFF(SECOND, @load_start_time, @load_end_time) AS duration_seconds;
SELECT COUNT(*) AS erp_cust_az12_row_count FROM erp_cust_az12;


SELECT 'Truncating table: erp_loc_a101' AS status;
TRUNCATE TABLE erp_loc_a101;

SET @load_start_time := NOW();
SELECT CONCAT('Loading data into table: erp_loc_a101 | Started: ', @load_start_time) AS status;
LOAD DATA LOCAL INFILE 'datasets/source_erp/LOC_A101.csv'
INTO TABLE erp_loc_a101
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @load_end_time := NOW();
SELECT
    'erp_loc_a101' AS table_name,
    @load_start_time AS load_start_time,
    @load_end_time AS load_end_time,
    TIMESTAMPDIFF(SECOND, @load_start_time, @load_end_time) AS duration_seconds;
SELECT COUNT(*) AS erp_loc_a101_row_count FROM erp_loc_a101;


SELECT 'Truncating table: erp_px_cat_g1v2' AS status;
TRUNCATE TABLE erp_px_cat_g1v2;

SET @load_start_time := NOW();
SELECT CONCAT('Loading data into table: erp_px_cat_g1v2 | Started: ', @load_start_time) AS status;
LOAD DATA LOCAL INFILE 'datasets/source_erp/PX_CAT_G1V2.csv'
INTO TABLE erp_px_cat_g1v2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET @load_end_time := NOW();
SELECT
    'erp_px_cat_g1v2' AS table_name,
    @load_start_time AS load_start_time,
    @load_end_time AS load_end_time,
    TIMESTAMPDIFF(SECOND, @load_start_time, @load_end_time) AS duration_seconds;
SELECT COUNT(*) AS erp_px_cat_g1v2_row_count FROM erp_px_cat_g1v2;


SET @batch_end_time := NOW();

SELECT '=============================================' AS status;
SELECT 'Bronze layer load completed' AS status;
SELECT CONCAT('Batch ended: ', @batch_end_time) AS status;
SELECT
    @batch_start_time AS batch_start_time,
    @batch_end_time AS batch_end_time,
    TIMESTAMPDIFF(SECOND, @batch_start_time, @batch_end_time) AS batch_duration_seconds;
SELECT '=============================================' AS status;
