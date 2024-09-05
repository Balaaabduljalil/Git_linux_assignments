# List of Assignments Contents. 
- Building Simple ETL Bash Script.
- Daily Cron Jobs Scripting.
- Bash Script to Move CSV & JSON Files.
- Bash Script to iterate SQL Database.
- PostgreSQL Scripts.

# Building Simple ETL Bash Script. 

## Task Overview

1. Extract: Download a CSV file from a provided link and save it into a folder called `raw`.
2. Transform: Perform a simple transformation by renaming a column, selecting specific columns, and saving the transformed file to a folder called `Transformed`.
3. Load: Move the transformed data to a directory named `Gold` and confirm that the file has been saved.

## Step 1: Extract
1. Download CSV file:
   - The CSV file is downloaded from a given URL.
   - The downloaded file is saved into a folder called `raw`.

2. Steps to follow:
   - Created a `raw` folder.
   - Used `curl` to download the CSV file and save it into the `raw` folder.
   - Confirmed the file has been saved.

## Step 2: Transform
1. Transformation Process:
   - Rename the column `Variable_code` to `variable_code`.
   - Select the following columns: `year`, `Value`, `Units`, and `variable_code`.
   - Save the transformed file as `2023_year_finance.csv` in the `Transformed` folder.

2. Steps to follow:
   - Create a `Transformed` folder.
   - Use `awk` to rename the column and select specific columns.
   - Confirm the transformed file has been saved.

## Step 3: Load
1. Loading Process:
   - Move the transformed data (`2023_year_finance.csv`) to the `Gold` directory.

2. Steps to follow:
   - Create a `Gold` folder.
   - Move the transformed file from the `Transformed` folder to the `Gold` folder.
   - Confirm the file has been saved.

## Final Full Script

Below is the complete script that performs the entire ETL process:

```bash
#!/bin/bash

# Step 1: Extract
CSV_URL="www.annual-enterprise-survey-2023-financial-year-provisional.csv"

# Create raw folder if it doesn't exist
mkdir -p raw

# Download the CSV file into the raw folder
wget -O raw/input.csv "$annual-enterprise-survey-2023-financial-year-provisional.csv"

# Check if the file is saved
if [ -f "raw/input.csv" ]; then
    echo "CSV file successfully saved to the raw folder."
else
    echo "Failed to save the CSV file."
    exit 1
fi

# Step 2: Transform
mkdir -p Transformed

# Perform the transformation
awk -F, '
BEGIN { OFS = "," }
NR == 1 {
    for (i = 1; i <= NF; i++) {
        if ($i == "Variable_code") $i = "variable_code"
    }
    print $1, $2, $3, $4
    next
}
rint $1, $2, $3, $4 }
' raw/input.csv > Transformed/2023_year_finance.csv

# Check if the transformed file is saved
if [ -f "Transformed/2023_year_finance.csv" ]; then
    echo "Transformed file successfully saved to the Transformed folder."
else
    echo "Failed to save the transformed file."
    exit 1
fi

# Step 3: Load
mkdir -p Gold

# Move the transformed file to the Gold folder
mv Transformed/2023_year_finance.csv Gold/

# Check if the file is saved in the Gold folder
if [ -f "Gold/2023_year_finance.csv" ]; then
    echo "File successfully moved to the Gold folder."
else
    echo "Failed to move the file to the Gold folder."
    exit 1
fi
```
# Bash Script to Moved CSV and JSON Files to different Direcotry.

This document will guide you step by step on how to create a Bash script that moves all CSV and JSON files from one folder to another folder named `json_and_CSV`. The script will work with one or more files of each type.

---

## Task Overview

### Objective:
- To write a Bash script that automatically moves CSV and JSON files from a source folder to a destination folder (`json_and_CSV`).

---

### 1. Creating the Folders
1. Source Folder:
   - Create a folder named `source_files` or any name of your choice. This is where the CSV and JSON files will be stored before moving.
   
   Example:
   ```bash
   mkdir source_files
   ```

2. Destination Folder:
   - Create a folder named `json_and_CSV` where the files will be moved.

   Example:
   ```bash
   mkdir json_and_CSV
   ```

### 2. Gathering Files to Move
- Place one or more `.csv` and `.json` files into the `source_files` folder. These files will be moved by the script.

### 3. Write the Bash Script

1. Creating the Bash Script:
   - Open a text editor to write the Bash script.

   Example:
   ```bash
   nano move_files.sh
   ```

2. Script Overview:
   - The script will:
     - Search the `source_files` directory for `.csv` and `.json` files.
     - Move the found files to the `json_and_CSV` folder.

