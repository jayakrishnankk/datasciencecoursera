corr <- function(directory, threshold = 0) {

  filename <- function (index) {
    if (index < 10) paste("00", index, ".csv", sep="")
    else if (index < 100) paste("0", index, ".csv", sep="")
    else paste(index, ".csv", sep="")
  }

  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  validcases <- subset(complete(directory), nobs > threshold)
  corrs <- numeric()
  for(index in validcases[,"id"]){
    pollutants <- read.csv(paste(directory,"/",filename(index), sep=""))
    corrs <- c(corrs, cor(pollutants[,"nitrate"], pollutants[,"sulfate"], use="complete.obs"))
  }
  corrs
}