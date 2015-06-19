
#--------------------------------

if node['ec2'].nil?
    bash "set_hostname" do
       #interpreter "bash"
       user 'root'
       code <<-EOH
         touch /home/ec2-user/test.txt
         NODE_NAME=node['hostname']
         LOCAL_IP=`ifconfig eth0 |grep inet |awk '{print $2}' |cut -d":" -f2 |grep -v "^$"`
         hostname ${NODE_NAME}
         echo ${LOCAL_IP}  ${NODE_NAME} >> /etc/hosts
       EOH 
    end 
else
     bash "set_hostname" do
        user 'root'
       #interpreter "bash"
        code <<-EOH
         touch /home/ec2-user/test.txt
         NODE_NAME=$(curl -s http://169.254.169.254/latest/meta-data/instance-id | cut -d- -f2)
         LOCAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
         hostname ${NODE_NAME}
         echo ${LOCAL_IP}  ${NODE_NAME} >> /etc/hosts
        EOH
     end	
end  


ohai "reload" do
  action :reload
end

if node['ec2'].nil?
    execute "set_hostname" do
        command "touch /home/ec2-user/test.txt;LOCAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4);echo ${LOCAL_IP} >> /home/ec2-user/testec2.txt"
    end        
else 
    execute "set_hostname" do
        #command "touch /home/ec2-user/testec2.txt;LOCAL_IP=node['hostname']; NODE_NAME=node['ipaddress'];echo node['hostname'] node['ipaddress'] >> /home/ec2-user/testec2.txt"
        command "touch /home/ec2-user/testec2.txt;LOCAL_IP=192.168.0.1; echo ${LOCAL_IP} >> /home/ec2-user/testec2.txt"
    end 
end    
