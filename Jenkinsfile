node {

    def mvnHome = tool 'Maven'

    stage ('Checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e2f1b466-b418-42ac-84a8-b6d6a5857928', url: 'https://github.com/surya0249/hello-world-master.git']]])

    }

    stage ('build')  {
        sh "${mvnHome}/bin/mvn package -f pom.xml"
    }

    stage ('Docker Build') {
       app = docker.build("suryasajja/test") 
    }
    
    stage('Docker push') {
docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {            
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")        
              }    
           }

        

    stage ('Kubernetes Deploy') {
        kubernetesDeploy(
            configs: 'myweb.yml',
            kubeconfigId: 'K8S',
            enableConfigSubstitution: true
            )
    }
    /*
        stage ('Kubernetes Deploy using Kubectl') {
          sh "kubectl apply -f MyAwesomeApp/springBootDeploy.yml"
    }*/
}
