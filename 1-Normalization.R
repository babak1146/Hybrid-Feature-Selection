
cat("\014")

library(affy)
library(limma)
library(simpleaffy)
library(MASS)
library("readxl")


'*******************************************************************
DEG
*******************************************************************'
setwd("F:\\0-Validation\\8-Lung Diseases\\1-DEG\\Data")

final2<-read_excel("IPF_Expression.xlsx")
final1=final2[,-1]
final=as.matrix(final1)
row.names(final)<-final2$Gene_Symbol

Trit <- read_excel("IPF_Trait.xlsx")
groups=Trit$Type
groups<-as.factor(groups)
design<-model.matrix(~groups)
design

fit<-lmFit(final, design)
fit<-eBayes(fit)
topTable(fit, coef=2)
tt<-topTable(fit, coef=2, n=nrow(final))
rn<-rownames(tt)[tt$adj.P.Val<=0.05]
FC=tt[rn,]
dat.s<-final[rn,]
dim(dat.s)

setwd("F:\\0-Validation\\8-Lung Diseases\\1-DEG\\Result\\IPF")
write.table(dat.s, "Expression_FC.txt", sep="\t",row.names=T, col.names=T, quote=F)    #LogFC && P.Value Of DEGs
write.table(tt, "FullFC.txt", sep="\t",row.names=T, col.names=T, quote=F)    #LogFC && P.Value Of DEGs
write.table(FC, "FC_0.05.txt", sep="\t",row.names=T, col.names=T, quote=F)    #LogFC && P.Value Of DEGs




