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