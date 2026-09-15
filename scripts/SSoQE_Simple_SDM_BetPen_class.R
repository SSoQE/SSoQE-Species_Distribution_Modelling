#### Species distribution model of Betula pendula in Germany ####

# aim: build SDM for the tree species Betula pendula using a simple sdm

# packages ----
library(terra)

# data ----
dat <- read.csv2("./data/data_SDM.csv")[,-1]

# bio 4 = temperature seasonality
# bio 9 = mean temperature of driest month
# bio 14 = mean precipitation of driest month

env <- rast("./data/bioclim_data.tif")
plot(env)

# model ----
glm_out <- glm(PA ~ wc2.1_30s_bio_4 + wc2.1_30s_bio_9 +  wc2.1_30s_bio_14, family = "binomial", data = dat)


# projection ----
glm_proj <- predict(env, glm_out, type= "response")

plot(glm_proj)

# save output ----


library(geodata)