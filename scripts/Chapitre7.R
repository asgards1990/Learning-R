setwd("/Users/sya/Desktop/learning-R")


tailleG <- c(169,175,182,166,179,NA,165,168,NA,179,167,172,156,191,NA,183,178,175,190,172,173,185,171)
names(tailleG) <- c("Vincent","Pierre","Karim","Michel","Eric","Kevin","Paul","Youssef","Alain","Ruy","Adrien","Bastien","Jacques","Christian","Justin","Julien","Philippe","Benoit","Thimothee","Francois","Diego","Jean","Fabien")
 
performanceG <- c(215,213,213,235,201,224,208,206,233,210,229,222,233,215,214,234,200,237,237,230,231,234,207,203)
names(performanceG) <- c("Ruy","Eric","Bastien","Claude","Diego","Francois","Karim","Youssef","Vincent","Cedric","Thimothee","Paul","Julien","Philippe","Matteo","Fabien","Adrien","Christian","Jean","David","Jacques","Benoit","Pierre","Michel")
 
tailleF <- c(185,180,182,172,165,178,175,NA,181,180,169,180,178,170,181,183,173,182,NA,176,171,178,164)
names(tailleF) <- c("Ana","Angelique","Aurelia","Chen","Cheryl","Chloe","Christine","Emilie","Emmannuelle","Estelle","Fatima","Irene","Jacqueline","Julie","Juliette","Karen","Katia","Lucie","Magali","Marion","Mathilde","Mireille","Zoe")
 
performanceF <- c(209,193,207,200,196,191,192,193,195,194,196,191,205,201,193,199,205,208,194,195,204,208,191,192,194,202)
names(performanceF) <- c("Sandrine","Mireille","Mathilde","Marion","Magali","Lucie","Liza","Katia","Karen","Juliette","Julie","Josette","Irene","Fatima","Estelle","Emmannuelle","Emilie","Elsa","Delphine","Christine","Chloe","Cheryl","Chen","Aurelia","Angelique","Ana")

save(tailleG,performanceG,tailleF,performanceF, file="donnees/Chapitre7.RData")