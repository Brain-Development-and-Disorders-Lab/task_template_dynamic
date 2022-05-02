[Home](../index.md) > Deployment > Installation and configuration of Nginx

# Deployment - Installation and configuration of Nginx

Once the server has been started on the virtual machine, requests will be able to be sent to the IP address provided by the cloud platform on port `8000`. An example of this address would be: `http://12.345.67.89:8000`.

A domain (e.g. `abc.wustl.edu`) will allow the SSL/TLS-secured HTTPS protocol to be used, improving the security of communications between the game and the virtual machine. To use a domain, an additional HTTP server tool must be configured on the virtual machine to process web requests and enable a domain. This server can be configured to route all requests to the domain to the R or Python server on port `8000` also configured on the virtual machine.

## Nginx configuration file

[Nginx](https://nginx.org/en/) is a very useful tool to serve web files and act as a proxy server. It supports configuration of a domain and a proxy system routing all requests to the R or Python server on port `8000`.

Nginx requires a configuration to define the routing behaviour. Create a new configuration file or modify an existing one using the following command:

```Shell
$ sudo nano /etc/nginx/nginx.conf
```

This will open up a text editor where you can add or modify an Nginx configuration file. A template Nginx configuration file has been included below:

```Nginx
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;

    keepalive_timeout  65;

    include /etc/nginx/conf.d/*.conf;

    # Configure proxy server, routing all requests to R or Python server
    server {
        server_name <domain>; # Substitute fields here

        location <endpoint> { # Substitute fields here
            proxy_pass "<address><endpoint>"; # Substitute fields here
        }

        listen 443 ssl;
        ssl_certificate /etc/ssl/certs/<public certificate>; # Substitute fields here
        ssl_certificate_key /etc/ssl/private/<certificate key>; # Substitute fields here
    }

    # Route all unsecured HTTP requests to the HTTPS domain
    server {
        if ($host = <domain>) { # Substitute fields here
            return 301 https://$host$request_uri;
        }

        listen 80;
        server_name <domain>; # Substitute fields here
        return 404;
    }
}
```

To complete the configuration, replace the following fields with your values (Note: quotes are not required):

| Field | Description |
| ----- | ----------- |
| `<address>` | This is the exact IP address of the virtual machine and the port of the R or Python server. An example address is: `http://12.345.67.89:8000` |
| `<domain>` | This is the URL that you will assign to the virtual machine. An example URL is `example.wustl.edu` |
| `<endpoint>` | When configuring the R or Python server, the exact endpoint path can be set for the API. An example endpoint is: `/api/compute` |
| `<public certificate>` | The public SSL certificate for the domain should be provided by the party managing or provisioning your domain. It should be placed in the `/etc/ssl/certs` directory of the virtual machine. Substitute this field for the exact name (including file extension) of the certificate. |
| `<certificate key>` | The key for the SSL certificate. This should also have been provided alongside the public certificate. Substitute this field for the exact name (including file extention) of the certificate key. |

Press <kbd>Ctrl</kbd> + <kbd>o</kbd> to save changes to the configuration file and press <kbd>Ctrl</kbd> + <kbd>x</kbd> to exit the text editor.

## Starting Nginx

Check the status of Nginx by running the following command:

```Shell
$ sudo systemctl status nginx
```

If Nginx is not running, start Nginx by running the following command:

```Shell
$ sudo systemctl start nginx
```

If Nginx is already running, restart Nginx to use the updated configuration by running the following command:

```Shell
$ sudo systemctl restart nginx
```
