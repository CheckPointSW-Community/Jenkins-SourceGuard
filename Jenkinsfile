pipeline {
   
     
     agent any
     environment {
         
              SG_CLIENT_ID = 'c90c46bd-a52f-4f8a-8da9-72c8a92d5a92'
              SG_SECRET_KEY = '82dd3d65257c4b50a14471921e278309'
             
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
