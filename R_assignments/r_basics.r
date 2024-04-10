#R data types are the following:
#numeric - (10.5, 55, 787)
#integer - (1L, 55L, 100L, where the letter "L" declares this as an integer)
#complex - (9 + 3i, where "i" is the imaginary part)
#character (a.k.a. string) - ("k", "R is exciting", "FALSE", "11.5")
#logical (a.k.a. boolean) - (TRUE or FALSE)


#numeric 
(x <- 24.5)

#integer (L stands for long)
(x <- 13L)

#complex
(x <- 23 + 4i)
class(x)

#logical 
x <- TRUE
x <- FALSE

#strings
str <- "I'm a string"
str #in this way I'll print its value

#------------ STATEMENTS ------------
#if conditions
cat("
if (condition) {
   selected
}

while (condition){
    selected
}

for (identifier in collection) {
   selected
}
")
#------------ FUNCTIONS ------------ 
#curl brackets for more than one statement
#the last statement of a function is the one that will be returned
f <- function(x, y, z) {x^2+y^2+z^2}
(f(1,2,4))

predefined <- function(x=1, y=2) {x+y}
(predefined())
(predefined(y=1))

#lazy evaluation
#1. if I define a function with a variable and I'll not use it it will not complain
# Because it will not be processed if not needed
lazy <- function(a,b) { 10 }
(lazy())

#The second statemnt is useless -> it will not be evaluated (even in case of syntax error)
if( TRUE || undefined_variable ){
    12
}

#even if the variables are inside the function declaration they will be evaluated runtime!!!
#crazy_time <- function(a=Sys.Date(), b=Sys.Date(), c=Sys.Date()) {}

#------------ LINEAR ALGEBRA ------------
myvector <- c(1,2,3,4)
myvector <- 1:4

subselected <- myvector[c(1,1,3)]

#create an empty vector
empty_vector = numeric(0)

#matrices
#applies function paste to every pair (x, y)
(cross <- outer(1:5, 1:5, FUN = "paste"))

#------------ VECTORIZED OPERATIONS ------------

#let's generate 20 random numbers from poisson distribution with lambda=1.5 and evaluate the logarithm
(xrandom <- log(rpois(20,1.5)))
(mean(xrandom))

#what if I want to replace -inf with NA (not available)?
#it's a vecorized operation
#if y<0 replace to NA, else use the unchanged xrandom
(xrandom <- ifelse(xrandom < 0, NA, xrandom))
#to remove the NA
(mean(xrandom, na.rm=TRUE))

#let's see the power of these vectorized operations
library(microbenchmark)
x <- runif(10^4)

fm1 <- function(x) { max(x) }
fm2 <- function(x) {
    maximum <- x[1]
    for (i in 2:length(x)){
        if (x[i] > maximum) {
           maximum <- x[i]
        }
    }
    i
}

(microbenchmark(max(x), fm1(x), fm2(x)))


#---------- COPY OF VECTORS --------
x <- 1:4
y <- x
#until here y and x are pointing to the same object 

#modifying y -> now y will point to another object
y[1] <- 10

(x)
(y)

#-------------- LISTS ------------
#each element is a reference to another R objetc

mylist = list(1:3, "I'm  string", c(TRUE, TRUE, FALSE), "Another string")
(mylist)
#to access an element I have to use double square brackets
mylist[[1]]
#SINGLE BRACKET FOR SUBLISTS!
sublist = mylist[1:2]
(sublist)

#you can also create list with names

mylist = list(
    index = 1:3,
    key = c("fe", "fwe")
)

(mylist[["index"]])

#ACHTUNG: if you copy a list and modify a single element
#           -> just that address will be modified

#--------------- DATAFRAMES ---------------

df <- data.frame(x=1:3, y=letters[1:3])
(df)
#check string as factors option
df2 <- df

(df2[,1] <- df2[,1]*2)
#obs: modify by columns is relatively fast
#     modify by rows can be timeconsuming 'cause I have to copy everything

#we can access using indeces, names and also matrix notation
(df[["x"]])
(df$x)
(df[,1])

