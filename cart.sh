source ./common.sh
app_name=cart


cp ${app_name}.service /etc/systemd/system/${app_name}.service

nodeJs

UserAdd

systemctl daemon-reload

systemctl enable ${app_name}
systemctl restart ${app_name}