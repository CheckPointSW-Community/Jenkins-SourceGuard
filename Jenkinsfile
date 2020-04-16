pipeline {
   
     
     agent any
     environment {
         
              SG_CLIENT_ID = 'd77b7a51-e5a6-4d49-b8d3-b92e9e8e7f3c'
              SG_SECRET_KEY = 'd45ae742081d48d4803c7e3ba357c6c5'
             
            }
    
     stages {
    
        stage('Clone Github repository') {
           
           steps {
             
             checkout scm
           
             }
  
          }
        
         stage('SourceGuard Source Code Scan') {
            
            agent {

              docker { image 'sourceguard/sourceguard-cli:latest' }

               }
            steps {

                sh '/sourceguard-cli --src ./'

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
