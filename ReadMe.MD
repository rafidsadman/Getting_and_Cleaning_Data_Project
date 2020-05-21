---
title: "Readme"
author: "Rafid Sadman Eesha"
date: "5/21/2020"
---

Information about the R scripts used for the data cleaning project. The project is based on data collected from the accelerometers  from the samsung galaxy smarphone. Full description of the dataset is available at 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Run_analysis.R

This is the script that is called to performe the cleaning and tidying of the dataset as described in the excercise. It joins the two datasets, gives them proper variable names and activity names, and every record is identifiable through subject ID and activity name.  

This file assumes that datazip file has been downloaded and unzipped.

The run_analysis.R does the following 

1. Loads dplyr package to ensure the easy handling and processing of the tables.
2. Reads the activity labels table and gives the table proper column names - activity ID and activity name.
3. Reads the names of 561 features and takes the second column of the table for future use as variable names of the records.
4. Reads the train dataset, activity labels and subject IDs and column binds them to create a data frame named train_data. 
5. Reads the test dataset, activity labes and subject IDs and column binds them to create a frame named test_data.
6. Merges the train_data and test_data dataframes and create one big dataframe by row binding named merged_data.
7. Merges the merged_data and activity_labels tables to add descriptive activity labels for each record named final_data.
8. Removes the Activity_ID column from the dataframe because of redundancy.
9. Selects the Unique ID columns and columns that contain "mean" or "standard deviation" values to update the dataframe. 
10. groups the dataframy by subject_ID and activity_name.
11. Summarizes to find the mean values of each variables grouped by subject_ID and activity_name.
12. The resultant dataframe is stored in a dataframe named "final_grouped_data_mean_output".

Line by line explanation is given in the script - run_analysis.R