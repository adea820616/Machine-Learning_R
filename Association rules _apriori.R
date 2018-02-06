data<-read.csv(file ="data_0511.csv", header=TRUE);data

count <- summary(data) ;count
unique(count)

class = c("A","B","C","D","E")

for(i in 1:length( class ) ){
  num[i] <-  length( data[ data == class[i] ] ) 
}
num

itemset_1 =  data.frame(class=class,count=num) ; itemset_1
#刪掉<1
itemset_1 = itemset_1[ itemset_1[,2] >= 2  , 1:2] ;itemset_1

#itemset_2
itemset_2 = t(combn(itemset_1[,1] , 2)) ;itemset_2 


x = matrix(nrow=6,ncol=1)
for( i in 1: length(data[,1]) ){
  for( j in 1 : length(itemset_2[,1]) ){
    
    x[j]=min(as.numeric ( table( data[i,] == as.character( itemset_2[j,1] ) )[2] ),
             as.numeric ( table( data[i,] == as.character( itemset_2[j,2] ) )[2] ))
  }
}




