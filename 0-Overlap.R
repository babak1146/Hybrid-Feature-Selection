
cat('\014')
library("readxl")

####################Asthma

setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Blood")
Asthma_Blood <- read_excel("Asthma.xlsx")
setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Lung")
Asthma_Lung <- read_excel("Asthma.xlsx")
setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Lung2")
Asthma_Lung2 <- read_excel("Asthma.xlsx")

indx=which(Asthma_Lung$Gene_Symbol %in% Asthma_Blood$Gene_Symbol)
Asthma_Lung=Asthma_Lung[indx,]
indx2=which(Asthma_Lung$Gene_Symbol %in% Asthma_Lung2$Gene_Symbol)
Asthma_Expression=Asthma_Lung[indx2,]
Asthma_Gens=Asthma_Expression$Gene_Symbol


####################COPD

setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Blood")
COPD_Blood <- read_excel("COPD.xlsx")
setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Lung")
COPD_Lung <- read_excel("COPD.xlsx")
setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Lung2")
COPD_Lung2 <- read_excel("COPD.xlsx")

indx=which(COPD_Lung$Gene_Symbol %in% COPD_Blood$Gene_Symbol)
COPD_Lung=COPD_Lung[indx,]
indx2=which(COPD_Lung$Gene_Symbol %in% COPD_Lung2$Gene_Symbol)
COPD_Expression=COPD_Lung[indx2,]
COPD_Gens=COPD_Expression$Gene_Symbol

####################IPF

setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Blood")
IPF_Blood <- read_excel("IPF.xlsx")
setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Lung")
IPF_Lung <- read_excel("IPF.xlsx")
setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Lung2")
IPF_Lung2 <- read_excel("IPF.xlsx")

indx=which(IPF_Lung$Gene_Symbol %in% IPF_Blood$Gene_Symbol)
IPF_Lung=IPF_Lung[indx,]
indx2=which(IPF_Lung$Gene_Symbol %in% IPF_Lung2$Gene_Symbol)
IPF_Expression=IPF_Lung[indx2,]
IPF_Gens=IPF_Expression$Gene_Symbol


############Save Data
setwd("F:\\0-Validation\\8-Lung Diseases\\0-Extract Overlap Genes\\Result")
write.table(Asthma_Expression, file = "Asthma_Expression.txt",row.names=TRUE, na="",col.names=TRUE, sep="\t")
write.table(COPD_Expression, file = "COPD_Expression.txt",row.names=TRUE, na="",col.names=TRUE, sep="\t")
write.table(IPF_Expression, file = "IPF_Expression.txt",row.names=TRUE, na="",col.names=TRUE, sep="\t")
write.table(Asthma_Gens, file = "Asthma_Genes.txt",row.names=TRUE, na="",col.names=TRUE, sep="\t")
write.table(COPD_Gens, file = "COPD_Genes.txt",row.names=TRUE, na="",col.names=TRUE, sep="\t")
write.table(IPF_Gens, file = "IPF_Genes.txt",row.names=TRUE, na="",col.names=TRUE, sep="\t")
