Repository contasins following files:
* README.md
* run\_analysis.R - main script
* Codebook.md - description of the data produced by run\_analysis.R
* clean\_data.txt - output of the run\_analysis.rb

After checking out the repository you should also download and unzip the dataset from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
In your repository directory you should have now directory named UCI HAR Dataset 

In R console you can simply `source('run_analysis.R')

The script will merge the test and training data and filter out only columns that contain average or mean values.
Then the data will be cleaned by displaying the mean of these values for each grouping of subject id and activity.

The description of the fields can be found in the Codebook.
