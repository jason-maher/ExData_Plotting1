source("common.R")


#' plot1 is just a simple histogram of the 'Global_active_power' column in the dataset
#' with some extra formatting.
#'
#' @references `hist`
plot1.draw <- function() {
    local <- get.data()
    hist(local$Global_active_power,
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)",
         col = "red")
}

#' Creates and saves the first plot from the assignment.
#'
#' @references `save.graph`
plot1 <- function() {
    save.graph("plot1.png", plot1.draw)
}
