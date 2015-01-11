source("common.R")
source("plot2.R")
source("plot3.R")

#' Plot4 is a combination of 4 different plots into a single square layout:
#'
#'      1. top-left: The `plot2` graph.
#'      2. top-right: A line graph of the Voltage data series over time.
#'      3. bottom-left: The `plot3` graph.
#'      4. bottom-right: A line graph of the Global_reactive_power series over time.
#'
#' @references `plot2`, `plot3`, `par`
plot4.draw <- function() {

    # Draws the Voltage graph
    voltage <- function() {
        local <- get.data()
        x <- local$DateTime
        y <- local$Voltage
        plot(x, y, xlab = "datetime", ylab = "Voltage", type = "l")
    }

    # Draws the Global_reactive_power graph
    reactive <- function() {
        local <- get.data()
        x <- local$DateTime
        y <- local$Global_reactive_power
        plot(x, y, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
    }

    # Draws all four graphs into a 2x2 layout in clockwise order
    par(mfrow = (c(2, 2)))
    plot2.draw("Global Active Power")    # top-left
    voltage()       # top-right
    plot3.draw()    # bottom-left
    reactive()      # bottom-right
}

#' Creates and saves the fourth plot from the assignment.
#'
#' @references `save.graph`
plot4 <- function() {
    save.graph("plot4.png", plot4.draw)
}
