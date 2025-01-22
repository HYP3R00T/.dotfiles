---
title: The Config Whisperer
---

When we run the `ansible-playbook` command to apply the changes, it first looks for the configuration file. Specifically, it looks for the file in the following order.

- `ANSIBLE_CONFIG` - env variable (if set)
- `ansible.cfg` - in current dir
- `~/ansible.cfg` - in home dir
- `/etc/ansible/ansible.cfg` - default

For this project, I prefer the second option where we define the config file within the project. This way we can keep track of it using git. If there are multiple ansible config files in different projects, when executed, these won't clash with each other.

This sounds great but we a small issue. Exactly what we can put in the config file? Well, for that you can run the following command to generate the config file with proper comments.

```bash
ansible-config init --disabled > sample_ansible.cfg
```

As you can see it has a lot of configurable options. But we don't need to know all of those for now. The following is enough to start with.

```ini
[default]
inventory = inventory.yml
interpreter_python = /usr/bin/python3
roles_path = roles
```

- `inventory`: This will point to the inventory file we will create.
- `interpreter_python`: Ansible need python to deploy the changes to the system. It's advisable to provide the correct path of Python interpreter.
- `roles_path`: This directory will contain all the roles for the tools that we will deploy.

---

## References

- [Ansible Configuration Settings](https://docs.ansible.com/ansible/latest/reference_appendices/config.html)
