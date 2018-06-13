pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
              docker {
                image 'maven:3.3.3'
              }
            }
            steps {
                sh 'mvn -B -DskipTests clean package'
                archiveArtifacts artifacts: 'target/**/*.jar', fingerprint: true
            }
        }
        stage('Test') {
           agent {
              docker {
                image 'maven:3.3.3'
              }
            }
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Docker') {
            agent {
              docker {
                image 'docker:18.03-dind'
              }
            }
            steps {
                sh 'docker build -t mon_appli:latest .'
            }
        }
        stage('Run') {
            agent {
              docker {
                image 'docker:18.03-dind'
              }
            }
            steps {
                sh 'docker run -d --name hello -p 8081:8080 mon_appli'
            }
        }
    }
}

