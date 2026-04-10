# Neuropsychological Test Result Standardization (`ntrs`)


<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/rmtrane/ntrsTscores/graph/badge.svg)](https://app.codecov.io/gh/rmtrane/ntrsTscores)
[![R-CMD-check](https://github.com/rmtrane/ntrsTscores/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rmtrane/ntrsTscores/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

This package provides functions for standardizing neuropsychological
test results using T-scores adjusted for age, sex, and education. It is
an extension of the [`ntrs`](https://github.com/rmtrane/ntrs) package.

The main function, `std_using_tscores()`, takes raw scores from various
neuropsychological tests and applies the appropriate T-score adjustments
based on demographic factors. The package includes specific
implementations for different tests, such as the `ANIMALS` test, and
ensures that the standardized scores are within a valid range.

> [!WARNING]
>
> ### Disclaimer
>
> None of the implementations here should be used in commercial products
> nor as standalone medical advice. This package is distributed under
> the [MIT Licence](./LICENSE.html), meaning the software is provided
> “asis” and the authors are not liable for any claim, damages or other
> liabaility arising from this software. Also, note that the authors
> behind the T-scores implemented here request that the scores are not
> edited, modified, translated or otherwise part of derivative work
> without the prior written permission of Mayo Clinic. For more on the
> use of the T-scores, contact [Nikki
> Stricker](mailto:Stricker.Nikki@mayo.edu) and/or see the [Mayo Clinic
> Study of Aging website for more on data
> sharing](https://www.mayo.edu/research/centers-programs/alzheimers-disease-research-center/research-activities/mayo-clinic-study-aging/for-researchers/data-sharing-resources).
