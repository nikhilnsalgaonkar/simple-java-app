pipeline {
    agent any
    tools {
        gradle 'Gradle8.12.1' // Configure Gradle in Jenkins Tools
        jdk 'JDK17'
    }

    environment {
        SONARQUBE_SERVER = 'sonarqube-server'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/nikhilnsalgaonkar/simple-java-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'gradle clean build'
            }
        }

        stage('SonarQube Scan') {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    sh 'gradle sonarqube'
                }
            }
        }

        stage('Upload Artifacts') {
            steps {
                archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
            }
        }

        stage('Cleanup') {
            steps {
                cleanWs()
            }
        }


    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }

}