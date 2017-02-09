library(ggplot2)
bbi<-element_text(face="bold.italic", color="black")

normal_6 <- data.frame(rating = round(rnorm(1000, mean=6, sd=1.2), 0))

weird_6 <- data.frame(rating = round(rbeta(1000, 0.5, 0.5)*13, 0))

hot <- c(9,10)
not <- c(1,2)

weird_6[weird_6$rating>10,] <- sample(hot, sum(weird_6$rating>10), replace=T)
weird_6[weird_6$rating<1,] <- sample(not, sum(weird_6$rating<1), replace=T)

mean(normal_6$rating)
mean(weird_6$rating)


ggplot(dat, aes(x=normal_6, fill=..x..)) + geom_bar() +
  scale_x_continuous(limits=c(0,11), breaks=1:10, labels=1:10)+
  scale_fill_gradient("Legend",low = "blue", high = "red", guide = "none") +
  theme(title=bbi,
        plot.title = element_text(size=16),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x=element_blank(),
        axis.text.x = element_text(size=12)) +
  labs(title="Conventional 'Six'")

ggplot(dat, aes(x=rating, fill=..x..)) + geom_bar() +
  scale_x_continuous(limits=c(0,11), breaks=1:10, labels=1:10)+
  scale_fill_gradient("Legend",low = "blue", high = "red", guide = "none") +
  theme(title=bbi,
        plot.title = element_text(size=16),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x=element_blank(),
        axis.text.x = element_text(size=12)) +
  labs(title="Controversial 'Six'")



