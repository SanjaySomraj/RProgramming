complete <- function(directory, id=1:332){

     id_len <- length(id)
     completeData <- rep(0, id_len)
   
     filesList <- as.character(list.files(directory))
     filePaths <- paste(directory, "/", filesList, sep="")
     
     j <- 1 
     for (i in id) {
          currentFile <- read.csv(filePaths[i], header=TRUE, sep=",")
          completeData[j] <- sum(complete.cases(currentFile))
          
          j <- j + 1
     }
     result <- data.frame(id = id, nobs = completeData)
     result
}