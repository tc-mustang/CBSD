
library(qqman)

#### LEaves severity

leaves <- read.delim("/home/DB2/dunia/3sCBSD.loco.mlma")
leaves1 <- as.data.frame(cbind(leaves[,2], leaves[,1], leaves[,3], leaves[,9]))
colnames(leaves1) <- c("SNP","CHR","BP","P")
leaves1[,1] <- leaves[,2]

pval <- leaves1$P

alpha <- seq(from = 0.00001,to = 0.05, by = 0.00001)
FDR <- vector(length =length(alpha))
for ( i in 1:length(alpha)){
  FDR[i] <- (length(pval) * alpha[i]) / sum(pval < alpha[i])
}

fdrt <- -log10(alpha[which.min(abs(FDR - 0.05))])
bonfet <- -log10(0.05/length(pval))

#Leaves severity graphing:
manhattan(leaves1, cex = 0.5, suggestiveline = F, genomewideline = F)
abline(h=fdrt, col = "blue")
abline(h=bonfet, col = "red")

qq(leaves1$P, main = "Q-Q plot of GWAS p-values")


#Only chromosome 11
manhattan(subset(leaves1, CHR == 11), suggestiveline = F, genomewideline = F, cex = 0.7)
abline(h=fdrt, col = "blue")
abline(h=bonfet, col = "red")


a <- leaves1$SNP[grep("S11_23......", leaves1$SNP)]
a

sort(leaves1,)

manhattan(subset(leaves1, CHR == 11), suggestiveline = F, genomewideline = F, cex = 0.7, highlight = a)

#### Roots severity

leaves <- read.delim("/home/DB2/dunia/rsCBSD.loco.mlma")
leaves1 <- as.data.frame(cbind(leaves[,2], leaves[,1], leaves[,3], leaves[,9]))
colnames(leaves1) <- c("SNP","CHR","BP","P")
leaves1[,1] <- leaves[,2]

pval <- leaves1$P

alpha <- seq(from = 0.00001,to = 0.05, by = 0.000002)
FDR <- vector(length =length(alpha))
for ( i in 1:length(alpha)){
  FDR[i] <- (length(pval) * alpha[i]) / sum(pval < alpha[i])
}

fdrt <- -log10(alpha[which.min(abs(FDR - 0.05))])
bonfet <- -log10(0.05/length(pval))

#Leaves severity graphing:
manhattan(leaves1, cex = 0.5, suggestiveline = F, genomewideline = F)
abline(h=fdrt, col = "blue")
abline(h=bonfet, col = "red")

qq(leaves1$P, main = "Q-Q plot of GWAS p-values")


##SUbsets


manhattan(subset(gwasResults, CHR == 1))

