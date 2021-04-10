

cat('\014')

options(digits=4)
library(readxl)


#  Read genes
setwd("F:\\0-Validation\\8-Lung Diseases\\4-GoSemSim\\Result")

BP <- read_excel("IPF_BP.xlsx")
MF <- read_excel("IPF_MF.xlsx")
CC <- read_excel("IPF_CC.xlsx")
setwd("F:\\0-Validation\\8-Lung Diseases\\1-DEG\\Result\\IPF")
Asthma<- read_excel("FC_0.05.xlsx")



tmp=order(BP$Gene_Symbol, decreasing = FALSE)
BP=BP[tmp,]
tmp=order(MF$Gene_Symbol, decreasing = FALSE)
MF=MF[tmp,]
tmp=order(CC$Gene_Symbol, decreasing = FALSE)
CC=CC[tmp,]

tmp=order(Asthma$Gene_Symbol, decreasing = FALSE)
Asthma=Asthma[tmp,]

indx=which(Asthma$Gene_Symbol %in% BP$Gene_Symbol)
LogFC=Asthma$logFC[indx]

LogFC=as.double(LogFC)
LogFC_BP=abs(LogFC*as.double(BP$Sematic_similarity_Value))
LogFC_MF=abs(LogFC*as.double(MF$Sematic_similarity_Value))
LogFC_CC=abs(LogFC*as.double(CC$Sematic_similarity_Value))
LogFC_BP_MF=abs(LogFC*((as.double(BP$Sematic_similarity_Value)+as.double(MF$Sematic_similarity_Value))/2))
LogFC_BP_CC=abs(LogFC*((as.double(BP$Sematic_similarity_Value)+as.double(CC$Sematic_similarity_Value))/2))
LogFC_MF_CC=abs(LogFC*((as.double(MF$Sematic_similarity_Value)+as.double(CC$Sematic_similarity_Value))/2))
LogFC_BP_MF_CC=abs(LogFC*((as.double(BP$Sematic_similarity_Value)+as.double(MF$Sematic_similarity_Value)+as.double(CC$Sematic_similarity_Value))/3))



Total=data.frame(BP$Gene_Symbol,LogFC,as.double(BP$Sematic_similarity_Value),as.double(MF$Sematic_similarity_Value)
                 ,as.double(CC$Sematic_similarity_Value),LogFC_BP,LogFC_MF,LogFC_CC,LogFC_BP_MF,LogFC_BP_CC
                 ,LogFC_MF_CC,LogFC_BP_MF_CC)
colnames(Total)=c("Gene_Symbol","LogFC","BP","MF","CC","LogFC_BP","LogFC_MF","LogFC_CC","LogFC_BP_MF","LogFC_BP_CC"
                  ,"LogFC_MF_CC","LogFC_BP_MF_CC")



setwd("F:\\0-Validation\\8-Lung Diseases\\5-Aggregate_GoSemSim")
write.table(Total, "IPF_GSS.txt", sep="\t",row.names=T, col.names=T, quote=F)    





