service node['redis']['service_name'] do
  service_name node['redis']['service_name']
  action [ :stop ]
end

package node['redis']['pkg_name'] do
  action :remove
end

# file File.join(node['redis']['conf_dir'], 'redis.conf') do
#   action :delete
#   only_if { ::File.exist? File.join(node['redis']['conf_dir'], 'redis.conf') }
# end

file File.join(node['redis']['sysconfig_dir'], node['redis']['pkg_name']) do
  action :delete
  only_if { ::File.exist? File.join(node['redis']['sysconfig_dir'], node['redis']['pkg_name']) }
end

# we leave the redis logs in /var/log/redis for post-mortems
