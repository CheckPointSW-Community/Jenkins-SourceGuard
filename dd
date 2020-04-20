pipeline {
      agent any
      environment {
           SG_CLIENT_ID = credentials("SG_CLIENT_ID")
           SG_SECRET_KEY = credentials("SG_SECRET_KEY")
      
        }
     stages {
          
         stage('Clone Github repository') {
            
    
           steps {
              
             checkout scm
           
              }
  
           }
       
         
           
          stage('Docker image Build and scan prep') {
             
            steps {

              sh 'docker build -t dhouari/sg .'
              
              
             } 
           }
    
          stage('Docker image scan') {
            
               agent {

                 docker { image 'aquasec/trivy' }
   
                   }
               steps {
                    
                  sh "/trivy sourceguard/sourceguard-cli/"
               
                 
                  }
              }   
           
          
          
    } 
}
