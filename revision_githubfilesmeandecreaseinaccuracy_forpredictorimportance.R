install.packages("randomForest")
install.packages("hrbrthemes")

library(randomForest)
library (ggplot2)
library (dplyr)
library(hrbrthemes)

# import list of features that you need to perform variance thresholding 

df <- read.csv("C:/PSMAradiomics_export/analysisforshortpaper/forfeatureselection/combinedpredictors_formda.csv")
df$survevent = as.factor(df$mfs_survevent) # make dependent variable as a factor (categorical)
str(df)

# now build the random forest and view it

rf <- randomForest(survevent~., data=df, ntree = 500, importance=TRUE) # importance is set to true, to make sure that the importance of the predictors is assessed.

print(rf)

#Evaluate variable importance
# mean decrease in accuracy indicates how much model performance decreases if we drop that variable
# maximum decrease in accuracy indicates most importanct variable
# top MDA-valued featurs chosen as predictors for modeling
