column_names <- read.table('features.txt')

# #1
# TRAINING set
# read X_train.txt, y_train.txt and subject_train.txt merge vertically
xtrain <- read.table('train/X_train.txt')
ytrain <- read.table('train/y_train.txt')
subject_train <- read.table('train/subject_train.txt')
# add column with activity ID and another one with subject ID
train <- cbind(xtrain,ytrain,subject_train)

# TEST set
# read X_test, y_test.txt and subject_test.txt merge vertically
xtest <- read.table('test/X_test.txt')
ytest <- read.table('test/y_test.txt')
subject_test <- read.table('test/subject_test.txt')
# add column with activity ID and another one with subject ID
test <- cbind(xtest,ytest,subject_test)

# Combine test and train data into one data set
merged_data <- rbind(test,train)
# replace y_train with labels from activity_labels.

# #2
# filter only the columns that have mean or std in their names
mn <-grep('mean',column_names[,2])
std <-grep('std',column_names[,2])
mean_std_columns <- sort(c(mn,std))
# column number of subject ID
subject_ID_column <- length(merged_data)
activity_ID_column <- length(merged_data) - 1
mean_std_columns_with_extras <- append(mean_std_columns, activity_ID_column)
mean_std_columns_with_extras <- append(mean_std_columns_with_extras, subject_ID_column)

filtered_merged_data <- merged_data[, mean_std_columns_with_extras]

# #3
activity_labels <- read.table('activity_labels.txt')
#filtered_merged_data$V1.1 <- factor(filtered_merged_data$V1.1,labels=activity_labels$V2)

# #4
# put the column names as loaded from features.txt
column_names <- as.character(read.table('features.txt')$V2)
column_names <- column_names[mean_std_columns]
column_names <- append(column_names,"Activity")
column_names <- append(column_names,"Subject_ID")
colnames(filtered_merged_data) <- column_names

#5
Activity <- as.character(filtered_merged_data$Activity)
Subject_ID <- as.character(filtered_merged_data$Subject_ID)
clean_data <- aggregate(filtered_merged_data, by=list(Activity,Subject_ID), FUN=mean)

write.table(clean_data,'../clean_data.txt')
