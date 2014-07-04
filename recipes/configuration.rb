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

directory "#{node['bamboo']['home_path']}/xml-data/configuration" do
  owner node['bamboo']['user']
  group node['bamboo']['user']
  mode 00755
  action :create
  recursive true
  only_if { node['bamboo']['crowd']['integration'] }
end

template "#{node['bamboo']['home_path']}/xml-data/configuration/crowd.properties" do
  source 'crowd.properties.erb'
  owner node['bamboo']['user']
  mode '0644'
  notifies :restart, 'service[bamboo]', :delayed
  only_if { node['bamboo']['crowd']['integration'] }
end

template "#{node['bamboo']['home_path']}/xml-data/configuration/crowd-ehcache.xml" do
  source 'crowd-ehcache.xml.erb'
  owner node['bamboo']['user']
  mode '0644'
  notifies :restart, 'service[bamboo]', :delayed
  only_if { node['bamboo']['crowd']['integration'] }
end

template "#{node['bamboo']['home_path']}/xml-data/configuration/atlassian-user.xml" do
  source 'atlassian-user.xml.erb'
  owner node['bamboo']['user']
  mode '0644'
  notifies :restart, 'service[bamboo]', :delayed
  only_if { node['bamboo']['crowd']['integration'] }
end

template "#{node['bamboo']['install_path']}/bamboo/atlassian-bamboo/WEB-INF/classes/seraph-config.xml" do
  source 'seraph-config.xml.erb'
  owner node['bamboo']['user']
  mode '0644'
  notifies :restart, 'service[bamboo]', :delayed
end
