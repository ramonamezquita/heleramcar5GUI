<!-- badges: start -->
[![R-CMD-check](https://github.com/ramonamezquita/heleramcar5GUI/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ramonamezquita/heleramcar5GUI/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->


# SVERIGES RIKSGAG's GUI

This Shiny app demonstrates a simple workflow of fethcing data from SVERIGES RIKSGAG's database and displaying a simple wordcount analysis. You can download it using:

```R
shiny::runGitHub("heleramcar5GUI", "ramonamezquita", subdir = "R/")
```

The interaction with the SVERIGES RIKSGAG REST-API is done through the [heleramcar5](https://github.com/crmaedo/heleramcar5) R-package, a SDK made for
such purpose.

