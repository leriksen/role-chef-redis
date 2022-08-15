unless os.windows?
  describe user('root') do
    it { should exist }
  end
end

describe package('redis-server') do
  it { should be_installed }
end

describe port(6379) do
  it { should be_listening }
end