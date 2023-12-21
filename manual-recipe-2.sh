#############################################
########### erpnext v14+v15 on ubuntu 22.04 #######
###############################################


#install ssh
sudo apt install -y openssh-server
sudo systemctl enable --now ssh
sudo ufw allow ssh


# check ssh service
sudo systemctl status ssh



## check ip
hostname -I



## connect  with putty 192.168.1.101 <<< your ip




############### STEP 1 ############### 

sudo apt update && sudo apt upgrade -y
sudo reboot







############### STEP 2 ############### 

sudo apt install  -y build-essential
sudo apt install  -y --fix-broken
sudo apt install  -y git supervisor nginx curl wget cron gnupg ca-certificates






############### STEP 3 ############### 

sudo adduser frappe
sudo usermod -aG sudo frappe
sudo nano /etc/sudoers
su - frappe
sudo chmod -R o+rx /home/frappe








############### STEP 4 ############### 

# erpnext version v14 & v15- ubuntu-22.04
sudo apt install python3.10 -y
sudo apt install python3.10-full -y
sudo apt install python3-dev -y
sudo apt install python3-setuptools python3-distutils python3-pip -y
sudo apt install python3.10-venv -y



## erpnext version 15 - ubuntu-23
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.11 -y
sudo apt install python3.11-full -y
sudo apt install python3-dev -y
sudo apt install python3-setuptools python3-distutils python3-pip -y
sudo apt install python3.11-venv -y


python3.11 --version




############### STEP 5 ###############
python3 -V



apt list --installed
apt list --upgradeable






############### STEP 6 ############### 

sudo apt install redis-server -y














############### STEP 7 ############### 

sudo apt install software-properties-common -y


# If prompt for "Override local changes to /etc/pam.d/common-*?" on PAM Configuration, 
then safely choose "No".












############### STEP 8 ############### 

sudo apt install xvfb libfontconfig wkhtmltopdf -y













############### STEP 9 ############### 

sudo apt install mariadb-server mariadb-client libmysqlclient-dev -y

sudo mysql_secure_installation

Enter current password for root (enter for none): press Enter
Switch to unix_socket authentication [Y/n]          (Press "Y")
Change the root password? [Y/n]                     (Press "Y")
New password: 123123                                
Re-enter new password:123123                        
Remove anonymous users? [Y/n]                       (Press "Y")
Disallow root login remotely? [Y/n]                 (Press "Y")
Remove test database and access to it? [Y/n]        (Press "Y")
Reload privilege tables now? [Y/n]                  (Press "Y")



sudo mysql --version









############### STEP 10 ############### 
sudo nano /etc/mysql/my.cnf
############################################

[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci      
 
[mysql]
default-character-set = utf8mb4

################################################


to exit press Ctrl-x and y to save then enter


## restart mysql 

sudo service mysql restart











############### STEP 11 ############### 


##### node for erpnext version 14
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile
nvm install 16
nvm use 16
sudo apt install npm -y
sudo reboot



##### node for erpnext version 15
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile
nvm install 18
nvm use 18
sudo apt install npm -y
sudo reboot





#if error
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo n latest





############### STEP 12 ############### 

sudo npm install -g yarn


######## check version (optional)



yarn --version
npm --version
node --version


sudo yarn --version
sudo npm --version
sudo node --version


sudo reboot












############### STEP 13 ############### 


sudo -H pip3 install frappe-bench 

bench --version


for Proxmox Installion in CT 
### sudo -H pip3 install frappe-bench --break-system-packages


bench --version






############### STEP 14 ############### 



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






#######################
dont use these untill you know
#######################
sudo apt install ufw
sudo ufw disable
sudo ufw default allow outgoing 
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow http 
sudo ufw allow https
sudo ufw enable
sudo service ssh restart 
sudo ufw status numbered
sudo ufw status
#########################
sudo ufw delete 10
sudo ufw reset
#########################



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
