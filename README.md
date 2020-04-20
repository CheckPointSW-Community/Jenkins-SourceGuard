# Using the Check Point SourceGuard SAST Scanner in a Jenkins CICD Pipeline 

## DevSecOps Tutorial to integrate in a Jenkins pipeline used to build a node.js app and deployed in a docker container, uploaded to a registry and in K8s cluster.

Developpers are embracing devops as it is enabling the automate their application development and deployment at large scale.
They using the CICD methodolgy to build their app s using the code checked in a SCM(source code manager) in order to build and package into a container image to be stored in a container registry or/and deployed in a Kubernetes cluster for runtime.
We will be using Github and Git as SCM and Docker for container runtime. SecOps team are adopting DevSecOps to natively integrate security tools in the CI/CD toolchain in order to ensure the security of the build and runtime of their application prior to its deployment to production. This page will cover how the Check Point SourceGuard SAST scanner can be integrated in a Jenkins CICD pipeline to address the source code and container image scan and analysis against CVEs, vulnerabilities and know/unknown malware.

The app will be a simple node.js app
lets first provision the Jenkins server and I will be using jenkins on a ubuntu VM using Vbox
The vbox and vm can be provisioned automatically using a vagrant script located in my k8s training,
I chose to use VM as running jenkins in a docker container can be slow especially on macOs. 

Installation as follow:

    ![header image](cicd.png)
