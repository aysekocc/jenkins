pipeline {
    agent any

    stages {
        stage('Docker Check') {
            steps {
                sh 'docker ps'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t aysekoc481/sample-app:latest .'
            }
        }
    }
}
