node {
    def app

    stage('Clone repository') {
        

        checkout scm
    }

    stage('Build Docker image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("dhouari/nodeapp")
    }

    stage('Push to Registry') {
        
        docker.withRegistry('https://hub.docker.com/repository/docker/dhouari/cpdevops', 'docker_hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
