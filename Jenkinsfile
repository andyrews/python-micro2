pipeline {
  agent any
  stages {
    stage('Setup Environment') {
      steps {
        script {
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
          sh 'make format'
        }

      }
    }

    stage('Validate Code Quality') {
      steps {
        script {
          sh 'make lint'
        }

      }
    }

    stage('Test Code') {
      steps {
        script {
          sh 'make test'
        }

      }
    }

    stage('Build Docker') {
      steps {
        script {
          sh 'make build'
        }

      }
    }

    stage('Deploy') {
      steps {
        script {
          sh 'make run'
        }

      }
    }

  }
}