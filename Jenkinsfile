pipeline {
    agent {node { label 'Docker' } }

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
			timeout(time: 15, unit: 'SECONDS') { 
		       	sh '''
			sleep 10
			if [[ ps -ux | grep python3$ ]]; then 
				echo "Test failed" && kill $(ps -ux | grep python3$)	&& sleep 10
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

