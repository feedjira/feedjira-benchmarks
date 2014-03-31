data <- read.csv("results.csv")
y_max <- as.integer(max(data)) + 1
png(file="fetch-benchmark.png",width=600,height=400)
par(mar=c(4, 4, 4, 2))
barplot(as.matrix(data), main="Fetching 100 URLs (in seconds)", col="#0e8292", ylim=c(0, y_max))
dev.off()
