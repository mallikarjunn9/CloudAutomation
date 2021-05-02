pipeline {
    agent any
    tools {
 	terraform 'terraform-15'
    }
    stages {
        stage('Git Checkout') {
            steps {
                git "https://github.com/mallikarjunn9/CloudAutomation"
            }
        }
        stage('Terraform init') {
            steps {
                sh label: '', script: 'terraform init'
            }
	stage('Terraform init') {
            steps {
                sh label: '', script: 'terraform apply --auto-approve'
            }
        }
    }
}		

