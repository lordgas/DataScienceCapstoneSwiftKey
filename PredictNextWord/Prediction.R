require(data.table)

bi<-readRDS(file="data/bi.rds")
tri<-readRDS(file="data/tri.rds")
four<-readRDS(file="data/four.rds")

#names(tri)<-c("count", "first", "second", "predicted")
#names(bi)<-c("count", "first", "predicted")

predictNext<-function(sentence)
{
  tokens <- strsplit(sentence, " ")[[1]]
  if (length(tokens)>=3)
    fourgram(tail(tokens,3)[1],tail(tokens,2)[1],tail(tokens,1))
  else  if (length(tokens)==2)
    trigram(tail(tokens,2)[1],tail(tokens,1))
  else  if (length(tokens)==1)
    bigram(tail(tokens,1))
  else unigram()
  
  }

fourgram<-function(first, second, third)
{
  predicted<-which(four$first==first& four$second==second& four$third==third)[1]
  if (!is.na(predicted))
  {
    four[predicted]$predicted
  } 
  else
  {
    trigram(second, third)
  } 
}

trigram<-function(first, second)
{
  predicted<-which(tri$first==first& tri$second==second)[1]
  if (!is.na(predicted))
  {
    tri[predicted]$predicted
  } 
  else
  {
    bigram(second)
  } 
}
  
bigram<-function(first)
{
  predicted<-which(bi$first==first)[1]
  if (!is.na(predicted))
  {
    bi[predicted]$predicted
  } 
  else
  {
    unigram()
  } 
}

unigram<-function(first)
{
  "the"
}
  
  
