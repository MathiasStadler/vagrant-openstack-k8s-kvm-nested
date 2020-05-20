#!/bin/bash

# write proxy config 
cat << EOF |sudo tee /etc/yum.conf
[main]
gpgcheck=1
installonly_limit=3
clean_requirements_on_remove=True
best=True
proxy=http://192.168.178.29:3142
tolerant=1
errorlevel=1
cachedir=/var/cache/yum/\$basearch/\$releasever
keepcache=0
debuglevel=2
logfile=/var/log/yum.log
exactarch=1
obsoletes=1
gpgcheck=1
plugins=1
installonly_limit=5
bugtracker_url=http://bugs.centos.org/set_project.php?project_id=23&ref=http://bugs.centos.org/bug_report_page.php?category=yum
distroverpkg=centos-release
EOF

# 
sudo yum clean metadata

# clean cache
sudo yum clean expire-cache

# https://blog.packagecloud.io/eng/2015/05/05/using-apt-cacher-ng-with-ssl-tls/
# https://www.cflee.com/posts/troubleshooting-apt-cacher-ng/
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=944143
