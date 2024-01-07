potato <- read.csv("http://people.carleton.edu/~apoppick/ClassData/baked_potato.csv", 
                   header=TRUE)
head(potato)
# Calculate and median moistness by region
library(diplyr)
potato %>% group_by(GrowingArea) %>%
  summarize(meanMoistness = mean(Moistness),
            medianMostness = median(Moistness))
#clculate standard deviation and inter quartile range IQR
potato %>% group_by(GrowingArea) %>% summarize(sdMoistness = sd(Moistness),
                                               IQRMoistness = IQR(Moistness))
library(ggplot2)
ggplot(potato, aes(x = GrowingArea, y = Moistness)) + geom_boxplot() +
  labs(x = "Growing Area", y = "Moistness Score (1 - 4)")

#Base R
mean(potato$Moistness) #mean moistness across both regions

tapply(potato$Moistness, INDEX = potato$GrowingArea, FUN = mean)
tapply(potato$Moistness, INDEX = potato$GrowingArea, FUN = sd)
boxplot(Moistness ~ GrowingArea, data = potato, xlab = "Growing Area", ylab = "Moistness Score (1 - 4)")

