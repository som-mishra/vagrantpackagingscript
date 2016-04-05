#!/bin/bash

# Does all vagrant tasks, like installing and packaging and all that stuff

# Inside Vagrantfile, when using Virtualbox, need to change config.vm.box to whatever you name your package

time vagrant destroy -f
time vagrant up
rm package.box
time vagrant package
time vagrant box add --force --name devstack-gate package.box
time vagrant destroy -f
cd ..
mkdir ~/devstack-gate-test-packaged
cp ~/devstack-gate-test/Vagrantfile ~/devstack-gate-test-packaged/
cd ~/devstack-gate-test-packaged/
time vagrant destroy -f
time vagrant up


