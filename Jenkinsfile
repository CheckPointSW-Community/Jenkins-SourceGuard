pipeline {
      agent any
      environment {
           SG_CLIENT_ID = credentials("SG_CLIENT_ID")
           SG_SECRET_KEY = credentials("SG_SECRET_KEY")
      
        }
     stages {
          
           
         stage('Clone Github repository') {
            post {
                   always {
                      echo "Send notifications for result: ${currentBuild.result}"
                      slackSend channel: 'https://checkpointsoftwareorg.slack.com/archives/C0123T6CV8S', message: 'started'

               
                   }
                

                }
                
         
           
           
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
                       
                   
                 
             

                 post {
                   always {
                      echo "Send notifications for result: ${currentBuild.result}"
               
                     slackSend channel: 'https://checkpointsoftwareorg.slack.com/archives/C0123T6CV8S', message: 'failed'

                      }
                
                 
                  }
             
               }         
           }     
    } 
}
