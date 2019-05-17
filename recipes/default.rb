
include_recipe 'apt'

package 'apache2' do
  action :install
end

service 'apache2' do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content <<~HTML
    <html>
        <body>
            Hello from #{node['myapp']['greeter']}!<br/>
            (sent via #{node['platform']} #{node['platform_version']})
        </body>
    </html>
  HTML
end

log 'open your browser at http://localhost:8080 to see it running'
