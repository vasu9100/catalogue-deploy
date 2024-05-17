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
        booleanParam(name: 'Apply', defaultValue: false, description: 'Do you want apply')
        booleanParam(name: 'Destroy', defaultValue: false, description: 'Do you want apply')
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

            when {
                expression{
                    params.Apply == 'true'
                }
            }
            steps {
                sh """
                    cd terraform
                    terraform apply -var="app_version=${params.version}" -auto-approve
                """    
            }
        }

        stage ('Destroy') {

            when {
                expression{
                    params.Destroy == 'false'
                }
            }
            steps {
                sh """
                    cd terraform
                    terraform destroy -auto-approve
                """    
            }
        }
    }


}
