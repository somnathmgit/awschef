name "play2"
maintainer "somnath"
maintainer_email "somnathsidea@gmail.com"
license "google"
description "Installs/Configures Play2 Framework (Version 2.1.4)"
version "1.0"

%w{ s3_file }.each do |cookbook|
  depends cookbook
end

%w{ centos redhat fedora amazon}.each do |os|
  supports os
end