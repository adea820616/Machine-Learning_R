data<-read.csv(file ="agglomerative_data.csv", header=TRUE)
data<-data[,-1]
head(data)


#SMC coefficient
f<-function( x,y ){
  SMC = as.numeric( table( data[x,] == data[y,] )[2] /  length( data[1,])  )  
  if(is.na(SMC)){
    SMC=0
  }
  return(SMC)
}

#put in the matrix
df_SMC <- matrix(nrow=6,ncol = 6)
for(i in 1 : (length(data[,1])) ){
  for(j in i : (length(data[,1]) ) ){
    df_SMC[ i, j ] = f( i, j )
  }
}

#Rao coefficient
#********************
df_Rao <- matrix(nrow=6,ncol = 6)
for ( i in 1: length( data[,1] )){
  for( j in 1:length( data[,1] )){
    rao = length( data[i,][  data[i,][data[j,]==1]  ] ) / length( data[1,] )
    df_Rao[i,j] = rao
  }
}




df_SMC=1-df_SMC ;df_SMC
df_Rao=1-df_Rao ;df_Rao

df_SMC = dist(df_SMC) ;df_SMC
df_Rao = dist(df_Rao) ;df_Rao

# clust_SMC = hclust( dist(df_SMC) ,  method = "complete" )
# clust_Rao = hclust( dist(df_Rao) , method="single" )
# 
# plot(clust_SMC)
# plot(clust_Rao)







#Rao's coefficient
#g <- function( w,z ){
#  a= which(data[w,] == 1)
#  b= which(data[z,] == 1)

#  count=0
#  for ( i in 1: length(a)){
#    for( j in 1:length(b)){
#      if( a[i] == b[j]){
#        count=count+1
#      }
#    }
#  }
#  return(count/(length( data[1,]) -1))
#}