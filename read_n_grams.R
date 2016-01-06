rows_to_keep = 500000
bi<-fread("~/Documents/Oscar/CourseraCapstone/en_US/train_set_bigrams_count.txt",nrows = rows_to_keep)
tri<-fread("~/Documents/Oscar/CourseraCapstone/en_US/train_set_trigrams_count.txt",nrows = rows_to_keep)

four<-fread("~/Documents/Oscar/CourseraCapstone/en_US/train_set_fourgrams_count.txt",nrows = rows_to_keep)

names(four)<-c("count", "first", "second","third", "predicted")
names(tri)<-c("count", "first", "second", "predicted")
names(bi)<-c("count", "first", "predicted")
saveRDS(four, file = "~/Documents/Oscar/CourseraCapstone/PredictNextWord/data/four.rds")
saveRDS(tri, file = "~/Documents/Oscar/CourseraCapstone/PredictNextWord/data/tri.rds")
saveRDS(bi, file = "~/Documents/Oscar/CourseraCapstone/PredictNextWord/data/bi.rds")