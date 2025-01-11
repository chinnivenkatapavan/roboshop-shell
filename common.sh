dir_path=$(pwd)

NodeJs(){
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
}

REDIS(){
  dnf module disable redis -y
  dnf module enable redis:7 -y
  dnf install redis -y
}

UserAdd(){
  useradd roboshop

  rm -rf /app
  mkdir /app

  curl -o /tmp/${app_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${app_name}-v3.zip
  cd /app
  unzip /tmp/${app_name}.zip

  cd /app
  npm install
}

DirPath(){
  cp ${dir_path}/${app_name}.service /etc/systemd/system/${app_name}.service

  systemctl daemon-reload

  systemctl enable ${app_name}
  systemctl restart ${app_name}
}

JAVA(){


  dnf install maven -y

  useradd roboshop

  rm -rf /app
  mkdir /app

  curl -L -o /tmp/${app_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${app_name}-v3.zip
  cd /app
  unzip /tmp/${app_name}.zip

  cd /app
  mvn clean package
  mv target/${app_name}-1.0.jar ${app_name}.jar

  DirPath
}