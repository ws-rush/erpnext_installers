- ## Setup
	- ### prepare databases
		-
		  > use databases from **containers** to avoid thier setup and config, but you should configure frappe to use remote database  
		- **mariadb**
		-
		  ```sh
		  sudo apt install mariadb-server mariadb-client default-libmysqlclient-dev
		  
		  # configure mariadb
		  sudo echo "
		  [mysqld]
		  character-set-client-handshake = FALSE
		  character-set-server = utf8mb4
		  collation-server = utf8mb4_unicode_ci
		  
		  [mysql]
		  default-character-set = utf8mb4
		  " >> /etc/mysql/my.cnf
		  sudo systemctl restart mysql
		  
		  # secure mariadb
		  sudo mysql_secure_installation
		  ```
		- answer on secure mariadb as following:
			- - Enter current password for root: (Enter your SSH root user password)
			- - Switch to unix_socket authentication [Y/n]: Y
			- - Change the root password? [Y/n]: Y
			- - It will ask you to set new MySQL root password at this step. This can be different from the SSH root user password.
			- - Remove anonymous users? [Y/n] Y
			- - Disallow root login remotely? [Y/n]: N
			- - This is set as N because we might want to access the database from a remote server for using business analytics software like Metabase / PowerBI / Tableau, etc.
			- - Remove test database and access to it? [Y/n]: Y
			- - Reload privilege tables now? [Y/n]: Y
		- **postgresql**
		-
		  > incomplete instructions  
		-
		  ```sh
		  sudo apt install postgresql postgresql-contrib
		  sudo systemctl start postgresql.service
		  psql -V # show postgres server version
		  sudo -u postgres psql
		  ```
		- **redis**
		-
		  ```sh
		  # redis server
		  sudo apt install redis-server
		  ```
	- ### setup bench
		-
		  > use **frappe/bench** container  
		-
		  > [optional setups | advanced](https://github.com/D-codE-Hub/ERPNext-installation-Guide#optional-step-for-cratetind-production-setup)  
		-
		  ```sh
		  # these instructions for `debian 12`
		  # install packages
		  sudo apt install python3-pip python3-setuptools python3-dev python3-distutils python3-venv build-essential
		  
		  # install node and npm
		  sudo apt install npm
		  sudo npm install -g yarn
		  
		  sudo apt install xvfb libfontconfig wkhtmltopdf
		  
		  
		  # install bench cli
		  pip3 install --user --break-system-packages frappe-bench
		  echo 'PATH="$PATH:/home/rush/.local/bin"'' >> ~/.bashrc
		  source ~/.bashrc
		  
		  # check  installation or get help
		  bench --version
		  bench --help
		  ```
- ## Bench CLI
	-
	  ```sh
	  # creat project
	  bench init [--frappe-branch version-14] frappe-app && cd frappe-app
	  # create in bench container (without redis connection)
	  bench init [--frappe-branch version-15] --skip-redis-config-generation app && cd app
	  # setup remote databases
	  bench set-config -g developer_mode 1
	  bench set-config -g db_host localhost && bench set-config -g db_port 3306
	  bench set-redis-cache-host redis
	  bench set-redis-queue-host redis
	  bench set-redis-socketio-host redis
	  bench set-config maintenance_mode 0 # disbale mintainance mode (it show after upgrade)
	  ## I dont prefer this way
	  ## add IP addres or domain
	  bench set-mariadb-host (REMOTE-MySQL-IP | ADDRESS)
	  
	  # download or create app in project
	  bench new-app (app_name)
	  bench get-app (app_name | repo_link) [--branch branch_name]
	  # bench get-app payments --branch version-14 (necessary for erpnext installation)
	  # bench get-app erpnext --branch version-15
	  # bench get-app hrms (optional)
	  # bench get-app ecommerce_integrations --branch main (optional)
	  
	  # create site
	  bench new-site [--db-type postgres] (site-name) # erp for example
	  # remove site
	  bench drop-site (site-name) --force
	  # sets a default site
	  # bench set (site_name.localhost)
	  bench use (site-name)
	  # install apps on site
	  bench --site (site-name) install-app (app-name)
	  # bench --site erp install-app erpnext
	  # bench --site erp install-app hrms
	  # bench --site erp install-app ecommerce_integrations
	  # defaults: Administrator, password as you set
	  # uninstall appp
	  bench uninstall-app (app-name)
	  ## setup site with new db, take site parameters from remote database
	  ## specify every parameter from database
	  bench new-site test.site --db-name test --mariadb-root-username dbadmin --mariadb-root-password mydbpassword
	  ## connect to database configured with full privilages, see configure above
	  bench new-site site1.remote --install-app erpnext --verbose
	  
	  # open mariadb console
	  bench --site
	  
	  # run project
	  bench start
	  # restart all bench services
	  bench restart
	  # clear the cache
	  bench clear-cache
	  # set configs
	  bench set-config (key) (value) # developer_mode 1 to make frappe generate code files fom Desk
	  # login spesfic site directly
	  bench browse (site_name.localhost) --user Administrator
	  
	  # create backup of default site
	  bench backup
	  # run patches, sync schema and rebuild files/translations
	  bench migrate
	  
	  # setup production server (need test)
	  bench --site site1.local enable-scheduler
	  bench --site site1.local set-maintenance-mode off
	  sudo bench setup production [frappe-user]
	  bench setup nginx
	  sudo supervisorctl restart all
	  sudo bench setup production [frappe-user]
	  ```
	-
	  > if get `404` error after run project check of `peoject/sites/currentsite.txt`, if not exist create it manually and add your `site-name`  
