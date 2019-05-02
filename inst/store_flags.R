
library(magick)

# Reading stored png images in png1 folder (store folder with
# png images in folder png1)

lf1 <- list.files(path="png1", pattern="\\.png$", full.names = TRUE)
images <- lapply(lf1, image_read)

# resize images to 100X100 it is not reccomended to be larger
# for more items use larger resize for example 50 x 50
image_rszd <- lapply(images, image_resize, "100x100")

#converts images to raster, and names it
.flaglist <- lapply(image_rszd, as.raster)
names(.flaglist) <- tolower(gsub("^png1/|\\.png", "", lf1))

#saving and removing files not needed
usethis::use_data(.flaglist, overwrite = TRUE, compress = TRUE)
file.remove("data/lflags.rda")
file.rename("data/.flaglist.rda", "data/lflags.rda")
unlink("png1", recursive=TRUE)
