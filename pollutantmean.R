pollutantmean <- function(directory, pollutant, id=1:332) {
     filesList <- as.character(list.files(directory))
     
     filePaths <- paste(directory, "/", filesList, sep="")
     
     sumOfPMValues <- c()
     for(i in id) {
          currentFile <- read.csv(filePaths[i], header=TRUE, sep=",")
          nasRemoved <- currentFile[!is.na(currentFile[, pollutant]), pollutant]
          sumOfPMValues <- c(sumOfPMValues, nasRemoved)
     }
     
     pollutantMean <- round(mean(sumOfPMValues),3)
     pollutantMean
}
