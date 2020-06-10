@Library('ised-cicd-lib') _

pipeline {
	agent any
	
    options {
        disableConcurrentBuilds()
    }
  
   	environment {
		// GLobal Vars
		IMAGE_NAME = "dsdmdl-moodle"
		BUILD_NAME = "dsdmdl-moodle"
    }
  
    stages {
    	stage('build') {
			steps {
				script {
	    			builder.buildS2IAppFromDir("${IMAGE_NAME}", "${BUILD_NAME}", ".")
				}
			}
    	}
    }
}
