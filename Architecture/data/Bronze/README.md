# 🥉 Bronze Layer

The Bronze layer stores **raw data ingested from source systems**.  
This layer is append-only and is never modified after ingestion. It serves as the **single source of truth**.

## 💾 Contents

- Raw CSV

## 📝 Guidelines

- **No transformations** should be applied here
- Use **consistent file naming** (e.g., `orders_dataset.csv`)

## ⚙️ Data Structure

    data/bronze/
    ├── customers_dataset.csv/
    ├── geolocation_dataset.csv/
    ├── order_items_dataset.csv/
    ├── order_payments_dataset.csv/
    ├── order_reviews_dataset.csv/
    ├── orders_dataset.csv/
    ├── products_dataset.csv/
    ├── sellers_dataset.csv/
    ├── product_category_name_translation.csv
