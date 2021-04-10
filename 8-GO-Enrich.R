
cat('\014')
library("readxl")
library(DOSE)
library('org.Hs.eg.db')
library("stringr")
library(RColorBrewer)
library(ggplot2)

setwd("F:\\0-Validation\\8-Lung Diseases\\13-Enrichment\\COPD")
dat1 <- read_excel("map.xlsx")

Disease=dat1$Name
Genes=dat1$`Hit Count in Query List`


tiff("Barplot.tiff", width = 12, height =5, units = 'in', compression = 'lzw', res = 500)
ggplot(dat1, aes(x=Disease, y=Genes)) + 
  geom_bar(stat = "identity") +
  coord_flip()
dev.off()

myPalette <- brewer.pal(12, "Set3") 
tiff("Pieplot.tiff", width = 12, height =5, units = 'in', compression = 'lzw', res = 500)
pie(Genes[1:15] , labels = Disease[1:15], col=myPalette)
dev.off()

