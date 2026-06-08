pipeline{
    agent{
        node{
            label 'AGENT-1'
        }
    }
    stages{
        stage('build docker image'){
            steps{
                sh 'docker build -t my-nginx:$(BUILD_NUMBER) .'
            }
        }
        stage('test'){
            steps{
                script{
                    sh '''
                    docker run -d --name nginx-test -p 8080:80 my-nginx:$(BUILD_NUMBER)
                    sleep 5
                    curl localhost:8080
                    docker rm -f nginx-test
                    '''
                }
            }
        }
    }
}