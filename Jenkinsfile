pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = "docker-compose.yaml"
        CREDENTIALS_ID = "a5758983-b389-4ddb-af56-3cc06b5700ae"
        REPO_URL = "https://github.com/csparedes/frontend-sistema-citas-medicas.git"
    }

    stages {
        stage('Checkout') {
            def scmVars = checkout([$class: 'GitSCM', 
                                            branches: [[name: '*/main']], 
                                            doGenerateSubmoduleConfigurations: false, 
                                            extensions: [], 
                                            submoduleCfg: [], 
                                            userRemoteConfigs: [[url: "${REPO_URL}"]]])
            echo "Checked out revision: ${scmVars.GIT_COMMIT}"
        }
        // stage('Clone repository') {
        //     steps {
        //         git credentialsId: "${CREDENTIALS_ID}", url: "${REPO_URL}"
        //     }
        // }
        stage('Build Docker images') {
            steps {
                echo "Starting docker compose build"
                sh "docker-compose -f ${DOCKER_COMPOSE_FILE} build"
                echo "Ending docker compose build"
            }
        }
        stage('Deploy application') {
            steps {
                echo "Initializing deploy application"
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
