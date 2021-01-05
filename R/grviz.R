Graph_data <- data.frame("R Communities" = rnorm(1000,1,1),"Other Communities" = rnorm(1000,0,1),check.names = F) %>% 
  pivot_longer(cols = 1:2, names_to = "Community", values_to = "Data")

Graph_data %>%
  ggplot(aes(x=`Data`) ) +
  geom_density(aes(fill=`Community`), alpha=0.8) +
  xlab("Community Interest in Reproducibility/Research") +
  ylab("") + 
  scale_x_continuous(breaks=c(-2,4), labels=c("Low Priority", "High Priority")) +
  scale_y_continuous(breaks=NULL) +
  title(main = "Unnecessary Visual Graph")

install.packages("DiagrammeR")
library(DiagrammeR)

grViz('
digraph G {
  rankdir=LR
  graph[bgcolor = "#FDFDFD"]
  edge[style=invis]
  node[fontname = "helvetica", width = 1.5, height = 0.5, fontsize=12]
  
  subgraph cluster_accepted {
    node [shape=box,style=filled, fillcolor = red];
    label = "@@1";
    style=dashed;
    color= "#625a5a";
    fontname = "helvetica-bold";
    
    node [shape=box, style=filled, color=black, fillcolor = "#91cf60"];
    a0[label = "Approved"]
    a1[label = "Awaiting \n Construction"]
    a2[label = "Decommissioned"]
    a3[label = "Operational"]
    a4[label = "Under \n Construction"]
    a5[label = "No Application \n Required"]
    
    a0 -> a2
    a1 -> a5
    
  }
  
  subgraph cluster_submitted {
    node [shape=box, style = filled, color=black, fillcolor = "#fee08b"];
    label = "@@2";
    style=dashed;
    color= "#625a5a";
    
    fontname = "helvetica-bold";
    
    s0[label = "In Planning"]
    s1[label = "Connection \n Applied For"]
    s3[style=invis]
    s4[style=invis]
    
  }
  
  subgraph cluster_rejected {
    node [shape=box, style = filled, color=black, fillcolor = "#fc8d59
"];
    label = "@@3";
    style=dashed;
    fontname = "helvetica-bold";
    color="#625a5a"
    
    b0[label = "Refused"]
    b1[label = "Withdrawn"]
    b2[label = "No Application \n Made"]
    b3[label = "Abandoned"];
    
    
  }
  
  a2 -> s0 -> b0
}
')

mermaid("
graph LR
A(Rounded)-->B[Rectangular]
B-->C{A Rhombus}
C-->D[Rectangle One]
C-->E[Rectangle Two]
")
