# Mutational Load simulations
Helper scripts to perform SLIM simulations, mutational load analyses, and to create the plot in [Figure3B](https://academic.oup.com/view-large/figure/266883350/msab070f3.tif) from [Font-Porterias, N. et al. *MBE*, 2021](https://doi.org/10.1093/molbev/msab070). This repo is not under active development, consider code as it is and check the software versions specified below.

## Description
**Overall description:** The scripts in this repo are used to perform forward simulations with SLIM based on the demographic model inferred for Spanish Romani (published in Mendizabal et al 2012) and calculate mutational load changes through time on the simulated populations. 

First, perform forward simulations under a demographic model (here, 4 sets of simulations were performed: full model with only additive mutations or "additive model"; full model with only recessive mutations or "recessive model"; model without non-Roma to Roma gene flow and only additive mutations or "additive model without gene flow"; and model without non-Roma to Roma gene flow and only recessive mutations or "recessive model without gene flow"). Then parse the simulation output, and lastly calculate mutational load values and plot the results. 

## Citation
If you use these tools, please cite: 

> **Font-Porterias N**, Caro-Consuegra R, Lucas-Sánchez M, Lopez M, Giménez A, Carballo-Mesa A, Bosch E, Calafell F, Quintana-Murci L, Comas D. (2021) The Counteracting Effects of Demography on Functional Genomic Variation: The Roma Paradigm. *MBE*, 38(7), 2804-2817, https://doi.org/10.1093/molbev/msab070

## Pipeline

### Step1. Forward simulations with SLiM
*SLiM version*: 3.2. 

Download SLiM ([documentation](https://messerlab.org/slim/), [Github repository](https://github.com/MesserLab/SLiM), and [online workshop](http://benhaller.com/workshops/workshops.html))

Run SLiM for each model:
#### Model 1 (*Additive model*)
Simulate only Additive mutations (h=0.5), under "full demographic model" (i.e., with non-Roma to Roma gene-flow)
```bash
slim Model_1.txt
```

#### Model 2 (*Recessive model*)
Simulate only Recessive mutations (h=0.0), under "full demographic model" (i.e., with non-Roma to Roma gene-flow)
```bash
slim Model_2.txt
```

#### Model 3 (*Additive model without gene flow*)
Simulate only Additive mutations (h=0.5), under "model without gene flow" (*i.e.*, without non-Roma to Roma gene-flow)
```bash
slim Model_3.txt
```

#### Model 4 (*Recessive model without gene flow*)
Simulate only Recessive mutations (h=0.0), under "model without gene flow" (*i.e.*, without non-Roma to Roma gene-flow)
```bash
slim Model_4.txt
```

See documentation [here](Documentation_simulations/Documentation_simulationsSLiM.md), for a complete description of the foward simulation set up. 

### Step2. Parse simulations output
Parse SLiM output to get the simulations results recorded at the different generations.
Briefly, this script keeps the simulation results for a number of generations and saves them in separate files. Remember! If you rescaled the simulations by 10, here generations will be rescaled by 10 too. Particurlaly, in our case, we recorded the results for the following generations ago (ga): 82,62,42,22,0. We grep results for generations: 6650, 6652, 6654, 6656, and 6659 (*e.g.*, "82 ga" corresponds to the "rescaled" generation 6650 in our simulations).

For each model, create a folder and move SLiM output there, *e.g.*:
```bash
mkdir Model1
mv Model_1.out
```
Then, run: 

```bash
sh Parse_output_SLiM.sh
```


### Step3. Calculate load and plot the mutational load temporal trajectories
*R version*: 4.1.1. 
*Required R package*: ggplot2 3.3.5

This scripts first calculates the frequency of each deleterious mutation in each model and generation. Then, estimates mutational load per mutation and lastly calculates mutational load for the population from the load of each mutation. See [Font-Porterias, N. et al. *MBE*, 2021](https://doi.org/10.1093/molbev/msab070) and [Lopez, M. et al. *Nat Ecol Evol*, 2018](https://doi.org/10.1038/s41559-018-0496-4) for more information.


Run the following to calculate mutational load values for each model at each sampled generation and plot the results:

```bash
Rscript plot_TrajectoryLoad.R
```

