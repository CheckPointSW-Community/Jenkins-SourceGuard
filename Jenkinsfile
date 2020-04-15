node {
    def nodeapp
    
    agent {

          docker { image 'sourceguard/sourceguard-cli:latest' }

          }

    stage('Clone Github repository') {

        checkout scm
    }
    
    stage('SourceGuard Code Scan') {
        
            

                sh '/sourceguard-cli --src ./'

            }
       
    
 

    stage('Docker image Build') {
        /* Using Dockerfile to build the container image*/

        nodeapp = docker.build("dhouari/nodeapp")
    }

    stage('Push to Docker Registry') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'docker_hub') {
            nodeapp.push("${env.BUILD_NUMBER}")
            nodeapp.push("latest")
        }
    }
}
