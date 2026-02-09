## Organinzing inventory in a directory 
* we can use multiple inventory 
* maintaining the single file becomes difficult when the file get too long

### TO get all groups and hosts
```bash
ansible-inventory --list
```

### root inventory
```bash
ansible-inventory -i inventory/inventory.yml --list
```
### masterOnly inventory
```bash
ansible-inventory -i inventory/masterOnly.yml --list
```
### workerOnly inventory
```bash
ansible-inventory -i inventory/workerOnly.yml --list
```

### multiple inventory pass as argument
```bash
ansible-inventory -i inventory/workerOnly.yml -i inventory/masterOnly.yml  --list
```

