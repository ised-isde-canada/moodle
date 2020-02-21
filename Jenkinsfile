@Library('ised-cicd-lib') _

pipeline {
	agent any
	
    options {
        disableConcurrentBuilds()
    }
  
  environment {
		// GLobal Vars
		IMAGE_NAME = "learning-moodle"
		BUILD_NAME = "learning-moodle"
		DEV_BRANCH = "MOODLE_36_DEV"
    }
  
    stages {
    	stage('build') {
			steps {
				script{
	    			build.buildS2IApp("${IMAGE_NAME}", "${BUILD_NAME}", "${DEV_BRANCH}")
				}
			}
    	}
    }
}
