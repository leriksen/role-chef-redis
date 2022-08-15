user node['accounts']['devops']['unix_user'] do
  comment 'devops user'
  action :create
  shell '/bin/bash'
  home '/home/devops'
end
