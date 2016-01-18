# opusblog-cookbook
##Purpose
  * For you to record your Life's Opus
  * Install wordpress, MySQL, nginx with hhvm
  * Quick Example of a full stack install
  * Leverage Vagrant for quick and easy testing

##Attributes

### Secrets
default['opusblog']['passwords']['secret_path'] = '/vagrant/encrypted_data_bag_secret'

### Database
default['opusblog']['database']['dbname'] - Name of the application database
default['opusblog']['database']['host'] - Hostname/IP of the database server
default['opusblog']['database']['username'] - Database admin password (root)
default['opusblog']['database']['port'] - Database port
default['opusblog']['database']['dbversion'] - Version of MySQL (5.5/5.6)
default['opusblog']['database']['db_tmp_dir'] - Database tmp foloder I don't like ubuntu's default
default['opusblog']['database']['app']['username'] - Wordpress Database User

### Webserver
default['opusblog']['nginx']['default_site_enabled'] - We use the default site but you don't have to
default['opusblog']['nginx']['site_config_location'] - Path to your site config
default['opusblog']['nginx']['webroot'] - Webroot for your siteconfig
default['opusblog']['nginx']['info_php_file_location'] - PHP Info is generated for diagnotic reasons

### Wordpress
default['opusblog']['wordpress']['install_file_fullpath'] - Name of install file and it's path
default['opusblog']['wordpress']['install_url'] - Full URL of the wordpress version (default is latest)
default['opusblog']['wordpress']['uploads_folder_user'] - Upload folder owner
default['opusblog']['wordpress']['uploads_folder_group'] - Upload folder group
default['opusblog']['wordpress']['install_query_weblogtitle'] - The offical name of your blog registered upon install init
default['opusblog']['wordpress']['install_query_firstuser'] - First wordpress username (default admin)
default['opusblog']['wordpress']['install_query_email'] - First wordpress user's email address
default['opusblog']['wordpress']['install_query_install_url'] - Points to the install page for the automated install, change the IP from 127.0.0.1 if you intend on keeping it around for a while.

 
###Nice to have
  * Security hardening and user management.
  * Should converge both in chef-zero and chef-client modes.
  * Take care with secrets!
  * Funcitonal/Unit/Lint tests are cool.
  * Think in terms of re-usable components.
  * Bonus points for a rake/Thor file for common tasks.


