### all apps & how-to dir
### https://github.com/gavindsouza/awesome-frappe


################################################# payments & erpnext & hrms ###########
cd frappe-bench


sudo service supervisor restart

bench get-app --branch version-14 payments


bench get-app --branch version-14 erpnext
sudo bench --site site1.local install-app erpnext


bench get-app --branch version-14 hrms
sudo bench --site site1.local install-app hrms






########################################## HR Timesheets #################################
cd frappe-bench
bench get-app --branch version-14 HR-Addon https://github.com/phamos-eu/HR-Addon.git
sudo bench --site site1.local install-app hr_addon








################################ erpnext-v14 POS-Awesome (Point Of sale) (unofficial app) ############# 
cd frappe-bench
https://github.com/yrestom/POS-Awesome
bench get-app branch version-14 https://github.com/yrestom/POS-Awesome.git
bench setup requirements
bench build --app posawesome
bench restart
sudo bench --site site1.local install-app posawesome
sudo bench --site site1.local migrate


# keyboard shortcuts
CTRL or CMD + S open payments
CTRL or CMD + X submit payments
CTRL or CMD + D remove first item from the top
CTRL or CMD + A expand first item from the top
CTRL or CMD + E focus on discount field
# to remove
bench remove-app posawesome





######################################## chat (unofficial app) #####################################
cd frappe-bench
bench get-app chat
sudo bench --site site1.local install-app chat









##################################### Active Users (unofficial app) ###############################
cd frappe-bench
bench get-app https://github.com/kid1194/frappe-active-users
bench build --app active_users
sudo bench --site site1.local install-app active_users

## Update
cd frappe-bench/apps/active_users
git pull
cd frappe-bench
bench build --app active_users
sudo bench --site site1.local migrate
bench restart

## Uninstall
cd frappe-bench
sudo bench --site site1.local uninstall-app active_users
bench remove-app active_users
bench restart








########################### cheque_management ( not official doctype ) ##################
cd frappe-bench
bench get-app cheque_management https://github.com/hfaridgit/Cheque-Management
sudo bench --site site1.local install-app cheque_management








######################################### gst ( E-Invoice India ) ######################
cd frappe-bench
bench get-app https://github.com/frappe/erpnext_gst_compliance.git
sudo bench --site site1.local install-app erpnext_gst_compliance

bench get-app --branch version-14 https://github.com/resilient-tech/india-compliance.git
bench get-app --branch version-14 https://github.com/resilient-tech/india-compliance:develop
sudo bench --site site1.local install-app india_compliance







########################################### Credit Memo #################################
cd frappe-bench
bench get-app --branch version-14 creditmemo https://github.com/agritheory/creditmemo
sudo bench --site site1.local install-app creditmemo






################################ E-Commerce ( online shopping ) ##########################
cd frappe-bench

# Production installation https://github.com/frappe/ecommerce_integrations
bench get-app ecommerce_integrations --branch main

# OR development install https://github.com/frappe/ecommerce_integrations
bench get-app ecommerce_integrations  --branch develop

# install on site
sudo bench --site site1.local install-app ecommerce_integrations

Currently supported integrations:
Shopify
Unicommerce
Zenoti
Amazon

################################ Hospitality ( Manage Hotels & Manage Restaurants ####################################################
# https://github.com/frappe/hospitality



cd frappe-bench
bench get-app hospitality
sudo bench --site site1.local install-app hospitality






################################ resturant >> Compatibility V13, V14 ####################################################
## https://github.com/alphabit-technology/erpnext-restaurant

bench get-app https://github.com/quantumbitcore/erpnext-restaurant.git
bench setup requirements
bench build --app restaurant_management
bench restart
sudo bench --site site1.local install-app restaurant_management
sudo bench --site site1.local migrate






######################################## Havenir Hotel Erpnext ###############################
# https://docs.erpnext.com/docs/user/manual/en/hotel-room

cd frappe-bench
bench get-app https://github.com/nasir97177/hotel_erpnext.git
sudo bench --site site1.local install-app hotel_erpnext





######################################## Zatca e-invoicing #######################################
bench get-app https://github.com/ERPGulf/saudi-phase2-api.git
sudo bench --site site1.local install-app saudi-phase2-api
sudo bench --site site1.local migrate

Now you can see Zatca API installed on your site. Goto Help->About and make sure you have Zatca app installaed.



######################################## Raven is a simple work messaging tool  #######################################
https://github.com/The-Commit-Company/Raven




bench get-app https://github.com/The-Commit-Company/Raven.git
sudo bench --site site1.local install-app raven






######################################## to check installed apps ###############################

cd frappe-bench

bench version --version

bench version --format plain








################################# to  check running  services ( optional ) #####################
systemctl 




sudo systemctl status ssh
sudo systemctl status nginx
sudo systemctl status redis-server
sudo systemctl status supervisor
sudo systemctl status ufw





Exit by press {{{ shift + : }}} 
then press {{{ q }}} then press {{{ enter }}}
be sure that your keyboard in eng language





################################# whitelabel ###################################################
https://github.com/bhavesh95863/whitelabel
Below are important setting in whitelabel setting page.


Ignore Onboard Whitelabel:
If this setting value true then this app will not whitelabel onboarding steps and onboarding modules.
Show help menu:
By default this app hide help menu. this setting show help menu if value of this setting true.
Disable New Update Popup:
If this setting value true then it will disable new updates popup.
Installation Steps:

bench get-app https://github.com/bhavesh95863/whitelabel
sudo bench --site site1.local install-app whitelabel
bench migrate
bench restart
bench clear-cache
Note: You need to upload your logo at /public/images





If any issue or suggestion do write in the issue list we will resolve that.





################################################################################################

cd frappe-bench && bench start

################################################################################################



# SSL certificate fot https ( must have internet domain name installed in your ip ) << nsname record

sudo apt install certbot python3-certbot-nginx
certbot -d site1.local --register-unsafely-without-email
for auto renew the certificate

sudo certbot renew --dry-run