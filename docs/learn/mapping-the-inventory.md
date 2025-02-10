---
title: Mapping the Inventory
---

An Ansible inventory is a file that defines the hosts and groups of hosts that Ansible can manage and configure. It serves as a central location where you specify the target systems you want to automate tasks for, along with any variables or settings related to those hosts.

By creating an inventory file, you can efficiently organize and manage the machines you need to work with, whether you're managing a single server or hundreds of systems.

The inventory file can different extensions like `.yaml` or `.ini`. You can leverage `ansible-inventory` command to check the format of the file.

```bash
ansible-inventory -i inventory.yml --list
```

It is recommended to create an `ansible.cfg` file in the root directory of the project to avoid specifying the inventory file every time.

```ini
# ansible.cfg

[defaults]
inventory = inventory.yaml
```

Now we can verify the inventory using `ansible-inventory --list`.

Any host we mention in the inventory file will at least be a part of 2 groups, even if we don't explicitly create them: `all` and `ungrouped`. If we put a host in a group, then it will belong to that group along with the `all` group.

For instance, consider the following sample.

```yaml
all:
  hosts:
    localhost:
      ansible_connection: local
```

If we print the graph of the inventory using `ansible-inventory --graph`, we get the following.

```shell
ansible-inventory -i inventory.yml --graph

@all:
  |--@ungrouped:
  |  |--localhost
```

As we can see, it belongs to both, `ungrouped` as well as `all` groups.

Of course, we can ping the host using ansible and that way we can verify if the host is accessible.

```shell
ansible localhost -m ping

localhost | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

We can see the output which confirms that this host is reachable.

So, for now we will create a simple `inventory.yml` file.

```yaml
all:
  hosts:
    localhost:
      ansible_connection: local
```

---

## References

- [Ansible - json schema](https://github.com/ansible/ansible-lint/blob/main/src/ansiblelint/schemas/inventory.json)
- [Building an inventory](https://docs.ansible.com/ansible/latest/getting_started/get_started_inventory.html)
- [How to build your inventory](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html)
