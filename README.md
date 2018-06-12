Ansible Role: DigitalOcean Droplet Creation
=========
[![Build Status][travis-badge]][travis-link]
[![Galaxy Role][role-badge]][galaxy-link]

An ansible role that creates a DigitalOcean droplet and add the droplet's IP address to the inventory file.

Requirements
------------

None.


Installation
------------
`ansible-galaxy install jasonheecs.digitalocean`


Role Variables
--------------

Role variables are listed in `defaults/main.yml`, and sensitive variables (like your DigitalOcean API token) should be listed in `vars/private.yml`.

Available variables are listed below, along with default values (see `defaults/main.yml` and `vars/private.yml.example`):
```yaml
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
ansible_inventory_file: hosts.ini
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


Example Playbooks
----------------

A playbook that runs this role on a remote machine:

```yaml
- hosts: all
  become: no
  roles:
    - { role: jasonheecs.digitalocean }
```

A playbook that runs this role on your local machine:

```yaml
- hosts: localhost
  connection: local
  become: no
  roles:
    - { role: jasonheecs.digitalocean }
```

Tests
---------------
Automated testing is done via [Test Kitchen](https://github.com/test-kitchen/test-kitchen), [Kitchen Ansible](https://github.com/neillturner/kitchen-ansible) and [Kitchen Docker](https://github.com/test-kitchen/kitchen-docker)

To run the tests, make sure [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Docker](https://docs.docker.com/installation/#installation) are installed and run the following:

```
gem install bundler && bundle exec kitchen test
```

Refer to the [travis.yml](.travis.yml) file and [Travis build logs](https://travis-ci.org/jasonheecs/ansible-digitalocean) for details on the test build process and expected outputs.


Supported Platforms
-------
This ansible role has been tested against the following platforms:
- macOS Sierra
- macOS High Sierra
- Ubuntu 16.04
- Ubuntu 14.04
- CentOS 7
- Debian 9

License
-------

MIT

Author Information
------------------

[Jason Hee](https://jasonhee.com)


[galaxy-link]: https://galaxy.ansible.com/jasonheecs/digitalocean/
[role-badge]: https://img.shields.io/ansible/role/26189.svg
[travis-badge]: https://travis-ci.org/jasonheecs/ansible-digitalocean.svg?branch=master
[travis-link]: https://travis-ci.org/jasonheecs/ansible-digitalocean
