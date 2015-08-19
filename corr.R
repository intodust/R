corr <- function(directory, threshold = 0) {
     thres<- complete("specdata")

      d <- subset(thres, nobs> threshold, id)
     d <- d[,1]
     w<- c()
     for( val in d){
           filenames <- sprintf("%03d.csv", val)
           filenames <- paste(directory, filenames, sep="/")
           read<- read.csv(filenames, header = TRUE)
           w<- c(w,cor(read$sulfate, read$nitrate, use = "complete.obs"))
     }
     w
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'threshold' is a numeric vector of length 1 indicating the
      ## number of completely observed observations (on all
      ## variables) required to compute the correlation between
      ## nitrate and sulfate; the default is 0
      
      ## Return a numeric vector of correlations
      ## NOTE: Do not round the result!
}