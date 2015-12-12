require(R.utils)

require(stringi)
require(tm)
require(RWeka)
require(magrittr)

require(dplyr)
setwd("~/Documents/Oscar//CourseraCapstone/en_US/")



# includes in the output file a sample of the lines in the input file given the inclusion  probability 
sampleFile<-function(filename,  probability, outfile)
{
  con <- file(filename, "r")
  lines <-readLines(con)
  close(con) ## It's important to close the connection when you are done
  
  numlines<-length(lines)
   
  sample<-sample(x = lines,replace = FALSE, size= floor(numlines*.005))
  
  saveRDS(sample, file = paste(filename,"sample.RDS", sep="_"))
}

sampleFile(filename = "en_US.blogs.txt")
sampleFile(filename = "en_US.news.txt")
sampleFile(filename = "en_US.twitter.txt")



