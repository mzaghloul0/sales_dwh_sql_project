DROP TABLE IF EXISTS bronze.crm_accounts_info;
create table bronze.crm_accounts_info (
account varchar(50),
sector varchar(20),
year_established smallint,
revenue numeric(12,2),
employees int, 
office_location varchar(20), 
subsidiary_of varchar(20)
);

DROP TABLE IF EXISTS bronze.crm_products_info;
create table bronze.crm_products_info (
product varchar(20),
series varchar(20),
sales_price numeric(12,2)
);

DROP TABLE IF EXISTS bronze.crm_sales_teams_info;
create table bronze.crm_sales_teams_info (
sales_agent varchar(20),
manager varchar(20),
regional_office varchar(20)
);

DROP TABLE IF EXISTS bronze.crm_sales_pipeline_info;
create table bronze.crm_sales_pipeline_info (
   opportunity_id VARCHAR(20),
   sales_agent varchar(20),
    product VARCHAR(255),
    account VARCHAR(255),
    deal_stage VARCHAR(50),
    engage_date DATE,
    close_date DATE,
    close_value NUMERIC(12,2)
);
