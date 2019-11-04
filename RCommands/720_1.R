#data = read.table(file='Desktop/720assign1/data/allPosts.tsv',sep='\t',header=TRUE)
#data = read.table(file='Desktop/720assign1/data/allPosts-metaData.tsv',sep='\t',header=TRUE)
data = as.matrix(read.table(file='Desktop/720assign1/data/askerAnswer.tsv',sep='\t',header=TRUE))
gplot(data)
deg = degree(data)
x = sort(x=deg,decreasing = TRUE)
N = 12
s = {}
index = order(deg,decreasing = TRUE)[1:N]
for (i in 1:N){
  a = which(data[index[i],]!=0)
  b = which(data[,index[i]]!=0)
  s = union(s,union(a,b))
}
s = union(index,s)
giant_components = data[s,s]
gplot(giant_components)
write.table(giant_components,file='Desktop/720assign1/data/asker-answerer-giant.tsv',sep="\t")
