#!/bin/bash
make_test_training.sh en_US.news.txt
make_test_training.sh en_US.blogs.txt
make_test_training.sh en_US.twitter.txt

cat *_test.txt > test_set.txt
cat *_train.txt > train_set.txt

rm *_test.txt
rm *_train.txt

