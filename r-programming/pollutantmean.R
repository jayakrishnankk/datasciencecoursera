pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  # function to return the filename prepended with zeroes. 
  filename <- function (index) {
    if (index < 10) paste("00", index, ".csv", sep="")
    else if (index < 100) paste("0", index, ".csv", sep="")
    else paste(index, ".csv", sep="")
  }

  pollutants <- data.frame()
  for (index in id) {
    pollutants <- rbind(pollutants,read.csv(paste(directory,"/",filename(index), sep="")))
  }
  mean(pollutants[,pollutant],na.rm=TRUE)
  
}
