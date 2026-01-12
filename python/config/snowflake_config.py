import os
from snowflake.connector import connect
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    conn = connect(
        user=os.getenv("SNOWFLAKE_USER"),
        password=os.getenv("SNOWFLAKE_PASSWORD"),
        account=os.getenv("SNOWFLAKE_ACCOUNT"),
        warehouse="COMPUTE_WH",
        database="ECOMMERCE",
        schema="BRONZE"
    )

    return conn