corr <- function(directory, threshold=0){

     completeData <- complete("specdata", 1:332)
     nobs <- completeData$nobs
     
     # finding the valid ids for the given threshold
     ids <- completeData$id[nobs > threshold]
     
     # obtain the length of ids vector
     idLength <- length(ids)
     correlationData <- rep(0, idLength)
     
     # finding all CSV files in the specdata directory
     filesList <- as.character(list.files(directory))
     filePaths <- paste(directory, "/", filesList, sep="")
     j <- 1
     for(i in ids) {
          currentFile <- read.csv(filePaths[i], header=TRUE, sep=",")
          sulfateData <- currentFile$sulfate
          nitrateData <- currentFile$nitrate
          correlationData[j] <- cor(sulfateData, nitrateData, use="complete.obs")
          j <- j + 1
     }
     correlationData
}