pipeline{


agent any

    stages{

        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps{
                withAWS(credentials: 'aws-cred-dh', region: 'us-east-1'){
                    
                    sh 'terraform plan'
                }
            }
        }
        stage('Terraform Analysis with Sonarqube'){
            steps{
                script{
                    def scannerHome = tool 'SonarScanner';
                    withSonarQubeEnv('SonarScanner') {
                      sh "${scannerHome}/bin/sonar-scanner"
                    }
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
                withAWS(credentials: 'aws-cred-dh', region: 'us-east-1'){
                    
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    } 
}







