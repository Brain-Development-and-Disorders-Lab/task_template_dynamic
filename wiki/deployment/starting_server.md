[Home](../index.md) > Deployment > Starting the server

# Deployment - Starting the server

## Files on the virtual machine

The first step to starting the server is to ensure all server files are placed onto the virtual machine. If you are using a version control system (e.g. GitHub), this is as simple as cloning the repository onto the virtual machine. Ensure you have configured folder structures such that you will be able to find where you have copied the files.

### Cloning

If you are cloning a public repository, you can use the following command to clone the repository onto your virtual machine:

```bash
$ git clone <repository URL>
```

Otherwise if you are cloning a private repository from GitHub, the [GitHub CLI](https://cli.github.com) streamlines authentication and will allow you to clone the repository.

### Alternative methods

For alternate file transfer methods, the cloud platform containing the virtual machine will likely have documentation for using tools such as `scp` or `sftp` to transfer the server files.

## Starting the server - R

To start the R server, run the following command in the directory where `run.R` is stored:

```bash
$ Rscript -e run.R
```

The server will attempt to start on port `8000`. If another process is using this port, the server will not start and yield an error.

## Starting the server - Python

To start the Python server, run the following command in the directory where `run.py` is stored:

```bash
$ python3 run.py
```

The server will attempt to start on port `8000`. If another process is using this port, the server will not start and yield an error.
