
<!-- README.md is generated from README.Rmd. Please edit that file -->

\*\*NOTE: This small package is a Stat545b project, primarily for the
purpose of learning function & package development.

# timeseries

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

The goal of `timeseries` is to speed up the initial stages of data
exploration by providing a quick template for visualizing temporal
patterns in data set.

## Installation

``` r
devtools::install_github("nicolalove/timeseries", build_vignettes = TRUE, ref = "v0.2.0")
```

## Package Development

As per the specifications of the rubric for Exercise 1.1, I will now
explain how I created each part of my R package using the `devtools` and
`usethis` packages.

1.  I initialized the package project by loading `library(devtools)` in
    the RStudio console & used the `create_package` function to create
    the `timeseries` package.

2.  In a new script under the `timeseries` package R-Project, I manually
    coded the function `qtseries`, which I developed in *assignment 1-b*
    of this course. I used the `use_r()` function to save `qtseries` as
    an .R file in the subdirectory of the `timeseries` package,
    committed the changes and ran the `load_all()` function to make the
    `qtseries` function available. Finally, I used the *Check* button
    under the *Build* tab to ensure that everything was running smoothly
    so far (I did this several times after each numbered step to ensure
    that the small changes hadn’t caused any errors).

3.  I then updated the description file with the relevant information,
    and specified a license using `use_mit_license()` function. I made
    sure to update the description file with the dependencies I use in
    the function, examples and tests using the `use_package()` and
    `use_pipe()` functions.

4.  I used `roxygen2`comment style and tags using `@` to specify the
    document the `qtseries` function, mostly following along with the
    recorded first Stat545a lecture on R package development. I looked
    up some examples for writing functions using `ggplot2` as a
    dependency, and found that the `ggplot2` developers recommend using
    the `@importFrom` tag if the new function uses many lines of ggplot
    functions. This was especially helpful as using the `::` call for
    every line of ggplot functions was getting messy and made `qtseries`
    difficult to read. Once I specified all the relevant documentation,
    I used the `document()` function to save the `roxygen2` inputs.
    After running another `check()`, I installed the `timeseries`
    package in my library & restarted my R session via `install()`.

5.  I implemented some formal tests for the `qtseries` function by using
    `use_testthat()` to add the `testthat` package to the Description
    file, and used `use_test("qtseries")` to specifically write a test
    script for `qtseries` function. These tests were developed in
    *assignment 1-b* of this course, so I just copied and pasted the
    tests in the *test-qtseries.R* script. I then checked the tests
    using the `test()` function, as well as using the *Check* button
    under the *Build* tab to ensure everything was running smoothly. I
    also ran the `load_all()` function again after this step.

6.  I created a `ReadMe.Rmd` file using the `use_readme_rmd()` function,
    and added a couple badges using
    `use_lifecycle_badge("experimental")` and manually writing the link
    for the MIT license badge. Once I am finished editing this Readme
    document I will render it using the `build_readme()` function.

7.  I built a vignette with `use_vignette()`, added the relevant
    information and examples, and then rendered the document using
    `build_vignette()`.

8.  Steps 2-7 were taken for the `qstacktseries` function.

## Basic Example

Building a time series plot with a dummy data set

``` r
testdf <- data.frame(year = rep(seq(from = 1980, to= 1990, 1), 3),
                       rainfall = c(rnorm(11, 100, 30), rnorm(11, 70, 10),rnorm(11, 20, 20)),
                       temp = c(rnorm(11, 70, 30), rnorm(11, 100, 10),rnorm(11, 45, 20)),
                       daysofsun = c(NA, NA, rnorm(9, 280, 50), rnorm(11, 300, 30), NA, rnorm(10, 340, 15)),
                       region = c(rep("A",11), rep("B", 11), rep("C", 11)))
```

``` r
library(timeseries)
qtseries(testdf, year, temp, region, verbose = TRUE)
#> Plotting time series...Done labelling plot!...Done applying default theme aesthetics!
```

<img src="man/figures/README-example_qtseries-1.png" width="100%" />

``` r
qstacktseries(testdf,year, temp, region, verbose = TRUE)
#> Plotting time series...Done labelling plot!...Done applying default theme aesthetics!
```

<img src="man/figures/README-example_qstacktseries-1.png" width="100%" />
