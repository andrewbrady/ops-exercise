#
# Cookbook Name:: opusblog
# Recipe:: wordpress
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

remote_file node['opusblog']['wordpress']['install_file_fullpath'] do
  source  node['opusblog']['wordpress']['install_url']
  mode    node['opusblog']['wordpress']['install_mode']
end

tar_extract node['opusblog']['wordpress']['install_file_fullpath'] do
  action      :extract_local
  target_dir  node['opusblog']['nginx']['webroot']
  creates     node['opusblog']['nginx']['webroot'] + '/wp-config-sample.php'
  tar_flags [ '-P', '--strip-components 1' ]
end

template node['opusblog']['nginx']['webroot'] + '/wp-config.php' do
  source "wp-config.erb"
  action :create
end

directory node['opusblog']['nginx']['webroot'] + '/wp-content/uploads' do
  owner node['opusblog']['wordpress']['uploads_folder_user']
  group node['opusblog']['wordpress']['uploads_folder_group']
  mode  node['opusblog']['wordpress']['uploads_folder_mode']
  notifies :run, 'execute[Submit Wordpress Install]', :delayed
end

# Load the secrets file and the encrypted data bag item that holds the root password.
password_secret = Chef::EncryptedDataBagItem.load_secret(node['opusblog']['passwords']['secret_path'])
root_password_data_bag_item = Chef::EncryptedDataBagItem.load('passwords', 'sql_server_root_password', password_secret)

execute 'Submit Wordpress Install' do
  command "service nginx restart;
    curl --data-urlencode \"weblog_title=#{node['opusblog']['wordpress']['install_query_weblogtitle']}\" \
      --data-urlencode \"user_name=#{node['opusblog']['wordpress']['install_query_firstuser']}\" \
      --data-urlencode \"admin_password=#{root_password_data_bag_item['password']}\" \
      --data-urlencode \"admin_password2=#{root_password_data_bag_item['password']}\" \
      --data-urlencode \"admin_email=#{node['opusblog']['wordpress']['install_query_email']}\" \
      --data-urlencode \"Submit=Install+WordPress\" \
      #{node['opusblog']['wordpress']['install_query_install_url']}"
  action :nothing
end

