#Classification

install.packages("rpart")
library(rpart)
library(rpart.plot)

head(iris)
names(iris)
summary(iris)

plot(iris[,1:4] , col=iris$Species )

accu<- function( m ){

#sample( train + test 8:2 )
#1:150 抽 150*0.8的data(抽數字)
s.no <- sample( nrow(iris), nrow(iris)*0.8 ) ;s.no
train.data <- iris[ s.no , ] ;train.data
test.data <- iris[-s.no , ] ;test.data
nrow(train.data)
nrow(test.data)

#Decision Tree (CART)

#rpart裡的parm or control可以控制如何切割樹
model.tree <- rpart( Species ~., data = train.data )
rpart.plot(model.tree)

}

#預測成機率值 + type="class"
pre.tree <- predict( model.tree, test.data[ ,-5], type="class") ;pre.tree
table( test.data$Species, pre.tree)
#算準確度
#diag - 矩陣對角線
#m<-table( test.data$Species, pre.tree)
#sum( diag(m) ) / sum(m)
  


accu(table( test.data$Species, pre.tree))

#Bayesuan
library("e1071")
#e1071有很多machining learning的方法

model.baye <- naiveBayes( Species~., data=train.data ) ;model.bay

pre.baye <- predict( model.baye, test.data[,-5] ) ;pre.baye
m1 <- accu( table(test.data, pre.baye) )
sum( diag(m1) ) / sum(m1)


#SVM
#e1071
#可以自己調整超平面
model.svm <- svm( Species~., data=train.data, kernel="sigmoid" ) ;model.svm
summary(model.svm)

pre.svm <- predict( model.svm, test.data[,-5] );pre.svm
m2<-accu(table(test.data, pre.svm))
sum( diag(m2) ) / sum(m2)

#ANN
library(nnet)
model.ann <- nnet( Species~., data=train.data, size=2) ;model.ann
summary(model.ann)

pre.ann <- predict( model.ann, test.data[,-5],type="class" );pre.ann
m3<-accu(table(test.data, pre.ann));m3
sum( diag(m3) ) / sum(m3)

install.packages("NeuralNetTools")
library(NeuralNetTools)

plotnet(model.ann)

#ANN2
library(neuralnet)


#KN
library(class)

#knn不用train model
pre.knn <- knn(train.data[,1:4], test.data[,1:4], train.data[,5], k=3 );pre.knn
accu( table( test.data$Species, pre.knn ))
m4<-accu(table(test.data, pre.knn));m4
sum( diag(m4) ) / sum(m4)


#LDA
library(MASS)

model.lda <- lda( Species~., data=train.data ) ;model.lda

pre.lda <- predict( model.lda, test.data[,-5] )$class ;pre.lda
m5 <- accu( table(test.data, pre.lda) )
sum( diag(m5) ) / sum(m5)


