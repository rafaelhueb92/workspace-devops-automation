git clone https://github.com/iesodias/devops-automation-api.git ../temp-folder

mkdir -p app

cp -r ../temp-folder/pom.xml ../temp-folder/src ../temp-folder/Dockerfile ./app

rm -rf ../temp-folder