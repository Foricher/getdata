cleanData <- function(dataDirectory, outputFileName) {
    library('stringr')
    oldDirectory <- getwd()
    setwd(dataDirectory)

    features <- getFeatures('features.txt')
    labels <- read.table('activity_labels.txt')

    allData <- mergeTrainAndTestData('train/X_train.txt', 'test/X_test.txt', features[,1])
    names(allData) <- str_replace_all(str_replace(tolower(features[,2]), "\\(\\)", ""), "-", "_")
    
    activities <- getActivities('train/y_train.txt', 'test/y_test.txt')
    names(activities) <- c("activity")
    
    subjects <- mergeFiles('train/subject_train.txt', 'test/subject_test.txt')
    names(subjects) <- c("subject")
    
    ## allData <- cbind(subjects, activities, allData)
    allData <- cbind(activities, allData)

    setwd(oldDirectory)
    print(sprintf("Saving data fo file %s", outputFileName))
    write.table(allData, file= outputFileName)
    setwd(dataDirectory)

    setwd(oldDirectory)
    bySubjects <- split(allData, subjects)
    f <- function(x) {
        ac <- x$activity
        zzx <- split(x[, !(colnames(x) %in% c("activity"))], ac)
        ##return (lapply(zzx, mean))
        return (zzx)
    }
    xy <- lapply(bySubjects, f)
    return (xy)
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


getData <- function(fileName, labels, subjects, features) {
	data <- read.table(fileName)
#	columns<-grep("std\\(\\)|mean\\(\\)", features[[2]])
#	result <- features[columns,]
	result <- data[,features[,1]]
	names(result) <- features[,2]

	labels <- read.table(labels)
	names(labels) <- c("label")
	result$label <- labels

	subjects <- read.table(subjects)
	names(subjects) <- c("subject")
	result$subject <- subjects

        return(result)
}

readFile <- function(fileNames, labels, subjects, features) {
xxx<-lapply(c("test/X_test.txt", "train/X_train.txt"), read.table)
	data <- read.table(fileName)
	result <- data[,features[,1]]
	names(result) <- features[,2]

	labels <- read.table(labels)
	names(labels) <- c("label")
	result$label <- labels

	subjects <- read.table(subjects)
	names(subjects) <- c("subject")
	result$subject <- subjects

        return(result)
	data <- read.table(fileName)
	result <- data[,features[,1]]
        return(result)
}
