library(ggflags)
library(gridExtra)
library(grid)

lf <- names(.flaglist)
lg <- lapply(.flaglist, rasterGrob, height=unit(5,"mm"))

gl <- mapply(function(x,y) arrangeGrob(x, top=y), x=lg, y=lf, SIMPLIFY = FALSE)

ggsave("inst/demo/flags.pdf", grid.arrange(grobs=gl), width=10, height=10)
ggsave("README_files/figure-markdown_github/flags.png", grid.arrange(grobs=gl), width=8, height=8)
