node {
    def nodeapp

    stage('Clone Github repository') {

        checkout scm
    }
    
    stage('Scan Source Code with SourceGuard') {
        environment {
       SG_CLIENT_ID = '5bdd3443-3919-4acc-8212-ed140185bc0d'
       SG_SECRET_KEY = '15c8074c194b4eb8988cfe010309ff78'
        }
       
        sh 'chmod +x sourceguard-cli'
       
        sh './sourceguard-cli -src web-server.js'
        
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
