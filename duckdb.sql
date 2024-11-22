USE duckdb;

SELECT * 
FROM read_csv('data/BasicCompanyDataAsOneFile-2024-11-01.csv')
WHERE "RegAddress.PostCode" LIKE 'BS%' OR "RegAddress.PostCode" LIKE 'BA%';