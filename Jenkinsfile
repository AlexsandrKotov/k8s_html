#!groovy
// Run docker build
pipeline {
    agent { 
        label 'master'
        }
   
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }
    stages {
        stage("docker login") {
            steps {
                echo " ============== docker login =================="
                withCredentials([usernamePassword(credentialsId: 'dockerhub_alexsandr', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    docker login -u $USERNAME -p $PASSWORD
                    """
                }
            }
        }
        stage("create docker image") {
            steps {
                echo " ============== start building image =================="
                	sh 'docker build -t alexsandr/k8s_html:latest . '
               
            }
        }
        stage("docker push") {
            steps {
                echo " ============== start pushing image =================="
                sh '''
                docker push alexsandr/k8s_html:latest
                '''
            }
        }
        stage("push k8s") {
            steps {
                echo " =================push k8s====================="
                    sshagent (credentials: ['my_pc']) {
                       sh 'ssh akotov@192.168.111.1 -p 2208 kubectl apply -f k8s_html.yml'
                     }
            }
        }
    
    
    }
}
