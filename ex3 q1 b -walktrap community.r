install.packages("igraph")
library("igraph")
actors <- read.table("ga_actors.csv", header = TRUE, sep = ",")
edgelist <- read.table("c:/ga_edgelist.csv", header = TRUE, sep = ",")
g <- graph.data.frame(edgelist, directed=TRUE, vertices=actors)
g <- simplify(g)
wtg =walktrap.community(g, weights = E(g)$weight, steps = 4, merges =
                     TRUE, modularity = TRUE, membership = TRUE)
