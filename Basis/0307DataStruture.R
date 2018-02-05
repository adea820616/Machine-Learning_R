#Data Type
11 %/% 4 #取商數
11 %% 4 #餘數
exp(1)
log(1) #預設e為底 log(x,base=e(1))
log(2,2) #log(x,base=底)
log(4,2)
sin(pi/6)

sqrt(-2+i)
0/0
2/0


x<-1
is.numeric(x)
is.integer(x)

assign("j",4)
j
rm(j) #remove
j


v0<-numeric(10)
v0
v1<-character(10)
v1
v2<-logical(10)
v2

x<-c(1.2:7.7)
x

#等差數列
seq(0,1,length.out=11) 
seq(1,9,by=2) #d=2
#有時不知道資料要分成幾份時
seq(0,100,along.with=c(1,1,1,1,))  #把0-100切成右邊一樣(4份)

#重複函數
rep(2,times=10)
rep(1:4,times=3)
rep(1:4,length=10) #1 2 3 4 1 2 3 4 1 2
rep(1:4,each=3) #1 1 1 2 2 2 3 3 3 4 4 4
rep(1:4,c(1,3,5,7)) #1 2 2 2 3 3 3 3 3 4 4 4 4 4 4 4

rep(seq(1,9,by=2),each=3)


#logical
x<-c(1,3,5,7,9)
x>5
all(x>5) #all true >> true
any(x>5) #any true >> true

which(x>5) #判斷結果為true的位置


#substr()提取部份字串
str <- c( "This", "is", "a", "pencil")
nchar("apple") #算字串長度
nchar(str)

substr("abcde",2,5)
substr(str,2,5)
#substring(data,start,end)
substring( str, 1:4, 3:6) #substring(str,(1,2,3,4),(3,4,5,6))
substring( "abcde", 1:3, 3:5)


#向量的取值
x <- c( 12, 41, 33, 7, 24, 51)
x[3]
x[1:3]
x[c(1,3,5)]
x[c(1,3,1)]
x[-3]
x[-(1:3)]
x[-c(1,3,5)]



x<-c(12, 41, 33, 7, 24, 51, NA, NA)
x[x<25]

x[1]=13
x

mean(x)

#插補 NA
y = mean(x[!is.na(x)])
which(is.na(x))
x[is.na(x)] <- y
x



#HW
#找出小於0的的元素
#找出小於0的的位置
#將小於0的位置取代成0
x <- round( rnorm(20) * 100 , 0 );x
x[x<0]
which(x>0)
which(x==12)
x[x<0] = 0 #等於x[which(x<0)]=0

#
age = c( John = 12, Steven = 17, George = 20 )
age["John"]


grade = c( 70, 90, 100 )
names(grade) <- c( "Chinese", "English", "Big Data")
grade


#data frame
df <- data.frame( Name = c( "John", "Allice", "James", "Leo"),
                  Sex = as.factor( c( "M", "F", "M", "F")),
                  Age = c( 17, 16, 18, 15),
                  Height = c( 165, 158, 171, 166)); df

df[1,1]
df[2,1]
df[-2,1]
df[,1]
df$Name
df$Name[1]

df[c(1,3),]
df$Age >= 18
df[df$Age>=18,3]=20
df

#factor
data<- c("A","AB","B","O")
fdata<- factor(data)
fdata
as.numeric(fdata)


e <- factor( x = c(  "College", "Masters","High School" ),
             levels = c( "High School", "College", "Masters" ),
             ordered = T)
e

#matrix
md <- matrix (1:20 , nrow=4) ; md
md <- matrix (1:20 , nrow=4 , byrow = TRUE) ; md
md <- matrix (1:20 , ncol=4) ; md

ma <- matrix (c(12,32,53,24,62,21),
              nrow=2 , ncol=3, byrow=TRUE,
              dimnames = list( c("r1","r2"),c("c1","c2","c3")))
ma

#combind row and column
x1<-1:3
x2<-4:6
mr<-rbind(x1,x2) ; mr
mc<-cbind(x1,x2) ; mc

#matrix維度
dim(ma)
nrow(ma)
ncol(ma)
dimnames(ma)
rownames(ma)
colnames(ma)

rownames(ma) <- c("r3" , "r4")
rownames(ma)

ma
ma[1,2]
ma[1,1:2]
ma[-1,-2]

A <- matrix(1:9, nrow=3);A
B <- matrix(-3:5, nrow=3);B
A+B
A*B
A%*%B


t(A)  #矩陣轉置
det(A) #行列式運算
diag(A) #找主對角線
lower.tri(A)  #下三角矩陣位置
upper.tri(A)  #上三角矩陣位置
svd(A) #對角矩陣


#Array
matrix(0, nrow=3 ,ncol=2)


#3X2陣列 四個
AA <- array(1:24, c(3,2,4)) ; AA
AA[1,2,3]
MA <- matrix(AA[1,,] ,nrow=4, byrow=TRUE) ;MA



#list
l <- list(name="steven", age=28, grade= c(64,80,93)) ; l
l$name
l[[1]]
l[[2]]
l[[3]]
l[[3]][2]
l$grade [2]
l[["name"]]

l$tt <- 1:3
l
