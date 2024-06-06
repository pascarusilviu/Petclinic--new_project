pipeline {
    agent any 
    
    /*tools{
        jdk 'jdk11'
        maven 'maven3'
    }
    
    environment {
        SCANNER_HOME=tool 'sonar-scanner'
    }

*/
    
    stages{
        
        stage("Git Checkout"){
            steps{
                git branch: 'app_test', changelog: false, poll: false, url: 'https://github.com/pascarusilviu/Petclinic--new_project.git'
            }
        }
        
        stage("Compile"){
            steps{
                sh "mvn clean compile"
            }
        }
        
       /* stage("Test Cases"){
            steps{
                sh "mvn test"
                    options{
                             timeout(time: 3, unit: 'MINUTES')
                }
            }
        } */
        


   /*     stage("Sonarqube Analysis "){
            steps{
                withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Petclinic--new_project \
                    -Dsonar.java.binaries=. \
                    -Dsonar.projectKey=Petclinic--new_project '''
    
                }
            }
        } 
        */



        stage("Docker Build"){
            steps{
                script{                   

                        sh "docker build -t image1 ."
                        sh "docker tag image1 pascarusilviu/pet-clinic123 "
                     }   
                                                }
                }
            
        


                 stage("Docker Push"){         
            steps{
                script {
                    docker.withRegistry( '', dockerhub ) {
                    dockerImage.push()
                    }
                }
            }
        }





/*  
###########################################
###for below command I installed zaproxy###
###########################################
*/
        
        /* stage("OWASP Dependency Check"){
            steps{
                dependencyCheck additionalArguments: '--scan ./ --format HTML ', odcInstallation: 'DP'
                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
            }
        }*/

        stage("TRIVY"){
            steps{
                sh " trivy image adijaiswal/pet-clinic123:latest"
            }
        } */
        
        stage("Deploy To Tomcat"){
            steps{
                sh "cp  /home/anonim/temp_repo/Petclinic--new_project/target/petclinic/resources/css/petclinic.css etc/tomcat10/"

            }
        }
    }
}

