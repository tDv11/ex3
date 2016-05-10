install.packages("igraph")
library("igraph")
actors <- read.table("ga_actors.csv", header = TRUE, sep = ",")
edgelist <- read.table("ga_edgelist.csv", header = TRUE, sep = ",")
g <- graph.data.frame(edgelist, directed=TRUE, vertices=actors)
g <- simplify(g)
set.seed(100)
lay <- layout.kamada.kawai(g)
fc <- edge.betweenness.community(g)
fc$modularity
memb <- community.to.membership(g, fc$merges, which.max(fc$modularity))
colors <- rainbow(max(membership(fc)))
plot(g,edge.arrow.size=.2,vertex.color=colors[membership(fc)],
     layout=lay)
