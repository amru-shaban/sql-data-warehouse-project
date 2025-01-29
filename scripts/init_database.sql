-- CREATING THE SCHEMA AND TABLES

CREATE SCHEMA IF NOT EXISTS amru_project;

USE amru_project;

/*

Creating the tables with information sourced from the CRM:

    1) customers
    2) products
    3) sales_info
    
*/

CREATE TABLE crm_customers(
    customer_id     INT,
    customer_key    VARCHAR(50),
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    marital_status  CHAR(1),
    gender          CHAR(1),
    create_date     DATE
);

CREATE TABLE crm_products(
    product_id      INT,
    product_key     VARCHAR(50),
    name            VARCHAR(50),
    cost            INT,
    line            VARCHAR(50),
    start_date      DATE,
    end_date        DATE
);

CREATE TABLE crm_sales_details(
    order_id        VARCHAR(50),
    product_id      VARCHAR(50),
    customer_id     INT,
    order_date      INT,
    shipping_date   INT,
    due_date        INT,
    sales_id        INT,
    quantity        INT,
    price           INT
);



/*

Creating the tables with information sourced from the ERP:

    1) locations
    2) customers
    3) categories
    
*/

CREATE TABLE erp_locations(
    customer_id     VARCHAR(50),
    country         VARCHAR(50)
);

CREATE TABLE erp_customers(
    customer_id     VARCHAR(50),
    birth_date      DATE,
    gender          VARCHAR(50)
);

CREATE TABLE erp_categories(
    category_id     VARCHAR(50),
    category        VARCHAR(50),
    subcategory     VARCHAR(50),
    maintenance     VARCHAR(50)
);



-- Loading the files into the tables

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/uploads/cust_info.csv' INTO TABLE crm_customers
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT  *
FROM    crm_customers;



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/uploads/prd_info.csv' INTO TABLE crm_products
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT  *
FROM    crm_products;



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/uploads/sales_details.csv' INTO TABLE crm_sales_details
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT  *
FROM    crm_sales_details;



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/uploads/LOC_A101.csv' INTO TABLE erp_locations
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT  *
FROM    erp_locations;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/uploads/CUST_AZ12.csv' INTO TABLE erp_customers
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT  *
FROM    erp_customers;



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/uploads/PX_CAT_G1V2.csv' INTO TABLE erp_categories
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT  *
FROM    erp_categories;
