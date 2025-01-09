source ./common.sh
app_name=catalogue

cp mongo.repo /etc/yum.repos.d/mongo.repo

nodeJs

UserAdd

dnf install mongodb-mongosh -y

mongosh --host mongodb-dev.azdevops2704.online </app/db/master-data.js