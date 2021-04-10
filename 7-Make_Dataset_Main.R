
cat('\014')
library(readxl)
Masir="F:\\0-Validation\\8-Lung Diseases\\6-Filter_Genes\\IPF"
Masir2="F:\\0-Validation\\8-Lung Diseases\\7-Make_Dataset_Main\\IPF"

# Read Data From Original Datasets
setwd("F:\\0-Validation\\8-Lung Diseases\\3-Make_Datasets\\Data")
Asthma <- read_excel("IPF_Expression.xlsx")
Asthma_Trait <- read_excel("IPF_Trait.xlsx")
x=Asthma_Trait$Type
x=as.data.frame(x)
names(x)="Groups";
x=rbind("Groups",x);

###############################################BP

setwd(Masir)
BP <- read_excel("BP.xlsx")
a=Asthma$Gene_Symbol
b=BP$Gene_Symbol

indx=which(a %in% b)
Asthma_Data=Asthma[indx,]
#len1=dim(Asthma)[1]
#Asthma_Data=rbind(Asthma_Data,Asthma[len1,])
Asthma_Data=rbind(Asthma_Data,x$Groups )

setwd(Masir2)
write.table(t(Asthma_Data), "BP.txt", sep="\t",row.names=F, col.names=F, quote=F)  


###############################################MF

setwd(Masir)
BP <- read_excel("MF.xlsx")
a=Asthma$Gene_Symbol
b=BP$Gene_Symbol

indx=which(a %in% b)
Asthma_Data=Asthma[indx,]
#len1=dim(Asthma)[1]
#Asthma_Data=rbind(Asthma_Data,Asthma[len1,])
Asthma_Data=rbind(Asthma_Data,x$Groups )

setwd(Masir2)
write.table(t(Asthma_Data), "MF.txt", sep="\t",row.names=F, col.names=F, quote=F)

###############################################CC

setwd(Masir)
BP <- read_excel("CC.xlsx")
a=Asthma$Gene_Symbol
b=BP$Gene_Symbol

indx=which(a %in% b)
Asthma_Data=Asthma[indx,]
#len1=dim(Asthma)[1]
#Asthma_Data=rbind(Asthma_Data,Asthma[len1,])
Asthma_Data=rbind(Asthma_Data,x$Groups )

setwd(Masir2)
write.table(t(Asthma_Data), "CC.txt", sep="\t",row.names=F, col.names=F, quote=F) 

###############################################BP-MF

setwd(Masir)
BP <- read_excel("BP_MF.xlsx")
a=Asthma$Gene_Symbol
b=BP$Gene_Symbol

indx=which(a %in% b)
Asthma_Data=Asthma[indx,]
#len1=dim(Asthma)[1]
#Asthma_Data=rbind(Asthma_Data,Asthma[len1,])
Asthma_Data=rbind(Asthma_Data,x$Groups )

setwd(Masir2)
write.table(t(Asthma_Data), "BP_MF.txt", sep="\t",row.names=F, col.names=F, quote=F)

###############################################BP_CC

setwd(Masir)
BP <- read_excel("BP_CC.xlsx")
a=Asthma$Gene_Symbol
b=BP$Gene_Symbol

indx=which(a %in% b)
Asthma_Data=Asthma[indx,]
#len1=dim(Asthma)[1]
#Asthma_Data=rbind(Asthma_Data,Asthma[len1,])
Asthma_Data=rbind(Asthma_Data,x$Groups )

setwd(Masir2)
write.table(t(Asthma_Data), "BP_CC.txt", sep="\t",row.names=F, col.names=F, quote=F)

###############################################MF-CC

setwd(Masir)
BP <- read_excel("MF_CC.xlsx")
a=Asthma$Gene_Symbol
b=BP$Gene_Symbol

indx=which(a %in% b)
Asthma_Data=Asthma[indx,]
#len1=dim(Asthma)[1]
#Asthma_Data=rbind(Asthma_Data,Asthma[len1,])
Asthma_Data=rbind(Asthma_Data,x$Groups )

setwd(Masir2)
write.table(t(Asthma_Data), "MF_CC.txt", sep="\t",row.names=F, col.names=F, quote=F)  

#########################################################BP-MF-CC
setwd(Masir)
BP <- read_excel("BP_MF_CC.xlsx")
a=Asthma$Gene_Symbol
b=BP$Gene_Symbol

indx=which(a %in% b)
Asthma_Data=Asthma[indx,]
#len1=dim(Asthma)[1]
#Asthma_Data=rbind(Asthma_Data,Asthma[len1,])
Asthma_Data=rbind(Asthma_Data,x$Groups )

setwd(Masir2)
write.table(t(Asthma_Data), "BP_MF_CC.txt", sep="\t",row.names=F, col.names=F, quote=F)

