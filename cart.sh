source ./common.sh
app_name=cart


cp cart.service /etc/systemd/system/cart.service

nodeJs

UserAdd

systemctl daemon-reload

systemctl enable cart
systemctl start cart