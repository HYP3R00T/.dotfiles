#!/bin/bash
set -e

# Constants
ORIGINAL_USER=${SUDO_USER:-$USER}
USER_HOME=$(eval echo ~$ORIGINAL_USER)
DOTFILES_DIR="$USER_HOME/.dotfiles"

# Helper Function: Print Messages
log() {
    echo -e "\033[1;32m[INFO]\033[0m $1"
}

error() {
    echo -e "\033[1;31m[ERROR]\033[0m $1"
    exit 1
}

# Ensure sudo privileges
if ! sudo -n true 2>/dev/null; then
    error "This script requires sudo privileges. Please run with a user that has sudo rights."
fi

# Update and upgrade packages
log "Updating and upgrading packages..."
sudo apt update && sudo apt upgrade -y

# Install Ansible if not present
if ! [ -x "$(command -v ansible)" ]; then
    log "Installing Ansible..."
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
    log "Installation completed."
else
    log "Ansible is already installed."
fi

# Run the Ansible playbook
if [ -x "$(command -v ansible)" ]; then
    if [ -f "$DOTFILES_DIR/playbook.yml" ]; then
        log "Running Ansible playbook..."
        # Run ansible-playbook as the original user with sudo privileges
        sudo -u "$ORIGINAL_USER" ansible-playbook "$DOTFILES_DIR/playbook.yml" \
            -e "target_user=$ORIGINAL_USER" \
            -e "user_home=$USER_HOME"
    else
        error "Playbook not found at $DOTFILES_DIR/playbook.yml"
    fi
else
    error "Ansible installation failed or is not available."
fi