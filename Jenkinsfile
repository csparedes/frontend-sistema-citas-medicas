pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = "docker-compose.yml"
        CREDENTIALS_ID = "a5758983-b389-4ddb-af56-3cc06b5700ae"
        REPO_URL = "https://github.com/csparedes/frontend-sistema-citas-medicas.git"
    }

    stages {
        stage('Clone repository') {
            steps {
                git credentialsId: ${CREDENTIALS_ID}, url: ${REPO_URL}
            }
        }
        stage('Build Docker images') {
            steps {
                sh "docker-compose -f ${DOCKER_COMPOSE_FILE} build"
            }
        }
        stage('Deploy application') {
            steps {
                sh "docker-compose -f ${DOCKER_COMPOSE_FILE} up -d"
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
