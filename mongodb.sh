source ./common.sh

cp mongo.repo /etc/yum.repos.d/mongo.repo

echo Install mongoDB file in project
dnf install mongodb-org -y &>>log_file
Status_Print $?

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

systemctl enable mongod
systemctl start mongod
systemctl restart mongod