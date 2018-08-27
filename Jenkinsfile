node {

   def mvnHome

   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/abderrazak-bouadma/spring-demo-test.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.
      mvnHome = tool 'M3'
   }

   stage('Build') {
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
      }
   }

   stage('Results') {
      junit '**/target/surefire-reports/TEST-*.xml'
      archive 'target/*.jar'
   }

   stage('deploy') {
       // sh "sshpass -p 'Jwkry_6w!i}j?34U' scp demo-0.0.1-SNAPSHOT.jar LzmP894N8Q@13.81.30.169:/tmp"
       pwd
       ssh "echo \"greetings\" > hello.txt"
   }
}