## This script will first process the data for train and then similarly
##for the test and then will combine them and further process them.


##Processing of train-data starts here...

##loading featureNames list

fNames<-read.table('dataset/features.txt')

##subsetting fNames to get the indices of the "mean()" variables only, using 
##grep function

indices<-grep("mean()",fNames[,2],fixed=TRUE)

##subsetting fNames to get the indices of the "std()" variables only, using 
##grep function and concatenating it to the previously created list for indices 
##of the mean() variables.

indices<-c(indices,grep("std()",fNames[,2],fixed=TRUE))
##Now, we have mean() and std() column indices

##Loading the X_train dataset and subsetting it at the same time so as to
##use less RAM.

traindata<-read.table('dataset/train/X_train.txt')[,indices]
##Now, we have got the std() and mean() data for train. Let's add the y_train
##subject_train data to know the activities and the subjects associated with
##X_train data's each row

traindata<-cbind(read.table('dataset/train/y_train.txt'),traindata)

traindata<-cbind(read.table('dataset/train/subject_train.txt'),traindata)

##Processing the Test data now...

##Loading the X_test dataset and subsetting it at the same time so as to
##use less RAM.

testdata<-read.table('dataset/test/X_test.txt')[,indices]
##Now, we have got the std() and mean() data for test. Let's add the y_test
##subject_test data to know the activities and the subjects associated with
##X_test data's each row

testdata<-cbind(read.table('dataset/test/y_test.txt'),testdata)

testdata<-cbind(read.table('dataset/test/subject_test.txt'),testdata)

##Let's now rbind() the train and test data, i.e.. let's merge them now.

data<-rbind(traindata,testdata)

##data is the merged data having only mean() and std() varibles

##So, now let's replace the activity numbers with their corresponding real names
##using the gsub() function six times for six activities

data[,2]<-gsub("1","WALKING",data[,2])
data[,2]<-gsub("2","WALKING_UPSTAIRS",data[,2])
data[,2]<-gsub("3","WALKING_DOWNSTAIRS",data[,2])
data[,2]<-gsub("4","SITTING",data[,2])
data[,2]<-gsub("5","STANDING",data[,2])
data[,2]<-gsub("6","LAYING",data[,2])


##Giving real names to all the columns of the dataset
##as a last step for tidy dataset1!

colnames(data)<-c("Subject","Activity",as.character(fNames[indices,2]))

##This dataset is without any average for each varible as asked in 5th instruction.

write.table(data,"tidydataset1.txt")

##Now, let's process "data" to get the new dataset as asked in the 5th instruction

i<-1
j<-NULL
newdata<-NULL
subdata<-NULL
subsubdata<-NULL

##Doing the required operations to obtained the processed data

for(i in 1:30)
{
  subdata<-data[data[,1]==i,]
  for(j in c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
  {
    subsubdata<-subdata[subdata[,2]==j,]
    subsubdata<-c(i,j,colMeans(subsubdata[,3:68]))
    newdata<-rbind(newdata,subsubdata)
  }
  
}
colnames(newdata)<-c("Subject","Activity",as.character(fNames[indices,2]))
rownames(newdata)<-NULL

##Saving the output as tidydataset2.txt in the working directory.

write.table(newdata,"tidydataset2.txt")


