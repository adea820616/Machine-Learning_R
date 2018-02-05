#linear regression

x<-round( rnorm(1:100, 30, 5), 0)
y<-x + round(rnorm(100, 0, 5) ,0)
plot( x, y)
cor(x,y)

m1 <- lm( y ~ x )
summary(m1)

#給截距、斜率的直線
abline( m1, col="blue")

#-------------------------------

x1<- 2 * x + round( rnorm(100, 0, 5) ,0 )
x2<- x + round(rnorm(100, 0, 15) ,0)
plot(x1,y)
plot(x2,y)

m2<- lm( y ~ x1 +x2)
summary(m2)
cor(x1,x2)

#-------m連續-------------------

m3 <- lm(y~x1*x2)
summary(m3)
#到底誰是因誰是果，由自己的研究論文去看，統計只是驗證
#看x1還是x2對y顯著相關，x1->y(x2是中介干擾) or x2->y(x1是中介干擾)

ny<- y - mean(y)
nx1 <- x1- mean(x1)
nx2<- x2 - mean(x2)

m4 <- lm( ny ~ nx1 * nx2)
summary(m4)

m5<- lm(ny ~ nx1 + nx1:nx2)
summary(m5)


# m類別----------------------------------

plot(x,y)
m <- ifelse( x >= 30 ,1 , 0)
plot(x, y, col=( m+1 ) )

m6 <- lm(y ~ x * m)
summary(m6)

#斜率一樣，往上平移
ny <- x
y[ m==1 ] = ny[ m==1] +20
plot(x , ny , col= m + 1 )

m7<- lm(ny~ x * m)
summary(m7)

m7$coefficients
a1 <- m7$coefficients[1]
a2 <- m7$coefficients[1] + m7$coefficients[3]
b1 <- m7$coefficients[2]
b2 <- m7$coefficients[2] + m7$coefficients[4]

abline(a1,b1)
abline(a2,b2,col="red")


#ANOVA

y <- round(c( rnorm(50, 30, 10), rnorm(50, 70, 5) , rnorm(50,120,5)),0) ;y
f <- as.factor( rep( c("A","B","C") , each=50 ));f

m8 <- aov( y ~ f )
summary(m8)

plot(density(y[1:50], xlim=c(0,150), ylim=c(0,0.1)   ))
lines(density(y[51,100]),col="blue")
lines(density(y[101:150]),col="red")

#2way ANOVA

f1 <- as.factor(rep(c("A","B","C") ,each=50 ))
f2 <- as.factor(rep(c("X","Y","Z"), 50))

m9 <- aov(y~ f1+f2)
summary(m9)

m10 <- aov( y ~ f1*f2)
summary(m10)


#卡方

A <- c(T=128, F=7)
B <- c(T=66, F=30)
C <- c(T=42, F=55)
M <- rbind(A,B,C)
M
chisq.test(M)

#logistic regression

x <- round( rnorm(30 , 10 ,20) ,0) ;x
y <- as.numeric( x + rnorm(30, 0, 20) > 10 ) ;y #轉0 or 1
plot(x,y)
#調整4可以調線
#curve( 1/ ( 1+ exp(-0.1 *x +10 )) , -100, 100 )
#畫圖
m11 <- glm( y ~ x , family = binomial(link = "logit") )
summary(m11)

curve( 1/ ( 1 + exp( -( m11$coefficients[2]) * x + m11$coefficients[1]))
       , -50,100 ,add=TRUE , col="red" )


predict( m11, data.frame( x=seq(-20,50 , by=10) )  ,type="response")
