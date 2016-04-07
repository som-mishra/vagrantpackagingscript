#!/bin/bash


# TODO: Figure out where this script we are running is. As this script and the Vagrantfile are in the same location.
# So instead of assuming that it is in ~/devstack-gate-test/ figure out where it really is.
# Maybe the 'packaged' directory should be a child of this directory????

# hints.
#  echo $0
#  dirname /home/mishra/foo

set -x


#echo Start1
#echo $0
#echo
#echo Step2
#dirname /home/mishra
#echo Step3
dirname $0
#echo Step4
BASE_DIR=$(dirname $0)
#echo $BASE_DIR
#echo Step5
#echo cp $BASE_DIR/Vagrantfile.packaged


#mkdir -p ~/devstack-gate-test-packaged
#cp $BASE_DIR/Vagrantfile.packaged ~/devstack-gate-test-packaged/Vagrantfile

#exit

# These two lines do the same thing
#set -e
set -o errexit

# Does all vagrant tasks, like installing and packaging and all that stuff

# Inside Vagrantfile, when using Virtualbox, need to change config.vm.box to whatever you name your package
#cp $0 $BASE_DIR/devstack-gate-test
cd $BASE_DIR
time vagrant destroy -f
time vagrant up
rm -f package.box
time vagrant package
time vagrant box add --force --name devstack-gate package.box
time vagrant destroy -f
mkdir -p ~/devstack-gate-test-packaged
cp $BASE_DIR/Vagrantfile.packaged ~/devstack-gate-test-packaged/Vagrantfile
cd ~/devstack-gate-test-packaged/
time vagrant destroy -f
time vagrant up
cd ~/devstack-gate-test-packaged/






