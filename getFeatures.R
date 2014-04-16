getFeatures <- function(fileName) {
	features <- read.csv(fileName, sep=' ', header=FALSE)
	columns<-grep("std\\(\\)|mean\\(\\)", features[[2]])
	result <- features[columns,]
	names(result) <- c("index", "title")
        return(result)
}
