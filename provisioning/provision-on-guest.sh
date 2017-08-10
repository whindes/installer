#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# prepare the host machine
sudo apt-get update

sudo apt-get -y install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2

sudo pip install ansible==2.1.0

git clone https://github.com/smart-on-fhir/installer

cd installer/provisioning

# install the required galaxy roles
ansible-galaxy install -r roles/requirements.yml -p ./roles/ --force

# modify the group_vars for your environment
#vi inventory/group_vars/all.yml

# change the installer_user value to match your login account
sudo ansible-playbook -i inventory/hosts site.yml --extra-vars "installer_user=changeme"
