require 'chefspec'

describe 'redis::redis-install' do
  platform 'redhat'

  default_attributes[:redis][:certs_path] = '/etc/redis/ssl/certs'
  default_attributes[:redis][:pkg_name]   = 'redis'

  before(:each) do
    stub_data_bag_item("certs", "redis").and_return({
      id: 'redis',
      'redis-password': 'the databag password',
      redis: {
        cert_name: 'this is the cert contents'
      }
    })
  end

  it {is_expected.to install_package('redis')}
end