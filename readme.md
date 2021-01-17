# Description

This docker container provides an Apache PHP stack with multiple versions of PHP.
Currently PHP 7.4, 7.3 and 5.6 is supported

# Usage

Before using for the first time, create the network bridge and build the container once using the commands:
./run bridge
./run build

Once built you can start and stop the conntainer any time using:
./run start
./run stop

Note, the script will also check if a container for the database is running,
if not it will automatically start it before runing the Apache stack

# Adding new site

To add a new site, simply copy the example configuration file 000-example.conf_template and name appropriately

# Enabling SSL for local sites

To use SSL for local sites generate the signig Certificate Authority (CA) with the command:
./run sslca

This will create the files my_ssl_ca.key, my_ssl_ca.pem and only needs to be done once if these files do not exist.  If you delete and regenerate these files, be sure to also delete the associated certificates in the .docker/apachessl folder and regenerate those

Import the trusted CA certificate my_ssl_ca.pem into your computer and enable it to be a trusted certificate.

On a Mac this is done by double clicking on the file my_ssl_ca.pem in the finder.
Once imported, open the Key chain and locate the certificate named 'Local Self Signed CA' under 
Login -> Certificates.  Right click on the certificate and select 'Get Info'.  Expand the Trust section, then choose 'Always Trust' next to 'When using this certificate'.  You will be prompted for your password to save when closing.  You should then see a white plus sign in a blue circle.

# Creating SSL certificate for local sites

To add SSL to a local site simply run the command:
./run sslcer www.exmaple.com

This will create the certificate and add it to the container. In the virtual host configuration file  for the site also be sure to define the variable HAS_SSL to enable HTTPS access

You will need to restart the container for the HTTPS site to take effect
