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
