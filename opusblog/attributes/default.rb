####################################################
## Secrets
#
default['opusblog']['passwords']['secret_path'] = '/vagrant/encrypted_data_bag_secret'

####################################################
# Database Settings
default['opusblog']['database']['dbname']       = 'opusblog'
default['opusblog']['database']['host']         = '127.0.0.1'
default['opusblog']['database']['username']     = 'root'
default['opusblog']['database']['port']         = '3306'
default['opusblog']['database']['dbversion']    = '5.5'
default['opusblog']['database']['db_tmp_dir']   = '/var/tmp'

#Application Database User
default['opusblog']['database']['app']['username'] = 'wordpress'

####################################################
#Webserver settings
default['opusblog']['nginx']['package_name']            = 'nginx-full'
default['opusblog']['nginx']['default_site_enabled']    = true
default['opusblog']['nginx']['site_config_location']    = '/etc/nginx/sites-enabled/default'
default['opusblog']['nginx']['webroot']                 = '/usr/share/nginx/html'
default['opusblog']['nginx']['info_php_file_location']  = '/usr/share/nginx/html/info.php'


####################################################
#hhvm settings
#
#  None taking the defaults
#
#

####################################################
#Wordpress settings
default['opusblog']['wordpress']['install_file_fullpath']       = '/tmp/wordpress-latest.tar.gz'
default['opusblog']['wordpress']['install_mode']                = '0777'
default['opusblog']['wordpress']['install_url']                 = 'http://wordpress.org/latest.tar.gz'
default['opusblog']['wordpress']['uploads_folder_user']         = 'www-data'
default['opusblog']['wordpress']['uploads_folder_group']        = 'www-data'
default['opusblog']['wordpress']['uploads_folder_mode']         = '0755'
default['opusblog']['wordpress']['install_query_weblogtitle']   = 'opusblog'
default['opusblog']['wordpress']['install_query_firstuser']     = 'admin'
default['opusblog']['wordpress']['install_query_email']         = 'admin@foo.com'
default['opusblog']['wordpress']['install_query_install_url']   = 'http://127.0.0.1/wp-admin/install.php?step=2'






