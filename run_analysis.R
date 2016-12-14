run_analysis <- function() {
        
         setwd("./UCI HAR Dataset")
        # Read the file features.txt which contains the labels of all columns
        labels <- read.table("features.txt")
        # Extract the column names which is the second column
        all_colNames <- labels[,2]
        # Find the column numbers which contains the mean and std values
        colNames_id <- grep("mean|std|Mean" , all_colNames)
        # Get the value of the column names needed
        colNames <- grep("mean|Mean|std" , all_colNames , value = T)
        
        # Read the training data
        train_read <- read.table("train/X_train.txt")
        # Select only the columns which contains mean , std values
        train_data <- train_read[,colNames_id]
        names(train_data) <- colNames
        
        #Read the Y _train file contains the activity data
        train_act<- read.table("train/y_train.txt")
        names(train_act) <- "activity"
        
        #Read the subject_train file
        train_subject <- read.table("train/subject_train.txt")
        names(train_subject) <- "subject"
        
        # Bind the activity table with the train data
        train <- cbind(train_act ,train_subject, train_data )
        # Create a new column with the type od the data train= 1 
        train <- mutate( train , type = "1")
        
        # Read the test data
        test_read <- read.table("test/X_test.txt")
        test_data <- test_read[,colNames_id]
        names(test_data) <- colNames
        
        # Read the activity table of the test data
        test_act <- read.table("test/y_test.txt")
        names(test_act) <- "activity"
        
        # Read the subject_test table
        test_subject <- read.table("test/subject_test.txt")
        names(test_subject) <- "subject"
        
        # Bind the activity table with the test data
        test <- cbind(test_act ,test_subject , test_data)
        # Create a new column with the type of the data  test= 2
        test <- mutate(test , type= "2")
        
       # Merge the train and test tables
        merged_data <- rbind(test , train)
        
        # summarized data , get the mean for each column grouped by activity and subject
        summarized_data <- merged_data %>% select(-type)%>%group_by(activity , subject)%>% summarize_each( funs(mean))
        write.table(summarized_data , "Data_tidy.txt" , col.name=FALSE)
        
        # View the tidy datasets
        View(merged_data)
        View(summarized_data)
        
        
}