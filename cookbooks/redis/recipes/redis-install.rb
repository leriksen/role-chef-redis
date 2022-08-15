execute "reset-redis-modules" do
  command 'dnf module reset redis -y'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end

execute "disable-redis-5" do
  command 'dnf module disable redis:5 -y'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end

execute "enable-redis-6" do
  command 'dnf module enable redis:6 -y'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end

package node['redis']['pkg_name'] do
  action :install
end

service node['redis']['service_name'] do
  service_name node['redis']['service_name']
  action [ :enable, :start ]
end

# secret is needed for config
secrets = data_bag_item('certs', 'redis')

template File.join(node['redis']['conf_dir'], 'redis.conf') do
  source 'redis.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables (
    {
      password: secrets['redis-password']
    }
  )
  notifies :restart, "service[#{node['redis']['service_name']}]"
end

template File.join(node['redis']['sysconfig_dir'], node['redis']['pkg_name']) do
  source 'redis.sysconfig.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, "service[#{node['redis']['service_name']}]"
end

include_recipe 'devops::default'

group node['redis']['group'] do
  append true
  comment 'add devops unix user to the redis group so they can read logs'
  members [ node['accounts']['devops']['unix_user'] ]
  action :modify
end

directory "#{node['redis']['certs_path']}" do
  recursive true
  action :create
end

include_recipe 'redis::redis-cert-update'