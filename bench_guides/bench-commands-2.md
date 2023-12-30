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
