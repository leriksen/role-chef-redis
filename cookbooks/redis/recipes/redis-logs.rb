execute 'redis-log-dump' do
  command '/usr/bin/cat /var/log/redis/redis.log'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end