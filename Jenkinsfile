pipeline {
    agent any

    environment {
        // Define environment variables if needed
    }

    stages {
        stage('Clone repository') {
            steps {
                // git credentialsId: 'YOUR_CREDENTIALS_ID', url: 'YOUR_REPO_URL'
                git url: 'https://github.com/csparedes/frontend-sistema-citas-medicas.git'
            }
        }
        stage('Build and Deploy') {
            steps {
                script {
                    def composeFile = "docker-compose.yml"
                    sh "docker-compose build"
                    sh "docker-compose up -d"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
