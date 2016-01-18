#
# Cookbook Name:: opusblog
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

####################################################
# Configure the mysql2 Ruby gem.
mysql2_chef_gem 'opusblog' do
  action :install
end

####################################################
# Configure the MySQL client.
mysql_client 'opusblog' do
  action :create
end

# Load the secrets file and the encrypted data bag item that holds the root password.
password_secret = Chef::EncryptedDataBagItem.load_secret(node['opusblog']['passwords']['secret_path'])
root_password_data_bag_item = Chef::EncryptedDataBagItem.load('passwords', 'sql_server_root_password', password_secret)

####################################################
# Configure the MySQL service.
mysql_service 'opusblog' do
  tmp_dir       node['opusblog']['database']['db_tmp_dir']
  port          node['opusblog']['database']['port']
  version       node['opusblog']['database']['dbversion'] 
  initial_root_password root_password_data_bag_item['password']
  action [:create,:start]
end

####################################################
# Create the database instance.
mysql_database 'opusblog' do
  connection(
    :host       => node['opusblog']['database']['host'],
    :username   => node['opusblog']['database']['username'],
    :password   => root_password_data_bag_item['password']
  )
  action :create
end

####################################################
# Add a database user.
mysql_database_user node['opusblog']['database']['app']['username'] do
  connection(
    :host       => node['opusblog']['database']['host'],
    :username   => node['opusblog']['database']['username'],
    :password   => root_password_data_bag_item['password']
  )
  password       root_password_data_bag_item['password']
  database_name  node['opusblog']['database']['dbname'] 
  host           node['opusblog']['database']['host']
  action [:create, :grant]
end
