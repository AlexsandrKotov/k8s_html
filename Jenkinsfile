#!groovy
// Run docker build
pipeline {
  agent {
  label 'master'
    }
    stages {
      stage("create docker image") {
        steps { echo "-------------------- start building image --------------"
           sh 'docker build . -t my_html_v.1'
            }
        }
    }
      stage ( "docker_hub login") {
         steps {
            whithCredentials ([usernamePassword(credentialsId: 'dockerhub_alexsandr', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
               sh """
               docker login -u $USERNAME -p $PASSWORD
               """
               }
          }
    }
      stage("push docker image") {
         steps {
            echo "-------------------- start pushing image --------------"
            sh """
            docker push alexsandr/k8s_html:latest
            """

        }
    }
}
