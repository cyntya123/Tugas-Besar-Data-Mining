#Set working direktori
setwd("D:/RStudio/Travel Reviews")
#Membaca dataset yang akan digunakan
dataset <- read.csv("tripadvisor_review.csv", sep = ",")
#Memilah kolom yang memiliki nilai Numeric
data.numeric <- dataset[2:11]
#install package ggplot 2, fungsi : untuk membuat grafik yang mereprentasikan data numerik dan kategorik
install.packages("ggplot2")
#load Library
library(ggplot2)
library(cluster)
library(factoextra)
library(tidyverse)
#Menentukan jumlah cluster
fviz_nbclust(data.numeric, kmeans, method = "wss") #Elbow Curve dengan hasil = K2
fviz_nbclust(data.numeric, kmeans, method = "silhouette") #hasil = K2
set.seed(123)
gap_stat <- clusGap(data.numeric, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 100)
fviz_gap_stat(gap_stat)
#Membuat Cluster
klaster <- kmeans(data.numeric, 2, nstart = 25)
#Menampilkan hasil Clustering
print(klaster)
#Grafik Cluster
fviz_cluster(klaster, data = data.numeric)
