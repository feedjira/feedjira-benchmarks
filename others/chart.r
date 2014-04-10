data <- read.csv("results.csv")
y_max <- as.integer(max(data)) + 1
png(file="others-benchmark.png",width=600,height=400)
par(mar=c(4, 4, 4, 2))
barplot(as.matrix(data), main="Comparison of other Ruby feed libraries", col="#0e8292", ylim=c(0, 50))
dev.off()
