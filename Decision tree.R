data<-read.csv("data_0324.csv") ;data

c <- summary(as.factor(data$class));c  #算有幾個1 and 2
A1 <- summary(as.factor(data$Attribute.3))
level<-factor(data$Attribute.3) ;level

#function Info-------------------------------------
f <- function( freq , t ){
  I=0
  
    I_value = (  (freq / t) * log(  ( freq / t)   ,2)    )
    I = I_value + I
    return(I)

}


#-------------------------------------

#算Info
t1_value=0
t1=0

for(i in 1:length(c)){
  t1_value = f(c[i], sum(c))
  t1 = t1 + t1_value
}

Info = (-1)*t1 ; Info
#---------------------------------- 



count=1
Info1_value=0
Info1=0

A1<-as.numeric(A1)
for( i in 1: length(A1)){
  C1_1 =0
  C2_2 =0
  

  for( j in 1:A1[i]){
    if( data[count,4] == level[1] ){
      C1_1 = C1_1 + 1
    }else{ C2_2 = C2_2 + 1 }
  count=count+1
  }

  


  #如果值=0就取代掉
    if(C1_1 == 0 ){
      C1_1 <- A1[i]
    }else if(C2_2 == 0){
      C2_2 <- A1[i]
    }

  
  #算Info1
  Info1_value = ( A1[i] / sum(A1) ) * ( f(C1_1 , A1[i]) + f(C2_2 , A1[i]) )
  Info1 = Info1 + Info1_value


}  

Info1 = Info1 *(-1)
Info1

gain = Info - Info1 
gain





