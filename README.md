# MATLAB Fall 2017 – Research Plan (Template)

> * Group Name: Bioformers.
> * Group participants names: Bretones Santamarina, Jorge; Marti, Andrei; Timo.
> * Project Title: Quorum Sensing and Biofilm formation.

## General Introduction

Quorum Sensing (QS) is a cell-to-cell bacterial communication mechanism among the same or different bacterial species, which is enabled through small diffusible signal molecules which bacteria produce (autoinducers) and perceive (inducers). Through QS, a wide range of different processes can be triggered, such as virulence, sporulation or biofilm formation, among others. We are particularly interested in the last topic and its relation to the treatment of infections using anti-QS antibiotics. The importance of the model relies on the study of infection treatment from a spatiotemporal viewpoint in which the communication between bacteria plays an essential role.

## The Model

The model we intent to use comprises a deterministic approach of ODEs at the population level, describing every aspect that must be accounted for in a QS model. The main variables we want to include explain: the production of the diffusive molecule, their diffusion into the medium, their rate of attachment to promoters to trigger genetic expression; cellular growth and division dynamics. 
Then, for the biofilm formation another set of specific variables should be included, like maximum length and thickness. After that, antibiotics should also be modelled to be able to account for Quorum Quenching (QQ) effects in dampening the QS behaviour and leading to the disruption of the biofilm and the population acquired phenotype.
We believe our model will be a good abstraction of the problem, as the main processes as diffusion of molecules and binding to promoters will be considered without overparameterizing the model.

## Fundamental Questions

-How effective is biofilm formation through QS?
-What is the effect of environmental conditions in QS development and biofilm formation?
-Until which stage in biofilm formation is it useful to add anti-QS antibiotics to treat the infection.

## Expected Results

-We expect biofilm formation to be highly effective through QS. The reason is that QS is a population based behaviour, so the rapid exponential growth of bacteria determines that the production of diffusive molecules will rise over a threshold at which the population acquires a new phenotype. 
-We expect that changes in pH or temperature may hamper bacterial growth and thus QS and biofilm formation. 
-We expect that at a time point when the biofilm is too thick and developed, the treatment will stop being useful, as hindering the QS process would be useless to counteract biofilm formation.


## References 

Chopp, D., Kirisits, M., Moran, B. et al. J Ind Microbiol Biotech (2002) 29: 339
(Most of the necessary references are included inside this review paper, so we will base our project on it).


## Research Methods

Currently, we believe that the use of continuous ODE models is ideal to model diffusion and the rest of the processes involving QS and biofilm formation. However, some scientific papers indiciate that the Agent-Based Modelling approach gives a deeper insight into single cell behaviour, and therefore it could be a possible way to implement it.

