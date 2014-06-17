#
# Cookbook Name:: chef-bamboo
# Recipe:: configuration
#
# Copyright (C) 2014 Sergio Leone
#
# All rights reserved - Do Not Redistribute
#
template "#{node['bamboo']['install_path']}/bamboo/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties" do
  source 'bamboo-init.properties.erb'
  owner node['bamboo']['user']
  mode '0644'
  notifies :restart, 'service[bamboo]', :delayed
end
