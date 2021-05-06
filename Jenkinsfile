pipeline {
    agent any
    tools {
 	terraform 'terraform-15'
    }
    stages {
        stage('Git Checkout') {
            steps {
                git "https://github.com/mallikarjunn9/CloudAutomation.git"
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }		
	}
	stage('Terraform init') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}		
