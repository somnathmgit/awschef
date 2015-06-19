execute "deploy-war" do  
  #cwd "/home/ec2-user"
  command "touch /home/ec2-user/testec2.txt; wget https://web-actions.googlecode.com/files/helloworld.war --directory /home/ec2-user"
  action :run
end
