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
    stage('SourceGuard Code Scan') {   
       steps {   
                   
         script {      
              try {
         
               
            
                sh 'chmod +x sourceguard-cli' 

                sh './sourceguard-cli --src .'
           
               } catch (Exception e) {
    
                 echo "Code Analysis is BLOCK and recommend not using the source code"  
                  }
              }
            }
         }
           
           
          stage('Docker image Build and scan prep') {
             
            steps {

              sh 'docker build -t dhouari/sg .'
              sh 'docker save dhouari/sg -o sg.tar'
              
             } 
           }
       stage('SourceGuard Container Image Scan') {   
          steps {   
                   
           
         
                    sh './sourceguard-cli --img sg.tar'
           
                }
             
            
            }
            
  }            
}
