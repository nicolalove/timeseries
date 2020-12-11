# timeseries 0.2.0

:rocket: :alarm_clock: :rocket:

* Added a new function, `qstacktseries`, a stacked area plot
    + updated documentation, readme and description files accordingly
    + created a vignette for `qstacktseries`
    + developed tests for `qstacktseries`
    
* Fixed the typo in the name of the `qtseries ` vignette - vignette now has the same name as the function
* Added `build_vignettes = TRUE` and `ref = "v0.2.0"` to the installation command in the package `README`
* Moved the `gapminder` and `rlang` under *suggests* from *imports* (as they are only used in the tests)

Take a look at the `qstacktseries` vignette to get a sense of how this function could be used.

# timeseries 0.1.0

* Added `stop()` messages to the `qtseries()` function to force the *time* and *voi* inputs to be numeric

* Added @ImportFrom `dplyr` to include `pull()` function

* Modified @param group to include character data as well

:dancer:

# timeseries 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.

The first version of `timeseries` is now *tentatively* available :rocket: . The package is quite limited at the moment as it only contains one function, but it is still useful for the purposes of quick data visualization. The main features are:

* Basic time series plot using `ggplot2`
* Data is colored by the group specified in `qtseries` function
* Custom theme for minimal but effective plots aesthetics

Take a look at the *qtseries* vignette to get a sense of how this package could be used.
