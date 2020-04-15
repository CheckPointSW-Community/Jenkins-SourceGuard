pipeline {
   

    agent {

        docker { image 'sourceguard/sourceguard-cli:latest' }

       }
     
     environment {
         
              SG_CLIENT_ID = '5bdd3443-3919-4acc-8212-ed140185bc0d'
              SG_SECRET_KEY = '15c8074c194b4eb8988cfe010309ff78'
              registry = "dhouari/nodeapp"
              registryCredential = 'docker_hub'
              
             
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
       
       
        
       stage('Building image') {
          
           steps{
        
               script {
          
                   docker.build registry + ":$BUILD_NUMBER"
        
               }
     
           }
   
        }

       
        
    }

}
