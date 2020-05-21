#Loading this library to ensure the easy handling and processing of the tables
library(dplyr)

#reading activity labels
activity_labels <- read.table("activity_labels.txt")
#naming the columns properly to indicate their activity
colnames(activity_labels) <- c("Activity_ID", "activity_name")

#reading feature names for column names
feature_names_tbl <- read.table("features.txt")
#reading the column names
features_names_col <- feature_names_tbl[,2]

#Reading and preparing the training Data Table 
train_values <- read.table("./train/X_train.txt")
train_activity_label <- read.table("./train/y_train.txt")
train_subject_ID <- read.table("./train/subject_train.txt")

#Column binding the subject ID, activity label and values
train_data <- cbind(train_subject_ID, train_activity_label, train_values)

#Reading and preparing the test Data Table
test_values <- read.table("./test/X_test.txt")
test_activity_label <- read.table("./test/y_test.txt")
test_subject_ID <- read.table("./test/subject_test.txt")

#Column binding the subject ID, activity label and values
test_data <- cbind(test_subject_ID, test_activity_label, test_values)

#merging test & train datasets
merged_data <- rbind(train_data, test_data)

#Giving proper descriptive variable names for easy understanding.
colnames(merged_data) <- c("Subject_ID", "Activity_ID", features_names_col)

#Merging the data file and Activity label table to ensure the activity labes have descriptive names instead of numbers 
final_merged_data <- merge(merged_data, activity_labels, by.x = "Activity_ID", by.y = "Activity_ID")

#Removing the Activity_ID column because it's redundant and rearranging the columns for easier reading
final_data <- subset(final_merged_data, select = c(2, 564, 3:563))

#Selecting only the columns that contain "Mean" or "Standard Deviation" values.
final_data <- select(final_data, Subject_ID, activity_name, matches("mean|std"))

final_data <- tbl_df(final_data)


#Taking the final_data, grouping them by subject ID and Activity names and then getting the mean values by summarizing them.
final_grouped_data_mean_output <- final_data %>%  group_by(Subject_ID, activity_name) %>% summarize_all(mean)


