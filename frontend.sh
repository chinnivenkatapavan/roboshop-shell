app_name=nginx


dnf module list

dnf module disable ${app_name} -y
dnf module enable ${app_name}:1.24 -y
dnf install ${app_name} -y

rm -rf /etc/${app_name}/${app_name}.conf
cp ${app_name}.conf /etc/${app_name}/${app_name}.conf

systemctl enable ${app_name}
systemctl start ${app_name}


rm -rf /usr/share/${app_name}/html/*


curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip


cd /usr/share/${app_name}/html
unzip /tmp/frontend.zip

systemctl restart ${app_name}