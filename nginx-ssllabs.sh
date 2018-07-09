sudo apt-get update
sudo apt-get install nginx -y
sudo apt-get install –only-upgrade libssl1.0.0 openssl -y
touch /etc/nginx/options-ssl-nginx.conf
echo -e "ssl_session_cache shared:le_nginx_SSL:1m;\nssl_session_timeout 1440m;\nssl_protocols TLSv1 TLSv1.1 TLSv1.2;\nssl_prefer_server_ciphers on;\nssl_prefer_server_ciphers on;\nssl_ciphers \"ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:\!DSS\";" > /etc/nginx/options-ssl-nginx.conf
mkdir -p /etc/nginx/ssl
cd /etc/nginx/ssl
openssl req -new -newkey rsa:4096 -nodes -keyout domain.key -out domain.csr -subj "/C=BR/ST=State/L=Location/O=Organization/OU=OrganizationalUnit/CN=yourfulldomain/emailAddress=email@example.com"
openssl dhparam -dsaparam -out dhparam.pem 4096
sudo service nginx reload
