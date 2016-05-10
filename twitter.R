install.packages(c('igraph', 'twitteR'))
library(igraph)
library(twitteR)

consumer_key <- "2FOY2RlbgYR7xpWmuMpBSu4Gr"
consumer_secret <- "2xDCaEVtuuUFINsOF4tj674kJWtBcmylL0w5oNc0M9616qu2Cc"
access_token <- "730111236365557760-gJQGf41dtiBFB4bCcOeE1HYSGD7ibo3"
access_secret <- "ywR843dpoUbfU1L5bcedPfPRqOylEIwcEvZRPb0MyBnku"
options(httr_oauth_cache=T)
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


user<-getUser("tdv1111") 


friends.object<-lookupUsers(user$getFriendIDs())
followers.object<-lookupUsers(user$getFollowerIDs())

n<-19
friends <- sapply(friends.object[1:n],function(x) x$name)
followers <- sapply(followers.object[1:n],function(x) x$name)

relations <- merge(data.frame(User="tdv1111", Follower=friends), 
                   data.frame(User=friends,  Follower=friends), 
                   all=T)

g <- graph.data.frame(relations, directed = T)
V(g)$label <- V(g)$name

betweenness(g)
closeness(g)
eigen_centrality(g)

plot(g, edge.arrow.size=.4, edge.color="green")