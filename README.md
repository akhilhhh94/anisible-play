
## Ansible - Install nginx using role

### Install roles
`ansible-galaxy install -r requirements.yml`

### Ping test
`ansible all -i ./inventory.txt -m ping`


### Run playbook
`ansible-playbook -i ./inventory.txt ./task.yaml`