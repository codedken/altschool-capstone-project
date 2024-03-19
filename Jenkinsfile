pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    parameters{
        choice(name: 'ENVIRONMENT', choices: ['create', 'destroy'], description: 'create and destroy cluster with one click')
    }
    stages {
     
        stage("Create prometheus") {
             when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('kubernetes/prometheus-monitoring') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name sockshop-sales-dev"
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }


        stage("Deploy sock-shop to EKS") {
             when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('kubernetes/micro-service') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

         stage("Deploy ingress rule to EKS") {
             when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('kubernetes/ingress') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

         stage("Create nginx-conroller & route53") {
             when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('kubernetes/nginx-controller') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

        stage("Create and validate SSL certificate") {
            when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('sslcert') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

       

         stage("destroy prometheus") {
             when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('kubernetes/prometheus-helm') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }


        stage("Destroy sock-shop in EKS") {
             when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('kubernetes/micro-service') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }

        stage("Destroy ingress rule in EKS") {
             when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('kubernetes/ingress-rule') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }
        
         stage("destroy nginx-conroller") {
             when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('kubernetes/nginx-controller') {
                         sh "terraform destroy -auto-approve"
                    }
                }
            }
        }
         stage("destroy SSL certificate") {
             when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('sslcert') {
                         sh "terraform destroy -auto-approve"
                    }
                }
            }
        }

    }
}