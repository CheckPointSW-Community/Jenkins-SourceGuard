pipeline {
      agent any
      environment {
           SG_CLIENT_ID = credentials("SG_CLIENT_ID")
           SG_SECRET_KEY = credentials("SG_SECRET_KEY")
           registry = "https://registry.hub.docker.com"
           registryCredential = 'docker_hub'
           dockerImage = 'dhouari/sg'
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
                   
         script {      
              try {
         
               
            
                sh 'chmod +x sourceguard-cli' 

                sh './sourceguard-cli --src .'
           
               } catch (Exception e) {
    
                 echo "Stage failed, but we continue"  
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
                   
             script {      
                 try {
         
                    sh './sourceguard-cli --img sg.tar'
           
                } catch (Exception e) {
    
                    echo "Analysis is BLOCK and recommend not using the container image"  
                     }
                }
            }
         }
            
           
           stage('Publish to Docker Hub') {
           
                  steps {
                       script {
                           try {
                             docker.withRegistry('registry', 'docker_hub') {
                              dockerImage.push("${env.BUILD_NUMBER}")
                              dockerImage.push("latest")
                              }
                          } catch (Exception e) {
    
                             echo "Stage failed, but we continue"  
                             }      
                        }     
                  }
             }
    } 
}
