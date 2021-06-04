node {

    def mvnHome = tool 'Maven'

    stage ('Checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e2f1b466-b418-42ac-84a8-b6d6a5857928', url: 'https://github.com/surya0249/hello-world-master.git']]])

    }

    stage ('build')  {
        sh "${mvnHome}/bin/mvn package -f pom.xml"
    }

    stage('Build Docker Image'){
        sh 'docker build -t suryasajja/webapp .'
    }
    
    stage('Push Docker Image'){
       withDockerRegistry(credentialsId: 'dockerhub', url: 'https://hub.docker.com/?ref=login') {
    // some block
 
          sh "docker login -u suryasajja -p ${dockerhub}"
       }
        sh 'docker push suryasajja/webapp'
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
