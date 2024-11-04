sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install git -y
sudo yum install maven -y

if [ -d "addressbook-v1" ]
then
  echo "repo is cloned and exists"
  cd addressbook-v1
  git pull origin sshagent-b1
else
  git clone https://github.com/preethid/addressbook-v1.git
fi

cd addressbook-v1

mvn package