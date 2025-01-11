source ./common.sh
app_name=catalogue

nodeJs

UserAdd

systemctl daemon-reload

systemctl enable catalogue
systemctl start catalogue

cp mongo.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-mongosh -y

mongosh --host mongodb-dev.azdevops2704.online </app/db/master-data.js