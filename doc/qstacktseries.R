## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(timeseries)
library(gapminder)
library(dplyr)

## ----dataset------------------------------------------------------------------
  testdf <- data.frame(year = rep(seq(from = 1980, to= 1990, 1), 3),
                       rainfall = c(runif(11, 0, 100), rnorm(11, 70, 10),
                                    rnorm(11, 20, 20)),
                       temp = c(rnorm(11, 70, 30), rnorm(11, 45, 20), 
                                rnorm(11, 100, 10)),
                       daysofsun = c(NA, NA, rnorm(9, 280, 50), rnorm(11, 300, 30), NA, 
                                     rnorm(10, 340, 15)),
                       region = c(rep("A",11), rep("B", 11), rep("C", 11)))

## ----example 1----------------------------------------------------------------
qstacktseries(testdf, year, rainfall, region, verbose = TRUE)

## ----example 2----------------------------------------------------------------
qstacktseries(gapminder %>%
                filter(continent == "Asia"), year, gdpPercap, country, verbose = TRUE)

## ----example 3: Errors, error=TRUE--------------------------------------------

qstacktseries(gapminder %>%
                filter(continent == "Asia"),continent, pop, country, verbose = TRUE)

qstacktseries(gapminder %>%
                filter(continent == "Africa"), year, country, continent, verbose = TRUE)

