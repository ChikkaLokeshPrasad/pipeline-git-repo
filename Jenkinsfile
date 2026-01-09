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
                echo 'Building application...'
                bat '''
                echo Compiling source files...
                dir /s /b src\\*.java > sources.txt
                javac @sources.txt
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                bat '''
                java -cp src\\main\\java com.example.HelloDevOpsTest
                '''
            }
        }

        stage('Archive') {
            steps {
                echo 'Archiving artifacts...'
                archiveArtifacts artifacts: 'app.jar', fingerprint: true
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
