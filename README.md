# InvoicePlane in a container

## Introduction

This thing started, because [InvoicePlane](https://invoiceplane.com/) 2.0 needs PHP > 7.0, which wasn't available on my server at that time. Instead of migrating my shared hosting server, I created the following container environment.

## Usage

Clone the repository with the submodules

    git clone --recurse-submodules https://github.com/dploeger/invoiceplane-docker.git
    cd invoiceplane-docker

There currently are two flavors for running InvoicePlane 2.0. One with a MySQL container included and one without, but a connection to a remote MySQL server prepared.

Look into the both files docker-composer-mysql.yaml and docker-compose.yaml about how to configure and run them.

After starting the containers, please wait some seconds until composer downloads dependent packages (see docker compose -f <docker-compose-filename you used> logs -f for progress). 

Then open InvoicePlane using 

    http://localhost:8080/setup

(if you haven't modified the port)

## Usage behind a proxy server

If you plan to use the container with a reverse proxy before it (i.e. Apache or NGINX), you'll have to set the following line in ip/app/Http/Middleware/TrustProxies.php:

    protected $proxies = "**";

(or set the IPs of all your reverse proxies, if you have them)