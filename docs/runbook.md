# Pipeline Runbook

This document explains how to set up and run the analytics pipeline end-to-end.

## Prerequisites

- Snowflake free trial account
- Python 3.x installed
- Git installed
- VS Code (or any IDE)

## Initial Setup

1. Clone the GitHub repository
2. Create and activate a Python virtual environment
3. Install dependencies using requirements.txt
4. Create a .env file with Snowflake credentials

## Snowflake Setup

1. Create database `ECOMMERCE`
2. Create schemas: BRONZE, SILVER, GOLD, MART
3. Create warehouse `COMPUTE_WH`
4. Create internal stage for CSV upload
5. Upload source CSV files to Snowflake stage

## Pipeline Execution Steps

1. Execute Bronze SQL scripts to load raw data
2. Execute Silver SQL scripts to clean and validate data
3. Execute Gold SQL scripts to create fact and dimension tables
4. Execute Mart SQL scripts for reporting datasets
5. Run Python pipeline for data quality checks


## Running Python Pipeline

From project root:

python -m python.orchestration.run_pipeline
