[Home](../index.md) > Setup > Server installation

# Setup - Server installation

## Cloning the repository

After integrating your server of choice with your custom functions and integrating the client with your game, the next step is to copy the server runtime files onto the virtual machine. If you have used version control (e.g. GitHub) to manage your code, this should just be a matter of cloning the repository onto the virtual machine.

## Installing dependencies - R

There are multiple dependencies required to run the R version of the server. After ensuring that R is installed on the virtual machine, use the following command, substituting `<package>`, with the name of the package to install.

```bash
$ Rscript -e "install.packages('<package>')"
```

The following packages are required by the R version of the server included in this repository:

- `logger`
- `jsonlite`
- `RestRserve`

## Installing dependencies - Python

To ensure all depedencies are present for the Python version of the server, use your Python package manager to install the following packages:

- `flask`
