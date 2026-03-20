# Standardize using T-scores

Standardize using T-scores

## Usage

``` r
std_using_tscores(scores, ..., age, sex, educ)
```

## Arguments

- scores:

  A numeric vector of class `npscyh_scores` with subclass

- ...:

  Unused

- age:

  numeric vector with age

- sex:

  numeric vector of `1`'s (male) and `2`'s (female)

- educ:

  numeric vector giving years of education

## Value

The standardized value of `scores`, whose exact type depends on the
specific S7 method called
