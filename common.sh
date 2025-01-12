dir_path=$(pwd)
log_file=/tmp/roboshop.log
rm -f ${log_file}

Status_Print() {
  if [ $1 -eq 0 ]; then
    echo -e " \e[32mSUCCESS\e[0m"
  else
    echo -e " \e[31mFAILURE\e[0m"
    exit 1
  fi
}

NodeJs(){
  echo Install NODEJS Setup
  dnf module disable nodejs -y &>>log_file
  dnf module enable nodejs:20 -y &>>log_file
  dnf install nodejs -y &>>log_file
}

REDIS(){
  echo Install REDIS Setup
  dnf module disable redis -y &>>log_file
  dnf module enable redis:7 -y &>>log_file
  dnf install redis -y &>>log_file
}

UserAdd(){
  echo UserAdding
  useradd roboshop

  echo Removed app dir file
  rm -rf /app
  echo  Added new app file
  mkdir /app

  echo Downloading ${app_name}
  curl -o /tmp/${app_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${app_name}-v3.zip &>>log_file
  cd /app
  unzip /tmp/${app_name}.zip &>>log_file

  cd /app

  echo installing nodejs
  npm install &>>log_file
}

DirPath(){
  echo Copying service in ${app_name} file
  cp ${dir_path}/${app_name}.service /etc/systemd/system/${app_name}.service

  echo restart system server
  systemctl daemon-reload

  systemctl enable ${app_name}
  systemctl restart ${app_name}
  Status_Print $?
}

JAVA(){

  echo Install Maven
  dnf install maven -y &>>log_file
  Status_Print $?

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