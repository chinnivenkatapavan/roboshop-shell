app_name=nginx

echo Showing module list
dnf module list

echo install modules &>>log_file
dnf module disable ${app_name} -y &>>log_file
dnf module enable ${app_name}:1.24 -y &>>log_file
dnf install ${app_name} -y &>>log_file
Status_Print $?


rm -rf /etc/${app_name}/${app_name}.conf
cp ${app_name}.conf /etc/${app_name}/${app_name}.conf

systemctl enable ${app_name} &>>log_file
systemctl start ${app_name} &>>log_file


rm -rf /usr/share/${app_name}/html/*


curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip


cd /usr/share/${app_name}/html
unzip /tmp/frontend.zip

systemctl restart ${app_name} &>>log_file