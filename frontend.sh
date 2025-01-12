source ./common.sh
app_name=nginx

echo Copy conf file in to file
cp nginx.conf /etc/nginx/nginx.conf &>>log_file
echo $?

echo ${app_name} module is Installing in server
dnf module disable ${app_name} -y &>>log_file
dnf module enable ${app_name}:1.24 -y &>>log_file
dnf install ${app_name} -y &>>log_file

echo start the ${app_name} server
systemctl enable ${app_name}
systemctl start ${app_name}

echo removing default content that web server is serving
rm -rf /usr/share/nginx/html/* &>>log_file
echo $?

echo Download the frontend content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>>log_file
echo $?

echo Extract the frontend content
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo $?

echo Restart Nginx Service to load the changes of the configuration
systemctl restart ${app_name}
