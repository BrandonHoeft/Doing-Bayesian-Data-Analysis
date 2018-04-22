Chapter 8 Problems: Just Another Gibbs Sampler (JAGS)
================
Brandon Hoeft
April 22, 2018

-   [Exercise 8.1 Run a High Level Script of JAGS code to compare 3 different subjects.](#exercise-8.1-run-a-high-level-script-of-jags-code-to-compare-3-different-subjects.)
-   [Exercise 8.2 What is ROPE?](#exercise-8.2-what-is-rope)
-   [Exercise 8.3 What gets saved by the high level scripts?](#exercise-8.3-what-gets-saved-by-the-high-level-scripts)
-   [Exercise 8.4 Explore the Prior on a difference of Parameters, implied by the priors of individual paramters](#exercise-8.4-explore-the-prior-on-a-difference-of-parameters-implied-by-the-priors-of-individual-paramters)

Exercise 8.1 Run a High Level Script of JAGS code to compare 3 different subjects.
----------------------------------------------------------------------------------

The script called `Jags-Ydich-XnomSsubj-MbernBeta-Example.R` is one of the high level scripts that implements MCMC using `JAGS` via `r`. The first part of this elaborate name, *Ydich*, reflects that this high level script uses data (Y) that is dichotomous (0 and 1). The next part, *XnomSsubj* reflects that the X variables or predictors, are nominal, reflecting S different subjects. Lastly, *MbernBeta* represents our Bernoulli data model and a beta prior distribution.

For running this script, we are asked to generate data for 3 different subjects to compare differences between a parameter *θ* = goalscoring rate. For this, I actually used real data acquired from [American Soccer Analysis](https://www.americansocceranalysis.com/asa-xgoals/). I want to compare the goalscoring ability of two newcomers to Major League Soccer in 2017, Nemanja Nikolic, and Josef Martinez, 2 prolific goalscoring strikers. Their finishing ability based only on the known data from their inaugural season in MLS 2017 will be compared to the finishing gold standard of Bradley Wright-Phillips, whose data from the past three full seasons of 2015-2017 was acquired. These data will be used to estimate if their finishing abilities differ from each one another based on *shots attempted* and *goals scored*, which are independent Bernoulli trials.

The shots data were imported within the code of modified script below. Note that the character vector of player names needed to be converted to numeric representation (factor from character) inside the revised script below.

-   **Nemanja Nikolic**: *θ*(1)
-   **Josef Martinez**: *θ*(2)
-   **Bradley Wright-Phillips**: *θ*(3)

``` r
# Load the functions genMCMC, smryMCMC, and plotMCMC:
# changed lines from saving the file output like lines 20, 21, 24, 30. 
source("/Users/bhoeft/Desktop/temp/DBDA Programs/Jags-Ydich-XnomSsubj-MbernBeta-Example_8_1.R")
```


    *********************************************************************
    Kruschke, J. K. (2015). Doing Bayesian Data Analysis, Second Edition:
    A Tutorial with R, JAGS, and Stan. Academic Press / Elsevier.
    *********************************************************************

    Compiling model graph
       Resolving undeclared variables
       Allocating nodes
    Graph information:
       Observed stochastic nodes: 467
       Unobserved stochastic nodes: 3
       Total graph size: 940

    Initializing model

    Burning in the MCMC chain...
    Sampling final MCMC chain...

                              Mean       Median         Mode     ESS HDImass
    theta[1]           0.188022298  0.186279510  0.179128687 50000.0    0.95
    theta[2]           0.292481647  0.290216751  0.284345769 50000.0    0.95
    theta[3]           0.195272661  0.194535489  0.192598194 51661.7    0.95
    theta[1]-theta[2] -0.104459349 -0.103457630 -0.106593895 50000.0    0.95
    theta[1]-theta[3] -0.007250363 -0.008177416 -0.007098908 50669.7    0.95
    theta[2]-theta[3]  0.097208986  0.095800652  0.091488933 50000.0    0.95
                           HDIlow    HDIhigh CompVal PcntGtCompVal ROPElow
    theta[1]           0.11942897 0.25824843      NA            NA      NA
    theta[2]           0.18478930 0.40064381      NA            NA      NA
    theta[3]           0.15041722 0.24007965      NA            NA      NA
    theta[1]-theta[2] -0.23476086 0.02463933       0         5.578      NA
    theta[1]-theta[3] -0.08936386 0.07656002       0        42.276      NA
    theta[2]-theta[3] -0.02212893 0.21350104       0        95.110      NA
                      ROPEhigh PcntLtROPE PcntInROPE PcntGtROPE
    theta[1]                NA         NA         NA         NA
    theta[2]                NA         NA         NA         NA
    theta[3]                NA         NA         NA         NA
    theta[1]-theta[2]       NA         NA         NA         NA
    theta[1]-theta[3]       NA         NA         NA         NA
    theta[2]-theta[3]       NA         NA         NA         NA

Exercise 8.2 What is ROPE?
--------------------------

Exercise 8.3 What gets saved by the high level scripts?
-------------------------------------------------------

Exercise 8.4 Explore the Prior on a difference of Parameters, implied by the priors of individual paramters
-----------------------------------------------------------------------------------------------------------
