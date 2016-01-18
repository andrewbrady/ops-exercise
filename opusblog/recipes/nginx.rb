#
# Cookbook Name:: opusblog
# Recipe:: nginx
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node.default['nginx']['package_name']          = node['opusblog']['nginx']['package_name']
node.default['nginx']['default_site_enabled']  = node['opusblog']['nginx']['default_site_enabled']
include_recipe "nginx"

template node['opusblog']['nginx']['site_config_location'] do
  source "nginx-default.erb"
  action :create
end

template node['opusblog']['nginx']['info_php_file_location'] do
  source "phpinfo.erb"
  action :create
end

