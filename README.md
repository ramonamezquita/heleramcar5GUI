<!-- badges: start -->
[![R-CMD-check](https://github.com/ramonamezquita/heleramcar5GUI/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ramonamezquita/heleramcar5GUI/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

---

# `heleramcar5GUI` Package 

## Overview

`heleramcar5GUI` is the graphical user interface (GUI) version of the `heleramcar5` package, created using Shiny. It allows users to interact with the Swedish Parliament (Riksdagen) data API in a visual, user-friendly way without the need for coding.

## Installation

To use `heleramcar5GUI`, you first need to install the original `heleramcar5` package:

```r
# Install the heleramcar5 package
devtools::install_github("crmaedo/heleramcar5")
```

Then, you can run the `heleramcar5GUI` Shiny dashboard directly from GitHub using:

```r
# Launch the Shiny dashboard
shiny::runGitHub("heleramcar5GUI", "ramonamezquita", subdir = "R/")
```

This command will automatically download and run the GUI, providing access to the `heleramcar5` functionality through a web interface.

## Usage

Once the app is running, you can:

- **Search Documents**: Enter a query to search for documents in the Riksdagen database.
- **Retrieve Document Content**: Input a document ID to view its content.
- **Analyze Text**: Perform word frequency analysis on the retrieved document text.

## Conclusion

`heleramcar5GUI` offers a convenient GUI for exploring Riksdagen data, making it accessible to users without programming experience. Simply run the Shiny app and start interacting with the API through an intuitive dashboard.
