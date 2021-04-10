
cat('\014')
library('org.Hs.eg.db')
library(GOSemSim)
library(readxl)

setwd("F:\\0-Validation\\8-Lung Diseases\\4-GoSemSim\\Data")

#  Read genes
x <- read_excel("Gene_IPF.xlsx")
tmp1=x$Gene_Symbol
List_entrezID=mapIds(org.Hs.eg.db, tmp1, 'ENTREZID', 'SYMBOL')
List_entrezID=na.omit(List_entrezID)
DEG=as.data.frame(List_entrezID)
DEG=cbind(DEG,row.names(DEG))
colnames(DEG)=c('Entrezid','GENE_SYMBOL')
DEG=as.data.frame.matrix(DEG)
IndxRow=length(rownames(DEG))
rows=seq(1, IndxRow, by=1)
rownames(DEG)=rows


#ont = 'BP', 'MF', 'CC'
#measure = "Resnik", "Lin", "Rel", "Jiang" and "Wang" methods.
#Calculate sematic similarity Molecular function(MF)

d <- godata('org.Hs.eg.db', ont="MF", computeIC=FALSE)
output=mgeneSim(List_entrezID, semData=d, measure="Wang")  #combine = "BMA")

Final.Gene_Symbol <- vector(mode="character", length=length(x$Gene_Symbol))
Final.Semsim <- vector(mode="numeric", length=length(x$Gene_Symbol))

RowNam=rownames(output)
for(i in 1:length(RowNam)){
   GS=RowNam[i]
   indx_GS=which(DEG$Entrezid %in% GS)
   Final.Gene_Symbol[i]=DEG$GENE_SYMBOL[indx_GS]
   Final.Semsim[i]=mean(output[i,])  
}

Diff=!(x$Gene_Symbol %in%  Final.Gene_Symbol)
list1=x$Gene_Symbol[Diff]


for(j in 1:length(list1)){
  
  Final.Gene_Symbol[i+j]=list1[j]
}

DF=data.frame(Final.Gene_Symbol,Final.Semsim)
colnames(DF)=c("Gene_Symbol","Sematic_similarity_Value")

setwd("F:\\0-Validation\\8-Lung Diseases\\4-GoSemSim\\Result")
write.table(DF, "IPF_MF.txt", sep="\t",row.names=T, col.names=T, quote=F)    #LogFC && P.Value Of DEGs


#Calculate sematic similarity Biological Process(BP)

d <- godata('org.Hs.eg.db', ont="BP", computeIC=FALSE)
output=mgeneSim(List_entrezID, semData=d, measure="Wang")  #combine = "BMA")

Final.Gene_Symbol <- vector(mode="character", length=length(x$Gene_Symbol))
Final.Semsim <- vector(mode="numeric", length=length(x$Gene_Symbol))

RowNam=rownames(output)
for(i in 1:length(RowNam)){
  GS=RowNam[i]
  indx_GS=which(DEG$Entrezid %in% GS)
  Final.Gene_Symbol[i]=DEG$GENE_SYMBOL[indx_GS]
  Final.Semsim[i]=mean(output[i,])  
}

Diff=!(x$Gene_Symbol %in%  Final.Gene_Symbol)
list1=x$Gene_Symbol[Diff]


for(j in 1:length(list1)){
  
  Final.Gene_Symbol[i+j]=list1[j]
}

DF=data.frame(Final.Gene_Symbol,Final.Semsim)
colnames(DF)=c("Gene_Symbol","Sematic_similarity_Value")

setwd("F:\\0-Validation\\8-Lung Diseases\\4-GoSemSim\\Result")
write.table(DF, "IPF_BP.txt", sep="\t",row.names=T, col.names=T, quote=F)    #LogFC && P.Value Of DEGs



#Calculate sematic similarity Celullar Component(CC)

d <- godata('org.Hs.eg.db', ont="CC", computeIC=FALSE)
output=mgeneSim(List_entrezID, semData=d, measure="Wang")  #combine = "BMA")

Final.Gene_Symbol <- vector(mode="character", length=length(x$Gene_Symbol))
Final.Semsim <- vector(mode="numeric", length=length(x$Gene_Symbol))

RowNam=rownames(output)
for(i in 1:length(RowNam)){
  GS=RowNam[i]
  indx_GS=which(DEG$Entrezid %in% GS)
  Final.Gene_Symbol[i]=DEG$GENE_SYMBOL[indx_GS]
  Final.Semsim[i]=mean(output[i,])  
}

Diff=!(x$Gene_Symbol %in%  Final.Gene_Symbol)
list1=x$Gene_Symbol[Diff]


for(j in 1:length(list1)){
  
  Final.Gene_Symbol[i+j]=list1[j]
}

DF=data.frame(Final.Gene_Symbol,Final.Semsim)
colnames(DF)=c("Gene_Symbol","Sematic_similarity_Value")


setwd("F:\\0-Validation\\8-Lung Diseases\\4-GoSemSim\\Result")
write.table(DF, "IPF_CC.txt", sep="\t",row.names=T, col.names=T, quote=F)    #LogFC && P.Value Of DEGs


