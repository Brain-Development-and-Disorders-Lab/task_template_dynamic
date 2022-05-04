# Dynamic Tasks

> Repository containing configurations and endpoint implementations for dynamic calculations used by online cognitive tasks.

Comprehensive documentation describing how to install and configure the contents of this repository can be found in the [wiki](https://github.com/Brain-Development-and-Disorders-Lab/template_task_dynamic/wiki).

## Description

In order to perform advanced computations in a cognitive task, it is often easier to use a specialised language such as Python or R. When operating a cognitive task online, the task is typically a 'static' task that has all behaviour pre-defined. This repository implements a small JavaScript library that sends requests to a remote server that is able to perform advanced computations. Complementing this library, two pre-configured server endpoints are implemented using R and Python. These servers are capable of receiving data from the JavaScript task, executing a function using the received data, and returning a response to the task containing the computed data.

## Contents

The contents of this repository are divided across two folders representing the two roles required for this technique to function: the `client/` (JavaScript / TypeScript) and the `servers/` (R or Python).

## Usage

### Usage: Client

The client is implemented to export a single `Client` class that acts as an interface to interact with requests to the remote server. The client can send and receive requests. It does not perform any significant data validation, as the researchers requirements will likely differ regarding the exact data specification.

### Usage: Server

Two servers are implemented: one in Python, and one in R. Only one server is required, the server should be selected based on the language the computation is implemented in. The source code for each server highlights the location to call the function implemented for the computations.
