sudo yum install java-1.8.0-openjdk-devel
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins
sudo systemctl start jenkins
systemctl status jenkins


cd /usr/local/src
sudo wget http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
sudo tar -xf apache-maven-3.5.4-bin.tar.gz
sudo mv apache-maven-3.5.4/ apache-maven/
