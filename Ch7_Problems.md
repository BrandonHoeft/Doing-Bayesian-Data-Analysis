Chapter 7 Problems: Markov Chain Monte Carlo
================
Brandon Hoeft
April 8, 2018

-   [Exercise 7.1 Experiment with Metropolis Algorithm](#exercise-7.1-experiment-with-metropolis-algorithm)
    -   [Metropolis Algorithm (MCMC) with Proposal SD of 0.02](#metropolis-algorithm-mcmc-with-proposal-sd-of-0.02)
    -   [Metropolis Algorithm (MCMC) with Proposal SD of 0.2](#metropolis-algorithm-mcmc-with-proposal-sd-of-0.2)
    -   [Metropolis Algorithm (MCMC) with Proposal SD of 2.0](#metropolis-algorithm-mcmc-with-proposal-sd-of-2.0)

Exercise 7.1 Experiment with Metropolis Algorithm
-------------------------------------------------

The script called `BernMetrop.R` from the program files for the book implements a Metrolopis Algorithm. Run the algorithm three times, each using different standard deviation of the **proposal distribution**.

The **proposal distribution** enables Metropolis algorithm to take a random walk through the parameter space of *θ*, effectively drawing samples from its posterior distribution. The SD of the **proposal distribution** we draw random samples from impacts how slowly or quickly the algorithm may explore the posterior distribution of *θ*. The prior used is Beta(*θ* | 1, 1) and the likelihood is based of 14 heads, 6 tails observations.

Here we'll explore the impact of 3 different values of proposal distribution SD, which are based off a standardized (mean = 0) normal distribution: 0.02, 0.2, 2.0. A normal distribution is used because it will lead to random proposal steps generally close to the current position.

### Metropolis Algorithm (MCMC) with Proposal SD of 0.02

First is using a proposal distribution SD of 0.02. The histogram below shows the posterior distribution followed by plots of the MCMC chain of the sampled posterior. The chain moves very slowly because the typical proposed move (+/- 1 SD or 68% of the time) is within only 0.02 *θ*. This yields a chain of small moves and a very small Effective Sample Size (ESS) due to high autocorrelation between successive moves. The percentage of proposed moves accepted is also high, because the proposed move ratio of **min**(1, P(*θ*proposed) / P(*θ*current) is generally going to yield a value close to 1, and therefore most monte carlo draws from \[0,1\] will be accepted. **This example is not an ideal simulation based on low ESS**

``` r
# added line 5 in script below. commented out line 1, 4, 57. comment out line 89 for openGraph so can generate the graph output in this RMarkdown script. Change seed in line 55 to 123. 
source("/Users/bhoeft/Desktop/temp/DBDA Programs/BernMetrop_7_1_sd1.R")
```


    *********************************************************************
    Kruschke, J. K. (2015). Doing Bayesian Data Analysis, Second Edition:
    A Tutorial with R, JAGS, and Stan. Academic Press / Elsevier.
    *********************************************************************

![](Ch7_Problems_files/figure-markdown_github/unnamed-chunk-1-1.png)

### Metropolis Algorithm (MCMC) with Proposal SD of 0.2

Below is the same Metropolis Algorithm MCMC simulation but using a larger proposal distribution SD of 0.2 to draw monte carlo samples from for making proposed steps. Different from the previous simulation, we see larger jumps to different values of *θ* between successive steps. This enables the algorithm to explore different values of the posterior distribution more efficiently. The chain visits many relatively representative values of *θ* in fewer steps. We see no clumpiness in the chain. This chain also has a very high ESS because successive steps are less prone to being autocorrelated as new proposal values aren't always so closely linked to each other. **This example is representative of a good MCMC simulation for this toy 1 parameter example based on a good ESS.**

``` r
# added line 5 in script below. commented out line 1, 4, 57. comment out line 89 for openGraph so can generate the graph output in this RMarkdown script. Change seed in line 55 to 123. 
source("/Users/bhoeft/Desktop/temp/DBDA Programs/BernMetrop_7_1_sd2.R")
```


    *********************************************************************
    Kruschke, J. K. (2015). Doing Bayesian Data Analysis, Second Edition:
    A Tutorial with R, JAGS, and Stan. Academic Press / Elsevier.
    *********************************************************************

![](Ch7_Problems_files/figure-markdown_github/unnamed-chunk-2-1.png)

### Metropolis Algorithm (MCMC) with Proposal SD of 2.0

Below is the same Metropolis Algorithm MCMC simulation but using a very large proposal distribution SD of 2.0 to draw monte carlo samples from for making proposed steps. Extreme jumps across values of *θ* between successive steps are observed. We see proposals could easily move outside the bounds of our posterior *θ*, which is \[0,1\] bound. Hence, proposed jumps may be rejected and the chain may stay in a single place for many successive steps (see the low rate of accepted proposed moves). This yields clumpy chain with little movement. But since the proposed jumps are so extreme between successive steps in the rare cases when a proposed move is actually accepted, these moves often aren't very autocorrelated, which yields us an ESS that's still too small (&lt; 10,000 heuristic) but better than using the 1st proposed SD of 0.02. **This example is not an ideal simulation based on low ESS**

``` r
# added line 5 in script below. commented out line 1, 4, 57. comment out line 89 for openGraph so can generate the graph output in this RMarkdown script. Change seed in line 55 to 123. 
source("/Users/bhoeft/Desktop/temp/DBDA Programs/BernMetrop_7_1_sd3.R")
```


    *********************************************************************
    Kruschke, J. K. (2015). Doing Bayesian Data Analysis, Second Edition:
    A Tutorial with R, JAGS, and Stan. Academic Press / Elsevier.
    *********************************************************************

![](Ch7_Problems_files/figure-markdown_github/unnamed-chunk-3-1.png)
