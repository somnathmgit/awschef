#
# Author:: somnath
# Cookbook Name:: Play2
# Attributes:: default

default['play']['base_version']="2"
default['play']['full_version']="2.1.1"
default['play']['installer']['file']="play-#{node['play']['full_version']}.zip"
default['play']['installer']['s3-bucket-name'] = "applications-repo"
default['play']['application']['location'] = "/usr/share"
default['play']['application']['target-path'] = "#{node['play']['application']['location']}/play-#{node['play']['full_version']}/play"
default['play']['application']['link-name'] = "/usr/bin/play#{node['play']['base_version']}"


default['aws-access']['aws_access_key_id'] = "<will-take-the-value-from-custom-JSON>"
default['aws-access']['aws_secret_access_key'] = "<will-take-the-value-from-custom-JSON>"
