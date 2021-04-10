
cat('\014')

options(digits=4)
library(readxl)

#  Read genes
setwd("F:\\0-Validation\\8-Lung Diseases\\5-Aggregate_GoSemSim")

Asthma <- read_excel("IPF_GSS.xlsx")
len=ceiling(length(Asthma$Gene_Symbol)/2)

#Biological Process
BP=Asthma[,c(1,6)]
BP=transform(BP, LogFC_BP = as.numeric(LogFC_BP))
tmp=order(BP$LogFC_BP, decreasing = TRUE)
BP=BP[tmp,]
BP=BP[1:len,]

#BP=BP[BP$LogFC_BP >= 1,]

#Molecular Function
MF=Asthma[,c(1,7)]
MF=transform(MF, LogFC_MF = as.numeric(LogFC_MF))
tmp=order(MF$LogFC_MF, decreasing = TRUE)
MF=MF[tmp,]
MF=MF[1:len,]
#MF=MF[MF$LogFC_MF >= 1,]

#Cellular Component
CC=Asthma[,c(1,8)]
CC=transform(CC, LogFC_CC = as.numeric(LogFC_CC))
tmp=order(CC$LogFC_CC, decreasing = TRUE)
CC=CC[tmp,]
CC=CC[1:len,]
#CC=CC[CC$LogFC_CC >= 1,]

#Biological Process && Molecular Function
BP_MF=Asthma[,c(1,9)]
BP_MF=transform(BP_MF, LogFC_BP_MF = as.numeric(LogFC_BP_MF))
tmp=order(BP_MF$LogFC_BP_MF, decreasing = TRUE)
BP_MF=BP_MF[tmp,]
BP_MF=BP_MF[1:len,]
#BP_MF=BP_MF[BP_MF$LogFC_BP_MF >= 1,]

#Biological Process && Cellular Component
BP_CC=Asthma[,c(1,10)]
BP_CC=transform(BP_CC, LogFC_BP_CC = as.numeric(LogFC_BP_CC))
tmp=order(BP_CC$LogFC_BP_CC, decreasing = TRUE)
BP_CC=BP_CC[tmp,]
BP_CC=BP_CC[1:len,]
#BP_CC=BP_CC[BP_CC$LogFC_BP_CC >= 1,]


#Molecular Function && Cellular Component
MF_CC=Asthma[,c(1,11)]
MF_CC=transform(MF_CC, LogFC_MF_CC = as.numeric(LogFC_MF_CC))
tmp=order(MF_CC$LogFC_MF_CC, decreasing = TRUE)
MF_CC=MF_CC[tmp,]
MF_CC=MF_CC[1:len,]
#MF_CC=MF_CC[MF_CC$LogFC_MF_CC >= 1,]


#Biological Process && Molecular Function && Cellular Component
BP_MF_CC=Asthma[,c(1,12)]
BP_MF_CC=transform(BP_MF_CC, LogFC_BP_MF_CC = as.numeric(LogFC_BP_MF_CC))
tmp=order(BP_MF_CC$LogFC_BP_MF_CC, decreasing = TRUE)
BP_MF_CC=BP_MF_CC[tmp,]
BP_MF_CC=BP_MF_CC[1:len,]
#BP_MF_CC=BP_MF_CC[BP_MF_CC$LogFC_BP_MF_CC >= 1,]

setwd("F:\\0-Validation\\8-Lung Diseases\\6-Filter_Genes\\IPF")

write.table(BP, "BP.txt", sep="\t",row.names=T, col.names=T, quote=F)   
write.table(MF, "MF.txt", sep="\t",row.names=T, col.names=T, quote=F)   
write.table(CC, "CC.txt", sep="\t",row.names=T, col.names=T, quote=F)    
write.table(BP_MF, "BP_MF.txt", sep="\t",row.names=T, col.names=T, quote=F)    
write.table(BP_CC, "BP_CC.txt", sep="\t",row.names=T, col.names=T, quote=F)    
write.table(MF_CC, "MF_CC.txt", sep="\t",row.names=T, col.names=T, quote=F)   
write.table(BP_MF_CC, "BP_MF_CC.txt", sep="\t",row.names=T, col.names=T, quote=F)    





