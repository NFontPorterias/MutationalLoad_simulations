###############################################
##########     PLOT SLiM OUTPUT     ##########
###############################################


#################################  
########## 1. Calculate Load
################################# 

########## 1.1 Model1

gens=c(6650,6652,6654, 6656, 6659)
Ne=c(327*2, 154*2,154*2,71*2, 71*2)


L <- matrix(0, nrow = length(gens), ncol=3)
colnames(L) <- c("Gen", "L", "RelativeLoad")
L[,1] <- gens

i=0
for (gen in gens){
  i=i+1
  out_slim <- read.table(paste0("Model1/",gen,".txt"))
  out_slim$q <- out_slim$V12/Ne[i] # Calculate frequency (q) of each mutation
  l = out_slim$V8*( 2*0.5*out_slim$q + (1-2*0.5)*(out_slim$q^2) ) # Calculate l = s×(2hq + (1-2h)q2 ) per mutation (In the additive model case, the 2nd part of equation=0 --> l =  s×(2hq) )
  L[i,2]= 1 - exp(sum(l)) # Calculate L = 1 - exp(∑i=0 li )
}

L[c(2:length(gens)),3] <- L[c(2:length(gens)),2]/L[1,2]
L[1,3] <- 1 # Ancestral Load = 1

########## 1.2 Model2 
gens=c(6650,6652,6654, 6656, 6659)
Ne=c(327*2, 154*2,154*2,71*2, 71*2)


L2 <- matrix(0, nrow = length(gens), ncol=3)
colnames(L2) <- c("Gen", "L", "RelativeLoad")
L2[,1] <- gens

i=0
for (gen in gens){
  i=i+1
  out_slim <- read.table(paste0("Model2/",gen,".txt"))
  out_slim$q <- out_slim$V12/Ne[i] # Calculate frequency (q) of each mutation
  l = out_slim$V8*( 2*0*out_slim$q + (1-2*0)*(out_slim$q^2) ) # Calculate l = s×(2hq + (1-2h)q2 ) per mutation (In the recessive model case, the 1st part of equation=0 --> l =  s×(q2) )
  L2[i,2]= 1 - exp(sum(l)) # Calculate L = 1 - exp(∑i=0 li )
}

L2[c(2:length(gens)),3] <- L2[c(2:length(gens)),2]/L2[1,2]
L2[1,3] <- 1 # Ancestral Load = 1


########## 1.3 Model3

gens=c(6650,6652,6654, 6656, 6659)
Ne=c(327*2, 154*2,154*2,71*2, 71*2)


L3 <- matrix(0, nrow = length(gens), ncol=3)
colnames(L3) <- c("Gen", "L", "RelativeLoad")
L3[,1] <- gens

i=0
for (gen in gens){
  i=i+1
  out_slim <- read.table(paste0("Model3/",gen,".txt"))
  out_slim$q <- out_slim$V12/Ne[i] # Calculate frequency (q) of each mutation
  l = out_slim$V8*( 2*0.5*out_slim$q + (1-2*0.5)*(out_slim$q^2) ) # Calculate l = s×(2hq + (1-2h)q2 ) per mutation (In the additive model case, the 2nd part of equation=0 --> l =  s×(2hq) )
  L3[i,2]= 1 - exp(sum(l)) # Calculate L = 1 - exp(∑i=0 li )
}

L3[c(2:length(gens)),3] <- L3[c(2:length(gens)),2]/L3[1,2]
L3[1,3] <- 1 # Ancestral Load = 1

########## 1.4 Model4
gens=c(6650,6652,6654, 6656, 6659)
Ne=c(327*2, 154*2,154*2,71*2, 71*2)

L4 <- matrix(0, nrow = length(gens), ncol=3)
colnames(L4) <- c("Gen", "L", "RelativeLoad")
L4[,1] <- gens

i=0
for (gen in gens){
  i=i+1
  out_slim <- read.table(paste0("Model4/",gen,".txt"))
  out_slim$q <- out_slim$V12/Ne[i] # Calculate frequency (q) of each mutation
  l = out_slim$V8*( 2*0*out_slim$q + (1-2*0)*(out_slim$q^2) ) # Calculate l = s×(2hq + (1-2h)q2 ) per mutation (In the recessive model case, the 1st part of equation=0 --> l =  s×(q2) )
  L4[i,2]= 1 - exp(sum(l)) # Calculate L = 1 - exp(∑i=0 li )
}

L4[c(2:length(gens)),3] <- L4[c(2:length(gens)),2]/L4[1,2]
L4[1,3] <- 1 # Ancestral Load = 1



################################# 
########## 2. Plot relative Load
#################################
library(ggplot2)
L_bind <- rbind(L, L2, L3, L4)
L_df <- as.data.frame(L_bind)
L_df$model <- c(rep("Additive", dim(L)[1]),rep("Recessive", dim(L2)[1]),rep("Additive.wogeneflow", dim(L3)[1]),rep("Recessive.wogeneflow", dim(L4)[1]))
L_df$Time <- c(c(82,62,42,22,0),c(82,62,42,22,0),c(82,62,42,22,0),c(82,62,42,22,0))

text_plot1 <- as.data.frame("Out-of-India")
text_plot2 <- as.data.frame("Out-of-Balkans")

pdf("Relative_Load_temporal.pdf", height = 4, width = 6.5)
ggplot(L_df, aes (x=Time, y=RelativeLoad) ) + 
  geom_vline(aes(xintercept = 64),col="lightgrey", size=5.5, alpha=0.6) +
  geom_vline(aes(xintercept = 38),col="lightgrey", size=5.5, alpha=0.6) +
  geom_point(size=0.5,aes(col=model)) + geom_point(pch=21, size=2,aes(col=model)) + geom_line(aes(col=model, linetype=model)) + 
  geom_text(data= text_plot1,mapping = aes(x = 64, y = 1.2, label = "Out-of-India"),col="black",angle=90, size=3.3) +
  geom_text(data= text_plot2,mapping = aes(x = 38, y = 1.2, label = "Out-of-Balkans"),col="black",angle=90, size=3.3) +
  ylim(c(0.85, 1.25)) + scale_x_reverse(breaks = seq(90, 0, by = -10),"Generations ago") +
  ylab(expression(L[g] / L[anc])) + 
  scale_linetype_manual(name="",values=c("solid","dashed","solid", "dashed","dotted"), labels = c("Additive", "Additive without gene flow","Recessive",  "Recessive without gene flow")) + 
  scale_color_manual(name="",values=c("midnightblue","midnightblue","black","black"), labels = c("Additive", "Additive without gene flow","Recessive",  "Recessive without gene flow")) +
  theme_linedraw() + theme(legend.text = element_text(size=10),
                           panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank(),
                           panel.grid.minor.y = element_blank(),
                           axis.title=element_text(size=11),
                           axis.text= element_text(size=10)) 
dev.off()
