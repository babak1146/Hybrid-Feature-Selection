
  cat('\014')
  library(readxl)

  ################################Asthma
  setwd("F:\\0-Validation\\8-Lung Diseases\\3-Make_Datasets\\Data");
  Asthma_Data <- read_excel('Asthma_Expression.xlsx');
  trait=read_excel("Asthma_Trait.xlsx");
  x=trait$Type
  x=as.data.frame(x)
  names(x)="Groups";
  x=rbind("Groups",x);
  Asthma_Data=rbind(Asthma_Data,x$Groups )
 
  setwd("F:\\0-Validation\\8-Lung Diseases\\3-Make_Datasets\\Result");
  write.table(t(Asthma_Data), 'Asthma.txt', sep="\t",row.names=T, col.names=F, quote=F)  
  
 
 ################################COPD 
  setwd("F:\\0-Validation\\8-Lung Diseases\\3-Make_Datasets\\Data");
  Asthma_Data <- read_excel('COPD_Expression.xlsx');
  trait=read_excel("COPD_Trait.xlsx");
  x=trait$Type
  x=as.data.frame(x)
  names(x)="Groups";
  x=rbind("Groups",x);
  Asthma_Data=rbind(Asthma_Data,x$Groups )
  
  setwd("F:\\0-Validation\\8-Lung Diseases\\3-Make_Datasets\\Result");
  write.table(t(Asthma_Data), 'COPD.txt', sep="\t",row.names=T, col.names=F, quote=F)  
  
  ################################IPF 
  setwd("F:\\0-Validation\\8-Lung Diseases\\3-Make_Datasets\\Data");
  Asthma_Data <- read_excel('IPF_Expression.xlsx');
  trait=read_excel("IPF_Trait.xlsx");
  x=trait$Type
  x=as.data.frame(x)
  names(x)="Groups";
  x=rbind("Groups",x);
  Asthma_Data=rbind(Asthma_Data,x$Groups )
  
  setwd("F:\\0-Validation\\8-Lung Diseases\\3-Make_Datasets\\Result");
  write.table(t(Asthma_Data), 'IPF.txt', sep="\t",row.names=T, col.names=F, quote=F)  
  