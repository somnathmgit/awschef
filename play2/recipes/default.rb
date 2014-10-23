# create a file in ec2 instance
execute "unzip play" do
    command "touch /home/ec2-user/test.txt"
end	

