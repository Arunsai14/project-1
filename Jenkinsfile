pipeline { 

    environment { 
        registry = "YourDockerhubAccount/YourRepository" 
        registryCredential = 'docker-hub' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Cloning our Git') { 
            steps { 
                git 'https://github.com/Arunsai14/project-1.git' 
            }
        } 
        stage('Building our image') { 
            steps { 
                script { 
                    sh "docker build -t garunsai14/tomcat:$BUILD_NUMBER ." 
                }

            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
