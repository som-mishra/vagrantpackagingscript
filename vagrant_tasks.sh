#!/bin/bash


# Possibly TODO in future: Figure out where this script we are running is. As this script and the Vagrantfile are in the same location.
# So instead of assuming that it is in ~/devstack-gate-test/ figure out where it really is.
# Maybe the 'packaged' directory should be a child of this directory????

# hints.
#  echo $0
#  dirname /home/mishra/foo

set -x

# These two lines do the same thing
#set -e
set -o errexit

# Does all vagrant tasks, like installing and packaging and all that stuff

# Inside Vagrantfile, when using Virtualbox, need to change config.vm.box to whatever you name your package

time vagrant destroy -f
time vagrant up
rm package.box
time vagrant package
time vagrant box add --force --name devstack-gate package.box
time vagrant destroy -f
mkdir -p ~/devstack-gate-test-packaged
cp ~/devstack-gate-test/Vagrantfile ~/devstack-gate-test-packaged/
cd ~/devstack-gate-test-packaged/
time vagrant destroy -f
time vagrant up
 

