library(caret)
library(randomForest)
data <- read.csv("pml-training.csv")
data_train <- data[,c("roll_belt","pitch_belt","yaw_belt","total_accel_belt","gyros_belt_x","gyros_belt_y","gyros_belt_z",
"accel_belt_y","accel_belt_z","magnet_belt_x","magnet_belt_y","magnet_belt_z","roll_arm","pitch_arm","yaw_arm","total_accel_arm",
"gyros_arm_x","gyros_arm_y","gyros_arm_z","accel_arm_y","accel_arm_z","magnet_arm_x","magnet_arm_y","magnet_arm_z",
"roll_dumbbell","pitch_dumbbell","yaw_dumbbell","total_accel_dumbbell","gyros_dumbbell_x","gyros_dumbbell_y","gyros_dumbbell_z",
"accel_dumbbell_y","accel_dumbbell_z","magnet_dumbbell_x","magnet_dumbbell_y","magnet_dumbbell_z","roll_forearm","pitch_forearm",
"yaw_forearm","total_accel_forearm","gyros_forearm_x","gyros_forearm_y","gyros_forearm_z","accel_forearm_y","accel_forearm_z",
"magnet_forearm_x","magnet_forearm_y","magnet_forearm_z","classe")]

inTrain  <- createDataPartition(y=data_train$classe, p= 0.7, list=FALSE)
training <- data_train[inTrain,]
testing <- data_train[-inTrain,]
set.seed(111)
rf <- randomForest(classe ~ ., data= training, ntree=500)
pred <- predict(rf,testing)
confusionMatrix(testing$classe,pred)
table(testing$classe,pred)

data_test <- read.csv("pml-testing.csv")
test <- data_test[,c("roll_belt","pitch_belt","yaw_belt","total_accel_belt","gyros_belt_x","gyros_belt_y","gyros_belt_z",
                      "accel_belt_y","accel_belt_z","magnet_belt_x","magnet_belt_y","magnet_belt_z","roll_arm","pitch_arm","yaw_arm","total_accel_arm",
                      "gyros_arm_x","gyros_arm_y","gyros_arm_z","accel_arm_y","accel_arm_z","magnet_arm_x","magnet_arm_y","magnet_arm_z",
                      "roll_dumbbell","pitch_dumbbell","yaw_dumbbell","total_accel_dumbbell","gyros_dumbbell_x","gyros_dumbbell_y","gyros_dumbbell_z",
                      "accel_dumbbell_y","accel_dumbbell_z","magnet_dumbbell_x","magnet_dumbbell_y","magnet_dumbbell_z","roll_forearm","pitch_forearm",
                      "yaw_forearm","total_accel_forearm","gyros_forearm_x","gyros_forearm_y","gyros_forearm_z","accel_forearm_y","accel_forearm_z",
                      "magnet_forearm_x","magnet_forearm_y","magnet_forearm_z")]
pred2 <- predict(rf,test)