pipeline {
    agent {
        node {
            label 'agent-1'
        }
    }

    options {
        ansiColor('xterm')
        disableConcurrentBuilds()
        timeout(time: 1, unit: 'HOURS') // Corrected syntax for timeout
    }

    parameters {
        string(name: 'version', defaultValue: '', description: 'Version of the package') // Added commas and description
        string(name: 'environment', defaultValue: '', description: 'Target environment') // Added commas and description
    }
    stages {

        stage('Get the version'){
        steps {
            sh """
                echo "version: ${params.version}"
                echo "enviornment: ${params.environment}"
            """
        }
        }

        stage ('Init') {
            steps {
                sh """
                    cd terraform
                    terraform init --backend-config=${params.environment}/backend.tf -reconfigure
                """    
            }
        }

        stage ('plan') {
            steps {
                sh """
                    cd terraform
                    terraform plan -var="app_version=${params.version}"
                """    
            }
        }

        stage ('apply') {
            steps {
                sh """
                    cd terraform
                    terraform apply -var="app_version=${params.version}" -auto-approve
                """    
            }
        }
    }


}
