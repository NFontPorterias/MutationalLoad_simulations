# Documentation for the simulations set up in SLiM

Briefly, each model has a:
- Burn-in phase: 8N generations
- Mutation rate: 1.36 × 10−8 per base position per generation
- Recombination rate:  10−8 per base per generation
- Genome structure (see figure below)
![](Genome_structure.png)
- Distributin of Fitness Effects (DFE) for deleterious mutations calculated with ∂a∂i/Fit∂a∂i (see [Fit∂a∂i github](https://github.com/LohmuellerLab/fitdadi)). 

"To reduce the computational time of the simulations, we performed a rescaling of the following parameters: population size and generation time were decreased by ten, whereas mutation and recombination rate, selection coefficient, and migration rate were multiplied by ten to keep population-genetic parameters constant" ([Font-Porterias, N. et al. *MBE*, 2021](https://doi.org/10.1093/molbev/msab070)). 

See a complete description in [Font-Porterias, N. et al. *MBE*, 2021](https://doi.org/10.1093/molbev/msab070) and [Lopez, M. et al. *Nat Ecol Evol*, 2018](https://doi.org/10.1038/s41559-018-0496-4).

