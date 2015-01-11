
#' Loads the data file 'household_power_consumption.txt' which is assumed to exist in the
#' current directory. The Date and Time columns and converted from `character` into `Date` and
#' `POSIXlt` respectively, additionally a 'DateTime' column is appeneded which is the joining
#' of those two columns.
#'
#' @return the contents of the text file as a `data.frame`
#' @references ttps://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
load.data <- function() {
    message("loading the data file...")
    # Read in the whole csv file leaving strings intact
    data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F, na.strings = "?")
    message("done!")

    # convert the date and time strings, the source doesn't specify the timezone (and
    # it likely isn't important) but since the data was donated by a French institution
    # we'll assume Central European Time
    message("running conversions...")
    data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S", tz = "CET")
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y", tz = "CET")
    data$Time <- strptime(data$Time, format = "%H:%M:%S", tz = "CET")
    message("done!")

    data
}

#' A caching wrapper around `load.data` that keeps the data in a hidden variable in the enclosing
#' scope. To bypass the cache call `load.data` directly. To clear the cache do `rm(.data.cache)`
#'
#' @param dates a vector of dates to subset out of the main data, if empty/NULL the whole set
#'        is returned
#' @return the result of `load.data`, or a cached result of that function, subsetted to a date
#'         range
get.data <- function(dates = c("2007-02-01", "2007-02-02")) {
    if (exists(".data.cache")) {
        data <- .data.cache
    } else {
        data <- load.data()
        .data.cache <<- data
    }
    if(is.null(dates)) {
        data
    } else {
        data[data$Date %in% as.Date(dates), ]
    }
}

#' Executes a plotting function and saves the results to disk.
#'
#' @param filename the name of the file to save the plot to.
#' @param drawfunc the function that will do the drawing/plotting.
#' @param filefunc the function that will setup the device for accepting the graph
#'                 date. defaults to `png`.
#' @param rm.file should the file be deleted before running drawfunc/filefunc? Defaults
#'                to TRUE.
#' @param ... args splat to pass to `filefunc`.
save.graph <- function(filename, drawfunc, filefunc = png, rm.file = T, ...) {
    if (rm.file && file.exists(filename)) {
        file.remove(filename)
    }
    filefunc(filename, ...)
    drawfunc()
    dev.off()
}

