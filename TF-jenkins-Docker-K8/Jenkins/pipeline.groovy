pipeline {
    agent {
        label 'agent1'
    }

    tools {
        maven 'Maven'
    }

    stages {
        stage('Build and Store Artifact')
        {
          
            steps {
                sh ''' git clone 'https://github.com/Mayur2905/studentapp-ui.git' '''


                dir('/studentapp-ui')
                {
                    sh 'sudo apt  install awscli -y'
                    sh 'mvn clean package'
                    // sh 'cp target/*.war /opt/tomcat/webapps/student.war'
                    sh 'aws s3 cp target/*.war s3://mariobymg/student.war'
                }

            }    
        }
        stage('Test')
        {
            steps {
                echo 'Testing the project'
            }
        }

        stage('Building Docker Image')
        {
            steps {
                git branch: 'main', credentialsId: '124', url: 'https://github.com/Mayur2905/three_tier_advance.git'

                dir('three_tier_advance/Frontend') {
                    script{
                 withDockerRegistry(credentialsId: '7756', toolName: 'Docker') {
                    sh 'docker build -t mayurgg7756/frontendrds .'
                    sh 'docker push mayurgg7756/frontendrds'
                    }
                    }
                }
                dir('three_tier_advance/Backend') {
                    script{
                    withDockerRegistry(credentialsId: '7756', toolName: 'Docker') 
                    {
                        sh 'docker build -t mayurgg7756/backendrds .'
                        sh'docker push mayurgg7756/backendrds'
                    }
                    }
                }
            }

        }

    }
}