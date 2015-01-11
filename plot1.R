source("common.R")

#' Creates and saves the first plot from the assignment.
#'
#' @references `hist`
plot1 <- function() {

    # plot1 is just a simple histogram of the 'Global_active_power' column in the dataset
    # with some extra formatting.
    draw <- function() {
        local <- get.data()
        hist(local$Global_active_power,
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)",
             col = "red")
    }

    # save the plot to file
    save.graph("plot1.png", draw)
}
