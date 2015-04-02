# create a file in ec2 instance
#execute "unzip play" do
#    command "echo '#{node['aws-access']['aws_access_key_id']}' >> /home/ec2-user/test.txt"
#end	

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
