pipeline {
    agent {
        label'target'
          }
    
    environment {
        DOCKER_IMAGE_NAME = 'webapp'
        WAR_FILE_NAME = 'webapp.war'
    }
    
    stages {
        stage('Checkout') {
            steps {
                sh 'echo passed'
        git branch: 'master', url: 'https://github.com/sagar171996/New-Project.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build(DOCKER_IMAGE_NAME, "-f Dockerfile .")
                    dockerImage.inside {
                        sh "cp /var/lib/jenkins/workspace/webapp_project_pipeline/webapp/target/webapp.war ."
                    }
                }
            }
        }
        
        stage('Run Container') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE_NAME).run("-p 8086:8086 --name my-webapp-container")
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
