template '/etc/init.d/bamboo' do
  source 'bamboo.init.erb'
  mode '0755'
  notifies :restart, 'service[bamboo]', :delayed
end

service 'bamboo' do
  supports :status => true, :restart => true
  action [:enable]
  subscribes :restart, 'java_ark[jdk]'
end
