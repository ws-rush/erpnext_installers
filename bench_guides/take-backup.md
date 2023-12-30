
###############
### normal backup ###
###############
cd frappe-bench

bench backup-all-sites


###############
### Restore normal ###
###############

bench --site erpnext.local restore ~/20231227_011244-erpnext_local-database.sql.gz

bench --site erpnext --force restore ~/20231227_221630-site1_local-database.sql.gz








Before beginning the migration process, it's crucial to prepare your environment and data to ensure a smooth transition. Follow these steps to migrate your ERPNext instance from version 13 to version 14:

Prepare Your Environment:

Turn off the Supervisor service to prevent any automatic restarts.
Put your existing version 13 site(s) in maintenance mode using the command: bench --site [site-name] disable-scheduler bench --site [site-name] set-maintenance-mode
Backup Your Data:

Create a backup of your version 13 database and files. It's recommended to take backups directly on the ERPNext server using the following commands:

bench backup-all-sites
Download the backup files, including any private files, from the server backend using SSH.

Install ERPNext Version 14 on a New Instance:

Set up a new instance with ERPNext version 14 using the installation instructions provided in the ERPNext documentation.
Prepare the New Instance:

Ensure the new instance is properly configured with all necessary prerequisites.
Database Migration:

Create a new site on the version 14 instance:

bench new-site [new-site-name]
Restore the version 13 database backup into the new version 14 instance:

bench --site [new-site-name] --force restore /path/to/backup-file.sql.gz
Migrate the DocTypes to the new version:

bench --site [new-site-name] migrate
Update Bench and Apps:

Update the Bench and apps to the latest version 14 code: bench update --patch
Testing and Verification:

Thoroughly test the new version 14 instance to ensure data integrity and functionality.
Final Steps:

Turn off maintenance mode on the newly created site:

bench --site [new-site-name] unset-maintenance-mode
Restart the Supervisor service to resume normal operations:

sudo supervisorctl start all
Run and test all necessary Bench commands to ensure the migrated site is working as expected.










Please note that this guide provides a general outline of the migration process. For the most accurate and up-to-date instructions, refer to the official ERPNext documentation. Additionally, consider consulting with ERPNext professionals like erpgulf to minimize risks during the migration process.
###############
### full backup ###
###############

sudo bench --site erpnext.local backup --with-files

###############
### Restore full ###
###############

bench --site erpnext.local restore ~/20231227_001826-erp_promostar-egy_com-database.sql.gz   --with-public-files ~/20231227_001826-erp_promostar-egy_com-files.tar    --with-private-files ~/20231227_001826-erp_promostar-egy_com-private-files.tar

bench new-app Customwebsite
sudo bench --site erpnext.local install-app Customwebsite




cd frappe-bench

gunzip [DATABASE BACKUP FILE.sql.gz]

tar xvf [FILES BACKUP.tar]

bench restore - /home/frappe/frappe-bench/sites/20231202_022943-default-database.sql.gz



Downloading Backups
Download backup files
cd /tmp
wget [DATABASE BACKUP FILE URL]
wget [FILES BACKUP FILE URL] (this URL is to be made based on what is shown on the DATABASE BACKUP FILE URL)
Unzip files (this step is not necessary for the latest version)
gunzip [DATABASE BACKUP FILE.sql.gz]
tar xvf [FILES BACKUP.tar]


