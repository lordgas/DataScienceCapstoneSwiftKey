library("tm")

text<-readRDS("en_US.twitter.txt_sample.RDS")
my.docs<-VectorSource(text)
my.corpus<-Corpus(my.docs)
my.corpus <- tm_map(my.corpus, removePunctuation)
my.corpus <- tm_map(my.corpus, removeNumbers)
term.doc.matrix.stm <- TermDocumentMatrix(my.corpus)
temp<-inspect(term.doc.matrix.stm)
FreqMat <- data.frame(ST = rownames(term.doc.matrix.stm), Freq = rowSums(term.doc.matrix.stm))

