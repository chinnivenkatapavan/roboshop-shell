source ./common.sh
app_name=user

cp user.service /etc/systemd/system/user.service

NodeJs

UserAdd

systemctl daemon-reload

systemctl enable user
systemctl restart user