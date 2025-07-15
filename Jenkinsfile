pipeline {
    agent { label 'node-agent' }

    stages {
        stage('Code') {
            steps {
                git url: 'https://github.com/mohit-yadv/node-todo-cicd.git', branch: 'master'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build . -t mohityadv/node-todo-test:latest'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'dockerHubUser', passwordVariable: 'dockerHubPassword')]) {
                    sh """
                        echo "$dockerHubPassword" | docker login -u "$dockerHubUser" --password-stdin
                        docker push mohityadv/node-todo-test:latest
                        docker logout
                    """
                }
            }
        }

        stage('Test') {
            steps {
                echo "Testing the new build .."
            }
        }

        stage('Deploy') {
            steps {
               sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
