pipeline {
    agent {node { label 'slave01' } }

    stages {
        
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
			timeout(time: 10, unit: 'SECONDS') { 
		       	sh '''
			sleep 3
			if [[ ps | grep python ]]; then 
				echo "Test failed" && kill $(ps | grep python)	&& sleep 12
			fi
			'''
			}
		}
            }
        
        
	    stage('Stop the container') {
            steps {
		sh  'docker stop AlpCon'      
                
            }
        }
        
        
        
        }
        
        
    }

