pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''sudo apt-get update && sudo apt-get install -y make
make install'''
      }
    }

  }
}