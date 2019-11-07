
install.packages("SNA")
library(SNA)
install.packages("igraph")
library(igraph)
install.packages("CINNA")
library(CINNA)


#data = read.table(file='Desktop/720assign1/data/allPosts.tsv',sep='\t',header=TRUE)
#data = read.table(file='Desktop/720assign1/data/allPosts-metaData.tsv',sep='\t',header=TRUE)
#data = as.matrix(read.table(file='Desktop/720assign1/data/askerAnswer.tsv',sep='\t',header=TRUE))

gplot(data)

graph = graph_from_adjacency_matrix(data, mode = "directed")
giant_components = giant_component_extract(graph, directed = TRUE)
plot(giant_components[[1]],vertex.label = NA,vertex.size = 7,edge.arrow.size = 0.5)

a = giant_components[[2]]
s={}

for (i in 1:length(a[,1])){
  for (j in 1:length(a[1,])){
    x = gsub("X","",a[i,j])
    y = as.numeric(as.character(x))
    s = union(s,y)
  }
 
}
giant_components = data[s,s]
#gplot(giant_components)
write.table(giant_components,file="C:/Users/ylou2/Desktop/data/asker-answerer-giant.tsv",sep="\t")
