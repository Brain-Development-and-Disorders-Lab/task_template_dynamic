# Realizing Dynamic Cognitive Tasks with Cloud-based Computation

## Configuration and Deployment using R

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
