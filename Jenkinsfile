pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh'''
                    echo "Building docker image..."
                    docker build -t products-back:v1 .
                    docker tag products-back:v1 transformation2/jenkins-products-back:v$BUILD_NUMBER
                '''
            }
        }
        stage('Push') {
            steps {
                sh'''
                    echo "Pushing docker image into Dockerhub..."
                    docker push transformation2/jenkins-products-back:v$BUILD_NUMBER 
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh'''
                    echo "Deploying into swarm new..."
                    ssh ubuntu@54.204.81.34 docker service update --image transformation2/jenkins-products-back:v$BUILD_NUMBER products_products-back
                '''
            }
    }
}
}
