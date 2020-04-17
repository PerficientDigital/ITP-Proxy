# ITP Proxy

A Kubernetes based application for proxying requests to itp-blocked services to enable 1st party cookies.

## Dependencies

To run this project locally you will need:

 - Docker
 - Minikube

# Testing the Docker Container

The Minikube local-init.sh script tags the docker container into the context of Minikube, to test the container separately run:

`docker build -t itp-proxy .`
`docker run itp-proxy`

## Minikube Setup

To start Minikube run:

`minikube start`

To reset it to an empty state run:

`minikube delete`

## Installation

To install this application in a local Minikube, start Minikube and run the script: `./local-init.sh`

## Dashboard

To see what's deployed, run:

`minikube dashboard`