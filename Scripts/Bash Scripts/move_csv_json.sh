#!/bin/bash
source_dir="my dataset" #my dataset is souces directory
mkdir -p "json_and_csv" # creating the target directory as json_and_csv
mv my_dataset /*.csv json_and_csv # moving all CSV files from my source directory to the target directory
mv my_dataset /*.json json_and_csv # moving all JSON files from the sources directory to the target directory.
if [ $? -eq 0]; then 
   echo "CSV and JSON files have been moved to json_and_csv."
else
   echo "No CSV or JSON files found in json_and_csv"
fi 
