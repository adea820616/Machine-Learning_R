#Fibonacci numbers
#假定一對兔子在它們出生整整兩個月以後可以生一對小兔子，
#其後每隔一個月又可以再生一對小兔子。假定現在在一個籠子裡有一對剛生下來的小兔子，
#請問一年以後籠子裏應該有幾對兔子？

month <- 12
count <- month
count[1] <- 1
count[2] <- 1

for( n in 3:month ){
count[n] <- count[n-1] + count[n-2]
}
