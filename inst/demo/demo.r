library(ggflags)

data(lflags)
set.seed(1235)
d <- data.frame(x=rnorm(10), y=rnorm(10), 
                country=sample(c("yu", "dr-de", "gb"), 50, TRUE), 
                stringsAsFactors = FALSE)
ggplot(d, aes(x=x, y=y, country=country, size=x)) + 
  geom_flag() +
  scale_country()
