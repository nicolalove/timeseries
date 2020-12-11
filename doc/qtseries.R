## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(timeseries)
library(gapminder)
library(dplyr)

## ----dummy dataset setup------------------------------------------------------
testdf <- data.frame(year = rep(seq(from = 1980, to= 1990, 1), 3),
                       rainfall = c(rnorm(11, 100, 30), rnorm(11, 70, 10),rnorm(11, 20, 20)),
                       temp = c(rnorm(11, 70, 30), rnorm(11, 100, 10),rnorm(11, 45, 20)),
                       daysofsun = c(NA, NA, rnorm(9, 280, 50), rnorm(11, 300, 30), NA, rnorm(10, 340, 15)),
                       region = c(rep("A",11), rep("B", 11), rep("C", 11)))

## ----example 1----------------------------------------------------------------
qtseries(testdf, year, daysofsun, region, verbose = TRUE)

## ----example 2----------------------------------------------------------------
qtseries(gapminder %>%
            filter(continent == "Europe"), year, pop, country, verbose = TRUE)

## ----example 3: Errors, error=TRUE--------------------------------------------
qtseries(gapminder %>%
            filter(continent == "Americas"),continent, pop, country, verbose = TRUE)

qtseries(gapminder %>%
              filter(continent == "Europe"),year, country, continent, verbose = TRUE)

