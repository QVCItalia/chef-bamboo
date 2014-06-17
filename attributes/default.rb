default['bamboo']['home_path']    = '/var/atlassian/application-data/bamboo'
default['bamboo']['install_path'] = '/opt/atlassian'
default['bamboo']['install_type'] = 'standalone'
default['bamboo']['service_type'] = 'init'
default['bamboo']['url_base']     = 'http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo'
default['bamboo']['user']         = 'bamboo'
default['bamboo']['version']      = '5.5.1'

default['bamboo']['url']      = "#{node['bamboo']['url_base']}-#{node['bamboo']['version']}.tar.gz"
default['bamboo']['checksum'] =
case node['bamboo']['version']
when '5.5.1' then '1a9229158d7347d8debeca824ce1511d40e1baa8514309aea576e0c07d73cf19'
end

default['bamboo']['apache2']['webapp_enable']      = true
default['bamboo']['apache2']['access_log']         = ''
default['bamboo']['apache2']['error_log']          = ''
default['bamboo']['apache2']['port']               = 80
default['bamboo']['apache2']['virtual_host_alias'] = node['fqdn']
default['bamboo']['apache2']['virtual_host_name']  = node['hostname']

default['bamboo']['apache2']['ssl']['access_log']       = ''
default['bamboo']['apache2']['ssl']['chain_file']       = ''
default['bamboo']['apache2']['ssl']['error_log']        = ''
default['bamboo']['apache2']['ssl']['port']             = 443

case node['platform_family']
when 'rhel'
  default['bamboo']['apache2']['ssl']['certificate_file'] = '/etc/pki/tls/certs/localhost.crt'
  default['bamboo']['apache2']['ssl']['key_file']         = '/etc/pki/tls/private/localhost.key'
else
  default['bamboo']['apache2']['ssl']['certificate_file'] = '/etc/ssl/certs/ssl-cert-snakeoil.pem'
  default['bamboo']['apache2']['ssl']['key_file']         = '/etc/ssl/private/ssl-cert-snakeoil.key'
end

default['bamboo']['database']['host']     = 'localhost'
default['bamboo']['database']['name']     = 'bamboo'
default['bamboo']['database']['password'] = 'changeit'
default['bamboo']['database']['port']     = 3306
default['bamboo']['database']['testInterval'] = 2
default['bamboo']['database']['type']     = 'mysql'
default['bamboo']['database']['user']     = 'bamboo'

default['bamboo']['jvm']['minimum_memory']  = '512m'
default['bamboo']['jvm']['maximum_memory']  = '768m'
default['bamboo']['jvm']['maximum_permgen'] = '256m'
default['bamboo']['jvm']['java_opts']       = ''
default['bamboo']['jvm']['support_args']    = ''

default['bamboo']['tomcat']['keyAlias']     = 'tomcat'
default['bamboo']['tomcat']['keystoreFile'] = "#{node['bamboo']['home_path']}/.keystore"
default['bamboo']['tomcat']['keystorePass'] = 'changeit'
default['bamboo']['tomcat']['port']         = '8085'
default['bamboo']['tomcat']['ssl_port']     = '8443'
default['bamboo']['context']                = ''
