data <-read.csv(file = "practice_0323.csv", header=TRUE) ;Bayesian


#適用於兩類
length(data$C)

#算有幾個欄位 A1 A2 A3
col_num <- ncol(data)-1 ;col_num

#類別(1 and 2)
cat<-unique(data$C) ;cat

#input
a1=1
a2=2
a3=2


#P(c=1)
#P(c=2)
num1 = 0
num2 = 0
for(i in 1:length(data$C)){
  if (data$C[i] == cat[1]){
    num1=num1+1
  }else{
    num2=num2+1
  }
}
num1 #4
num2 #3

#P(C1)=4/7
#P(C2)=3/7
pc1<-num1/length(data$C) ; pc1
pc2<-num2/length(data$C) ; pc2


#-----------------------------------------------------------





#P(A1=a1|C=1)
#a1=1

f <- function(x){
  
  sum1=0
  sum2=0
  sum3=0
  
  for (i in 1:length(data$C)){
    
    if(data$C[i] == cat[x] & data[i,1] == a1){ 
      sum1=sum1+1 
    }
    
    if(data$C[i] == cat[x] & data[i,2] == a2){
      sum2=sum2+1
    }
    
    if(data$C[i] == cat[x] & data[i,3] == a3){
      sum3=sum3+1
    } 
    
    
    
    
    pa1_c1 = sum1/num1 ;pa1_c1
    pa2_c1 = sum2/num1 ;pa2_c1
    pac3_c1 = sum3/num1 ;pac3_c1
    
    
    final_c1= pc1 * pa1_c1 * pa2_c1 * pac3_c1 
    return(final_c1)
    
  }
  
  
  f(1)
  f(2)
  
  
  
  #final_c2= pc2*pa1_c2*pa2_c2*pac3_c2 
  #final_c2
  
