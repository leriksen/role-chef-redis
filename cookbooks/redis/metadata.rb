name 'redis'
maintainer 'Leif Eriksen'
maintainer_email 'leif.eriksen.au+redis-chef-github@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures Redis daemon'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.4.29'
chef_version '>= 16.0'
source_url 'https://github.com/leriksen/redis-chef'
issues_url 'https://github.com/leriksen/redis-chef/issues'

recipe 'redis::default', 'Install and configure Redis daemon'
recipe 'redis::uninstall-redis', 'Uninstalls Redis daemon'

depends 'devops'