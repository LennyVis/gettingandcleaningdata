unzip("UCI HAR Dataset.zip")


#Reading the train file

X_train = read.table("UCI HAR Dataset/train/X_train.txt")

Y_train = read.table("UCI HAR Dataset/train/Y_train.txt")

subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")


#Reading the test set

X_test = read.table("UCI HAR Dataset/test/X_test.txt")

Y_test = read.table("UCI HAR Dataset/test/Y_test.txt")

subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")


#Reading the var names from the features.txt file

var_names=read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)


#Building the combined train and test dataset

full_train=X_train

full_train$activity=Y_train$V1

full_train$Subject=subject_train$V1

full_test=X_test

full_test$activity=Y_test$V1

full_test$Subject=subject_test$V1

combined_dataset=rbind(full_train, full_test)



#Replacing the activity numbers with activity name

activity_labels=read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)

names(activity_labels)=c("activity.num", "activity.desc")

combined_dataset=join(combined_dataset, activity_labels, by="activity.num", type="left", match="all")


#Setting more descriptive variable names of the dataset by using the "features.txt"

var_names=read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)

var_names$V2=tolower(var_names$V2)

var_names$V2=gsub("[(),-]","",var_names$V2,)

names(combined_dataset)=c(var_names$V2, "subject", "activity.num", "activity.desc")


#Extracts the column id of all columns that are representing mean and standard deviation values

col_ls=grep("mean|std|subject|activity.num|activity.desc", names(combined_dataset), value=FALSE)

combined_dataset_truncated=combined_dataset[,col_ls]


#Buidling the new dataset with mean values of every variable grouped by subject and activity

measurement_var_ls=names(combined_dataset_truncated[,c(1:86)])

melt_dt=melt(combined_dataset_truncated, id=c("subject", "activity.desc"), measure.vars= measurement_var_ls)

result_dt=dcast(melt_dt, subject+ activity.desc~variable, mean)


#Printing the dataset to a csv file

write.csv(result_dt, file="course_project_result.csv", row.names=FALSE)

