source ./common.sh
app_name=nginx

echo ${app_name} module is Installing in server
dnf module disable ${app_name} -y &>>$log_file
dnf module enable ${app_name}:1.24 -y &>>$log_file
dnf install ${app_name} -y &>>$log_file

echo start the ${app_name} server
systemctl enable nginx
systemctl start nginx

echo removing default content that web server is serving
rm -rf /usr/share/nginx/html/* &>>$log_file
Status_Print $?

echo Download the frontend content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>>$log_file
Status_Print $?

echo Extract the frontend content
cd /usr/share/nginx/html &>>$log_file
unzip /tmp/frontend.zip &>>$log_file
Status_Print $?

echo Copy conf file in to file
cp nginx.conf /etc/nginx/nginx.conf
Status_Print $?

echo Restart Nginx Service to load the changes of the configuration
systemctl restart nginx
