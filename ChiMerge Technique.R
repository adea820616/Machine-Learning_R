
#order排序

data<-data.frame( d = c(2.5, 3.4, 4.8, 5.6, 6.3, 7.2, 8.1),
                  k= c(0,1,1,0,1,1,0)) ;data



group1 <- data.frame( g=data$d[1] , c=data$k[1]) ;group1



for(j in 2:nrow(data)){
  
  A11=0
  A12=0
  A21=0
  A22=0
  R1=0
  R2=0
  c1=0
  c2=0
  N=0
  
for(i in 1:nrow(group1)){
  
  if(group1$c[i] == 0){
    A11=A11+1
  }else(A12=A12+1)
  
  
}

if( data$k[j] ==0){
  A21=A21+1
}else(A22=A22+1)
  
  

R1=A11+A12
R2=A21+A22
c1=A11+A21
c2=A12+A22
N=R1+R2


E11=(R1*c1)/N
E12=(R1*c2)/N
E21=(R2*c1)/N
E22=(R2*c2)/N

x2=((A11-E11)^2/E11)+((A12-E12)^2/E12)+((A21-E21)^2/E21)+((A22-E22)^2/E22)

print(x2)


if( x2 < 2.706){
  group1[nrow(group1)+1 , 1] <- data$d[j]
  group1[nrow(group1) , 2] <- data$k[j]
  
}

}

group1



