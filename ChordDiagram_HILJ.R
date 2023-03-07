rm(list=ls(all=TRUE))
setwd("C:/Users/Dell-vestro5568/Desktop/R Project") # çalışma ortamını belirleyen kodumuz
data1=read.csv(file = "oremdata3.csv",sep=",", row.names=1)
oremdata<-as.matrix(data1)
inverse_oremdata=t (oremdata)

png(file="Chord-Diag_HigRes.png",width = 90*300,height = 60*300,res = 1000,pointsize = 16) 

library(RColorBrewer)
sh=brewer.pal(n = 12, name = "Spectral")

library(circlize)
circos.clear()
df = data.frame(from = rep(rownames(inverse_oremdata), times = ncol(inverse_oremdata)),
                to = rep(colnames(inverse_oremdata), each = nrow(inverse_oremdata)),
                value = as.vector(inverse_oremdata),
                stringsAsFactors = FALSE)

circos.par("track.height" = 1)
circos.par(gap.after = c(rep(10, nrow(oremdata)-1), 15, rep(10, ncol(oremdata)-1), 10))
col = rand_color(nrow(df))
circos.par(start.degree = 0)


chordDiagramFromDataFrame(
  df,
  grid.col = NULL,
  grid.border = NA,
  transparency = 0,
  col = sh,
  order = NULL,
  directional = 1,
  xmax = NULL,
  direction.type = "diffHeight",
  diffHeight = convert_height(-1, "mm"),
  link.target.prop = TRUE,
  target.prop.height = mm_h(1),
  reduce = 1e-5,
  self.link = 2,
  preAllocateTracks = NULL,
  annotationTrack = c("name", "grid","axis"),
  annotationTrackHeight = convert_height(c(2, 1), "mm"),
  link.border = "red",
  link.lwd = par("lwd"),
  link.lty = par("lty"),
  link.auto = TRUE,
  link.sort = FALSE,
  link.decreasing = TRUE,
  link.arr.lty = par("lty"),
  link.arr.lwd = par("lwd"),
  link.arr.col = par("col"),
  link.largest.ontop = FALSE,
  link.visible = df[[3]] >= 2,
  link.rank = NULL,
  link.zindex = seq_len(nrow(df)),
  link.overlap = FALSE,
  scale = FALSE,
  group = NULL,
  big.gap = 10,
  small.gap = 1,
  plot = TRUE,)

dev.off()
