#
#   Reads deaths and exposure data for England and Wales from a file
#   downloaded from the Human Mortality Database
#
#   File: EngWales_read.r
#
#   Read in deaths data
#
x <- scan(file="EngWales_Deaths.txt", what = "character", skip = 1)
x <- matrix(x, ncol = 5, byrow = T)
x <- c(x)
#
#    Choose ages 10-90
#
select <- c(rep(F,10),rep(T,81),rep(F,20))
Deaths <- x[select]
Deaths <- as.numeric(Deaths)
Deaths <- matrix(Deaths, ncol = 5)
#
Age <- 10:90
Year <- 1841:2005
#
#    Male death matrix
#
Dth.M <- Deaths[ ,4]
Dth.M <- matrix(Dth.M, nrow = length(Age))
dimnames(Dth.M) <- list(Age, Year)
#
#    Female death matrix
#
Dth.F <- Deaths[ ,3]
Dth.F <- matrix(Dth.F, nrow = length(Age))
dimnames(Dth.F) <- list(Age, Year)
#
#   Read in exposure data
#
x <- scan(file="EngWales_Exposures.txt", what = "character", skip = 1)
x <- matrix(x, ncol = 5, byrow = T)
x <- c(x)
#
#    Choose ages 10-90
#
Exp <- x[select]
Exp <- as.numeric(Exp)
Exp <- matrix(Exp, ncol = 5)
#
#    Male exposure matrix
#
Exp.M <- Exp[ ,4]
Exp.M <- matrix(Exp.M, nrow = length(Age))
dimnames(Exp.M) <- list(Age, Year)
#
#    Female death matrix
#
Exp.F <- Exp[ ,3]
Exp.F <- matrix(Exp.F, nrow = length(Age))
dimnames(Exp.F) <- list(Age, Year)
#
rm(x, select, Deaths, Exp)
