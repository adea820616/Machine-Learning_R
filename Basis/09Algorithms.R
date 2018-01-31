
myknn( train.data[,1:4], test.data[30,1:4], train.data[,5], k = 3 )

# train -> data frame
# test -> vector
# category -> vector
# k

myknn <- function( train, test, category, k ){
  # 合併 train 和 test
  dt <- rbind( train, test )
  # 計算 test 和 train 的距離
  dd <- as.matrix( dist(dt) )[nrow(dt),]
  # 取第k近的距離
  kv <- sort(dd)[k+1]
  # 取得k個最近的類別分配
  tc <- table( na.omit( category[ which( dd <= kv) ] ) )
  # 取得最大類別數的名稱
  names( which( tc == max(tc) ) )
}


#KN
library(class)


  #sample( train + test 8:2 )
  #1:150 抽 150*0.8的data(抽數字)
  s.no <- sample( nrow(iris), nrow(iris)*0.8 ) ;s.no
  train.data <- iris[ s.no , ] ;train.data
  test.data <- iris[-s.no , ] ;test.data
  nrow(train.data)
  nrow(test.data)
  


