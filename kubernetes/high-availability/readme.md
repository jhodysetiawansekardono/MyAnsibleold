Test pinging the nodes
```
ansible -i hosts.yaml all -m ping
```

Run the playbook
```
ansible-playbook -i hosts.yaml containerd-1.24.6.yaml
```
