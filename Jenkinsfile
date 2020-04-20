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
           
     script {      
         try {
         
          stage('SourceGuard Code Scan') {
            
            steps {
            
                sh 'chmod +x sourceguard-cli' 

                sh './sourceguard-cli --src .'

                   }
                
                 }
               } catch (Exception e) {
    
                 echo "Stage failed, but we continue"  
               
               }
               
           
         }
           
           
          stage('Docker image Build and scan prep') {
             
            steps {

              sh 'docker build -t dhouari/sg .'
              sh 'docker save dhouari/sg -o sg.tar'
              
             } 
           }
       script {
         try {
           stage('Docker image scan') {
               steps {
                    
                  sh './sourceguard-cli -img sg.tar'
               
                    }
                  }
               } catch (Exception e) {
    
                echo "Stage failed, but we continue"  
               
               }
         }
       }        
            
           
           stage('Publish to Docker Hub') {
           
                  steps {
                        
                     withDockerRegistry(["https://registry.hub.docker.com", "docker_hub"]) {
                      sh 'docker push dhouari/sg'
                      
                    }
               }     
          }
    } 
}
