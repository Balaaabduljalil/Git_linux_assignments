#!/bin/bash
csv_files = dataset.csv  #directory that contain CSV files
db_name = possey #PostgreSQL database name
db_user = ballaabduljalil@gmial.com # postgreSQL username
db_host = localhost
db_port = 5432 #postgreSQL port
import_csv_to_postgres(){
    local new_dataset.csv ="$1"
    local new_dataset =$(basename "new_dataset" .csv)
    echo "Importing $dataset.csv into table new_dataset."
psql -U ballaabduljalil@gmail.com #checking if the table alredy exists, and if so, drop it. 
localhost -p 5432 -d 
posey -c "drop table if exists new_dataset."
#creating new table to import the CSV
psql -U ballaabduljalil@gmail.com -h 
localhost -p 5432 -d 
possey -c
   CREATE TABLE new_table 
   \COPY new_table FROM dataset.csv WITH (FORMAT csv, HEADER
if [ ! -d csv_files]; then 
    echo "Error: Directory csv_files does not exist,"
    exit 1 
fi
#Iterating over each csv files in the directory
for csv_files in dataset /*.csv; 
do
    if [ -f dataset.csv]; then 
       import_csv_to_postgress new_dataset
    else 
      echo "No CSV files found in  csv_files."
    fi
done 
echo "All CSV files have been imported."


 
