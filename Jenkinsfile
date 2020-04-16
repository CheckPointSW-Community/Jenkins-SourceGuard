pipeline {
     agent any
      environment {
         
              SG_CLIENT_ID = 
              SG_SECRET_KEY =
             
               }
     stages {
    
        stage('Clone Github repository') {
           
           steps {
             
             checkout scm
           
             }
  
          }
        
         
        stage('Docker image Build') {
           
            steps{

              sh 'docker build -t dhouari/sg .'
             
              
              }
             
           }
        
        
            stage('Prep Docker Image for Scan') {
           
               steps{

                  sh 'docker save dhouari/sg -o  sg.tar'
              
               }
             
            }
        
         stage('SourceGuard Docker Image Scan') {
            
            agent {

               docker { image 'sourceguard/sourceguard-cli:latest' }

                }
            
             steps {

               
                sh '/sourceguard-cli --img "sg.tar"/'

               }
            
            }
        
          
         
     }

}
