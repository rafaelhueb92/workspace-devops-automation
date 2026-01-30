git clone https://github.com/iesodias/devops-automation-api.git ../temp-folder

mkdir -p app

cp -r ../temp-folder/* ../temp-folder/.mvn ./app

rm -rf ../temp-folder
