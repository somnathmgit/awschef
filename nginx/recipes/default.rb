package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
end

file "/usr/share/nginx/html/#{node['index_page']['name']}" do
  content "<html>
  <body>
    <h1>#{node['welcome']['message']}</h1>
  </body>
</html>"
end