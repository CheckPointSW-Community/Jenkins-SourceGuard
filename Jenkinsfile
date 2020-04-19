pipeline {
      agent any
      environment {
           SG_CLIENT_ID = credentials("SG_CLIENT_ID")
           SG_SECRET_KEY = credentials("SG_SECRET_KEY")
      
        }
     stages {
          
        slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

    
        stage('Clone Github repository') {
           
           steps {
             
             checkout scm
           
             }
  
          }
       
         stage('SourceGuard Code Scan') {
            
            steps {
            
                sh 'chmod +x sourceguard-cli' 

                sh './sourceguard-cli --src .'

                  }
              
             
              }

         
         
       stage('Docker image Build') {
           
            
             
             steps{

              sh 'docker build -t dhouari/sg .'
             
              
              }
             
           }
        
      
           
           stage('Docker image scan') {
            
             
                 steps {
                    
                   sh './sourceguard-cli -img sg.tar'
                       
                   }
                 
             

                 post {
                   always {
                      echo "Send notifications for result: ${currentBuild.result}"
               
                      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

                      }
                }
       }         
                
    } 
}
