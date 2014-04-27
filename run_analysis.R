cleanData <- function() {
    require(stringr)
    require(data.table)
    outputFileName <- 'tidy_data.txt'
    averagesFileName <- 'averages.txt'

    ## Read and select features.
    features <- getFeatures('features.txt')
    
    ## Read activity labels.
    activityLabels <- read.table('activity_labels.txt')

    ## Read and merge measurements data; keep only selected features.
    allData <- mergeTrainAndTestData('X_train.txt', 'X_test.txt', features[,1])
    ##names(allData) <- str_replace_all(str_replace(tolower(features[,2]), "\\(\\)", ""), "-", "_")
    names(allData) <- features[,2]
    
    ## Read and merge activity files.
    activities <- getActivities('y_train.txt', 'y_test.txt')
    names(activities) <- c("activity")
    
    ## Read and merge subject files.
    subjects <- getSubjects('subject_train.txt', 'subject_test.txt')
    names(subjects) <- c("subject")
    
    ## Bind together subject, activities and measurements data.
    allData <- cbind(subjects, activities, allData)

    ## Save tidy file with merged test and train measurements for selected features.
    print(sprintf("Saving data to file %s", outputFileName))
    write.table(allData, file= outputFileName, row.names = FALSE, quote = FALSE)

    ## Using data.table for calculating measurements means for each subject and activity.
    dt_data <- as.data.table(allData)
    dt_means <- dt_data[, lapply(.SD, mean), by = c("subject", "activity")]

    ## Convert data.table back to frame for final output.
    means <- as.data.frame(dt_means)
    
    activities <- means$activity
    subjects <- means$subject
    labels <- factor(activities, activityLabels[,1], activityLabels[,2])

    means <- cbind(subjects, activities, labels, means[, !(names(means) %in% c("subject", "activity"))])
    names(means)[1:3] = c("subject", "activity", "label")
    
    ## Write tidy data with means of measurements data.
    write.table(means, file = averagesFileName, row.names = FALSE, quote = FALSE)

    return(means)
}

mergeFiles <- function(trainFileName, testFileName) {
    print(sprintf("Reading data from file %s", trainFileName))
    d1 <- read.table(trainFileName)
    print(sprintf("Reading data from file %s", testFileName))
    d2 <- read.table(testFileName)
    return (rbind(d1, d2))
}

mergeTrainAndTestData <- function(trainFileName, testFileName, selection) {
    data <- mergeFiles(trainFileName, testFileName)
    return (data[, selection])
}

getFeatures <- function(fileName) {
    print(sprintf("Reading features from file %s", fileName))
    features <- read.csv(fileName, sep=' ', header=FALSE)
    columns<-grep("std\\(\\)|mean\\(\\)", features[[2]])
    result <- features[columns,]
    names(result) <- c("index", "title")
    return(result)
}

getActivities <- function(trainFileName, testFileName) {
    return (mergeFiles(trainFileName, testFileName))
}

getSubjects <- function(trainFileName, testFileName) {
    return (mergeFiles(trainFileName, testFileName))
}
