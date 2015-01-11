source("common.R")

#' Creates and saves the second plot from the assignment.
#'
#' @references `plot`
plot2 <- function() {

    # plot2 is just a simple line graph of 'Global_active_power' over time with some extra
    # formatting.
    draw <- function() {
        local <- get.data()
        x <- local$DateTime
        y <- local$Global_active_power
        plot(x, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    }

    # save the plot to file
    save.graph("plot2.png", draw)
}
