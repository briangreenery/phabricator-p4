#!/bin/bash

# Install perforce server

mkdir /opt/p4
cd /opt/p4

wget http://filehost.perforce.com/perforce/r13.3/bin.linux26x86_64/p4d
chmod +x p4d

cat > p4d.conf << OHANA_MEANS_FAMILY
description "Perforce server"

start on runlevel [2345]
stop on shutdown

respawn

chdir /opt/p4
exec /opt/p4/p4d
OHANA_MEANS_FAMILY

mv p4d.conf /etc/init
start p4d 

# Get perforce client

wget http://filehost.perforce.com/perforce/r13.3/bin.linux26x86_64/p4
chmod +x p4d p4
mv p4 /usr/local/bin

# Set environment

echo 'export P4PORT=phabricator-p4.ohana:1666' >> /home/vagrant/.profile