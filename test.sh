#!/bin/bash

# Database file name
DB_FILE="test.db"

# SQL file name
SQL_FILE="createTables.sql"

# Remove the existing database file if it exists
rm -f "$DB_FILE"

# Create a new database and execute the SQL commands
sqlite3 "$DB_FILE" < "$SQL_FILE"

# Check if the operation was successful
if [ $? -eq 0 ]; then
    echo "Database setup completed successfully."
else
    echo "Error: Database setup failed."
    exit 1
fi