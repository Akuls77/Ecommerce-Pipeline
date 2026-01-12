# Data Model Overview

This project follows a layered data warehouse architecture using Bronze, Silver, Gold, and Mart layers.
Each layer has a clear responsibility to ensure data quality, scalability, and ease of analysis.

---

## Bronze Layer (Raw Data)

Purpose:
The Bronze layer stores raw data exactly as received from source CSV files.
No business rules or transformations are applied at this stage.

Tables:
- BRONZE.CUSTOMERS_RAW
- BRONZE.ORDERS_RAW
- BRONZE.ORDER_ITEMS_RAW
- BRONZE.PRODUCTS_RAW
- BRONZE.PAYMENTS_RAW
- BRONZE.SHIPMENTS_RAW

Characteristics:
- All columns are stored as STRING
- Duplicate and invalid records are allowed
- Ingestion timestamp is added for traceability

---

## Silver Layer (Cleaned & Validated Data)

Purpose:
The Silver layer prepares data for analytics by cleaning, validating, and standardizing it.

Key actions performed:
- Data type casting (dates, numbers, booleans)
- Deduplication using business keys
- Removal of invalid records
- Enforcement of referential integrity

Tables:
- SILVER.CUSTOMERS
- SILVER.ORDERS
- SILVER.ORDER_ITEMS
- SILVER.PRODUCTS
- SILVER.PAYMENTS
- SILVER.SHIPMENTS

---

## Gold Layer (Analytics Model)

Purpose:
The Gold layer follows dimensional modeling principles and is optimized for analytics.

### Dimension Tables
- GOLD.DIM_CUSTOMER  
  Grain: One row per customer

- GOLD.DIM_PRODUCT  
  Grain: One row per product

- GOLD.DIM_DATE  
  Grain: One row per calendar date

### Fact Tables
- GOLD.FACT_ORDERS  
  Grain: One row per order

- GOLD.FACT_ORDER_ITEMS  
  Grain: One row per order per product  
  Metrics: quantity, revenue

- GOLD.FACT_PAYMENTS  
  Grain: One row per payment

---

## Mart Layer (Reporting)

Purpose:
The Mart layer provides business-friendly, pre-aggregated datasets for reporting and analysis.

Tables:
- MART.DAILY_REVENUE
- MART.MONTHLY_REVENUE
- MART.TOP_CUSTOMERS
- MART.PRODUCT_PERFORMANCE

These tables are designed to be directly consumed by analysts or BI tools.
