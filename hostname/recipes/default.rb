execute "deploy-war-with-execute" do  
  cwd "/home/ec2-user"
  command "wget https://web-actions.googlecode.com/files/helloworld.war"
  action :nothing
end

bash 'deploy-war-with-bash' do
  user 'root'
  cwd '/home/ec2-user'
  code <<-EOH
	  mkdir webapps
	  wget wget https://web-actions.googlecode.com/files/helloworld.war
	  cp helloworld.war webapps/
  EOH
end
