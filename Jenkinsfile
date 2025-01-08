pipeline {
    agent any
    
    tools {
        terraform 'terraform'
    }
    
    parameters {
    choice(
      name: 'operation',
      choices: ['terraform apply', 'terraform destroy'],
      description: 'Infra provisioning or destroying'
    )
  }
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/shubhamprasadnr/tool_kafka.git'
            }
        }
        
        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('terraform fmt') {
            when {
             expression { params.operation == 'terraform apply' }
            }
            
            steps {
                sh 'terraform fmt'
            }
        }
        
        stage('terraform validate') {
            when {
             expression { params.operation == 'terraform apply' }
            }
            
            steps {
                sh 'terraform validate'
            }
        }
        
        stage('terraform plan') {
            when {
             expression { params.operation == 'terraform apply' }
            }
            steps {
                sh 'terraform plan'
            }
        }
        
        stage('terraform apply') {
            when {
             expression { params.operation == 'terraform apply' }
            }
            
            steps {
                input 'Do you want to run terraform apply ?'
                sh 'terraform apply --auto-approve'
            }
        }
        
        stage('terraform destroy') {
            when {
                expression {params.operation == 'terraform destroy' }
            }
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}
