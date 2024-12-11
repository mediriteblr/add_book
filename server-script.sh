# sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install git -y
# sudo yum install maven -y
sudo yum install docker -y
sudo systemctl start docker

if [ -d "add_book" ]
then
  echo "repo is cloned and exists"
    git pull origin docker-nov
    cd add_book
else
  git clone https://github.com/mediriteblr/add_book.git
fi

cd add_book
# git checkout docker-nov
# mvn package
# mvn -U deploy -s settings.xml

sudo docker build -t $1 .
