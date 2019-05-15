
package 'apache2' do
  action :install
end

service 'apache2' do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content 'hello world!'
end

log 'open your browser at http://localhost:8080 to see it running'
