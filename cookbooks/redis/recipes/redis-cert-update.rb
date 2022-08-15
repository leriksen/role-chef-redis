secrets = data_bag_item('certs', 'redis')

file File.join(node['redis']['certs_path'], "#{node['redis']['cert_name']}.key") do
  content secrets[node['redis']['cert_name']]
  mode '0644'
  action :create
  notifies :restart, "service[#{node['redis']['service_name']}]"
end

remote_file File.join(node['redis']['certs_path'], "#{node['redis']['cert_name']}.crt") do
  source 'https://artifactoryredis.blob.core.windows.net/data/cert_content.txt'
  mode '0644'
  owner 'redis'
  group 'redis'
  checksum '69b65693ac9eff89e42e68a5110970df7508a525cc86c5647cc1c3253df7c670'
  action :create
  notifies :restart, "service[#{node['redis']['service_name']}]"
end

remote_file File.join(node['redis']['certs_path'], "ca-bundle.crt") do
  source 'https://artifactoryredis.blob.core.windows.net/data/cert_content.txt'
  mode '0644'
  owner 'redis'
  group 'redis'
  checksum '69b65693ac9eff89e42e68a5110970df7508a525cc86c5647cc1c3253df7c670'
  action :create
  notifies :restart, "service[#{node['redis']['service_name']}]"
end

service node['redis']['service_name'] do
  service_name node['redis']['service_name']
end
