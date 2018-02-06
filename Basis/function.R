#0328 function


f<-function(x){
  return(x^2+1) #沒有return會把最後一行回傳
}

f(1)
f(2)

#--------------------------------------
#Max

Max<-function(v){
  M <- v[1]
  for(i in 1:length(v)){
    print(v[i])
    if(v[i] > M){
      M<-v[i]
    }
  }
  return(M)
}

Max(c(12,32,22,55))

#--------------------------------------
#relief


Relief <- function(f,class){
  
  w=0
  for( i in 1:length(f)){
    
    m=min((f[class != class[i]]-f[i])^2)
    
    h = sort((f[class == class[i]]-f[i])^2 )[2]
    
    h
    m
    w = w - h + m 
  }
  w/ length(f)
}


ff <- c(3,2,6,5)
cc <- c("C1","C1","C2","C2")
Relief(ff,cc)

#--------------------------------------------------

df<-read.csv("0328data.csv")
df

Relief(df$I1,df$O)
Relief(df$I2,df$O)
Relief(df$I3,df$O)

#-----------------------------------------------------
#While

i=1
while(i<10){
  print(i)
  i=i+1
}

#-------------------------------------------------------




