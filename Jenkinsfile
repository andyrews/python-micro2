pipeline {
  agent any
  stages {
    stage('Setup Environment') {
      steps {
        script {
                    sh '''
                        echo "Updating package lists..."
                        apt-get update
                        echo "Installing necessary packages..."
                        apt-get install -y make python3 python3-pip python3.11-venv
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
