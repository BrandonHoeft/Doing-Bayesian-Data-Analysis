Ch. 2 Problems: Credibility, Models, Parameters
================
Brandon Hoeft
January 9, 2018

-   [Exercise 2.1 Manipulating Probabilities](#exercise-2.1-manipulating-probabilities)
-   [Exercise 2.2 How data causes probabilities to shift.](#exercise-2.2-how-data-causes-probabilities-to-shift.)

Exercise 2.1 Manipulating Probabilities
---------------------------------------

x represents the value of the bottom face of the die.

Model A: p(x) = 1/4

The interpretation of this model is that it has no bias; each side of the tetrahedral die (4-sided) are equally likely to land face down.

``` r
set.seed(1988)
tosses <- sample(1:4, size = 10000, replace = TRUE, prob = c(.25, .25, .25, .25)) 
round(prop.table(table(tosses)), 2)
```

    ## tosses
    ##    1    2    3    4 
    ## 0.25 0.25 0.25 0.25

Model B: p(x) = x / 10

This model is biased towards larger numbers on the die. The higher the number, the more probable it is to be rolled.

``` r
set.seed(1988)
tosses <- sample(1:4, size = 10000, replace = TRUE, prob = c(1/10, 2/10, 3/10, 4/10)) 
round(prop.table(table(tosses)), 2)
```

    ## tosses
    ##    1    2    3    4 
    ## 0.10 0.20 0.29 0.40

Model C: p(x) = 12 / 25x

This model is biased towards smaller numbers on the die. The lower the number, the more probable it is to be rolled.

``` r
set.seed(1988)
tosses <- sample(1:4, size = 10000, replace = TRUE, prob = c(12 / (25 * 1:4))) 
round(prop.table(table(tosses)), 2)
```

    ## tosses
    ##    1    2    3    4 
    ## 0.48 0.24 0.16 0.12

Exercise 2.2 How data causes probabilities to shift.
----------------------------------------------------

Keeping with the same models from before with the tetrahedral die, and presume we start out thinking that each model is equally credible. p(A) = p(B) = p(C) = 1/3.

What happens when we introduce data of 100 rolls, and each side is rolled face down, 25 times? What is the most credible model then? Probably Model A, where we posited p(x) = 1/4.

What if we rolled the die 100 times but found these results instead: \#1's = 48, \#2's = 24, \#3's = 16, \#4's = 12. With this new data introduced, Model C appears most credible as smaller numbers appear to be rolled more frequently, as represented by Model C p(x) = 12 / 25x.
