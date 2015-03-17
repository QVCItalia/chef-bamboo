default['bamboo']['home_path']    = '/var/atlassian/application-data/bamboo'
default['bamboo']['install_path'] = '/opt/atlassian'
default['bamboo']['install_type'] = 'standalone'
default['bamboo']['service_type'] = 'init'
default['bamboo']['url_base']     = 'http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo'
default['bamboo']['user']         = 'bamboo'
default['bamboo']['version']      = '5.8.1'

default['bamboo']['url']      = "#{node['bamboo']['url_base']}-#{node['bamboo']['version']}.tar.gz"
default['bamboo']['checksum'] =
case node['bamboo']['version']
	when '5.5.1' then '1a9229158d7347d8debeca824ce1511d40e1baa8514309aea576e0c07d73cf19'
	when '5.6.0' then '71c72e094fbcc258aa0f0cf74c652e0d63887c35b900f563bc672db99c5d9b98'
	when '5.6.1' then '28fcf425b44737fbe7aedc9cdccacee788d174c3cd6cc2beb4ce5f3ca5d0de27'
	when '5.6.2' then '57737a00207642e7be4ceea7b702e30e1caccaaa51e08699c2c9ae588e4c88b3'
	when '5.7.0' then 'd5de9b25502f78a2b975a74f9200a3ac15f91f1452e584344621cdd60368a690'
	when '5.7.2' then 'b378500ea61803333fc27b0a42cfbdfbce5dccc75cead0b464dbc4e5e0bddb17'
	when '5.8.1' then 'bb691d22273ceaa999eb435dfb4e8d697c3c803505218845bf5785ec2785cbd8'
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

default['bamboo']['crowd']['integration'] = false
default['bamboo']['crowd']['sso'] = false
default['bamboo']['crowd']['application.name'] = 'bamboo'
default['bamboo']['crowd']['application.password'] = 'password'
default['bamboo']['crowd']['application.login.url'] = 'http://localhost:8095/crowd/console/'
default['bamboo']['crowd']['crowd.server.url'] = 'http://localhost:8095/crowd/services'
default['bamboo']['crowd']['crowd.base.url'] = 'http://localhost:8095/crowd/'
default['bamboo']['crowd']['session.validationinterval'] = 2
