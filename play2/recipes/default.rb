# create a file in ec2 instance
execute "unzip play" do
    command "echo #{node['aws-access']['aws_access_key_id']} >> /home/ec2-user/test.txt"
end	

