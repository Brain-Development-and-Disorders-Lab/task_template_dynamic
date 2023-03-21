# Realizing Dynamic Cognitive Tasks with Cloud-based Computation

> How can we expand the computational capabilities of online cognitive tasks to realize dynamic task behavior?

This repository implements a containerized 'template' of an architecture that defers advanced computations from an online cognitive task to a cloud server configured to perform these computations.

Comprehensive documentation describing how to customize and deploy this template can be found in the [wiki](https://github.com/Brain-Development-and-Disorders-Lab/task_template_dynamic/wiki).

## Description

Beyond manipulation of task stimuli and static web components, dynamic behavior is constrained within the limitations of JavaScript itself. Dynamic task behavior can be implemented by deferring advanced computations from the participant’s browser to a cloud server. We propose a task-server architecture that receives participant task input, uses an R script to perform advanced computations, and returns an output to inform dynamic task behavior.

## Configuration and Deployment

Prerequisites for configuration and deployment online:

1. Cloud computing resource that supports the deployment of Docker containers.
2. A domain name with an SSL certificate to ensure secure communications between the task and the server.
3. Specification of the following files:
    1. Nginx configuration file (`nginx.conf`):
    2. RestRserve configuration file (`config.yml`):
    3. Custom R script (`compute_function.R`):

The [wiki](https://github.com/Brain-Development-and-Disorders-Lab/task_template_dynamic/wiki) contains further detail of specific requirements for each prerequisite.

Parameters for the R server must be configured inside `config.yml`:

- `endpoint`: Define the URL segment that the server will listen to.
- `compute_function`: Path to the R script containing the `compute_function` entry function.
- `port`: Port that the server will listen to the URL segment from.
- `output`: Local path where logs and participant data will be stored. Directory will be created if it doesn't exist.

The `compute_function` function must be implemented within `compute_function.R`. This function accepts one parameter, `request_data`, which will always contain the contents of a request sent to the server. The function can return any style of parameters, and these parameters will be packaged into the body of a response to the task.

To build and start the containers, run `docker compose up --build` after completing the steps listed above.

---

<img src="Burgess_etal_CNS_2023_Poster.png">

---

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
