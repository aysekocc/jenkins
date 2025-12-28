pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t youtube-jenkins-app .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop youtube-jenkins-app || true
                docker rm youtube-jenkins-app || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run -d \
                  --name youtube-jenkins-app \
                  -p 8585:8585 \
                  youtube-jenkins-app
                '''
            }
        }
    }
}
