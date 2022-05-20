#!/usr/bin/bash

# check if tmux is installed
if ! command -v tmux &> /dev/null
then
	echo "tmux not installed!"
	exit
fi

# install config
ln -sf $PWD/.tmux.conf $HOME/.tmux.conf

# apply it once, to set up some tpm vars
tmux source $HOME/.tmux.conf

# install TPM with my plugins
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && \
	TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins/tpm $HOME/.tmux/plugins/tpm/bin/install_plugins

# final source to apply configuration
tmux source $HOME/.tmux.conf
