Tutorial to deploy a node.js app into a Docker container using a Jenkins pipeline.
Node.js and other runtime apps can be packaged in a container image and deployed on Docker Hub or other registries. Devops teams are using
a CICD methodolgy to build this node.js using the code checked in a SCM branch as Git or Github in order to build and package into a container image to be
deployed on Docker Hub or in a Kubernetes cluster.
From a Check Point perspective, I will demonstrate how to integrate security in the CICD pipeline by adding SAST and DAST.
This tutorial will take you step by step on how to build a node.js app with node code stored in this SCM and then build a container image for app using a Jenkins pipeiine.
SAST will trigerred once we checkin code to SCM and thenuploading the container image to a registry or K8s cluster
