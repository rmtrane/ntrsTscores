# Scale Scores

Get the scaled scores used in the T-scores.

## Usage

``` r
scale_scores(scores)
```

## Arguments

- scores:

  An object of class `npsych_scores`.

## Value

A numeric value. The function will error if `scores` is not of class
`npsych_scores` or if its subclass is not one of `names(ss)`.
