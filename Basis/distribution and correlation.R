#分配
rnorm()
dnorm()
pnorm()
qnorm()

rbinom()
dbinom()
pbinom()
qbinom()

rchisq()
rhyper()
rbeta()

rnorm(10,12,2) #產生10個符合平均數為12 標準差2 的常態分配亂數

rbinom(10,12,0.3) #二項分配 (產生10個亂數  n=12 p=0.3)

#搭配 常態圖看
dnorm(0,0,1) # d=p(x) (y軸)
pnorm(0,0,1) #累積機率
qnorm(0.5,0,1) #q位置 (累積機率到0.5的q)

1/((2*(0.31415926))^0.5)

#--------------------------了解分布

X<-round(rnorm(1000,50,5),0);X
x<- sample(X,100) #從X取100個數，抽出不放回
mean(x)
sd(x)
var(x)
min(x)
max(x)
median(x)
summary(x)
quantile(x,0.25)
quantile(x,seq(0.1 , 1 , 0.1)) #seq從0.1開始到1 每次加0.1

hist(x)
hist(x ,probability = TRUE)
lines(density(x),col="blue") #desity 機率密度

#CLT 中央極限定理----------------------
#population
X<-c(round(rnorm(10000,50,5),0) , round(rnorm(10000,20,10),0 )) #雙峰
hist(X , probability = TRUE)
lines(density(X) , col="blue")

#樣本分配

n<-100
x<-sample(x,n) ;x
hist(x , probability=TRUE)
lines(density(x) , col="red")

#抽樣分配
#把樣本分配抽很多次

n<-100
k<-200
m<-numeric(0) #0組向量

for (i in 1:k){
  x<-sample(X,n)
  #把k組平均數放入m裡，m裡含有
  m<-c(m,mean(x))
}

hist(m , probability = TRUE)
lines(density(m),col="green")

#把值放入向量裡
m<-numeric(0);m  #空向量
m<-c(m,1) ; m 
m<-c(m,2) ; m
m<-10 ; m





#相關--------------------------------------
#內建data
cars
#看相關性
cor(cars)

#相關係數
cor(cars$speed , cars$dist)
#共變異
cov(cars$speed , cars$dist)

cov(cars$speed , cars$dist) / sqrt(var(cars$speed) * var(cars$dist))
