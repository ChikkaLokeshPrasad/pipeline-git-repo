pipeline {
    agent any

    tools {
        jdk 'jdk21'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/ChikkaLokeshPrasad/pipeline-git-repo'
                echo 'Repository cloned successfully'
            }
        }

        stage('Build') {
            steps {
                bat 'build.bat'
            }
        }

        stage('Test') {
    steps {
        echo 'Running tests...'
        bat 'java -cp target\\classes com.example.HelloDevOpsTest'
    }
}

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'app.jar', fingerprint: true
                archiveArtifacts artifacts: 'build.bat', fingerprint: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
            cleanWs()
        }
    }
}
