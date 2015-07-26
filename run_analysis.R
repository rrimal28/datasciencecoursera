library(plyr)

# 0 Dataload steps

# 0.1  Find location of the file: Blanks are removed from the file name;

 pathfile <- file.path(getwd(),"Documents/R_Learning/UCI HAR Dataset")
 
 # 0.2 Find location of train and test  folder
 
 file_loc_train <- file.path(pathfile,"train")
 file_loc_test <- file.path( pathfile,"test")
 
 
 # 0.3 Read train data,labels and subjects;
 
  TrainData <- read.table(file.path(file_loc_train,"X_train.txt"))
  TrainLabels <- read.table(file.path(file_loc_train,"y_train.txt"))
  TrainSubjects <- read.table(file.path(file_loc_train,"subject_train.txt"))

  # 0.4 Read test data,labels and subjects;
 
  TestData <- read.table(file.path(file_loc_test,"X_test.txt"))
  TestLabels <- read.table(file.path(file_loc_test,"y_test.txt"))
  TestSubjects <- read.table(file.path(file_loc_test,"subject_test.txt"))
 
 
  # 0.5 read features and labels;
  
  
  #1 Merge training and test data sets to get final data set;
  
  CombinedTrainData <- cbind(cbind(TrainData,TrainSubjects),TrainLabels)
  CombinedTestData <- cbind(cbind(TestData,TestSubjects),TestLabels)
  SensorData = rbind(CombinedTrainData,CombinedTestData)
  
  # 1.1 create feature labels to use in SensorLabels;
   FeatureLabels <- read.table(file.path(pathfile,"features.txt"),colClasses = c("character"))

   #1.2 create SensorLabels
    SensorLabels <- rbind(rbind(FeatureLabels,c(562,"Subject")),c(563,"Id"))[,2]
    names(SensorData) <- SensorLabels

  
  # 2 Extract only the measurements on the mean and standard deviation for each measurement;
  SensorDataAvgStd <- SensorData[,grepl("mean\\(\\)|std\\(\\)|Subject|Id",names(SensorData))]
   
   
  # 3 Use descriptive activity names to name the activities in the data
  # 3.1 get activity labels;
    ActivityLabels <- read.table(file.path(pathfile,"activity_labels.txt"),col.names=c("Id","Activity")) 
   
  # 3.2 use activity labels
   SensorDataAvgStd <- join(SensorDataAvgStd,ActivityLabels,by="Id",match="first")
   SensorDataAvgStd <- SensorDataAvgStd[,-1]
   
  #4  Label the data set with descriptive names;
  
  names(SensorDataAvgStd) <- gsub("([()])","",names(SensorDataAvgStd))
  
  # 4.1 normal names
  
  names(SensorDataAvgStd) <- make.names(names(SensorDataAvgStd))
  
  
  # 5 create tidy data set
  TidyData <- ddply(SensorDataAvgStd,c("Subject","Activity"),numcolwise(mean))
  
  # 5.1 Write the table out;
  
  write.table(TidyData,file = "/Users/sushmakarmacharya/Documents/R_Learning/UCI HAR Dataset/test/Data_Avg_By_Subject.txt",row.names=FALSE)
  
  
  
   
  
  
  
  
 
 
 
 
 
 
 
 
