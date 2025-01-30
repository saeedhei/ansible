ls /etc/nginx/sites-available/

sudo rm /etc/nginx/sites-available/db1.seointro.de.conf
sudo rm /etc/nginx/sites-available/db2.seointro.de.conf

ls -l /etc/nginx/sites-enabled/

sudo rm /etc/nginx/sites-enabled/db1.seointro.de.conf
sudo rm /etc/nginx/sites-enabled/db2.seointro.de.conf

sudo systemctl restart nginx

sudo systemctl status nginx


