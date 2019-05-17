# InSpec test for recipe myapp::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('apache2') do
  it { should be_installed }
end

describe upstart_service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
  its('processes') { should include 'apache2' }
  its('protocols') { should include 'tcp' }
  its('addresses') { should include '0.0.0.0' }
end

describe file('/var/www/html/index.html') do
  it { should be_file }
  its('content') { should include 'Hello from el cheffe!' }
end

describe command('wget -qO- http://localhost:80') do
  its('exit_status') { should eq 0 }
  its('stdout') { should include 'Hello from el cheffe!' }
end
