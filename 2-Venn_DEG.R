
cat("\014")
library(grid)
library(futile.logger)
library(VennDiagram)
library("readxl")


setwd("F:\\0-Validation\\8-Lung Diseases\\2-Venn\\DEG_Genes")
#  Read Disregulate_genes
IPF <- read_excel("IPF.xlsx")
Asthma <- read_excel("Asthma.xlsx")
COPD <- read_excel("COPD.xlsx")


Overlap12=intersect(Asthma$Gene_Symbol,IPF$Gene_Symbol)
Overlap23=intersect(IPF$Gene_Symbol,COPD$Gene_Symbol)
Overlap13=intersect(Asthma$Gene_Symbol,COPD$Gene_Symbol)
Overlap123=intersect(intersect(Asthma$Gene_Symbol,IPF$Gene_Symbol),COPD$Gene_Symbol)

Overlap_Num12=length(Overlap12)
Overlap_Num23=length(Overlap23)
Overlap_Num13=length(Overlap13)
Overlap_Num123=length(Overlap123)

Asthma_Num=length(Asthma$Gene_Symbol)
IPF_Num=length(IPF$Gene_Symbol)
COPD_Num=length(COPD$Gene_Symbol)


IPF_DIFF=setdiff(setdiff(IPF$Gene_Symbol,COPD$Gene_Symbol),Asthma$Gene_Symbol)
IPF_Num1=length(IPF_DIFF)
Asthma_DIFF=setdiff(setdiff(Asthma$Gene_Symbol,COPD$Gene_Symbol),IPF$Gene_Symbol)
Asthma_Num1=length(Asthma_DIFF)
COPD_DIFF=setdiff(setdiff(COPD$Gene_Symbol,IPF$Gene_Symbol),Asthma$Gene_Symbol)
COPD_Num1=length(COPD_DIFF)

setwd("F:\\0-Validation\\8-Lung Diseases\\2-Venn")

#For Two Case
#grid.newpage()
#draw.pairwise.venn(Asthma_Num, IPF_Num, Overlap_Num, category = c("Asthma", "IPF"), lty = rep("blank",2),
 #      fill = c("light blue", "pink"), alpha = rep(0.5, 2), cat.pos = c(0,0), cat.dist = rep(0.025, 2))

#For Three Case
tiff("Venn.tiff", width = 6, height = 6, units = 'in', compression = 'lzw', res = 500)
grid.newpage()
draw.triple.venn(area1 = Asthma_Num, area2 = IPF_Num, area3 = COPD_Num, n12 = Overlap_Num12, n23 = Overlap_Num23, n13 = Overlap_Num13,n123 = Overlap_Num123, 
      category = c("Asthma", "IPF","COPD"), lty = "blank",fill = c("skyblue", "pink1", "mediumorchid"),cex=3,cat.cex=2)
dev.off()


#Difference
setwd("F:\\0-Validation\\8-Lung Diseases\\2-Venn\\Result")
write.table(IPF_DIFF,"Gene_IPF.txt", sep="\t",row.names=T, col.names=T, quote=F)
write.table(COPD_DIFF,"Gene_COPD.txt", sep="\t",row.names=T, col.names=T, quote=F)
write.table(Asthma_DIFF,"Gene_Asthma.txt", sep="\t",row.names=T, col.names=T, quote=F)


'#############################################################'
'              eXPERSSION DEG Extract                         '
'#############################################################'

# Asthma Expression Extract
setwd("F:\\0-Validation\\8-Lung Diseases\\2-Venn\\Result")
index_Asthma=which(Asthma$Gene_Symbol %in% Asthma_DIFF)
File_Asthma=Asthma[index_Asthma,]
dim(File_Asthma)
write.table(File_Asthma,"Asthma_Expression.txt", sep="\t",row.names=T, col.names=T, quote=F)


# COPD Expression Extract
index_COPD=which(COPD$Gene_Symbol %in% COPD_DIFF)
File_COPD=COPD[index_COPD,]
dim(File_COPD)
write.table(File_COPD,"COPD_Expression.txt", sep="\t",row.names=T, col.names=T, quote=F)


# IPF Expression Extract
index_IPF=which(IPF$Gene_Symbol %in% IPF_DIFF)
File_IPF=IPF[index_IPF,]
dim(File_IPF)
write.table(File_IPF,"IPF_Expression.txt", sep="\t",row.names=T, col.names=T, quote=F)

