train <- read.csv("/Users/qianj/Documents/Kaggle_Competition/PlayGround/Regression with a Flood Prediction Dataset/train.csv")

x_train <- train[c('MonsoonIntensity','TopographyDrainage',"TopographyDrainage",
                   "RiverManagement","Deforestation","ClimateChange","DamsQuality",
                   "Siltation","AgriculturalPractices","Encroachments",
                   "IneffectiveDisasterPreparedness","DrainageSystems","CoastalVulnerability",
                   "Landslides","Watersheds","DeterioratingInfrastructure","PopulationScore",
                   "WetlandLoss","InadequatePlanning","PoliticalFactors")]
y_train <- train[c("FloodProbability")]

LM = lm (FloodProbability ~ MonsoonIntensity+TopographyDrainage+TopographyDrainage+
         RiverManagement+Deforestation+ClimateChange+DamsQuality+
         Siltation+AgriculturalPractices+Encroachments+
         IneffectiveDisasterPreparedness+DrainageSystems+CoastalVulnerability+
         Landslides+Watersheds+DeterioratingInfrastructure+PopulationScore+
         WetlandLoss+InadequatePlanning+PoliticalFactors,data=train)
summary(LM)

#p-value IS significantly small, the model as a whole is a significant.
# The F test yields a significant result which implies at least one of the predictors
# is a significant predictor

x_test <- read.csv("/Users/qianj/Documents/Kaggle_Competition/PlayGround/Regression with a Flood Prediction Dataset/test.csv")
y_test <- predict(LM,data=x_test)
result <- data.frame(x_test$id,y_test)
result
