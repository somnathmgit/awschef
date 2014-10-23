Play 2 Framework
================

Installs and configures the Play2 framwork (http://www.playframework.com/)

Configuration
=============

To download the play2 framework installer from S3, the following credentials are mandatory in the custom JSON:

    {
        "otp-aws-access": {
            "aws_access_key_id" : "<your-access-key-id>",
            "aws_secret_access_key" : "<your-secret-access-key>"
        }
    }
    
The following optional parameters can also be specified via custom JSON (the default values are given below):

    {
        "play" : {
            "base_version" : "2",
            "full_version" : "2.1.4",
            "installer" : {
                "file" : "play-2.1.4.zip",
                "s3-bucket-name" : "otp-infra-applications-repo",                
            },
            "application" : {
                "location" : "/usr/share",
                "target-path" : "/usr/share/play-2.1.4/play",
                "link-name" : "/usr/bin/play2"                
            }
        }
    }