if node['ec2'].nill?
  bash "set_hostname" do
   #interpreter "bash"
   code <<-EOH
   NODE_NAME=node['hostname']
   LOCAL_IP=`ifconfig eth0 |grep inet |awk '{print $2}' |cut -d":" -f2 |grep -v "^$"`
   hostname ${NODE_NAME}
   echo ${LOCAL_IP}  ${NODE_NAME} >> /etc/hosts
   EOH 
  end   
else
   bash "set_hostname" do
   #interpreter "bash"
   code <<-EOH
   NODE_NAME=$(curl -s http://169.254.169.254/latest/meta-data/instance-id | cut -d- -f2)
   LOCAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
   hostname ${NODE_NAME}
   echo ${LOCAL_IP}  ${NODE_NAME} >> /etc/hosts
   EOH
  end	
end  
