pipeline {
    agent { docker { image 'python:3.13.0-alpine3.20' } }
    stages {
        stage('Build') {
            steps {
                sh 'echo "Hello, From the Jenkins Pipeline !"'
                sh 'python --version'
            }
        }
    }
}