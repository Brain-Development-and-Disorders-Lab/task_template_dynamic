# Realizing Dynamic Cognitive Tasks with Cloud-based Computation

> How can we expand the computational capabilities of online cognitive tasks to realize dynamic task behavior?

This repository implements a containerized 'template' of an architecture that defers advanced computations from an online cognitive task to a cloud server configured to perform these computations.

Comprehensive documentation describing how to customize and deploy this template can be found in the [wiki](https://github.com/Brain-Development-and-Disorders-Lab/task_template_dynamic/wiki).

## Description

Beyond manipulation of task stimuli and static web components, dynamic behavior is constrained within the limitations of JavaScript itself. Dynamic task behavior can be implemented by deferring advanced computations from the participant’s browser to a cloud server. We propose a task-server architecture that receives participant task input, uses an R or MATLAB script to perform advanced computations, and returns an output to inform dynamic task behavior.

---

![CNS 2023 Poster](Burgess_etal_CNS_2023_Poster.png)

---

![License](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).
