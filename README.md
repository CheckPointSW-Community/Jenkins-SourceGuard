# Using the Check Point SourceGuard SAST Scanner in a Jenkins CICD Pipeline 

## DevSecOps Tutorial to integrate in a Jenkins pipeline used to build a node.js app and deployed in a docker container, uploaded to a registry and in K8s cluster.

Developpers are embracing devops as it is enabling the automate their application development and deployment at large scale.
They using the CICD methodolgy to build their app s using the code checked in a SCM(source code manager) in order to build and package into a container image to be stored in a container registry or/and deployed in a Kubernetes cluster for runtime.
We will be using Github and Git as SCM and Docker for container runtime. SecOps team are adopting DevSecOps to natively integrate security tools in the CI/CD toolchain in order to ensure the security of the build and runtime of their application prior to its deployment to production. This page will cover how the Check Point SourceGuard SAST scanner can be integrated in a Jenkins CICD pipeline to address the source code and container image scan and analysis against CVEs, vulnerabilities and know/unknown malware.

The app will be a simple node.js app in a docker container.
lets first provision the Jenkins server and I will be using jenkins on a ubuntu VM using Virtualbox. I recommend allocating a minimumof 512MB of memory and a few Gigs of HDD space for tolerable Jenkins build performance. The same applies if you are running Jenkins in a container. 

 ![Screenshot](cicd.png)
        
 
 The first step is to install Jenkins on Ubuntu
 https://wiki.jenkins.io/display/JENKINS/Installing+Jenkins+on+Ubuntu
 
 By default Jenkins listens to port 8080 and I would recommend changing that. In this lab, I am using port 8282

 > You can change the default by changing the value of HTTP_PORT=  on /etc/default/jenkins

 

   
        
        
