pipeline {
    agent any
    tools {
 	terraform 'terraform-15'
    }
    stages{
        stage('Git Checkout'){
            steps {
                git "https://github.com/mallikarjunn9/CloudAutomation.git"
            }
        }
        stage('Terraform Init'){
            steps {
                sh 'terraform init'
            }		
	}
	stage('Terraform Apply'){
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}		
