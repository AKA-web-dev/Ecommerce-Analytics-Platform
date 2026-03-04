# 🛒 E-commerce Analytics Platform

This project implements an end-to-end ELT-focused data warehouse for e-commerce analytics.
Raw transactional data is ingested, cleaned using Spark, modeled with dbt, and stored in BigQuery to support business KPIs and dashboards.

## 🎯 Objectives

- Build a modern ELT pipeline
- Apply dimensional modeling (Star Schema)
- Implement incremental data processing
- Enable analytics-ready KPIs

## ⚙️ Tech Stack
__________________________________________________________
| Layer           | Technology                            |
| --------------- | --------------------------------------|
| Ingestion       | Python (CSV ingestion)                |
| Storage         | Local FS → GCS - Google Cloud Storage |
| Processing      | PySpark                               |
| Warehouse       | BigQuery                              |
| Transformations | dbt                                   |
| Orchestration   | Airflow (design-ready)                |
| Analytics       | SQL / BI tools (Power BI)             |
|_________________|_______________________________________|

## 🧱 Data Layers
- **Bronze**: Raw data ingested from source systems (CSV)
- **Silver**: Cleaned and standardized datasets using Spark
- **Gold**: Analytics-ready star schema models built with dbt

## 🏗 Architecture

    🥉 Bronze Layer
        - Raw CSV files
        - No transformations
        - Append-only

    🥈 Silver Layer
        - PySpark transformations
        - Deduplication & normalization
        - Stored as Parquet
        - Incremental-ready

    🥇 Gold Layer
        - Star schema (facts & dimensions)
        - dbt incremental models
        - Analytics marts for KPIs

    📊 Key KPIs
        - Revenue
        - Average Order Value (AOV)
        - Customer Retention
        - On-time Delivery Rate
        - Product & Category Performance

<p align="center">
  <img src="architecture/Architecture_flow.png" alt="Architecture" width="700">
</p>

## 📂 Repository Structure
See folder structure for modular pipeline organization:
- `spark/` → Silver transformations
- `dbt/` → Gold models and analytics marts
- `data/` → Documentation only

## ✅ Data Quality

    - dbt tests (not null, uniqueness)
    - Revenue reconciliation
    - Referential integrity checks

## 🚫 Data Policy
This repository does not contain raw data files. Only schemas, transformations, and documentation are included.

## 🚀 How to Run

    # Run Spark transformations
        spark-submit spark/silver_transformations.ipynb
    # Run dbt models
        dbt run
        dbt test
