library(DiagrammeR)
rm(list=ls(all=TRUE))
setwd("C:/Users/Dell-vestro5568/Desktop/R Project")
grViz(
  "digraph my_flowchart { 
      graph[splines = ortho]
      node [fontname = times, shape = box, width = 4, height = 1, fontsize=23]
      
        node1[label = <Data Collection<br/>Conduct search in WoK Database<br/>(n = 1408)>]
        node2[label = <Calculate Rao-Stirling Diversity Index>]
        node3[label = <Calculate and <br/> Visualize Integration Score>]
        blank1[label = '', width = 0.01, height = 0.01]
        excluded1[label = <Assigning WC Categories>]
        excluded2[label = <Visualize Cumulative Distribution of<br/> SCDTN Versions>]
        node4[label = <Visualize Heatmap of <br/> SCDTN Versions>]
        node5[label = <Visualize Overlay Map of  <br/> SCDTN Versions>]
        node6[label = <Visualize Chord Diagram of  <br/> SCDTN Versions>]
     
        node1 -> blank1[dir = none];
        node1 -> excluded1[minlen = 3];
        blank1 -> excluded2[minlen = 3];
        { rank = same; blank1 excluded1 } 
        
        blank1 -> node2;
        node2  -> node3;
        excluded1 -> node4;
        excluded1 -> node5
        excluded1 -> node6;
              
  }"
  
) 
