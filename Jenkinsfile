pipeline {
    agent {
        docker {
            image 'buildpack-deps:latest' // Contains make, gcc, and other build tools
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'make install'
            }
        }
    }
}
