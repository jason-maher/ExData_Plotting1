source("common.R")

#' plot2 is just a simple line graph of 'Global_active_power' over time with some extra
#' formatting.
#'
#' @param ylab the label to use on the y-axis. Defaults to the one needed for plot2 in the
#'             assignment but can be overriden for plot4 which is slightly different.
#' @references `plot`
plot2.draw <- function(ylab = "Global Active Power (kilowatts)") {
    local <- get.data()
    x <- local$DateTime
    y <- local$Global_active_power
    plot(x, y, type = "l", xlab = "", ylab = ylab)
}

#' Creates and saves the second plot from the assignment.
#'
#' @references `save.graph`
plot2 <- function() {
    save.graph("plot2.png", plot2.draw)
}
