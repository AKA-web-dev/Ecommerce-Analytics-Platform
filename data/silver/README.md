# 🥈 Silver Layer

- The Silver layer stores **cleaned and standardized datasets**.  
- Data from Bronze is processed using **PySpark transformations**, including deduplication, normalization, and type casting.
- Use **`spark/silver_transformations.ipynb`** to populate this layer.

## 💾 Contents

- Deduplicated Parquet or Delta files
- Normalized tables ready for analytics
- Incremental-friendly structure for ETL pipelines

## 📝 Guidelines

- Data should **never contain duplicates**
- Column names should follow **snake_case convention**
- Store in **Parquet** or **Delta** for performance
- This layer feeds directly into **dbt Gold models**

## ⚙️ Structure

    data/silver/
    ├── orders/
    │ └── orders.parquet
    ├── customers/
    │ └── customers.parquet
    ├── products/
    │ └── products.parquet
    ├── order_items/
    │ └── order_items.parquet
    ├── payments/
    │ └── payments.parquet
    ├── reviews/
    │ └── reviews.parquet
    ├── sellers/
    │ └── sellers.parquet
