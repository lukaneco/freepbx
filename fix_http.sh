#apt update && apt install nano -y

#grep -R AllowOverride * | grep -v :# | grep -v available

#sed -i -r "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
#
# <Directory /var/www/>
#         Options Indexes FollowSymLinks
#         AllowOverride None
#         Require all granted
# </Directory>
sed -i '/<Directory \/var\/www\/>/,\@</Directory>@ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
service apache2 restart