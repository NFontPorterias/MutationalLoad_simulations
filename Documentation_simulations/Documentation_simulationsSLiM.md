# Documentation for the simulations set up in SLiM

The following documentation describes the parameter values used to set up the forward simulations architecture. "To reduce the computational time of the simulations, we performed a rescaling of the following parameters: population size and generation time were decreased by ten, whereas mutation and recombination rate, selection coefficient, and migration rate were multiplied by ten to keep population-genetic parameters constant" ([Font-Porterias, N. et al. *MBE*, 2021](https://doi.org/10.1093/molbev/msab070)). 

Briefly, each model has a:
- Burn-in phase: 8N generations
- Mutation rate: 1.36 × 10−8 per base position per generation
- Recombination rate:  10−8 per base per generation
- Distributin of Fitness Effects (DFE) for deleterious mutations calculated with ∂a∂i/Fit∂a∂i (see [Fit∂a∂i github](https://github.com/LohmuellerLab/fitdadi)). 
- Genome structure (see Fig.1 below)
![Genome_structure](Genome_structure.png)

<div align="center" style="font-size:50px;">

  **Fig.1 - Genome structure set up for the forward simulations.** Codons have three base pairs, only the 1st and 2nd positions (in red) are under selection (accepting deleterious mutations, subject to the DFE), the 3rd position (in yellow) is neutral. Genomic elements with "x nº" indicate the number nº of repetitions of each element in the simulated genome.
  
</div> 



See a complete description in [Font-Porterias, N. et al. *MBE*, 2021](https://doi.org/10.1093/molbev/msab070) and [Lopez, M. et al. *Nat Ecol Evol*, 2018](https://doi.org/10.1038/s41559-018-0496-4).

