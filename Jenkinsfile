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
			sh 'sleep 3'
		       	sh '''
			if [ ps | grep python ]
				then echo "Test failed" && kill $(ps | grep python) && timeout(time: 3, unit: 'SECONDS')
			fi
			'''
		    	sh 'sleep4'
				}
            }
        
        
	    stage('Stop the container') {
            steps {
		sh  'docker stop AlpCon'      
                
            }
        }
        
        
        
        }
        
        
    }

