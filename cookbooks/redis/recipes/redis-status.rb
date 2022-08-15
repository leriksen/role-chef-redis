execute 'redis-service-status' do
  command '/usr/bin/systemctl status redis.service'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end