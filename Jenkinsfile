pipeline {
    agent any
    tools {
        gradle 'Gradle8.12.1' // Configure Gradle in Jenkins Tools
        jdk 'JDK17'
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


    }

}