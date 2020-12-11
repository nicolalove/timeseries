test_that("Quick Time Series Check", {
  # create dummy dataframe
  testdf <- data.frame(year = rep(seq(from = 1980, to= 1990, 1), 3),
                       rainfall = c(rnorm(11, 100, 30), rnorm(11, 70, 10),rnorm(11, 20, 20)),
                       temp = c(rnorm(11, 70, 30), rnorm(11, 100, 10),rnorm(11, 45, 20)),
                       daysofsun = c(NA, NA, rnorm(9, 280, 50), rnorm(11, 300, 30), NA, rnorm(10, 340, 15)),
                       region = c(rep("A",11), rep("B", 11), rep("C", 11)))

  # test that the data is grouped as expected, testing with NA's present & all arguments = TRUE
  expect_match("region",as.character(rlang::get_expr(qtseries(testdf, year,daysofsun,region, round_values = TRUE, verbose = FALSE )$mapping$colour)))
  cat(" Expected grouping & extra arguments working? -> Yes!")

  # test that the output is a ggplot object, testing without NA's present & all arguments = FALSE
  expect_identical(class(qtseries(testdf, year,rainfall, region, default_theme = FALSE))[2], "ggplot")
  cat("...Expected Object Output (ggplot)? -> Yes!")

  # test that the first layer is a geom_point layer
  expect_true("GeomPoint" %in% class(qtseries(testdf, year,temp, region)$layers[[1]]$geom))
  cat("...Expected Geom_Point Layer? -> Yes!")
})
