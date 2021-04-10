cat('\014')
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(readxl)

##############BP
setwd('F:/0-Validation/8-Lung Diseases/Article/Tables/Enrichment')
dat=read_excel('IPF_BP.xlsx')
Adj.Pval=dat$`q-value`[1:20]
Biological_Process=dat$Name[1:20]
Number_Of_Genes=dat$len[1:20]

tiff("IPF_BP.tiff", width =12, height =12, units = 'in', compression = 'lzw', res = 500)

ggplot(data = dat[1:20,], aes(x =Biological_Process , y =Number_Of_Genes )) +
  geom_bar(stat = "identity", aes(fill =Adj.Pval))+
  theme(axis.text.x = element_text(
    angle = 90,
    hjust = 1,
    vjust = 0.5,
    size=14,
    color = "black"
  ))

dev.off()



##############Pathway
setwd('F:/0-Validation/8-Lung Diseases/Article/Tables/Enrichment')
dat=read_excel('IPF_PW.xlsx')
Adj.Pval=dat$`q-value`[1:20]
Biological_Process=dat$Name[1:20]
Number_Of_Genes=dat$len[1:20]

tiff("IPF_PW.tiff", width =12, height =13, units = 'in', compression = 'lzw', res = 500)

ggplot(data = dat[1:20,], aes(x =Biological_Process , y =Number_Of_Genes )) +
  geom_bar(stat = "identity", aes(fill =Adj.Pval))+
  theme(axis.text.x = element_text(
    angle = 90,
    hjust = 1,
    vjust = 0.5,
    size=14,
    color = "black"
  ))

dev.off()


