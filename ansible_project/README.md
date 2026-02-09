### genrate SSh key on master node
```bash
ssh-keygen
```

### copy key to all nodes
```bash
ssh-copy-id abhishek@k9s-master.abhishek.local
ssh-copy-id abhishek@k9s-worker.abhishek.local
ssh-copy-id abhishek@k9s-worker1.abhishek.local
```

# adhoc command
* An ansible adhoc command are great for tasks you repeat rarely 
* ex: if you want to  power off the machine in your lab for christmas vacation , u could execute a quick one liner in ansible without a playbook

### To check all system dates 
```bash
ansible -i inventory/workerOnly.yml all -m command -a "date"
```

### reeboot worker servers
```bash
ansible -i inventory/workerOnly.yml all -m reboot
```

## Managing files 
### Copy files from master node to worker node
* An ad hoc task can harness the power of ansible  and scp to tarnsfer many files to multiple machine parallel
```bash
ansible -i inventory/workerOnly.yml all -m ansible.builtin.copy -a 'src=~/ansible_project/testfile.txt dest=~/Desktop' 
```

### Change Owner ship of the file using adhoc Command 
```bash
ansible -i inventory/workerOnly.yml all -m ansible.builtin.file -a 'dest=~/Desktop/testfile.txt mode=777'
```