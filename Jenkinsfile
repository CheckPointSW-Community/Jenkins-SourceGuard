pipeline {
   
     
     agent any
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
       
        
       
       
       
         
        stage('Docker image Build') {
           
            steps{

              sh 'docker build -t dhouari/nodeapp .'
              
            }
             
         }

          
         
    }

}
