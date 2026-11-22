/*
===============================================================================
Script:     init_database.sql
Purpose:    Recreate the Bronze, Silver, and Gold data warehouse databases.

WARNING:    This script permanently deletes the existing bronze, silver, and
            gold databases, including all objects and data they contain.
            Run only in an approved environment.
===============================================================================
*/

-- Recreate the data warehouse layer databases.
DROP DATABASE IF EXISTS bronze;
CREATE DATABASE bronze;

DROP DATABASE IF EXISTS silver;
CREATE DATABASE silver;

DROP DATABASE IF EXISTS gold;
CREATE DATABASE gold;
