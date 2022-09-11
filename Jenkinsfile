pipeline {
    agent {node { label 'slave01' } }

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('SCM') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker file') {
            steps {
		sh 'docker build -t alpcon .'
            }
        }
        
        stage('Test and Run container') {
            steps {
		sh  'docker rm AlpCon'      
                sh 'chmod +x ./script.sh'
                sh './script.sh'
            }
        }
        stage('TimeOut') {
            steps {
		    timeout(time: 15, unit: 'SECONDS'){
		    sh 'sleep 10'
		    
	           sh '''
		     if [ "$(docker ps | grep alpcon)" ]; then
			 echo "Test failed"
			 }
			 //sleep 5
			//else
			//docker kill AlpCon
			
			fi		 
			'''
				}
            }
        
        
        
        
        
        }
        
        
    }

