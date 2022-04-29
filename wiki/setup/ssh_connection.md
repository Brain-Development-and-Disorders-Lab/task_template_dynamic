# Setup - SSH connection

## Connecting with a certificate

If you are on Linux or MacOS and your certificate is _not_ located in `~/.ssh/`, visit [Virtual machine creation](virtual_machine_creation.md) and follow the steps to store the certificate correctly.

To connect to the virtual machine, you will require the following information:

| Field | Description |
| ----- | ----------- |
| `<certificate>` | The name (including file extension) of the certificate. |
| `<username>` | The username that you configured for the virtual machine. |
| `<IP address>` | The IP address allocated to the virtual machine by the cloud platform. |

Run the following command to connect to the virtual machine, substituting the relevant information:

```bash
ssh -i ~/.ssh/<certificate> <username>@<IP address>
```

Example command:

```bash
ssh -i ~/.ssh/certificate.pem henry@192.168.0.1
```
