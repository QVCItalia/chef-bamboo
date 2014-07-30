name 'bamboo'
maintainer 'Sergio Leone'
maintainer_email 'sergio.leone@qvc.com'
license 'Apache 2.0'
description 'Installs/Configures Atlassian Bamboo'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'
recipe 'bamboo', 'Installs/Configures Atlassian Bamboo'
recipe 'bamboo::apache2', 'Installs/Configures Apache 2 proxy for Bamboo'
recipe 'bamboo::configuration', "Configures Bamboo's settings"
recipe 'bamboo::database', 'Installs/configures MySQL/Postgres server, database, and user for Bamboo'
recipe 'bamboo::linux_standalone', 'Installs/configures Bamboo via Linux standalone archive'
recipe 'bamboo::service_init', 'Installs/configures Bamboo init service'
recipe 'bamboo::tomcat_configuration', "Configures Bamboo's built-in Tomcat"

%w(amazon centos redhat scientific ubuntu).each do |os|
  supports os
end

%w(apache2 ark database java mysql mysql_connector percona postgresql).each do |cb|
  depends cb
end
