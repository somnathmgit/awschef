package 'httpd' do
  action :install
end

service 'httpd' do
  action [:enable, :start]
end

file "/var/www/html/#{node['index_page']['name']}" do
  content "<html>
  <body>
    <h1>#{node['welcome']['message']}</h1>
  </body>
</html>"
end
