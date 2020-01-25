# InvoicePlane in a container

## Introduction

This thing started, because [InvoicePlane](https://invoiceplane.com/) 2.0 needs PHP > 7.0, which wasn't available on my server at that time. Instead of migrating my shared hosting server, I created the following container environment.

The current version requires [my fork of InvoicePlane 2.0.0-alpha](https://github.com/dploeger/InvoicePlane).

## Usage

To use the container, [download the latest invoiceplane 2.0.0-alpha](https://github.com/dploeger/InvoicePlane/releases/tag/v2.0.0-alpha.2) version and run

    docker run --name invoiceplane -v <path to invoiceplane>:/var/www/html --add-host mysql:<ip of your mysql server> dploeger/invoiceplane

## Docker compose

In the contrib subfolder, you can find docker-compose templates, that run invoiceplane and invoiceplane together with a MySQL container.
