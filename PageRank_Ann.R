data <- read.csv("Pagerank_HW.csv",head = T); data
data = as.matrix(data)

#機率矩陣
for( i in 1 : length(data[,1]) ){
  data[,i] = data[,i] / sum( data[,i] )
}
#Pr 矩陣
Pr = matrix(1 / length(data[,1]),nrow=6,ncol=1 ,byrow = F) ;Pr

d=0.15
for( i in 1:100){
  Pr = (1-d)/length(data[,1]) + d * ( data %*% Pr ) 
  print(i)
  print(Pr) 　
}
Pr

