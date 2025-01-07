source ./common.sh

cp cart.service /etc/systemd/system/cart.service

nodeJs

useradd roboshop

rm -rf /app
mkdir /app

curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip
cd /app
unzip /tmp/cart.zip

cd /app
npm install

systemctl daemon-reload

systemctl enable cart
systemctl start cart