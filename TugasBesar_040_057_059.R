#pengaturan lokasi direktori
setwd("D:/RStudio/Glass Classification")
#membaca dataset
dataset <- read.csv("glass.csv", sep = ",")
#melihat struktur object
str(dataset)
#install package pendukung
install.packages("dplyr")
#load library
library("dplyr")
library("caret")
library("lattice")
library("ggplot2")
#melihat beberapa sample data
sample_n(dataset, 10)
#membagi data menjadi data training dan testing
set.seed(123)
training.sample <- dataset$Type %>%
createDataPartition(p = 0.8, list = FALSE)  
train.data <- dataset[training.sample, ]
test.data <- dataset[-training.sample, ]
#install package rpart
install.packages("rpart")
#load library rpart
library("rpart")
#membangun model
set.seed(123)
model <- rpart(Type ~., data = train.data, method = "class")
#menampilkan 
par(xpd = NA)
plot(model)
text(model, digits = 3)
#prediksi data testing
predicted.classes <- model %>% predict(test.data, type = "class")
#menamppilkan beberapa nilai dari object yang diprediksi
head(predicted.classes)
#menampilkan bebrapa nilai dari object sebenarnya
head(test.data$Type)
#membandingkan prediksi dengan nilai asli lalu dirata-ratakan
mean(predicted.classes == test.data$Type)
#menampilkan hasil prediksi
summary(predicted.classes)
