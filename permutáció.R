install.packages('MPTinR')
library(MPTinR)
 
install.packages('CCP')
library('CCP')
install.packages('RVAideMemoire')
library(RVAideMemoire)


for (i in 2:3) {
  x = data[,i]
  for (k in 1:7){
    y =  data[,k+3]
   print( perm.cor.test(x, y, nperm = 10000,"two.sided", progress = TRUE)) 
  }
}





