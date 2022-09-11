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
			sh 'sleep 10'
		       	sh '''
			if [ ps | grep python ]
				then
				echo "Test failed" ; 
				kill $(ps | grep python);
			
			//timeout(time: 1, unit: 'SECONDS'){
		    //sh 'sleep 2' 
			 //}
			 
			fi		 
			'''
				}
            }
        
        
	    stage('Stop the container') {
            steps {
		sh  'docker stop AlpCon'      
                
            }
        }
        
        
        
        }
        
        
    }

