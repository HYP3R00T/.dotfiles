---
title: Laying the Groundwork
---

> Failure is simply the opportunity to begin again, this time more intelligently.
> *– Henry Ford*

As it's inevitable to mess up your system, it's better to start working on a disposable machine. Following are some of the options, set up whichever you are comfortable with.

- Virtual Machine
- WSL2
- Docker
- A second laptop

For now, I would recommend installing Ubuntu.

## A Fresh Start

Create a simple GitHub Repository and clone that to your machine. To make the repo hidden, you can add a dot before the repo name. For instance, use `.dotfiles` instead of `dotfiles`.

## Installing Ansible

It's pretty easy to install Ansible. For Ubuntu, all you need is to run the following command.

```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

To verify that you have installed `ansible` successfully, use the following command.

```bash
ansible --version
```

But we have a tiny problem. What if you mess this the setup and you need to start fresh? Do you wish to install it manually again? I hope not.

## Automate the Ansible Installation

I prefer to automate this as well. So, let's create a directory within our repo and call it `bin`. This is where we will keep all the bash scripts. Create a bash script file called `install.sh`.

```bash
├── bin
│   └── install.sh
```

We can simply put the installation command in this file, but let's make it slightly better. If you recall the first thing you did after a fresh installation of Ubuntu, you had to `update` and `upgrade` your system. So let's put that in the `install.sh` file as well.

```bash
# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install Ansible
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

If you try to run this script, it will throw an error. We need to make it executable.

```bash
# .dotfiles/bin
sudo chmod +x install.sh
```

Now, we can easily execute it.

```bash
# .dotfiles/bin
sudo install.sh
```

## The Directory Structure

I recommend a simple directory structure to begin with.

```bash
.
├── ansible.cfg
├── bin
│   └── install.sh
├── inventory.yml
├── playbook.yml
├── roles
│   └── tool
│       ├── tasks
│       │   └── main.yml
│       ├── files
│       │   └── config_file_for_the_tool
│       └── templates
│           └── zshrc.j2
└── vars.yml
```

---

## References

- [Creating a new repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)
- [Ansible Documentation](https://docs.ansible.com/ansible/latest/index.html)
- [Installing Ansible on specific operating systems](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html)
- [Sample Ansible setup](https://docs.ansible.com/ansible/latest/tips_tricks/sample_setup.html)
