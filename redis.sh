source ./common.sh

app_name=redis

REDIS

sed -i 's/127.0.0.1/0.0.0.0' /etc/${app_name}/${app_name}.conf
sed -i '/protected-mode/ c protected-mode no' /etc/${app_name}/${app_name}.conf

systemctl enable ${app_name}
systemctl restart ${app_name}