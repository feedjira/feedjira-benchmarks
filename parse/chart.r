data <- read.csv("results.csv", header=TRUE)
y_max <- as.integer(max(data$time)) + 1
tag_length <- length(data$tag)

png(file="parse-benchmark.png",width=600,height=400)
par(mar=c(4, 4, 4, 2))
plot(data$time, type="l", ylim=c(0, y_max), col="#0e8292", ylab="", xlab="", xaxt="n", main="Benchmarking Feedjira's Parse Method At Each Version (results in seconds)", lwd=3)
axis(1, at=c(1:tag_length), labels=FALSE)
text(c(1:tag_length), par("usr")[3] - 0.22, labels=data$tag, srt=45, pos=3, xpd=TRUE, cex=0.8)
dev.off()
