pipeline {
    agent any
    
    
    stages{
        stage("Code clone"){
            steps {
              echo "Cloning the repository"
              git url:"https://github.com/kumawatsanjay123/node-todo-cicd.git",branch:"main"
            }
        }
        stage("Code Build"){
            steps {
              echo "Building"
              sh "docker build -t my-note-app ."
            }
        }
        stage("Push to DockerHub"){
            steps {
              echo "Pushing to the image to DockerHub"
              withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
              sh "docker tag my-note-app ${env.dockerHubUser}/my-note-app:latest"
              sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
              sh "docker push ${env.dockerHubUser}/my-note-app:latest"
              }
            }
        }
        stage("Deploy"){
            steps {
              echo "Deploying application" 
              sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}





