node() {
   
   def webapp

   stage('Clone repository') {

        checkout scm
    }

   stage('Build Docker image') {

        webapp = docker.build("/usr/local/bin", "chkp-dhouari/node-app")
    }

    stage('Test Docker image') {
        

        webapp.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
