source("common.R")

#' plot3 is a superimposed graph of all the sub-metering data series with
#' a legend identifying the different meterings by color.
#'
#' @references `plot`, `lines`, `legend`
plot3.draw <- function() {
    local <- get.data()
    x <- local$DateTime
    sub1 <- local$Sub_metering_1
    sub2 <- local$Sub_metering_2
    sub3 <- local$Sub_metering_3

    # Sub_metering_1 has the largest range in y of all the data series so plot that
    # as the main data.
    plot(x, sub1, type = "l", xlab = "", ylab = "Energy sub metering")

    # then plot the other series on top of the graph with lines
    lines(x, sub2, col = "red")
    lines(x, sub3, col = "blue")

    # draw the legend
    legend("topright",
           lwd = 1,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"))
}

#' Creates and saves the third plot from the assignment.
#'
#' @references `save.graph`
plot3 <- function() {

    # save the plot to file
    save.graph("plot3.png", plot3.draw)
}
