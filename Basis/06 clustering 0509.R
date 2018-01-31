#clustering
#-AHC
#-k-means
#DBSCAN

#不同城市的犯罪
head(USArrests)

# Hierachical
#距離矩陣
d <- dist(USArrests) ;d
model.h1 <- hclust( d, method = "single" )
plclust( model.h1 )
#把字移到最下面
plclust( model.h1, hang=-1)

#切割3群
rect.hclust( model.h1, k=3)
cutree( model.h1, k=3)

model.h2 <- hclust( d, method = "complete" )
plclust( model.h2, hang=-1)
rect.hclust( model.h2, k=3)
cutree( model.h2, k=3)

# k-mean

model.kmeans <- kmeans( USArrests, centers=3) ;model.kmeans
model.kmeans$cluster


# k-means part2

x <- c( rnorm(50, 10, 7), rnorm(50, 50, 7), rnorm(50, 50, 7))
y <- c( rnorm(50, 10, 7), rnorm(50, 50, 7), rnorm(50, 10, 7))
plot(x,y)
dd <- data.frame(x,y) ;dd

model.dd <- kmeans( dd, centers = 2) ;model.dd
plot( dd, col = model.dd$cluster )

model.dd2 <- kmeans( dd, centers = 3) ;model.dd2
plot( dd, col = model.dd2$cluster )

model.dd3 <- kmeans( dd, centers = 4) ;model.dd3
plot( dd, col = model.dd3$cluster, pch = 16 )

#當資料沒有明顯群聚關係時，給資料的起始點，資料會分成不同群
model.dd4 <- kmeans( dd, centers = 4, nstart = 1 ) ;model.dd4
plot( dd, col = model.dd4$cluster, pch = 16 )

#當資料有明顯群聚關係時，起始點怎麼設，群都不太會變
model.dd2 <- kmeans( dd, centers = 3, nstart=1) ;model.dd2
plot( dd, col = model.dd2$cluster )



#DBSCAN

install.packages("dbscan")
library(dbscan)

model.db1 <- dbscan( dd, eps=1 ,minPts=3 );model.db1
plot( dd, col= model.db1$cluster +1 , pch=16 )

model.db12 <- dbscan( dd, eps=5 ,minPts=3 );model.db2
plot( dd, col= model.db2$cluster +1 , pch=16 )

model.db3 <- dbscan( dd, eps=4 ,minPts=10 );model.db3
plot( dd, col= model.db3$cluster +1 , pch=16 )


#DBSCAN part2

theta1 <- runif(500, 0, 2 * pi )
theta2 <- runif(100, 0, 2 * pi )
x <- c( 50* cos(theta1) + rnorm(500,0,2), 5 *cos(theta2)+ rnorm(100,0,2))
y <- c( 50* sin(theta1) + rnorm(500,0,2), 5 *sin(theta2)+ rnorm(100,0,2))
plot(x,y)

dd <- data.frame(x,y) ;dd

model.dd <- kmeans( dd, centers = 2) ;model.dd
plot( dd, col = model.dd$cluster )

model.db <- dbscan( dd, eps=5 ,minPts=3 );model.db
plot( dd, col= model.db$cluster +1 , pch=16 )
