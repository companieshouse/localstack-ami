# Testing docker-ami

pre-requisites
- Have vagrant installation

To test, run `vagrant up` from this directory. This will create a virtual machine and automatically run the Ansible provisioner.

To re-run tests, run `vagrant provision`

When finished, run `vagrant destroy`, which will destroy the currently running VM and cleanup.
