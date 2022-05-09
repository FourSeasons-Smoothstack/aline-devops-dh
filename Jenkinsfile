pipeline{


agent any

    stages{

        stage('Terraform Init'){
            steps{
                sh 'cd ./terraform'
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps{
                sh 'terraform plan'
            }
        }

        stage('Terraform Test with Sonarqube')
            steps{
                script {
                    withSonarQubeEnv('SonarScanner') {
                        sh "${tool("sonarscan")}/bin/sonar-scanner -Dsonar.projectKey=terraform -Dsonar.sources=terraform"
                    }
                }
            }
        stage('Quality Gate'){
            steps{
                withSonarQubeEnv('SonarScanner') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Terraform Apply') {
            steps{
                
            }
        }
    } 
}



