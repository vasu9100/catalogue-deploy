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
    }


}
