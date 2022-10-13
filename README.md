# Dynamic Tasks - Deployable Server Container

> Repository containing configurations and endpoint implementations for dynamic calculations used by online cognitive tasks.

Comprehensive documentation describing how to install and configure the contents of this repository can be found in the [wiki](https://github.com/Brain-Development-and-Disorders-Lab/template_task_dynamic/wiki).

## Description

In order to perform advanced computations in a cognitive task, it is often easier to use a specialised language such as R. When operating a cognitive task online, the task is typically a 'static' task that has all behaviour pre-defined. A pre-configured server container is implemented using R.

## Usage

Parameters for the R server must be configured inside `config.yml`:

- `endpoint`: Define the URL segment that the server will listen to.
- `custom_function`: Path to the R script containing the `custom_function` function.
- `port`: Port that the server will listen to the URL segment from.
- `output`: Local path where logs and participant data will be stored. Directory will be created if it doesn't exist.

The `custom_function` function must be implemented within `custom_function.R`. This function must accept one parameter, `parameters`, which will always contain the contents of a request sent to the server. The function must return another set of parameters, which will be passed back by the server to the client as a response.
