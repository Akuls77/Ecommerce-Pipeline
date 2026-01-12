from ..config.snowflake_config import get_connection
from ..data_quality.checks import check_row_count, check_no_nulls


def main():
    print("Connecting to Snowflake...")
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("USE DATABASE ECOMMERCE")
    cursor.execute("USE WAREHOUSE COMPUTE_WH")

    print("Running data quality checks...\n")

    tables_to_check = [
        ("SILVER.CUSTOMERS", "customer_id"),
        ("SILVER.ORDERS", "order_id"),
        ("GOLD.FACT_ORDER_ITEMS", "order_item_id")
    ]

    for table, pk in tables_to_check:
        row_check = check_row_count(cursor, table)
        null_check = check_no_nulls(cursor, table, pk)

        print(f"Table: {table}")
        print(f" - Row count > 0: {'PASS' if row_check else 'FAIL'}")
        print(f" - No NULL {pk}: {'PASS' if null_check else 'FAIL'}\n")

    cursor.close()
    conn.close()
    print("Pipeline execution completed.")

if __name__ == "__main__":
    main()
