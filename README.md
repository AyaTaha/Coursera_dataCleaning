## Data Getting and Cleaning Project Instructions

1. First , we get the column labels from the features.txt file which has all the column names
2. Performing a search function to get the values and the id which contains the mean or std 
	values in its labels as these variables will be used later
3. Reading the train , y_train which is the activity and the subject
4. Binding the data to make a one dataset and select only the columns which contain mean and
   std from point 2
5. Apply step 3 for the test data
6. Merge the two datasets to make a one tidy dataset
7. Group the data for activity and subject then get the mean of all columns 
8. Create the file Data_tidy.txt of the summarized data