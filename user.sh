source ./common.sh
app_name=user

cp user.service /etc/systemd/system/user.service

nodeJs

UserAdd

systemctl daemon-reload

systemctl enable user
systemctl restart user