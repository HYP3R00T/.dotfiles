# .dotfiles

## About the Project  

This repository is a complete solution for managing system configurations (dotfiles) and automating system setup with Ansible.  

I created this project to:  

- Streamline the process of configuring new systems.  
- Automate repetitive tasks, like installing packages and applying settings.  
- Make it easy to maintain a consistent environment across multiple devices.  

In this repository, you’ll find:  

1. My Dotfiles Setup: The exact configuration I use for my systems, organized and automated.  
2. Step-by-Step Guides: Learn how to create your own dotfiles repository and automate your setup.  

Whether you're a beginner or experienced, this project will help you understand the power of dotfiles and automation tools like Ansible.

---

## What’s in This Repository?  

- My Dotfiles Setup:  
  Explore the configuration files I use for tools like Bash, Zsh, Vim, and more. These are managed using Ansible for easy setup on new machines.  

- Documentation Site:  
  This site (hosted via GitHub Pages) serves as a guide to help anyone:  
  1. Understand how I built this system.  
  2. Learn how to create their own dotfiles setup.  

- Scripts and Playbooks:  
  Ready-to-use scripts and Ansible playbooks for automated installation and configuration.  

---

## How This Works  

1. Dotfiles Repository:  
   My dotfiles are stored in this repo and organized into logical sections (e.g., shell, editor, tools).  

2. Ansible for Automation:  
   Ansible playbooks handle tasks like installing packages, setting up configurations, and applying custom settings.  

3. Installation Script:  
   A single script (`install.sh`) applies the configurations automatically on any system.  

---

## Learn to Build Your Own  

### 💡 *Want to create your own dotfiles system?*  

This repository includes a dedicated learning section where I teach you everything you need to know to:  

- Set up your own dotfiles repository.  
- Use Ansible to automate system configurations.  
- Customize the setup for your unique needs.  

---

## How to Use  

### Using My Setup  

If you’d like to try my configuration:  

1. Clone this repository.  

   ```bash
   git clone https://github.com/HYP3R00T/.dotfiles.git
   cd .dotfiles
   ```  

2. Run the installation script:  

   ```bash
   ./bin/install.sh
   ```  

3. Customize `vars.yml` to match your preferences, then reapply the playbook:  

   ```bash
   ansible-playbook playbook.yml
   ```  

### Learn and Build Your Own  

Visit the [Learn Section]([#link-to-docs-site](https://dotfiles.hyperoot.dev/)) to get step-by-step instructions on:  

- Organizing your dotfiles.  
- Writing modular Ansible playbooks.  
- Automating system setup across devices.  

---

## Why Use This Approach?  

1. Saves Time: Eliminate repetitive tasks by automating your setup.  
2. Consistency: Ensure all your devices are configured the same way.  
3. Customizable: Tailor the setup to match your workflow perfectly.  
4. Scalable: Easily add new tools or update configurations without breaking existing setups.  

---

## Let’s Get Started  

Ready to simplify your workflow?  

- Use my dotfiles and customize them.  
- Or learn to build your own from scratch.  

👉 [Explore the Docs and Learn More]([#link-to-docs-site](https://dotfiles.hyperoot.dev/))

---

## Just for me

The following command is NOT for you. It's ONLY for me.

```bash
curl -fsSL https://raw.githubusercontent.com/HYP3R00T/.dotfiles/main/bin/install.sh | bash
```
