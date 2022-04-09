# Mutational Load simulations
Helper scripts to perform SLIM simulations and mutational load analyses (for additive and recessive mutations) used in [Font-Porterias, N. et al. *MBE*, 2021](https://doi.org/10.1093/molbev/msab070). This repo is not under active development, consider code as it is and check the software versions specified below.

## Description
Overall description: The scripts in this repo are used to perform forward simulations with SLIM based on the demographic model inferred for Spanish Romani (published in Mendizabal et al 2012) and calculate mutational load changes through time on the simulated populations. 
First, perform forward simulations under a demographic model (here, 4 sets of simulations were performed: full model with only additive mutations or "additive model"; full model with only recessive mutations or "recessive model"; model without non-Roma to Roma gene flow and only additive mutations or "additive model without gene flow"; and model without non-Roma to Roma gene flow and only recessive mutations or "recessive model without gene flow"). Then parse the simulation output, and lastly calculate mutational load values and plot the results. 

## Citation
If you use these tools, please cite: 

> **Font-Porterias N**, Caro-Consuegra R, Lucas-Sánchez M, Lopez M, Giménez A, Carballo-Mesa A, Bosch E, Calafell F, Quintana-Murci L, Comas D. (2021) The Counteracting Effects of Demography on Functional Genomic Variation: The Roma Paradigm. *MBE*, 38(7), 2804-2817, https://doi.org/10.1093/molbev/msab070

## Pipeline

### Step1. Forward simulations with SLiM
*SLiM version*:3.2. 

Download SLiM ([documentation](https://messerlab.org/slim/), [Github repository](https://github.com/MesserLab/SLiM), and [online workshop](http://benhaller.com/workshops/workshops.html) )

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

Briefly, each model has a:
- Burn-in phase of 8N generations
- Mutation rate: 1.36 × 10−8 per base position per generation
- Recombination rate:  10−8 per base per generation
- Genome structure (see figure below)
![](Genome_structure.png)
- Distributin of Fitness Effects (DFE) for deleterious mutations calculated with dadi/fitdadi. 
"To reduce the computational time of the simulations, we performed a rescaling of the following parameters: population size and generation time were decreased by ten, whereas mutation and recombination rate, selection coefficient, and migration rate were multiplied by ten to keep population-genetic parameters constant". See a complete description in [Font-Porterias, N. et al. *MBE*, 2021](https://doi.org/10.1093/molbev/msab070) and [Lopez, M. et al. *Nat Ecol Evol*, 2018](https://doi.org/10.1038/s41559-018-0496-4).

### Step2. Parse simulations output
Parse SLiM output to get the simulations results recorded at the different generations (for this study we recorded the results for the following generations: 6650, 6651, 6652, 6653, 6654, 6655, 6656, 6657, 6658, 6659).

```bash
slim sh Parse_output_SLiM.sh
```

### Step3. Calculate mutation load and plot the results
