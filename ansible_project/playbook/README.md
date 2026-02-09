### Run play books

1. run showDate.yaml playbook
```bash
ansible-playbook ./playbook/showDate.yaml --verbose
```

2. run install-nginx.yaml
```bash
ansible-playbook ./playbook/install-nginx.yaml --verbose -K
```

3. run blocks.yaml
```bash
ansible-playbook ./playbook/blocks.yaml --verbose
```

4. Enviroment_variable.yaml
```bash
ansible-playbook ./playbook/Enviroment_variable.yaml --verbose
```

# Ansible Playbooks

* ansible playbooks provide a repeatable , resuable , simple configuration management and multimachine deployment system what is well suited to deploying  complex applications

## playbook execution

* A playboook runs in order from top to bottom
* playbooks with multiple play can orchestrate multi-machine depoymemnts 

## Running playbooks 

* ansible check mode allows you to execute a playbook without appling and alteration to your system

```bash
ansible-playbook --check playbook.yaml
```

* using --verbose flag when running application we can see  detailed output

```bash
ansible-playbook --verbose playbook.yaml
```