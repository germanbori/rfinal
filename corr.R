install.packages('corrplot')

library(ggplot2)
library(lme4)
library(reshape2)
library(corrplot)
library("Hmisc")


#korrelációs scatterplot 
data2 = data[ , c(2,4:9)]

#Make the plot
plot(data2 , pch=20 , cex=1.5 , col=rgb(0.5, 0.8, 0.9, 0.7)) 
data1=data[ , c(3,4:9)]

#Make the plot
plot(data1 , pch=20 , cex=1.5 , col=rgb(0.5, 0.8, 0.9, 0.7))


#pairwise missing value kezelés  beállítása
cor(data, use = "complete.obs", method = "spearman")

newdata <- data [c(2:10)]
newres <- rcorr(as.matrix(data))

r_matrix <- newres$r
p_matrix <- newres$P

corrplot(newres$r, method = c("square"), 
         order="original", 
         hclust.method = "average", addrect = 6, rect.col = "black", rect.lwd = 1, 
         type="upper", diag = F, tl.col = "black", tl.srt = 45,
         p.mat = newres$P, sig.level = 0.05, insig = "blank")



corrplot(newres$r, method = c("number"), type="upper", order="original", diag = F, tl.col = "black", 
         p.mat = newres$P, sig.level = 0.05, insig = "blank")


half_matrix <- as.dist(p_matrix)
p_values <- as.vector(half_matrix) 
n <- length(p_values)

#correction <- p.adjust(p_values, method = p.adjust.methods, n) 


# n <- length(p_values)
# p.adjust(p_values, method = p.adjust.methods, n)
# correction <- p.adjust(p_values, method = p.adjust.methods, n)
correction <- as.data.frame(p_values)

# correction1<- data.frame(correction)
# View(correction1)
# p.values <- data.frame(p_values)
# View(p.values)

half_matrix <- as.dist(p_matrix)
p_values <- as.vector(half_matrix) 
n <- length(p_values)
correction <- as.data.frame(p_values)
correctionData = correction[order(correction$p_values),]
correctionData <- as.data.frame(correctionData)
                            
                            
correctionData$Bonferroni = 
      p.adjust(correctionData$correctionData, 
                    method = "bonferroni")
                          
correctionData$BH = 
    p.adjust(correctionData$correctionData, 
                   method = "BH")
                            

                            
J = correctionData$correctionData
K = cbind(correctionData$Bonferroni,
          correctionData$BH)
  
                            
matplot(K, J,
   xlab="Raw p-value",
   ylab="Adjusted p-value",
   type="l",
   asp=1,
   col=1:6,
   lty=1,
   lwd=2)
                            
legend('bottomright', 
   legend = c("Bonferroni", "BH"), 
      col = 1:6, 
      cex = 1,    
      pch = 16)
                
abline(0, 1,
     col=1,
     lty=2,
     lwd=1)
                            
 
                      
                            


                            