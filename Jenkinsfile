pipeline {

    agent {

        docker { image 'sourceguard/sourceguard-cli:latest' }

    }

    stages {
    
        stage('Clone Github repository') {
           
           steps {
             
             checkout scm
           
           }
  
         }
         
        stage('SourceGuard') {

            steps {

                sh '/sourceguard-cli --src ./'

            }

        }

    }

}
