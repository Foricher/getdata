cleanData <- function() {
    outputFileName <- 'tidy_data.txt'
    averagesFileName <- 'averages.txt'
    require(stringr)
    require(data.table)

    features <- getFeatures('features.txt')
    activityLabels <- read.table('activity_labels.txt')

    allData <- mergeTrainAndTestData('train/X_train.txt', 'test/X_test.txt', features[,1])
    ##names(allData) <- str_replace_all(str_replace(tolower(features[,2]), "\\(\\)", ""), "-", "_")
    names(allData) <- features[,2]
    
    activities <- getActivities('train/y_train.txt', 'test/y_test.txt')
    names(activities) <- c("activity")
    
    subjects <- mergeFiles('train/subject_train.txt', 'test/subject_test.txt')
    names(subjects) <- c("subject")
    
    allData <- cbind(subjects, activities, allData)

    print(sprintf("Saving data to file %s", outputFileName))
    write.table(allData, file= outputFileName, row.names = FALSE, quote = FALSE)

    dt_data <- as.data.table(allData)
    dt_means <- dt_data[, lapply(.SD, mean), by = c("subject", "activity")]

    means <- as.data.frame(dt_means)
    
    activities <- means$activity
    subjects <- means$subject
    labels <- factor(activities, activityLabels[,1], activityLabels[,2])

    means <- cbind(subjects, activities, labels, means[, !(names(means) %in% c("subject", "activity"))])
    names(means)[1:3] = c("subject", "activity", "label")
    
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
    return (mergeFiles('train/y_train.txt', 'test/y_test.txt'))
}

getSubjects <- function(trainFileName, testFileName) {
    return (mergeFiles('train/subject_train.txt', 'test/subject_test.txt'))
}
