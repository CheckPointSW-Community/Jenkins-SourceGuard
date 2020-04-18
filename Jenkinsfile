pipeline {
      agent any
      environment {
         
              SG_CLIENT_ID = 'fc721267-cc00-476b-963f-fff13902b663'
              SG_SECRET_KEY = '26d91abf125f47198794149b594330fb'
             
               }
      
     stages {
    
        stage('Clone Github repository') {
           
           steps {
             
             checkout scm
           
             }
  
          }
       
         stage('SourceGuard Code Scan') {
            
             
             steps {
               
                sh 'chmod +x sourceguard-cli'
                sh './sourceguard-cli -src .'

                } 
          }

         
         
       stage('Docker image Build') {
           
            
             
             steps{

              sh 'docker build -t dhouari/sg .'
             
              
              }
             
           }
        
       stage('Docker image prep') {
           
             
             
             steps{

              sh 'docker save dhouari/sg -o sg.tar'
             
              
              }
             
           }
           stage('Docker image scan') {
             
                 steps {
                    
              sh './sourceguard-cli -img sg.tar'

                } 
           }
   
                 
     } 
}
