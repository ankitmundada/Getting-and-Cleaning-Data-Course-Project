1.Assumptions:
mean features and standerd deviation features are the features that contain "mean()" and "std()" expressions in them.


2.Note: My script creates two Tidy datasets as asked in the course instructions. 
1st one is the labelled dataset which contains merged data.frames for Test and Train.
2nd one contains further processed 1st data.frame to give average values of the Activities for each Subject.

3.Processes done on features.txt are:

Subsetted to give new vector called indices which give indices for the mean() and std() values.
Subsetted using grep() function.

4.Processes done on X_train.txt are:
Subsetted using indices as the column conditioners.

5.Creation of traindata and its meaning:
Traindata is the dataset which is the merging of overall train subjects' data arranged properly 
with their activities using cbind() function on X_train, y_train and subjects_train.


Similar processings have been done over the X_test, y_test and subjects_test and then its merged with 
traindata to finally give "tidydataset1.txt".

6.Creation of tidydataset2.txt:

tidydataset1.txt is actually subsetted twice using a nested for loop structure to get the mean of variables 
for each varable of each subject.


7.Varibles: 66 variables which describe mean() of varios parameters and std() of various parameters.
8.Activities: WALKIN, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, STANDING, SITTING, LAYING.


Thank you for reading through this Codebook. I hope it helps!
Cheers!

