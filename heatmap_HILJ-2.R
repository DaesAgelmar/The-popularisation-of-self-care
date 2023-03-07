library(ComplexHeatmap)
library(circlize)
library(colorspace)
library(GetoptLong)

rm(list=ls(all=TRUE))
setwd("C:/Users/Dell-vestro5568/Desktop/R Project")
data1=read.csv(file = "oremdata2.csv",sep=",", row.names=1)
oremdata<-as.matrix(data1)
df<-scale(oremdata,center = TRUE,scale = TRUE)

library(dendextend)
dend = hclust(dist(df))
dend = color_branches(dend, k = 2)
png(file="deneme-heatmap.png",width = 90*300,height = 60*300,res = 1000,pointsize = 12) 

sh<-Heatmap(df,
        name = "Density",
        col = colorRamp2(c(-4, 0, 4), c("blue", "white", "red")),
        column_title = "Heatmap of SCDNT WC Categories",
        row_title = "Theory Versions",
        column_title_gp = gpar(fontsize = 14, fontface = "bold"),
        row_title_gp = gpar(fontsize=14,fontface="bold"),
        column_names_side = "bottom",
        column_dend_height =unit(25, "mm"),
        column_names_gp = gpar(fontsize = 9),
        column_names_max_height = unit(85, "mm"),
        clustering_distance_rows = "pearson",
        row_names_centered = TRUE, 
        column_names_centered = FALSE,
        cluster_rows = dend)

draw(sh)
dev.off()