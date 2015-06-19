execute "deploy-war" do  
  cwd "/home/ec2-user"
  command "wget https://web-actions.googlecode.com/files/helloworld.war"
  action :run
end
