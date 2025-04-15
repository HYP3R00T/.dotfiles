#!/bin/bash
set -e

# Constants
ORIGINAL_USER=${SUDO_USER:-$USER}
USER_HOME=$(eval echo ~$ORIGINAL_USER)
DOTFILES_DIR="$USER_HOME/.dotfiles"
DOTFILES_REPO="https://github.com/HYP3R00T/.dotfiles.git"
PLAYBOOK_FILE="playbook.yml"
SERVER_PLAYBOOK_FILE="playbook-server.yml"

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

# Parse Arguments
USE_SERVER_PLAYBOOK=false
for arg in "$@"; do
    case $arg in
    --server)
        USE_SERVER_PLAYBOOK=true
        PLAYBOOK_FILE=$SERVER_PLAYBOOK_FILE
        shift
        ;;
    *) ;;
    esac
done

# Update and upgrade packages
log "Updating and upgrading packages..."
sudo apt update && sudo apt upgrade -y

# Check if .dotfiles directory exists; if not, clone it
if [ ! -d "$DOTFILES_DIR" ]; then
    log "Cloning .dotfiles repository..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    log "Dotfiles directory already exists. Skipping clone."
fi

# Install Mise if not present
if ! [ -x "$(command -v mise)" ]; then
    log "Installing Mise..."
    curl https://mise.run | sh
    log "Mise installation completed."
else
    log "Mise is already installed."
fi

# Install Ansible if not present
if ! [ -x "$(command -v ansible)" ]; then
    log "Installing Ansible using Mise..."
    mise install ansible
    log "Ansible installation completed."
else
    log "Ansible is already installed."
fi

# Run the Ansible playbook
if [ -x "$(command -v ansible)" ]; then
    if [ -f "$DOTFILES_DIR/$PLAYBOOK_FILE" ]; then
        log "Running Ansible playbook: $PLAYBOOK_FILE"
        # Run ansible-playbook as the original user with sudo privileges
        sudo -u "$ORIGINAL_USER" ansible-playbook "$DOTFILES_DIR/$PLAYBOOK_FILE" \
            --ask-become-pass \
            -v \
            -e "target_user=$ORIGINAL_USER" \
            -e "user_home=$USER_HOME"
    else
        error "Playbook not found at $DOTFILES_DIR/$PLAYBOOK_FILE"
    fi
else
    error "Ansible installation failed or is not available."
fi