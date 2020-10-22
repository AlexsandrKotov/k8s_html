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
         node {
            def remote = [:]
            remote.name = 'pclocal'
            remote.host = '192.168.111.1'
            remote.user = 'akotov'
            remote.password = '8a35af5181b3'
            remote.allowAnyHosts = true
            stage('Remote SSH') {
                sshCommand remote: remote, command: "ls -lrt"
                 }
            }    
    
    }
}
