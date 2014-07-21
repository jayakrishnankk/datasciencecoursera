complete <- function(directory, id = 1:332) {
  # function to return the filename prepended with zeroes. 
  
  filename <- function (index) {
    if (index < 10) paste("00", index, ".csv", sep="")
    else if (index < 100) paste("0", index, ".csv", sep="")
    else paste(index, ".csv", sep="")
  }

  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  rows <- data.frame()
  for (index in id) {
    pollutants <- read.csv(paste(directory,"/",filename(index), sep=""))
    rows <- rbind(rows, cbind(index, nrow(pollutants[complete.cases(pollutants),])))
  }
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  colnames(rows) <- c("id", "nobs")
  rows
}