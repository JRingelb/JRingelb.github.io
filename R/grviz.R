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

text_ex <- 'graph LR;
    A-->B;
    B-->C;
    C-->D;
    D-->E;
    linkStyle 3 stroke:#ff3,stroke-width:4px,color:red;'
mermaid(diagram = text_ex)


mermaid("
gantt
        dateFormat  YYYY-MM-DD
        title Adding GANTT diagram functionality to mermaid

        section A section
        Completed task            :done,    des1, 2014-01-06,2014-01-08
        Active task               :active,  des2, 2014-01-09, 3d
        Future task               :         des3, after des2, 5d
        Future task2               :         des4, after des3, 5d

        section Critical tasks
        Completed task in the critical line :crit, done, 2014-01-06,24h
        Implement parser and jison          :crit, done, after des1, 2d
        Create tests for parser             :crit, active, 3d
        Future task in critical line        :crit, 5d
        Create tests for renderer           :2d
        Add to mermaid                      :1d

        section Documentation
        Describe gantt syntax               :active, a1, after des1, 3d
        Add gantt diagram to demo page      :after a1  , 20h
        Add another diagram to demo page    :doc1, after a1  , 48h

        section Last section
        Describe gantt syntax               :after doc1, 3d
        Add gantt diagram to demo page      : 20h
        Add another diagram to demo page    : 48h
")

mermaid("
graph TB
    sq[Square shape] --> ci((Circle shape))

    subgraph A subgraph
        od>Odd shape]-- Two line<br>edge comment --> ro
        di{Diamond with <br/> line break} -.-> ro(Rounded<br>square<br>shape)
        di==>ro2(Rounded square shape)
    end

    %% Notice that no text in shape are added here instead that is appended further down
    e --> od3>Really long text with linebreak<br>in an Odd shape]

    %% Comments after double percent signs
    e((Inner / circle<br>and some odd <br>special characters)) --> f(,.?!+-*ز)

    cyr[Cyrillic]-->cyr2((Circle shape Начало));

     classDef green fill:#9f6,stroke:#333,stroke-width:2px;
     classDef orange fill:#f96,stroke:#333,stroke-width:4px;
     class sq,e green
     class di orange
")
