pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        choice(name: 'action', choices: ['apply', 'destroy', 'deploy infrastructure'], description: 'Select the action to perform')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-access-secret-key')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Yura11/server_depoy.git'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -out tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Apply / Destroy / Deploy') {
            steps {
                script {
                    if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'tfplan.txt'
                            input message: "Do you want to apply the plan?",
                            parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh 'terraform apply -input=false tfplan'
                    } else if (params.action == 'destroy') {
                        sh 'terraform destroy --auto-approve'
                    } else if (params.action == 'deploy infrastructure') {
                        def pingResult = sh(script: "ansible all -m ping -i dynamic_inventory.ini --ssh-common-args='-o StrictHostKeyChecking=no'", returnStatus: true)
                        if (pingResult == 0) {
                            sh 'ansible-playbook -i dynamic_inventory.ini serverdp.yml'
                        } else {
                            error "Ping failed. Unable to deploy infrastructure."
                        }
                    } else {
                        error "Invalid action selected. Please choose either 'apply', 'destroy', or 'deploy infrastructure'."
                    }
                }
            }
        }
    }
}
