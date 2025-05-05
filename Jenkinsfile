
pipeline{
agent 'agent1'

stages{
    stage('Code'){
        steps{
            echo "Clonning code.."
             git url: 'https://github.com/Himanshu31bisht/node-todo-cicd.git', branch: 'master'
        }
    }
    
     stage('Build'){
         steps{
            sh 'docker build . -t himanshu31bisht/node-app:latest'
        }
    }
    stage('Push'){
        steps{
           withCredentials([usernamePassword(
                    credentialsId:"dockerHub",
                    usernameVariable:"dockerHubUser",
                    passwordVariable:"dockerHubPass")]){
                 sh 'echo $dockerHubPass | docker login -u $dockerHubUser --password-stdin'
                sh "docker push ${env.dockerHubUser}/node-app:latest"
                
                }
        }
    }
    
     stage('Test'){
         steps{
            echo "Testing the new Build.."
        }
    }
    
     stage('Deploy'){
         steps{
            sh "docker-compose down && docker-compose up -d"
        }
    }
}
}