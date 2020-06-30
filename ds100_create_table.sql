/**************************************************
データサイエンス100本ノック（構造化データ加工編） - SQL

https://github.com/The-Japan-DataScientist-Society/100knocks-preprocess/blob/master/docker/work/answer/ans_preprocess_knock_SQL.ipynb


****************************************************/
use crm
;
-- customer
DROP TABLE IF EXISTS customer
;
CREATE TABLE customer(
     customer_id NVARCHAR(14)
    ,customer_name NVARCHAR(20)
    ,gender_cd NVARCHAR(1)
    ,gender NVARCHAR(2)
    ,birth_day DATE
    ,age INT
    ,postal_cd NVARCHAR(8)
    ,address NVARCHAR(128)
    ,application_store_cd NVARCHAR(6)
    ,application_date NVARCHAR(8)
    ,status_cd NVARCHAR(12)
    ,PRIMARY KEY(customer_id)
)
;
-- category
DROP TABLE IF EXISTS category
;
CREATE TABLE category(
     category_major_cd NVARCHAR(2)
    ,category_major_name NVARCHAR(32)
    ,category_medium_cd NVARCHAR(4)
    ,category_medium_name NVARCHAR(32)
    ,category_small_cd NVARCHAR(6)
    ,category_small_name NVARCHAR(32)
    ,PRIMARY KEY(category_small_cd)
)
;
-- product
DROP TABLE IF EXISTS product
;
CREATE TABLE product(
     product_cd NVARCHAR(10)
    ,category_major_cd NVARCHAR(2)
    ,category_medium_cd NVARCHAR(4)
    ,category_small_cd NVARCHAR(6)
    ,unit_price INT
    ,unit_cost INT
    ,PRIMARY KEY(product_cd)
)
;
-- store
DROP TABLE IF EXISTS store
;
CREATE TABLE store(
     store_cd NVARCHAR(6)
    ,store_name NVARCHAR(128)
    ,prefecture_cd NVARCHAR(2)
    ,prefecture NVARCHAR(5)
    ,address NVARCHAR(128)
    ,address_kana NVARCHAR(128)
    ,tel_no NVARCHAR(20)
    ,longitude NUMERIC(10, 5)
    ,latitude NUMERIC(10, 5)
    ,floor_area NUMERIC(10, 5)
    ,PRIMARY KEY(store_cd)
)
;
-- receipt
DROP TABLE IF EXISTS receipt
;
CREATE TABLE receipt(
     sales_ymd INT
    ,sales_epoch INT
    ,store_cd NVARCHAR(6)
    ,receipt_no SMALLINT
    ,receipt_sub_no SMALLINT
    ,customer_id NVARCHAR(14)
    ,product_cd NVARCHAR(10)
    ,quantity INT
    ,amount INT
    ,PRIMARY KEY(sales_ymd, store_cd, receipt_no, receipt_sub_no)
)
;
-- geocode
DROP TABLE IF EXISTS geocode
;
CREATE TABLE geocode(
     postal_cd NVARCHAR(8)
    ,prefecture NVARCHAR(4)
    ,city NVARCHAR(30)
    ,town NVARCHAR(30)
    ,street NVARCHAR(30)
    ,address NVARCHAR(30)
    ,full_address NVARCHAR(80)
    ,longitude NUMERIC(10, 5)
    ,latitude NUMERIC(10, 5)
)
;
/*********************************************************/
--customer
truncate TABLE customer
;
BULK
INSERT customer
FROM
     'D:\BeaconCRM\SAS_DATA\rawdata\WORK\customer.csv' WITH(
         FIRSTROW = 2
        ,DATAFILETYPE = 'char'
        ,CODEPAGE = '65001'
        ,FIELDTERMINATOR = ','
        ,ROWTERMINATOR = '0x0a'
    )
;
--category
truncate TABLE category
;
BULK
INSERT category
FROM
     'D:\BeaconCRM\SAS_DATA\rawdata\WORK\category.csv' WITH(
         FIRSTROW = 2
        ,DATAFILETYPE = 'char'
        ,CODEPAGE = '65001'
        ,FIELDTERMINATOR = ','
        ,ROWTERMINATOR = '0x0a'
    )
;
--product
truncate TABLE product
;
BULK
INSERT product
FROM
     'D:\BeaconCRM\SAS_DATA\rawdata\WORK\product.csv' WITH(
         FIRSTROW = 2
        ,DATAFILETYPE = 'char'
        ,CODEPAGE = '65001'
        ,FIELDTERMINATOR = ','
        ,ROWTERMINATOR = '0x0a'
    )
;
--store
truncate TABLE store
;
BULK
INSERT store
FROM
     'D:\BeaconCRM\SAS_DATA\rawdata\WORK\store.csv' WITH(
         FIRSTROW = 2
        ,DATAFILETYPE = 'char'
        ,CODEPAGE = '65001'
        ,FIELDTERMINATOR = ','
        ,ROWTERMINATOR = '0x0a'
    )
;
--receipt
truncate TABLE receipt
;
BULK
INSERT receipt
FROM
     'D:\BeaconCRM\SAS_DATA\rawdata\WORK\receipt.csv' WITH(
         FIRSTROW = 2
        ,DATAFILETYPE = 'char'
        ,CODEPAGE = '65001'
        ,FIELDTERMINATOR = ','
        ,ROWTERMINATOR = '0x0a'
    )
;
--geocode
truncate TABLE geocode
;
BULK
INSERT geocode
FROM
     'D:\BeaconCRM\SAS_DATA\rawdata\WORK\geocode.csv' WITH(
         FIRSTROW = 2
        ,DATAFILETYPE = 'char'
        ,CODEPAGE = '65001'
        ,FIELDTERMINATOR = ','
        ,ROWTERMINATOR = '0x0a'
    )
;
