#%%
import duckdb
import polars as pl

#%%
path2 = "data/BasicCompanyDataAsOneFile-2024-11-01.csv"

#%%

qry = f"""
SELECT * 
FROM read_csv('{path2}')
WHERE "RegAddress.PostCode" LIKE 'BS%' OR "RegAddress.PostCode" LIKE 'BA%';
"""
#%%
# use duckdb's relational API'
rel = duckdb.sql(qry)

#%%
(rel.select("*")).write_parquet("data/companies_bs_ba_postcodes.parquet")

#%%

rel.describe()

#%%

rel.close()