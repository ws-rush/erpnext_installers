# erpnext V14-ubuntu-22
bench init frappe-bench --frappe-branch version-14
pip3 install --upgrade --user pip
cd frappe-bench/
sudo chmod -R o+rx /home/frappe
bench start





# erpnext V15
bench init frappe-bench --frappe-branch version-15
pip3 install --upgrade --user pip
cd frappe-bench/
sudo chmod -R o+rx /home/frappe
bench start








############### STEP 15 ############### 

cd frappe-bench
sudo chmod -R o+rx /home/frappe

bench new-site erp.domain.com

bench use erp.domain.com

bench --site erp.domain.com add-to-hosts

bench --site erp.domain.com clear-cache

cd frappe-bench

bench start


# erpnext 14

bench setup requirements --dev

bench get-app https://github.com/frappe/payments --branch version-14
bench --site erp.domain.com install-app payments

bench get-app https://github.com/frappe/erpnext --branch version-14
bench --site erp.domain.com install-app erpnext

bench get-app https://github.com/frappe/hrms --branch version-14
bench --site erp.domain.com install-app hrms

bench get-app branch version-14 https://github.com/yrestom/POS-Awesome.git
bench setup requirements
bench build --app posawesome
bench --site erp.domain.com install-app posawesome


# erpnext 15

bench setup requirements --dev

bench get-app https://github.com/frappe/payments --branch version-15
bench --site erp.domain.com install-app payments

bench get-app https://github.com/frappe/erpnext --branch version-15
bench --site erp.domain.com install-app erpnext


bench get-app https://github.com/frappe/hrms --branch version-15
bench --site erp.domain.com install-app hrms


bench get-app branch version-15 https://github.com/yrestom/POS-Awesome.git
bench setup requirements
bench build --app posawesome
bench --site erp.domain.com install-app posawesome

# uninstall app
# sudo bench --site erp.domain.com uninstall-app hrms

bench use erp.domain.com

#لمعرفة اجمالي ما تم تنزيله علي النظام بالكامل 
bench version --format table
bench version --format legacy


# لمعرفة ما تم تثبيته علي موقع معين
bench --site erp.domain.com list-apps


cd frappe-bench


bench start





موقع دليل جميع تطبيقات فرابي
####################################################################################
### all apps website
### https://github.com/gavindsouza/awesome-frappe
####################################################################################






expert.com
192.168.1.103



####################################################
#uninstall app
sudo nano apps.txt
cd sites/apps
rm -rf posawesome
sudo bench --site erp.domain.com uninstall-app appname
sudo bench --site erp.domain.com remove-from-installed-apps appname
sudo bench --site erp.domain.com remove-app appname
bench --site erp.domain.com trim-database  --dry-run
bench --site erp.domain.com clear-cache





############### STEP 16 ###############   Production mode

cd frappe-bench

############ production mode:
cd frappe-bench

sudo chmod -R o+rx /home/frappe
bench --site erp.domain.com enable-scheduler
bench --site erp.domain.com set-maintenance-mode off
sudo bench setup production frappe
bench setup nginx
sudo service nginx reload
sudo supervisorctl restart all
sudo bench setup production frappe
bench build
bench restart

sudo nano /etc/supervisor/supervisord.conf

chmod=0760
chown=frappe:frappe

sudo -A systemctl restart supervisor

############ developer mode:
bench set-config -g developer_mode 1
bench --site erp.domain.com clear-cache
sudo bench disable-production
bench --site erp.domain.com disable-scheduler
bench setup requirements --dev
bench start



bench update --requirement
sudo service nginx restart
sudo service nginx start
sudo service nginx reload
bench setup supervisor
bench setup nginx
sudo systemctl restart nginx
#sudo python3 -m pip install ansible --break-system-packages
bench setup nginx
sudo systemctl restart nginx
sudo service nginx reload
bench --site erp.domain.com enable-scheduler
bench --site erp.domain.com set-maintenance-mode off




///Production bench restart issue////
cd ../
sudo nano /etc/supervisor/supervisord.conf
chown=ubuntu:ubuntu (under chmod)

Ctrl+X
sudo service supervisor restart
chmod -R o+rx /home/frappe

bench restart




hostname -I

## جرب الدخول من المتصفع علي رقم السيرفر
http://192.168.1.$$$$



# lets Encrypt ( SSL Secure Connection)
sudo apt install snapd -y
sudo snap install core; sudo snap refresh core
sudo apt-get remove certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --nginx

# Renew certication
sudo certbot renew --dry-run

# Manual (optional)
sudo certbot certonly --nginx
