#!/bin/bash

# Database file name
DB_FILE="test.db"

# SQL file name
SQL_FILE="createTables.sql"
DROP_SQL_FILE="dropTables.sql"  # Added for drop tables

# Check for command line arguments
if [ "$1" == "-c" ]; then
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

elif [ "$1" == "-d" ]; then
    # Drop the existing tables
    sqlite3 "$DB_FILE" < "$DROP_SQL_FILE"

    # Check if the operation was successful
    if [ $? -eq 0 ]; then
        echo "Tables dropped successfully."
    else
        echo "Error: Dropping tables failed."
        exit 1
    fi

else
    # Display helper message
    echo "Usage: $0 [-c | -d]"
    echo "  -c  Create the database and tables"
    echo "  -d  Drop the existing tables"
    exit 1
fi