3. General Bash Script Code:

   ```bash
   #!/bin/bash

   # Define source and destination folders
   SOURCE_DIR="source_files"
   DEST_DIR="json_and_CSV"

   # Ensure the destination directory exists
   if [ ! -d "$DEST_DIR" ]; then
       mkdir -p "$DEST_DIR"
       echo "Destination directory created."
   fi

   # Move CSV files
   for file in "$SOURCE_DIR"/*.csv; do
       if [ -f "$file" ]; then
           mv "$file" "$DEST_DIR"
           echo "Moved $file to $DEST_DIR"
       else
           echo "No CSV files found in $SOURCE_DIR"
       fi
   done

   # Move JSON files
   for file in "$SOURCE_DIR"/*.json; do
       if [ -f "$file" ]; then
           mv "$file" "$DEST_DIR"
           echo "Moved $file to $DEST_DIR"
       else
           echo "No JSON files found in $SOURCE_DIR"
       fi
   done
   ```

### 4. Make the Script Executable
1. Set Execute Permissions:
   - After writing the script, you need to make it executable. Run the following command:

   ```bash
   chmod +x move_files.sh
   ```

### 5. Run the Script
1. Execute the Script:
   - Now, you can run the script to move the files from the `source_files` folder to the `json_and_CSV` folder.

   ```bash
   ./move_files.sh
   ```

2. Script Output:
   - The script will search for `.csv` and `.json` files in the `source_files` folder and move them to the `json_and_CSV` folder.
   - If no files are found, it will notify you that no CSV or JSON files are present.

### 6. Verify File Movement
1. Check Destination Folder:
   - After running the script, check the `json_and_CSV` folder to ensure the CSV and JSON files have been moved successfully.
   
   ```bash
   ls json_and_CSV
   ```

2. Check Source Folder:
   - Ensure that the files have been removed from the `source_files` folder.

   ```bash
   ls source_files
   ```

### 7. Automate the Script.
1. Use Cron to Automate:
   - If you want the script to run automatically at specific times (e.g., daily), you can schedule it using a cron job.
   
   Example (to run the script daily at midnight):
   ```bash
   crontab -e
   ```

   Add this line:
   ```bash
   0 0 * * * /path/to/move_files.sh
   ```

---

# PostgreSQL Scripts: 

This document provides a step-by-step guide to perform the task of analyzing CoreDataEngineers' competitor, Parch and Posey. The process involves downloading a CSV file, importing the data into a PostgreSQL database, and writing SQL queries to address specific business questions.

---

## Task Overview

CoreDataEngineers is venturing into sales and needs to analyze their competitor Parch and Posey. The goal is to download a CSV file containing relevant data, load it into a PostgreSQL database, and answer questions using SQL queries.

---

## Step-by-Step Instructions

### 1. Download the CSV File
1. Download the CSV file from the provided link.
   - Save the CSV file in a local directory (e.g., `parch_and_posey_data`).

### 2. Create a PostgreSQL Database
1. Open your PostgreSQL interface (e.g., `psql` or `pgAdmin`).
2. Create a new database called `posey` using the following command:
   ```sql
   CREATE DATABASE posey;
   ```

### 3. Write a Bash Script to Import CSV Data into PostgreSQL

Bash Script: `import_csv_to_db.sh`

```bash
#!/bin/bash

# Define database details
DB_NAME="posey"
DB_USER="your_username"
DB_PASSWORD="your_password"
CSV_DIR="./parch_and_posey_data"

# Loop through all CSV files in the folder and import them
for file in $CSV_DIR/*.csv; do
  echo "Importing $file into the database..."
  
  # Use the psql COPY command to load the CSV into PostgreSQL
  psql -d $DB_NAME -U $DB_USER -c "\COPY your_table_name FROM '$file' DELIMITER ',' CSV HEADER;"
  
  # Check if the command was successful
  if [ $? -eq 0 ]; then
    echo "$file successfully imported into $DB_NAME."
  else
    echo "Error importing $file."
  fi
done
```

### 4. Schedule the Script with Cron (Optional)
If you want to automate this process, you can schedule the script to run at a specified time using `cron`.

1. Open your crontab using the following command:
   ```bash
   crontab -e
   ```
2. Add the following line to schedule the script to run daily at 12:00 AM:
   ```bash
   0 0 * * * /path_to_your_script/import_csv_to_db.sh
   ```

### 5. Writen the SQL Queries to Answer Business Questions

#### Question 1: Find Order IDs Where `gloss_qty` or `poster_qty` > 4000

```sql
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;
```

#### Question 2: Orders Where `standard_qty` is Zero and `gloss_qty` or `poster_qty` > 1000

```sql
SELECT id, gloss_qty, poster_qty
FROM orders
WHERE standard_qty = 0
AND (gloss_qty > 1000 OR poster_qty > 1000);
```

#### Question 3: Find Company Names Starting with 'C' or 'W' and Where Contact Contains 'ana' but not 'eana'

```sql
SELECT company_name
FROM companies
WHERE (company_name LIKE 'C%' OR company_name LIKE 'W%')
AND primary_contact ILIKE '%ana%'
AND primary_contact NOT ILIKE '%eana%';
```

#### Question 4: Table of Region, Sales Rep, and Accounts

``` sql
SELECT regions.region_name, sales_reps.sales_rep_name, accounts.account_name
FROM sales_reps
JOIN regions ON sales_reps.region_id = regions.id
JOIN accounts ON sales_reps.account_id = accounts.id
ORDER BY accounts.account_name ASC;
```







