#relief
#f <- c(2.7 , 3.1 , 6.6 , 4.5 , 5.3 , 5 )
#f <- c(3.4 ,  6.2 , 3.1 , 2.8 , 5.8 , 4.1)
f <- c(1, 2, 1, 1, 2, 2)

class <- c("A","A","A","B","B","B")
w=0
for( i in 1:length(f)){
  
  m=min((f[class != class[i]]-f[i])^2)
  
  h = sort((f[class == class[i]]-f[i])^2 )[2]
  
  h
  m
  w = w - h + m 
}
w
w/ length(f) 
