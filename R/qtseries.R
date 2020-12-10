#' Quick Time Series Plot
#'
#' @param data A data frame or tibble where the inputs *time*, *voi* and *group* are stored.
#' @param time A numeric vector that represents time (year, month, day), stored in the data set *data*.
#' @param voi  A continuous, numeric vector stored in the data set *data* (this is your variable of interest that might have interesting variations over time).
#' @param group A character or factor vector that is used to group the numeric data, *voi*, in the specified data set, *data*.
#' @param round_values An optional argument that rounds the variable of interest (*voi*) to 3 digits (default = FALSE).
#' @param verbose An optional argument that that keeps the user up-to-date with the ongoing processes at each step of the graphing function (default = FALSE).
#' @param default_theme An optional argument that specifies a default theme: uses theme_minimal with bold plot title, legend title, and axis titles (default = TRUE).
#'
#' @importFrom ggplot2 ggplot aes geom_point geom_line labs theme_minimal theme element_text
#' @importFrom dplyr filter pull
#'
#' @return A ggplot object (a plot) depicting the temporal dynamics of some variable (*voi*) grouped by a factor variable (*group*) from the specified data set (*data*).
#'
#' @export
#'
#' @examples
#' qtseries(gapminder::gapminder, year, gdpPercap, country, round_values = TRUE,verbose = TRUE)
#'
#' qtseries(gapminder::gapminder %>%
#'          dplyr::filter(continent == "Americas"),
#'          year, lifeExp, country, verbose = TRUE)
qtseries <- function(data, time, voi, group, round_values = FALSE, verbose = FALSE, default_theme = TRUE) {
  if(!is.numeric(pull(data, {{ time }}))){
    stop("Sorry, the time variable needs to be a numeric variable!")}
  if(!is.numeric(pull(data, {{ voi }}))){
    stop("Sorry, the variable of interest (dependent) needs to be a numeric variable!")
  }
  if(verbose)cat("Plotting time series...")
  plot <- #if we want to round y-values
    if(round_values){
      ggplot2::ggplot(data, aes({{time}}, round({{voi}}, 3), color = {{group}}))+
        geom_point()+
        geom_line(alpha = .4)+
        labs(y = deparse(substitute(voi)), title = "Quick Time Series Plot")
    } else { # else we use raw y-values
      ggplot(data, aes({{time}}, {{voi}}, color = {{group}}))+
        geom_point()+
        geom_line(alpha = .4)+
        labs(y = deparse(substitute(voi)), title = "Quick Time Series Plot")
    }
  if(verbose)cat("Done labelling plot!")
  if(default_theme){ #default theme aesthetics
    plot <- plot + theme_minimal() + theme(plot.title = element_text(face = "bold"), axis.title = element_text(face = "bold"), legend.title = element_text(face = "bold"))
    if(verbose)cat("...Done applying default theme aesthetics!")
  }
  return(plot)
}

