#
# Cookbook Name:: chef-bamboo
# Recipe:: default
#
# Copyright (C) 2014 Sergio Leone
#
# All rights reserved - Do Not Redistribute
#
platform = 'windows' if node['platform_family'] == 'windows'
platform ||= 'linux'
settings = Bamboo.settings(node)

include_recipe 'bamboo::database' if settings['database']['host'] == 'localhost'
include_recipe "bamboo::#{platform}_#{node['bamboo']['install_type']}"
include_recipe 'bamboo::tomcat_configuration'
include_recipe 'bamboo::apache2'
include_recipe 'bamboo::configuration'
include_recipe "bamboo::service_#{node['bamboo']['service_type']}"
