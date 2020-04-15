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

       
       stage('SourceGuard Container Image Scan') {

           agent {
              // Equivalent to "docker build -f Dockerfile.build --build-arg version=1.0.2 ./build/
                dockerfile {
                   filename 'dhouari/nodeapp'
                   args '-v /tmp:/tmp'
                 
                    }
                 }
            steps {
              
           
                 
                sh 'docker save dhouari/nodeapp -o app.tar'
                sh '/sourceguard-cli --img ./'
 
                 
              
              }
          }
        
    }

}
