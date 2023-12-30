##########################################################
###### Internal Server Error ############

sudo nano /etc/systemd/system/mysqld.service

On the file change

#LimitNOFILE=16364
LimitNOFILE=40000

Then enter the following commands

sudo mysqld --tc-heuristic-recover=ROLLBACK
sudo service mysql start

Your application should now be up and running!!

bench install-app custom

bench --site erp.YOURDOMAIN.COM install-app custom






bench new-app library_management




sudo nano /etc/nginx/conf.d/frappe-bench.conf

# Confirm redis-server is running
sudo netstat -tulpn | grep redis-server
sudo redis-server -v        # Should be >= 3.2.x

# Confirm NodeJS and npm
sudo node -v                # Should be >= 8.9.x for all except Debian 7
sudo npm -v                 # Should be >= 5.6.x

# Confirm mysql/mariadb is running on port 3306
sudo netstat -tulpn | grep mysql

# Confirm ngingx is listening on port 80
sudo netstat -tulpn | grep nginx

# Confirm postfix smtp relay is running on port 25
sudo netstat -tulpn | grep master

# Confirm socket.io is running on port 8000 as a python process
sudo netstat -tulpn | grep 8000

# Confirm NodeJS is running on port 9000
sudo netstat -tulpn | grep node
























bench setup manager


https://github.com/frappe/bench_manager

bench new-site bench-manager.local
bench get-app bench_manager
bench --site bench-manager.local install-app bench_manager
bench --site erp.YOURDOMAIN.COM install-app bench_manager



bench use erpnext.com
bench setup nginx
bench restart
bench migrate



# Perform a dry run to see what would happen on running it on a particular site.
bench --site erpnext uninstall-app payments --dry-run

#Don't take a backup before the application uninstall operation.
bench --site erpnext uninstall-app payments --no-backup


#Use force to uninstall application from site.
bench --site erpnext uninstall-app payments --force


#Skip the interactive prompt for confirmation of uninstall.
bench --site erpnext uninstall-app payments --yes


bench remove-app payments

# try to just delete all the app files from the app directory
# try to remove the lines in apps.txt ( payments ) manually

sudo bench setup production bitnami > y

sudo supervisorctl restart all

sudo systemctl restart supervisor.service

bench --site erpnext.com set-maintenance-mode off

sudo bench setup production bitnami > y

bench --site erpnext migrate

bench restart


########################
# if bench error

bench use site.com

bench setup socketio

bench setup supervisor

bench setup nginx

bench setup redis

bench setup systemd

sudo bench setup production root << user name
 
sudo bench setup sudoers frappe





########################
# if permission error

sudo service nginx reload

sudo service supervisor restart

sudo supervisorctl restart all

sudo systemctl reload nginx

sudo systemctl stop nginx

sudo systemctl start nginx

sudo systemctl reload nginx

sudo systemctl restart nginx





## If error
# bench setup supervisor
# sudo ln -s `pwd`/config/supervisor.conf /etc/supervisor/conf.d/frappe-bench.conf




#sudo apt install snapd -y && \
            sudo snap install core && \
            sudo snap refresh core && \
            sudo snap install --classic certbot && \
            sudo ln -s /snap/bin/certbot /usr/bin/certbot



sudo nano /etc/supervisor/supervisord.conf
chmod = 0760
chown = frappe:frappe



pip3 install --upgrade --user pip



pip3 install --user "setuptools<45"



bench restart




Adding a Domain with SSL to your Site
Add Domain
bench setup add-domain [desired-domain]
Install Let's Encrypt Certificate
Install snapd on your machine
sudo apt install snapd
Update snapd
sudo snap install core;
sudo snap refresh core
Remove existing installations of certbot
sudo apt-get remove certbot
Install certbot
sudo snap install --classic certbot

sudo ln -s /snap/bin/certbot /usr/bin/certbot
Get Certificate
sudo -H bench setup lets-encrypt [site-name]
You will be faced with several prompts, respond to them accordingly. This command will also add an entry to the crontab of the root user (this requires elevated permissions), that will attempt to renew the certificate every month.










################################# under test commands
sudo apt-get install -y net-tools
netstat
netstat -a
df
free -m
vmstat
sudo netstat -ltnp | grep -w ':13000'
###################################