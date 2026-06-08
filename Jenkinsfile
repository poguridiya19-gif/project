pipeline{
    agent{
        node{
            label 'AGENT-1'
        }
    }
    stages{
        stage('build docker image'){
            steps{
                sh 'docker build -t my-nginx .'
            }
        }
        stage('test'){
            steps{
                script{
                    sh '''
                    docker run -d --name nginx-test -p 8081:80 my-nginx
                    sleep 5
                    curl localhost:8081
                    docker rm -f nginx-test
                    '''
                }
            }
        }
    }
}