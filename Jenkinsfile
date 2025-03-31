pipeline {
    agent any
    stages {
        stage('Setup Environment') {
            steps {
                script {
                    // Update apk package manager and install necessary tools
                    sh '''
                        apk update
                        apk add --no-cache bash make python3 py3-pip
                    '''
                }
            }
        }
        
        stage('Install Python Dependencies') {
            steps {
                script {
                    sh 'make install'
                }
            }
        }

        stage('Format Codes') {
            steps {
                script {
                    // Execute the default Makefile target
                    sh 'make format'
                }
            }
        }

        stage('Validate Code Quality') {
            steps {
                script {
                    // Execute the default Makefile target
                    sh 'make lint'
                }
            }
        }

        stage('Test Code') {
            steps {
                script {
                    // Execute the default Makefile target
                    sh 'make test'
                }
            }
        }

        stage('Build Docker') {
            steps {
                script {
                    // Execute the default Makefile target
                    sh 'make build'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Execute the default Makefile target
                    sh 'make run'
                }
            }
        }
    }
}
