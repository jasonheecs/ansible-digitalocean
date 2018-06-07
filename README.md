Ansible Role: DigitalOcean Droplet Creation
=========
[![Build Status](https://travis-ci.org/jasonheecs/ansible-digitalocean.svg?branch=master)](https://travis-ci.org/jasonheecs/ansible-digitalocean)

An ansible role that creates a DigitalOcean droplet and add the droplet's IP address to the inventory file.

Requirements
------------

None.


Installation
------------
`ansible-galaxy install jasonheecs.digitalocean`


Role Variables
--------------

Available variables are listed below, along with default values (see defaults/main.yml and vars/private.yml.example):
```
# SSH Key identifier in your DigitalOcean account
do_ssh_key_name: Ansible SSH Key
# Public SSH key to be added to your account
do_ssh_pub_key: "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"
# Private key used to ssh into your droplet
do_ssh_private_key: "~/.ssh/id_rsa"

# Name of the droplet
droplet_name: test-droplet
# This is the slug of the region you would like your server to be created in.
droplet_region_id: sgp1
# This is the slug of the size you would like the droplet to be created with.
droplet_size_id: 512mb
# This is the slug of the image you would like the droplet to be created with.
droplet_image_id: ubuntu-18-04-x64

# Location of your ansible inventory file
ansible_inventory_file: ansible-hosts.ini
# The group name that is used for grouping your droplets in your inventory file
droplets_inventory_group: do_droplets

# Your DigitalOcean Personal Access Token (https://www.digitalocean.com/community/tutorials/how-to-use-the-digitalocean-api-v2)
do_api_token: inserttokenhere
# Additional SSH Keys to add to the droplet during the creation process (https://developers.digitalocean.com/documentation/v2/#ssh-keys)
droplet_additional_ssh_key_ids: []
```

Dependencies
------------

None.


Example Playbook
----------------

```
- hosts: all
  become: yes
  roles:
    - { role: jasonheecs.digitalocean }
```   


License
-------

MIT

Author Information
------------------

[Jason Hee](https://jasonhee.com)
