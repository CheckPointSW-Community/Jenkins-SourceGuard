node {
    def nodeapp

    stage('Clone Github repository') {

        checkout scm
    }
    
    stage('Scan Source Code with SourceGuard') {
        
        sh 'chmod +x sourceguard-cli'
        sh """  
           export SG_CLIENT_ID=f646d88e-2215-494b-996e-1f184d7e26b7
           export SG_SECRET_KEY=aa107ca1d1bb4c66ba13210075f91197
           
           """  
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
