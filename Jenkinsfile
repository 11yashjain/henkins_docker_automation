pipeline {
    agent any

    environment {
        // Docker Hub credentials stored in Jenkins
        DOCKER_HUB_CREDENTIALS = 'docker-hub-creds' // replace with your Jenkins Docker Hub credentials ID
        DOCKER_IMAGE_NAME = 'yashj0768/flask-docker-app' // replace with your Docker Hub username and repo name
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from GitHub repository
                git branch: 'main', url: 'https://github.com/11yashjain/henkins_docker_automation.git' // replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build(DOCKER_IMAGE_NAME)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE_NAME).push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully.'
        }
        failure {
            echo 'Build or push failed.'
        }
    }
}
