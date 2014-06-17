#
# Cookbook Name:: chef-bamboo
# Recipe:: tomcat_configuration
#
# Copyright (C) 2014 Sergio Leone
#
# All rights reserved - Do Not Redistribute
#
settings = Bamboo.settings(node)
bamboo_version = Chef::Version.new(node['bamboo']['version'])

template "#{node['bamboo']['install_path']}/bamboo/bin/setenv.sh" do
  source 'setenv.sh.erb'
  owner node['bamboo']['user']
  group node['bamboo']['user']
  mode '0755'
  notifies :restart, 'service[bamboo]', :delayed
end

template "#{node['bamboo']['install_path']}/bamboo/conf/server.xml" do
  source 'server.xml.erb'
  owner node['bamboo']['user']
  group node['bamboo']['user']
  mode '0640'
  variables :tomcat => settings['tomcat']
  notifies :restart, 'service[bamboo]', :delayed
end
