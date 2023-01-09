# Dynamic Cognitive Task Computations

> This repository contains a containerized 'template' that starts an R-based server and a proxy service allowing for streamlined local and remote deployment of an API endpoint.

Comprehensive documentation describing how to customize and deploy the template can be found in the [wiki](https://github.com/Brain-Development-and-Disorders-Lab/dynamic_cognitive_task/wiki).

## Description

Given that most behavioral and cognitive testing is moving online, it is necessary to develop computational tools that allow interactive computations within the task itself. In order to perform advanced computations in a cognitive task, it is often easier to use a specialised language such as R. When operating a cognitive task online, the task is typically a 'static' task that has all behaviour pre-defined. A pre-configured server container is implemented using R.

## Usage

Parameters for the R server must be configured inside `config.yml`:

- `endpoint`: Define the URL segment that the server will listen to.
- `custom_function`: Path to the R script containing the `custom_function` function.
- `port`: Port that the server will listen to the URL segment from.
- `output`: Local path where logs and participant data will be stored. Directory will be created if it doesn't exist.

The `custom_function` function must be implemented within `custom_function.R`. This function must accept one parameter, `parameters`, which will always contain the contents of a request sent to the server. The function must return another set of parameters, which will be passed back by the server to the client as a response.

---

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
