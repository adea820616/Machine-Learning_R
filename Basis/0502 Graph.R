#R Graphics
# -base
#   -high level
#   -low level
# -lattice
# -ggplot2****

#base
head(mtcars)
plot( mtcars$mpg, mtcars$wt)       #highlevel 直接創一個繪圖區
mm <- lm( mtcars$wt ~ mtcars$mpg)
abline(mm)                         #low level 在現有的繪圖區畫圖

plot(mtcars$mpg , mtcars$wt, main= "散布圖")

# histogram (include title)
hist( mtcars$mpg, 
      main = "直方圖",
      xlab = "X",
      ylab = "Y",
      probability=TRUE) 
line()


#Blox-plot
boxplot( mtcars$mpg )
boxplot( mpg ~ vs , data=mtcars ,xlab = "vs" ,ylab = "mpg") #根據不同mtcars$vs 畫 mpg


#plot+ points -> vs=0的點畫red
plot( mtcars$mpg, mtcars$wt ,xlab="mpg", ylab="wt")

c0 <- mtcars[mtcars$vs == 0,] ;c0
c1 <- mtcars[mtcars$vs == 1,] ;c1

points(c0$mpg, c0$wt , col="red" , pch=16)
points(c1$mpg, c1$wt , col="blue" , pch=16)

#lwd線變粗
abline( lm( wt~mpg, data=c0), col="red", lwd=2 )
abline( lm( wt~mpg, data=c1), col="blue", lwd=2 )

#圖示
legend("topright", pch=16, col=c("red","blue"), legend=c("0","1") )


#barplot
#給整理好的資料table()
barplot( table( mtcars$gear ), col = c("yellow", "green", "red" ) )

pie( table( mtcars$gear ) )

#set plot block繪圖區設置
#用mfrow 設定
par( mfrow = c(1,2) )
plot( c0$mpg, c0$wt, main="0")
plot( c1$mpg, c1$wt, main="1")


#lattice
library(lattice)

#公式表示
#y~x | f :不同f下,x對y影響

histogram( x= ~ mpg, data = mtcars )
histogram( x= ~ mpg| vs, data = mtcars ) #在不同vs的情況下,mpg的分布
histogram( x= ~ mpg| gear, data = mtcars , layout= c(3,1)) #在不同gear的情況下,mpg的分布
unique(mtcars$gear)

#box-plot
bwplot(x = ~mpg, data=mtcars)
bwplot(x = ~mpg |gear, data=mtcars, layout = c(1,3)) #layout三列一欄

#Density plot
densityplot( ~mpg, data = mtcars)
densityplot( ~mpg | gear, data=mtcars)


#xyplot
xyplot( wt~mpg, data=mtcars)
xyplot( wt~mpg, data=mtcars, group = vs) #vs= 0,1 幫vs分群



#lattice - panel function 圖上面在畫一個圖要用panel


#ggplot2
install.packages("ggplot2")
library(ggplot2)



# Use data from data.frame
head(mtcars)
qplot(mpg, wt, data = mtcars)
qplot(mpg, wt, data = mtcars, colour = cyl)
qplot(mpg, wt, data = mtcars, size = cyl)
qplot(mpg, wt, data = mtcars, facets = vs ~ am)

# https://blog.gtwang.org/r/ggplot2-tutorial-basic-concept-and-qplot/

#ggplot2 grammar
#資料來源（data）：指定原始資料來源的 data frame
head(iris)
ggplot( iris )
#美學對應（aesthetic）：指定原始資料與圖形之間的對應關係
#                       哪一個變數要當作 x 座標變數，而哪一個要當作 y 座標變數，還有資料繪圖時的樣式等

ggplot(iris, aes(x= Sepal.Length, y= Sepal.Width ))

#幾何圖案（geometry）：要用什麼幾何圖形繪製資料，例如點、線條、多邊形等
ggplot(iris, aes(x= Sepal.Length, y= Sepal.Width )) + geom_point( color="red", alpha=0.5)

g=ggplot(iris, aes(x= Sepal.Length)) #histogram -> only one variable
g + geom_histogram( bins=10, fill="skyblue", col="black")
g + geom_density()

### g = g + geom_point() ;g

#繪圖面（facet）：指定如何將資料分散在多張子圖形中繪製，以利互相比較
ggplot(iris, aes(x= Sepal.Length, y= Sepal.Width )) + 
  geom_point()+
  facet_grid( Species~. )

#統計轉換（statistical transformation）：指定如何以將資料轉換為各種統計量
ggplot(iris, aes(x= Sepal.Length, y= Sepal.Width )) + 
  geom_point()+
  facet_grid( Species~. )+
  stat_smooth( method ="lm", col="red", fullrange=TRUE)

g + geom_histogram( bins=10, fill="skyblue", col="black", aes( y = ..density.. ))+
  facet_grid(Species~.)+
  stat_density(alpha=0.5)

#座標系統（coordinate system）：指定繪圖時所使用的座標系統

ggplot(iris, aes(x= Sepal.Length, y= Sepal.Width )) + 
  geom_point()+
  facet_grid( Species~. )+
  stat_smooth( method ="lm", col="red")+
  scale_x_continuous("長度", limits = c(1,10))+
  scale_y_continuous("寬度", limits = c(-2,6))

#主題（theme）：控制資料以外的繪圖組件，例如座標軸、說明文字等
#用預設好的theme
ggplot(iris, aes(x= Sepal.Length, y= Sepal.Width )) + 
  geom_point()+
  facet_grid( Species~. )+
  stat_smooth( method ="lm", col="red", fullrange=TRUE)+
  theme_dark()

#ggplot2 theme package-------------------------------------
install.packages("ggthemes")
library(ggthemes)

ggplot(iris, aes(x= Sepal.Length, y= Sepal.Width )) + 
  geom_point()+
  facet_grid( Species~. )+
  stat_smooth( method ="lm", col="red", fullrange=TRUE)+
  theme_linedraw()

#也可以自己設定theme內的內容--------------------------------
ggplot(iris, aes(x= Sepal.Length, y= Sepal.Width )) + 
  geom_point()+
  facet_grid( Species~. )+
  stat_smooth( method ="lm", col="red", fullrange=TRUE)+
  theme()


#Example---------------------------------------------------
library(MASS)
head(mammals)

#有一兩個outlier
ggplot( mammals, aes( x = body, y = brain))+
  geom_point()

#座標取log
ggplot( mammals, aes( x = body, y = brain))+
  geom_point()+
  scale_x_log10()+
  scale_y_log10()

