#--------------------
x <- 10
if( x %% 2 == 0) {
  print("even")
}else{
  print("odd")
}

#-------------------
y <- seq(1,40, by=3) ; y
ifelse( y %/% 2==0 , "even", "odd")

age <- c( 25, 51, 33, 17, 12, 5)
ifelse( age <= 20 , "young" ,ifelse( age <= 40, "strong" , "old"))

#-----------------------------------------------------------------

switch( 3,"1","2","3")
switch( age[1] %/% 20 +1 ,"young","strong","old")

#--------------------------------------------------

for( i in 1:10){
  print(i)
}

for( i in seq(1,30,by=3)){
  print(i)
}

age <- c( 25, 51, 33, 17, 12, 5) ;age
for ( i in age){
  print(switch( i %/% 20 +1 ,"young","strong","old"))
}


#----------------------------------------------------------
#1+2+.....+99+100
s=0
for(i in 1:100){
  s=s+i
}
print(s)

#sum()
sum(1:100)

#-----------------------------
for(i in 1:10){
  if( i %% 2 == 0){
    print(paste("jump",i,"right head"))
  }else(print(paste("jump",i,"left head")))
}

#------------------------------------------------
#break 中斷程式
for( i in 1:10 ){
  print(i)
  if( i == 3 ){
    break
  }
}

for( i in 1:10 ){
  
  if( i == 3 ){
    break
  }
  print(i)
}

# next跳過
for( i in 1:10 ){
  
  if( i == 3 ){
    next
  }
  print(i)
}


x<- c(10,20,-30,50,-20,20,23,-43)
s=0
for( i in x){
  if(i<0){
    next
  }
  s=s+i
}
print(s)



