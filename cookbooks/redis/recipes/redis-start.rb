service node['redis']['service_name'] do
  service_name node['redis']['service_name']
  action [ :enable, :start ]
end