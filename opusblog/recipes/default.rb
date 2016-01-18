#
# Cookbook Name:: opusblog
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'ruby-dev' do
  action :install
end

include_recipe "opusblog::database"
include_recipe "opusblog::nginx"
include_recipe "opusblog::hhvm"
include_recipe "opusblog::wordpress"
