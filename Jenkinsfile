pipeline {
      agent any
      environment {
         
              SG_CLIENT_ID = '3db9cc45-9312-4713-8ce9-6effd390185c'
              SG_SECRET_KEY = '9c4918253697408bb7a9bb897e613199'
             
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
           
             agent any
             
             steps{

              sh 'docker build -t dhouari/sg .'
             
              
              }
             
           }
        
      
        
     } 
}
