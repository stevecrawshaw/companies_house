./duckdb

COPY
(SELECT * 
FROM read_csv('data/BasicCompanyDataAsOneFile-2024-11-01.csv')
WHERE "RegAddress.PostCode" LIKE 'BS%' OR "RegAddress.PostCode" LIKE 'BA%')
TO 'data/bs_ba_postcode.parquet' (FORMAT PARQUET);

.open data/companies_house.duckdb
CREATE TABLE IF NOT EXISTS companies_house AS SELECT * FROM read_csv('data/BasicCompanyDataAsOneFile-2024-11-01.csv');

show tables;

DESCRIBE companies_house;

PRAGMA table_info('companies_house');

SHOW information_schema.columns;

SELECT column_name FROM information_schema.columns WHERE table_name = 'companies_house' AND column_name = 'CompanyName';

.mode line
SUMMARIZE companies_house;
.mode box
DESCRIBE companies_house;
.mode box

SELECT COUNT(DISTINCT CompanyName) FROM companies_house;
SELECT COUNT(*) FROM companies_house;

.exit