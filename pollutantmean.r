files <- (Sys.glob("specdata//*.csv"))[id];

combined_data <- c()

for (file in files) {
  file_data <- read.csv(file, sep = ",");
  pollutant_data <- file_data[,pollutant];
  pollutant_data <- pollutant_data[!is.na(pollutant_data)]
  combined_data <- c(combined_data, pollutant_data)
}

return(mean(combined_data));
}
pollutantmean <- function(directory, pollutant, id = 1:332) {
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  files <- dir()
  data <- numeric()
  data<-data.frame()
  
  for (i in id) {
    newRead = read.csv(paste(directory, "/", 
                             ".csv", sep = ""))
    data = c(data, newRead[[pollutant]])
  }
  
  return(mean(data, na.rm = TRUE))
}