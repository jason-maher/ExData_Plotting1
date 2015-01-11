source("common.R")

#' plot2 is just a simple line graph of 'Global_active_power' over time with some extra
#' formatting.
#'
#' @references `plot`
plot2.draw <- function() {
    local <- get.data()
    x <- local$DateTime
    y <- local$Global_active_power
    plot(x, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
}

#' Creates and saves the second plot from the assignment.
#'
#' @references `save.graph`
plot2 <- function() {
    save.graph("plot2.png", plot2.draw)
}
