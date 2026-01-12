def check_row_count(cursor, table_name):
    cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
    count = cursor.fetchone()[0]
    return count > 0


def check_no_nulls(cursor, table_name, column_name):
    cursor.execute(
        f"SELECT COUNT(*) FROM {table_name} WHERE {column_name} IS NULL"
    )
    nulls = cursor.fetchone()[0]
    return nulls == 0
