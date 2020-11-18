
tseries <- function(data, time, voi, group, round_values = FALSE, verbose = FALSE, default_theme = TRUE) {
  if(verbose)cat("Plotting time series...")
  plot <- #if we want to round y-values
    if(round_values){
      ggplot(data, aes({{time}}, round({{voi}}, 3), color = {{group}}))+
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
    plot <- plot+ theme_minimal() + theme(plot.title = element_text(face = "bold"), axis.title = element_text(face = "bold"), legend.title = element_text(face = "bold"))
    if(verbose)cat("...Done applying default theme aesthetics!")
  }
  return(plot)
}

