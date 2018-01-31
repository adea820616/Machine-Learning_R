install.packages("arules")
install.packages("arulesViz")
install.packages("arulesSequences")

library(arules)
library(arulesSequences)
library(arulesViz)

# List -> Transaction 

tran_list <- 
list( 
  c( "A", "B" ),
  c( "B", "C", "D" ),
  c( "A", "C", "D", "E")
  )

trans <- as( tran_list, "transactions" )
inspect(trans)

# Matrix -> Transaction

tran_matrix <-
matrix(
  c( 1, 1, 0, 0, 0,
     0, 1, 1, 1, 0,
     1, 0, 1, 1, 1,
     1, 0, 0, 1, 1,
     1, 1, 1, 0, 0,
     1, 1, 1, 1, 0,
     1, 0, 0, 0, 0,
     1, 1, 1, 0, 0,
     1, 1, 0, 1, 0,
     0, 1, 1, 0, 0
  ),
  ncol = 5,
  byrow = TRUE
)

colnames( tran_matrix ) <- c( "A", "B", "C", "D", "E" )

trans <- as( tran_matrix, "transactions" )
inspect(trans)
image(trans)

# File -> Transaction
trans <- read.transactions( "trans1.csv", 
                            format = "single", 
                            sep = ",", 
                            col = c( 1, 2), 
                            skip = 1 )
inspect(trans)

# File -> Transaction
trans <- read.transactions( "trans2.csv",
                            format = "basket",
                            sep = "," )
inspect(trans)



# Apriori
#TID 10 , threshold=2
transrule <-
apriori( trans,
         parameter = list( support = 0.2, target = "frequent itemsets")
         )
inspect(transrule)

transrule <-
  apriori( trans,
           parameter = list( support = 0.2, confidence = 0.5 )
  )
inspect(transrule)

transrule <-
  apriori( trans,
           parameter = list( support = 0.2, confidence = 0.5 ),
           appearance = list( rhs = c( "A" ), default = "lhs" )  
  )
inspect(transrule)
#appearance = list( lhs = c( "A" ), default = "rhs" ) 
#appearance = list( rhs = c( "A" ), default = "lhs" )

# Visualization 
plot( transrule )
plot( transrule, method = "group")
plot( transrule, method = "graph")
plot( transrule, method = "two-key plot")

# Sequential Pattern
#加入購買時間
trans <- read_baskets( "trans3.csv", sep = ",", info = c( "sequenceID", "eventID") )
inspect(trans)

seqrule <- cspade( trans, parameter = list( support = 0.5 ) )
inspect(seqrule)

