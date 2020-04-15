pipeline {
   
        
      agent {

          docker { image 'sourceguard/sourceguard-cli:latest' }

          }
    
     
     environment {
         
              SG_CLIENT_ID = '5bdd3443-3919-4acc-8212-ed140185bc0d'
              SG_SECRET_KEY = '15c8074c194b4eb8988cfe010309ff78'
              
              
             
            }
    
    stages {
    
        stage('Clone Github repository') {
           
           steps {
             
             checkout scm
           
             }
  
          }
        
     
       
        
       stage('Building image') {
        
             agent any
            
             steps {
         
                script {
                   
                    sh 'docker build -t dhouari/jenkinstest .'
          
                   }
      
                }
            }

       
       stage('SourceGuard Container Image Scan') {

           agent any 
           steps {
              
              script {
                 
                sh 'docker save dhouari/jenkinstest -o app.tar'
                sh '/sourceguard-cli --img ./'
 
                 }
              
              }
          }
        
    }

}
