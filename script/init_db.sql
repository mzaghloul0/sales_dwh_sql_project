-- creating medallion schemas in the sales_dwh database: 


-- First, verify wtih this query which database you are currently connected to: 

SELECT current_database();

-- Drop schemas if they already exist:

DROP SCHEMA IF EXISTS bronze CASCADE;
DROP SCHEMA IF EXISTS silver CASCADE;
DROP SCHEMA IF EXISTS gold CASCADE;

-- Recreate the schemas:

CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
