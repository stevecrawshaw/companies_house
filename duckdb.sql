./duckdb

COPY
(SELECT * 
FROM read_csv('data/BasicCompanyDataAsOneFile-2024-11-01.csv')
WHERE "RegAddress.PostCode" LIKE 'BS%' OR "RegAddress.PostCode" LIKE 'BA%')
TO 'data/bs_ba_postcode.parquet' (FORMAT PARQUET);

.exit