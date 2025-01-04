#Appropriate privileges to gain root access
sudo -i

#Display module list
dnf module list

#Install Nginx
dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

#Start and Enable Nginx service
systemctl enable nginx
systemctl start nginx

#Removing the default content
rm -rf /usr/share/nginx/html/*

#Downloading the frontend content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip

#Extracting download content in location
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#copyin configuration file
cp nginx.conf /etc/nginx/nginx.conf

#Restarting nginx service to load the changes of the configuration file
systemctl restart nginx



