#!/bin/bash

set -e

# Default to using the vscode user
USERNAME=${USERNAME:-${_REMOTE_USER:-"automatic"}}

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

# Determine the appropriate non-root user
if [ "${USERNAME}" = "auto" ] || [ "${USERNAME}" = "automatic" ]; then
    USERNAME=""
    POSSIBLE_USERS=("vscode" "node" "codespace" "$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)")
    for CURRENT_USER in "${POSSIBLE_USERS[@]}"; do
        if id -u "${CURRENT_USER}" >/dev/null 2>&1; then
            USERNAME=${CURRENT_USER}
            break
        fi
    done
    if [ "${USERNAME}" = "" ]; then
        USERNAME=root
    fi
elif [ "${USERNAME}" = "none" ] || ! id -u "${USERNAME}" >/dev/null 2>&1; then
    USERNAME=root
fi

echo "Running as user: ${USERNAME}"

# Switch to the correct user to install Pluto
sudo -u "${USERNAME}" bash << EOF
    set -e
    
    
    
    # Activate and install Pluto in the user-specific environment
    /home/${USERNAME}/.juliaup/bin/julia -e '
        import Pkg;
        Pkg.add("Pluto");
        println("Pluto and its dependencies have been installed and precompiled in the user-specific environment.");
    '
    
    echo "Installation and precompilation completed."

EOF
