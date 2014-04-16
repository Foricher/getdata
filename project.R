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

getFeatures <- function(fileName) {
	features <- read.csv(fileName, sep=' ', header=FALSE)
	columns<-grep("std\\(\\)|mean\\(\\)", features[[2]])
	result <- features[columns,]
	names(result) <- c("index", "title")
        return(result)
}
