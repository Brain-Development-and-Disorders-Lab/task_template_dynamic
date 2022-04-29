# Setup - Virtual machine creation

## Resources

The resources allocated to a virtual machine should be suitable for the computations being performed. All server implementations support multiple concurrent connections, meaning that multiple game instances may require data from the server at the same time.

## Username

As part of the creation process, the cloud platform will require you to specify a username. This is the username that you will ultimately use to log into the virtual machine once it has been created, so ensure that you remember this username.

## SSH certificates

The cloud platform will prompt you to create an SSH certificate. The purpose of this certificate is to allow you, the researcher, to log into the virtual machine remotely without a username / password login. You will upload the _public_ key to the virtual machine, and keep the _private_ key in a secure location on your computer. On Linux and MacOS, this location is typically in the `~/.ssh/` directory.

On Linux and MacOS, you can use the following command to move your certificate into the `~/.ssh/` directory:

```bash
mv <certificate> ~/.ssh/
```

## Public IP address

After the virtual machine has been instantiated, the cloud platform will allocate an IP address to the virtual machine. This is the address that you will use to initially access the virtual machine from your computer. Store this IP address, as it will be required to connect to the virtual machine and for future configuration.
