
node {

    def mvnHome = tool 'Maven'

    stage ('Checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e2f1b466-b418-42ac-84a8-b6d6a5857928', url: 'https://github.com/surya0249/hello-world-master.git']]])

    }

    stage('Build image') {         
       
            app = docker.build("suryasajja/test")    
    }  
	stage('Push image') {
docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {		
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")        
              }    
           }
        

        

    stage ('Kubernetes Deploy') {
        kubernetesDeploy(
            configs: 'myweb.yaml',
            kubeconfigId: 'k8s',
            enableConfigSubstitution: true
            )
    }
    /*
        stage ('Kubernetes Deploy using Kubectl') {
          sh "kubectl apply -f MyAwesomeApp/springBootDeploy.yml"
    }*/
}
