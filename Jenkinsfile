pipeline{
    agent{
        node{
            label 'AGENT-1'
        }
    }
    stages{
        stage('checkout'){
            steps{
                git 'https://github.com/poguridiya19-gif/project.git'
            }
        }
        stage('build docker image'){
            steps{
                sh 'docker build -t my-nginx:$(BUILD NUMBER) .'
            }
        }
        stage('test'){
            steps{
                script{
                    sh '''
                    docker run -d --name nginx-test -p 8080:80 my-nginx:$(BUILD NUMBER)
                    sleep 5
                    curl localhost:8080
                    docker rm -f nginx-test
                    '''
                }
            }
        }
    }
}