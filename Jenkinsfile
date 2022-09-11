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
                sh 'chmod +x ./script.sh'
                sh './script.sh'
            }
        }
        stage('TimeOut') {
            steps {
	           sh '''
		     if [ "$(docker ps | grep alpcon)" ]; then
			 docker kill AlpCon;  docker rm AlpCon
			'''
				}
            }
        
        
        
        
        
        }
        
        
    }

